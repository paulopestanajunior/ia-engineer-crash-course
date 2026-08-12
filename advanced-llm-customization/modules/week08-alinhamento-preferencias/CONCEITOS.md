# Semana 8 — Alinhamento por Preferências

## Visão Geral

SFT (Semana 5) ensina o modelo a produzir *uma* resposta razoável. Mas
"razoável" tem graus — entre duas respostas corretas, uma pode ser mais
útil, mais segura, ou ter o estilo certo. Alinhamento por preferências
ensina o modelo a *preferir* a resposta melhor, não só a gerar *uma*
resposta aceitável.

---

## 8.1 Objetivos do alinhamento

Ajustar o comportamento do modelo pra bater com critérios que não são
fáceis de expressar como "a resposta certa" (que é o que SFT otimiza) —
coisas como tom, nível de detalhe, segurança, ou preferência subjetiva de
usuários reais.

## 8.2 Preference datasets: escolhido e rejeitado

O formato de dado central: pra um mesmo prompt, um par de respostas — uma
marcada como **chosen** (escolhida/preferida) e outra como **rejected**
(rejeitada). A origem da preferência pode ser humana (anotadores
comparando respostas) ou de IA (RLAIF — um modelo mais forte julga qual é
melhor).

## 8.3 Reward Models

Um **Reward Model** é um modelo treinado especificamente pra prever um
"score" de qualidade pra uma resposta — treinado no mesmo tipo de dado de
preferência (aprende a dar score mais alto pra `chosen` que pra
`rejected`). É a peça central do RLHF clássico (Semana 8.4) e das
recompensas usadas em RL (Semana 9).

## 8.4 RLHF e RLAIF

**RLHF** (Reinforcement Learning from Human Feedback): o pipeline
clássico — treina um Reward Model nos dados de preferência humana, depois
usa esse Reward Model como sinal de recompensa pra otimizar o LLM via RL
(historicamente PPO, Semana 9). **RLAIF** é a mesma ideia, mas usando um
LLM (em vez de humanos) pra gerar os julgamentos de preferência —
mais barato e escalável, com o risco de herdar os viéses do modelo julgador.

## 8.5 Direct Preference Optimization (DPO)

A alternativa mais popular hoje ao RLHF clássico: DPO **elimina** a
necessidade de um Reward Model separado e de RL propriamente dito. A
matemática (derivada no paper original, Rafailov et al. 2023) mostra que
é possível otimizar diretamente na política (o próprio LLM) uma função de
loss que aumenta a probabilidade da resposta `chosen` em relação à
`rejected` — mais simples de implementar e mais estável de treinar que
RLHF com PPO.

## 8.6 IPO, ORPO, KTO, SimPO — variantes

- **IPO** (Identity Preference Optimization): corrige uma tendência do DPO
  de "overfitar" em preferências com sinal fraco.
- **ORPO** (Odds Ratio Preference Optimization): combina SFT e alinhamento
  de preferência num único passo de treino (não precisa de um modelo
  SFT prévio separado).
- **KTO** (Kahneman-Tversky Optimization): não precisa de pares
  chosen/rejected — funciona com exemplos rotulados individualmente como
  "bom" ou "ruim" (mais fácil de coletar dado em produção real).
- **SimPO:** simplifica ainda mais o DPO, removendo a necessidade de um
  modelo de referência separado durante o treino.

## 8.7 Construindo pares de preferência

Dimensões comuns pra julgar qual resposta é "melhor": factualidade
(qual está mais correta), segurança (qual evita conteúdo prejudicial),
estilo (qual segue melhor o tom desejado), utilidade (qual resolve melhor
o pedido do usuário). Um bom dataset de preferência cobre essas dimensões
de forma equilibrada, não só uma.

## 8.8 SFT vs Preference Optimization — quando usar cada um

SFT ensina *o quê* responder (o conteúdo/formato correto). Preference
optimization ensina *qual entre várias respostas corretas* é melhor. Na
prática, o pipeline mais comum é sequencial: SFT primeiro (pra ter uma
base de comportamento razoável), preference optimization depois (pra
refinar qual entre as respostas razoáveis é a preferida).

## 8.9 Avaliação de modelos alinhados

Comparar a taxa de "vitória" do modelo alinhado vs o modelo antes do
alinhamento, num conjunto de prompts de teste, com julgamento humano ou
de outro LLM (LLM-as-judge, Fase 1 Semana 9.2) — nunca assuma que o
alinhamento funcionou sem medir.

## Lab prático

[`labs/08-dpo-real.ipynb`](../../labs/08-dpo-real.ipynb) — usa o
`DPOTrainer` real da `TRL` pra treinar um modelo num dataset de
preferências (chosen/rejected) construído à mão, e mede se a probabilidade
que o modelo atribui à resposta "chosen" aumenta em relação à "rejected"
depois do treino.
