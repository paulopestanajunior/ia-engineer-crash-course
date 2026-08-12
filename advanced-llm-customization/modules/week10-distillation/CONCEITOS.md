# Semana 10 — Model Distillation

## Visão Geral

Todas as semanas anteriores melhoram um modelo usando seus próprios dados
de treino ou sua própria geração. Distillation é diferente: usa um modelo
**maior e mais capaz** (teacher) pra ensinar um modelo **menor** (student)
— transferindo capacidade sem precisar do mesmo tamanho/custo do teacher
em produção.

---

## 10.1 Teacher e Student

O **teacher** é o modelo maior/mais forte, cujo comportamento você quer
transferir. O **student** é o modelo menor que você vai treinar pra imitar
o teacher — o objetivo final é o student chegar perto da qualidade do
teacher, custando muito menos pra rodar (latência, memória, $).

## 10.2 Response Distillation

A forma mais simples: gerar respostas do teacher pra um conjunto de
prompts, e treinar o student nessas respostas como se fossem um dataset
de SFT normal (Semana 5) — o student aprende a imitar o *texto final* do
teacher, sem acesso a mais nada.

## 10.3 Logit Distillation e Temperatura na destilação

Mais informativo que só o texto final: treinar o student pra imitar a
**distribuição de probabilidade completa** do teacher sobre o próximo
token (os logits, Semana 1.6), não só o token escolhido. Isso carrega mais
sinal — "o teacher achava B quase tão provável quanto A" é informação que
o texto final sozinho não captura. A perda usada é geralmente **KL
divergence** entre a distribuição do teacher e a do student. Usar uma
temperatura mais alta no softmax durante a destilação "suaviza" as
distribuições, expondo mais desse sinal sutil sobre probabilidades
relativas entre tokens não-escolhidos.

## 10.4 Feature/Sequence-level e Self-Distillation

- **Feature distillation:** o student também tenta imitar ativações
  internas do teacher (não só a saída final), útil quando as arquiteturas
  são parecidas.
- **Sequence-level distillation:** otimiza pra sequência completa gerada
  bater com o teacher, não token a token isolado.
- **Self-distillation:** o "teacher" é uma versão anterior (ou uma
  versão com mais recursos, ex.: mais passos de reasoning) do próprio
  modelo — usado pra "condensar" capacidades sem precisar de um modelo
  externo maior.
- **Progressive distillation:** destila em etapas (modelo grande → médio
  → pequeno) em vez de um salto único — cada etapa perde menos qualidade.

## 10.5 Dados sintéticos gerados pelo teacher

O teacher pode gerar o próprio dataset de treino do student (prompts
variados + respostas) — é a mesma ideia de dados sintéticos (Fase 1,
Semana 13.5; Fase 2, Semana 4.9), aplicada especificamente à transferência
de capacidade. Filtro/ranking de qualidade das respostas geradas é
essencial — sem isso, erros do teacher se propagam amplificados pro
student.

## 10.6 Múltiplos teachers e combinação com outras técnicas

É possível destilar de **vários** teachers (cada um especializado em algo)
pro mesmo student, combinando forças. Destilação também se combina
naturalmente com SFT (destilar é uma forma de gerar dado de SFT) e com
LoRA/QLoRA (Semana 6) — treinar o student via adapter, não full
fine-tuning, economiza ainda mais recurso.

## 10.7 Reasoning Distillation

Um caso especialmente relevante hoje: destilar não só a resposta final,
mas o **processo de raciocínio** (Semana 7) de um modelo forte de
reasoning pra um modelo menor — o student aprende a "pensar" de forma
parecida, não só a decorar respostas.

## 10.8 Process vs Outcome supervision na destilação

Igual à Semana 7.7: destilar baseado só na resposta final (outcome) é
mais simples mas ensina menos sobre *como* chegar lá; destilar cada passo
do reasoning trace (process) ensina mais, mas exige mais dado e mais
cálculo.

## 10.9 Retenção de capacidades e catastrophic forgetting

Risco parecido com o de fine-tuning (Semana 5.7): destilar agressivamente
num domínio estreito pode fazer o student perder capacidades gerais que
não estavam no dataset de destilação. Avaliar o student em benchmarks
gerais, não só na tarefa-alvo, é o jeito de detectar isso.

## 10.10 Licenciamento e governança do dado gerado pelo teacher

Se o teacher é um modelo comercial via API, os termos de serviço podem
restringir usar as saídas dele pra treinar um modelo concorrente —
sempre checar a licença antes de montar um pipeline de destilação em
produção.

## Lab prático

[`labs/10-distillation-real.ipynb`](../../labs/10-distillation-real.ipynb) —
implementa destilação real via KL divergence: um modelo "teacher"
(`SmolLM2-135M`, maior e mais capaz) gera distribuições de probabilidade
reais, e um modelo "student" (`tiny-gpt2`, minúsculo) é treinado pra
imitar essas distribuições — com gradiente de verdade, não simulado.
