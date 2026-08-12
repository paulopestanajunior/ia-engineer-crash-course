# Semana 1 — Fundamentos de Large Language Models

## Visão Geral

Antes de treinar ou customizar um LLM, você precisa entender o que
literalmente acontece entre "texto de entrada" e "texto de saída". Essa
semana abre a caixa-preta: tokens, embeddings, e como o modelo decide qual
palavra vem a seguir.

---

## 1.1 Evolução dos modelos de linguagem

De modelos estatísticos n-gram (contam frequência de sequências de
palavras) para redes neurais recorrentes (RNN/LSTM, que processam texto
sequencialmente) até os Transformers (2017, processam a sequência inteira
em paralelo via *attention*). **Foundation Models** são modelos treinados
numa quantidade massiva de dados genéricos (texto da internet, código,
etc.) que servem de base pra várias tarefas — GPT, Claude, Llama são
foundation models. Um **LLM** é um foundation model focado em texto/linguagem,
grande o suficiente pra generalizar bem sem fine-tuning específico
(few-shot/zero-shot).

## 1.2 Tokens, tokenização e vocabulário

Um LLM não processa caracteres nem palavras inteiras — processa **tokens**,
pedaços de texto definidos por um algoritmo de tokenização (BPE —
Byte-Pair Encoding é o mais comum). "Tokenization" divide o texto em
pedaços do **vocabulário** do modelo (tipicamente 30k-100k tokens
possíveis). Palavras comuns viram 1 token; palavras raras ou em outro
idioma podem virar vários tokens (é por isso que português/gasta mais
tokens que inglês em muitos modelos — o vocabulário foi treinado com mais
texto em inglês).

## 1.3 Embeddings e representações vetoriais

Cada token vira um vetor de números (embedding) — um ponto num espaço de
alta dimensão (768, 1024, 4096 dimensões, dependendo do modelo) onde
tokens com significado parecido ficam geometricamente próximos. Essa é a
representação que o modelo realmente processa internamente — não o texto,
o vetor.

## 1.4 Context window e processamento de sequências

O **context window** é o número máximo de tokens que o modelo processa de
uma vez (input + output). Modelos modernos vão de 8k a 1M+ tokens. Tudo
que passa disso é truncado ou precisa de estratégia (RAG, sumarização) —
ver Fase 1, Semana 3.

## 1.5 Geração autoregressiva

O LLM gera texto **um token de cada vez**: prevê o próximo token dado tudo
que veio antes, adiciona esse token à sequência, e repete — usando sua
própria saída como entrada da próxima previsão (por isso "autoregressivo").
É um processo sequencial, não instantâneo — é por isso que respostas mais
longas demoram mais.

## 1.6 Logits, probabilidades e Softmax

Antes de escolher o próximo token, o modelo calcula um **logit** (um
número real, não normalizado) pra cada token possível do vocabulário — o
quão "provável" ele acha cada opção. A função **Softmax** transforma esses
logits numa distribuição de probabilidade (todos os valores somam 1) —
só depois disso o modelo (ou uma estratégia de sampling) escolhe o
próximo token.

## 1.7 Temperatura, Top-K e Top-P

Formas de controlar a aleatoriedade da escolha do próximo token:
- **Temperatura:** divide os logits antes do Softmax. Temperatura baixa
  (perto de 0) = escolhas mais determinísticas (sempre o token mais
  provável); temperatura alta = mais variado/criativo, mas mais chance de
  "alucinar".
- **Top-K:** só considera os K tokens mais prováveis, descarta o resto.
- **Top-P (nucleus sampling):** considera o menor conjunto de tokens cuja
  probabilidade acumulada passa de P (ex.: 0.9) — mais adaptativo que
  Top-K fixo.

## 1.8 Treinamento, inferência e geração — três coisas diferentes

- **Treinamento:** ajustar os pesos do modelo pra minimizar erro de
  previsão num dataset (Semana 3).
- **Inferência:** rodar o modelo já treinado pra produzir uma saída, sem
  mudar os pesos.
- **Geração:** o processo específico de inferência autoregressiva que
  produz texto, token por token (1.5 acima).

## Lab prático

[`labs/01-tokenizacao-embeddings.ipynb`](../../labs/01-tokenizacao-embeddings.ipynb) —
usa um tokenizer e modelo real (pequeno) pra visualizar tokenização,
embeddings, logits, Softmax, e o efeito de temperatura/Top-K/Top-P na
geração.
