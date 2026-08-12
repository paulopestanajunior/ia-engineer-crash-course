# Semana 4 — Preparação e Curadoria de Datasets

## Visão Geral

"Garbage in, garbage out" é mais verdadeiro em fine-tuning do que em quase
qualquer outra parte de ML — a qualidade do dataset de treino importa mais
que quase qualquer escolha de hiperparâmetro. Essa semana é sobre construir
um dataset que realmente ensina o comportamento que você quer.

---

## 4.1 Coleta, limpeza e normalização

Dados brutos (scraped, exportados de um sistema, etc.) quase sempre têm
ruído: HTML residual, encoding quebrado, duplicatas, texto vazio ou
truncado. Limpeza é o primeiro passo, sempre — treinar num dataset sujo
ensina o modelo a reproduzir o ruído.

## 4.2 Formato de instrução, entrada e resposta

O formato mais comum pra fine-tuning supervisionado (Semana 5) é
instruction/input/output (ou variantes): uma instrução do que fazer, um
input opcional (contexto), e a resposta esperada. É a estrutura que ensina
o modelo a seguir instruções, não só completar texto.

## 4.3 Datasets conversacionais e chat templates

Pra modelos de chat (a maioria dos LLMs modernos), o dataset é uma
sequência de turnos `{role: "user"/"assistant"/"system", content: "..."}`.
O **chat template** é a função que converte essa estrutura em texto puro
com tokens especiais delimitando cada turno (ex.: `<|user|>...<|assistant|>...`)
— cada família de modelo tem seu próprio template, e usar o errado
degrada drasticamente a qualidade do fine-tuning.

## 4.4 System prompts

A instrução de "papel"/comportamento que vale pra conversa inteira (ver
Fase 1, Semana 1.2). Incluir (ou não) system prompts consistentes no
dataset de treino afeta como o modelo generaliza pra system prompts
diferentes em produção.

## 4.5 Tokenização, padding, truncamento e attention masks

Sequências de tamanhos diferentes precisam ser "niveladas" pra formar um
batch: **padding** adiciona tokens vazios até o comprimento da sequência
mais longa do batch; **truncamento** corta sequências longas demais. A
**attention mask** marca quais posições são padding (ignoradas no cálculo
de loss e attention) — visto na prática no Lab 3.

## 4.6 Split treino/validação/teste

- **Treino:** o que o modelo realmente aprende.
- **Validação:** usado durante o treino pra monitorar overfitting (Semana
  3.7) e decidir quando parar.
- **Teste:** completamente isolado, usado só na avaliação final — nunca
  influencia decisões durante o desenvolvimento.

## 4.7 Deduplicação, balanceamento e diversidade

**Deduplicação:** exemplos repetidos (ou quase idênticos) inflam
artificialmente a importância daquele padrão no treino. **Balanceamento:**
se uma categoria de exemplo domina o dataset, o modelo tende a "regredir
pra média" nela. **Diversidade:** cobrir variações reais do domínio (não
só o caso feliz) é o que faz o modelo generalizar.

## 4.8 Controle de qualidade e prevenção de data leakage

Revisar amostras do dataset manualmente (mesmo que não dê pra revisar
tudo) pega erros sistemáticos que passariam despercebidos. **Data
leakage:** garantir que nenhum exemplo do teste vazou pro treino (ex.:
via deduplicação malfeita, ou dados de validação reaproveitados) — senão a
avaliação final mostra um resultado otimista demais e não confiável.

## 4.9 Dados sintéticos

Quando dados reais são escassos, um LLM mais forte pode gerar exemplos de
treino sintéticos (ver Fase 1, Semana 13.5, e Semana 10 desta trilha —
Distillation, onde isso é central). Sempre precisa de filtro de qualidade
— dado sintético ruim ensina padrões ruins tão bem quanto dado real ruim.

## 4.10 Licenciamento, privacidade e governança

Antes de usar qualquer dataset pra treino: checar a licença permite esse
uso, garantir que dado pessoal foi removido/anonimizado, e documentar a
proveniência (você precisa saber de onde cada exemplo veio, caso precise
remover depois).

## Lab prático

[`labs/04-curadoria-dataset.ipynb`](../../labs/04-curadoria-dataset.ipynb) —
pega um dataset bruto e "sujo" (com duplicatas, exemplos vazios, tamanhos
desbalanceados), aplica limpeza + deduplicação + split, formata no chat
template real de um modelo, e tokeniza o resultado — o dataset final é
exatamente o input que o Lab 5 (SFT) usa.
