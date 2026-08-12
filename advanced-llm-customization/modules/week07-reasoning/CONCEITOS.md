# Semana 7 — Reasoning e Dados de Raciocínio

## Visão Geral

Gerar texto fluente (Semana 1) não é o mesmo que resolver um problema
complexo corretamente. Essa semana cobre técnicas e dados especializados
pra melhorar a capacidade de um LLM "pensar antes de responder" —
a base do que hoje chamamos de "reasoning models".

---

## 7.1 Geração textual vs Reasoning

Geração textual pura otimiza "o que é uma continuação plausível" —
reasoning otimiza "qual é a resposta *correta*", o que geralmente exige
decompor o problema em passos verificáveis, não só gerar texto fluente.

## 7.2 Decomposição de problemas e Chain-of-Thought (CoT)

**Chain-of-Thought:** pedir (ou treinar) o modelo pra explicitar os passos
de raciocínio antes da resposta final, em vez de pular direto pra
conclusão (já introduzido na Fase 1, Semana 1.2 e 7.3). Decompor um
problema complexo em sub-problemas menores, resolvidos em sequência,
reduz a chance de erro em cada etapa individual.

## 7.3 Self-consistency

Gerar **múltiplas** cadeias de raciocínio independentes (com sampling,
Semana 1.7) pro mesmo problema, e tomar a resposta majoritária. Mais caro
(N vezes mais chamadas), mas mais robusto — erros aleatórios de raciocínio
tendem a divergir entre as N tentativas, enquanto o raciocínio correto
tende a convergir.

## 7.4 ReAct e Tool Use

**ReAct** (Reason + Act): o modelo alterna entre raciocinar e agir (chamar
uma tool, Fase 1 Semana 4) — raciocina sobre o que fazer, age, observa o
resultado, raciocina de novo com a nova informação. **Planejamento e
execução:** para problemas complexos, separar "montar um plano completo"
de "executar passo a passo" (Fase 1, Semana 5.1) melhora robustez.

## 7.5 Dados sintéticos de raciocínio

Datasets de reasoning são caros de anotar manualmente (exigem expert
verificando cada passo) — geralmente são gerados sinteticamente por um
modelo mais forte, com verificação automática do resultado final.

## 7.6 Reasoning traces e verificadores

Um **reasoning trace** é a sequência completa de passos que o modelo
gerou até a resposta. **Verificadores** são funções (programáticas, ou
outro modelo) que checam se o trace — ou só a resposta final — está
correto, usados tanto pra filtrar dados de treino quanto pra recompensa em
RL (Semana 9).

## 7.7 Process supervision vs Outcome supervision

- **Outcome supervision:** só avalia se a resposta *final* está certa,
  ignora o caminho.
- **Process supervision:** avalia (e dá sinal de treino para) cada *passo*
  do raciocínio individualmente — mais caro de produzir (precisa de
  anotação por passo), mas ensina o modelo a ter um processo correto, não
  só "acertar por sorte" com raciocínio falho que chega na resposta certa
  por acidente.

## 7.8 Recompensas verificáveis

Em domínios onde a resposta final pode ser checada automaticamente e sem
ambiguidade (matemática: bateu com o resultado numérico? código: passou
nos testes?), é possível gerar sinal de recompensa em escala, sem
avaliação humana — a base do treino por RL em reasoning (GRPO, Semana 9,
foi popularizado exatamente nesse regime).

## 7.9 Limitações e riscos

Dados de raciocínio sintético podem propagar erros sistemáticos do modelo
gerador. Reasoning traces longos custam mais tokens (Fase 1, Semana 11) em
produção. E um modelo pode aprender a produzir um trace de raciocínio que
*parece* correto sem realmente refletir o processo que levou à resposta
("raciocínio pós-hoc", não causal).

## Lab prático

[`labs/07-reasoning-cot.ipynb`](../../labs/07-reasoning-cot.ipynb) —
compara zero-shot vs Chain-of-Thought vs self-consistency (5 amostras +
voto majoritário) num conjunto de problemas de raciocínio simples,
medindo accuracy real de cada abordagem.
