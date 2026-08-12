# Semana 5 — Supervised Fine-Tuning e Instruction Tuning

## Visão Geral

Com o dataset pronto (Semana 4) e o mecanismo de treino entendido (Semana
3), essa semana aplica isso num cenário real: pegar um modelo pré-treinado
e adaptá-lo pra seguir instruções melhor, ou se especializar num domínio.

---

## 5.1 Prompting vs RAG vs Fine-tuning — quando usar cada um

Três formas de adaptar o comportamento de um LLM, do mais barato/rápido ao
mais caro/lento:
- **Prompting** (Fase 1, Semana 1): ajustar instruções no momento da
  chamada — zero custo de treino, mas limitado pelo que cabe no prompt.
- **RAG** (Fase 1, Semana 3): injetar conhecimento externo relevante no
  prompt — resolve "o modelo não sabe esse fato", não resolve "o modelo
  não se comporta do jeito que eu quero".
- **Fine-tuning:** muda os pesos do modelo — resolve mudança de
  comportamento/estilo/formato de forma mais robusta que prompting, mas
  custa treino (tempo, GPU) e precisa de dataset de qualidade.

Regra prática: comece com prompting, adicione RAG se falta conhecimento,
considere fine-tuning só se prompting+RAG não bastam pro comportamento que
você precisa.

## 5.2 Full Fine-tuning vs Instruction Tuning vs Domain Adaptation

- **Full fine-tuning:** todos os parâmetros do modelo são atualizados —
  máxima flexibilidade, máximo custo de memória (Semana 3.9).
- **SFT / Instruction tuning:** fine-tuning num dataset de pares
  instrução→resposta — ensina o modelo a *seguir instruções* (é o que
  transforma um modelo "base" num modelo "chat/assistant").
- **Domain adaptation:** fine-tuning focado em vocabulário/estilo de um
  domínio específico (jurídico, médico, etc.), não necessariamente em
  seguir instruções.
- **Continual pre-training:** continuar o treino não-supervisionado
  (previsão de próximo token em texto genérico do domínio) antes do SFT —
  útil quando o domínio tem vocabulário muito distante do treino original.

## 5.3 Escolha do modelo-base

Fatores: tamanho (mais parâmetros = mais capacidade, mais custo),
licença (permite uso comercial? redistribuição do fine-tune?), se já é
"instruct" (já teve SFT) ou "base" (só pré-treino) — fine-tunar um modelo
já instruct geralmente precisa de menos dados que partir de um base puro.

## 5.4 Hiperparâmetros de treino

Os mesmos conceitos da Semana 3 (learning rate, batch size, épocas), mas
com valores tipicamente bem menores que pré-treino do zero — fine-tuning
parte de pesos já bons, então learning rates muito menores (evita destruir
o que o modelo já sabe) e poucas épocas (1-3, geralmente — mais que isso
tende a overfitting rápido num dataset de fine-tuning, que é ordens de
magnitude menor que o pré-treino original).

## 5.5 Treinar na resposta completa vs só no assistant

Uma escolha importante de implementação: calcular o loss (Semana 3.3) em
**toda** a sequência (prompt + resposta) ou só nos tokens da **resposta do
assistant**. A segunda opção é mais comum — não faz sentido "penalizar" o
modelo por não prever o prompt do usuário, que ele não está gerando.

## 5.6 Checkpoints e experiment tracking

Salvar checkpoints periodicamente (Semana 3.6) permite comparar o modelo
em diferentes pontos do treino e reverter se um checkpoint posterior
piorar. Ferramentas de experiment tracking (Weights & Biases, MLflow,
TensorBoard) registram loss, métricas e hiperparâmetros de cada rodada —
essencial quando você testa múltiplas configurações.

## 5.7 Catastrophic forgetting

Fine-tuning agressivo (LR alto, muitas épocas) pode fazer o modelo
"esquecer" capacidades gerais que tinha antes, otimizando demais pro
dataset novo e estreito. É o principal risco de full fine-tuning — LoRA
(Semana 6) naturalmente mitiga isso parcialmente, por tocar numa fração
pequena dos pesos.

## 5.8 Avaliação antes e depois

Nunca assuma que o fine-tuning melhorou o modelo — meça. Rodar o mesmo
conjunto de perguntas de teste no modelo base e no modelo fine-tunado, e
comparar (qualitativamente e, quando possível, com métricas) é o mínimo
necessário antes de considerar o fine-tuning um sucesso.

## Lab prático

[`labs/05-sft-real.ipynb`](../../labs/05-sft-real.ipynb) — usa o
`SFTTrainer` da biblioteca `TRL` (a mesma usada em produção) pra fazer
fine-tuning real do `SmolLM2-135M` no dataset curado no Lab 4, e compara a
saída do modelo antes/depois do fine-tuning no mesmo prompt.
