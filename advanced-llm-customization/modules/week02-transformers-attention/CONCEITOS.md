# Semana 2 — Transformers, Attention e QKV

## Visão Geral

Todo LLM moderno é construído em cima da arquitetura **Transformer**
(Vaswani et al., 2017, "Attention Is All You Need"). O mecanismo central
que faz ela funcionar é a **self-attention** — essa semana abre exatamente
como isso funciona, matematicamente.

---

## 2.1 Estrutura de um Transformer

O paper original tinha **encoder** (processa o input inteiro de uma vez,
bom pra entender) e **decoder** (gera token por token, bom pra gerar). A
maioria dos LLMs modernos (GPT, Llama, Claude) usa arquitetura
**decoder-only** — só a metade geradora, mas com *causal attention* (cada
token só "vê" os tokens anteriores, nunca os futuros — essencial pra gerar
texto coerentemente da esquerda pra direita).

## 2.2 Self-attention e Matrizes QKV

**A ideia central:** pra processar um token, o modelo pergunta "quais
outros tokens da sequência são relevantes pra entender este aqui?" e
"pesa" a informação deles proporcionalmente à relevância.

Isso é feito com 3 matrizes aprendidas, aplicadas ao embedding de cada
token:
- **Query (Q):** "o que este token está procurando"
- **Key (K):** "o que este token oferece, pra ser encontrado"
- **Value (V):** "a informação real que este token carrega, se for relevante"

## 2.3 Scaled Dot-Product Attention

A fórmula central:

```
Attention(Q, K, V) = softmax(Q·Kᵀ / √d_k) · V
```

Passo a passo: `Q·Kᵀ` mede a similaridade entre cada par de tokens
(quanto a Query de um "casa" com a Key do outro). Divide-se por `√d_k`
(dimensão das chaves) pra estabilizar os valores. `softmax` transforma
essas similaridades numa distribuição de pesos (somando 1). Multiplicar
pelos `V` dá a saída: uma média ponderada dos Values, pesada por
relevância.

## 2.4 Attention scores e máscara causal

Os pesos resultantes do softmax são os **attention scores** — quanto cada
token "olha" pra cada outro. Numa arquitetura causal (decoder-only), uma
**máscara** zera (na prática, `-infinito` antes do softmax) os scores de
qualquer token futuro — o token na posição 5 nunca pode "ver" o token na
posição 8, senão o modelo estaria trapaceando ao prever o futuro usando o
próprio futuro.

## 2.5 Multi-head attention

Em vez de calcular attention uma vez só, o Transformer calcula **várias
"cabeças" em paralelo**, cada uma com seu próprio Q/K/V aprendido — cada
cabeça pode aprender a prestar atenção em relações diferentes (uma cabeça
foca em relações sintáticas, outra em relações semânticas de longo alcance,
etc.). As saídas de todas as cabeças são concatenadas e projetadas de
volta pro tamanho original.

## 2.6 Positional embeddings

Attention, sozinha, não sabe *onde* cada token está na sequência (é uma
operação sobre um "conjunto", não uma "sequência ordenada"). Positional
embeddings (somados ou combinados com o embedding do token) injetam essa
informação de posição — sem isso, "o gato comeu o rato" e "o rato comeu o
gato" pareceriam idênticos pro mecanismo de attention.

## 2.7 Feed-forward, residual connections e layer normalization

Depois da attention, cada bloco Transformer tem uma rede feed-forward
(duas camadas lineares com não-linearidade no meio) que processa cada
posição independentemente. **Residual connections** (somar o input de
volta na saída de cada sub-camada) e **layer normalization** (normalizar
as ativações) são o que permite empilhar dezenas de blocos sem o
treinamento explodir ou desaparecer (vanishing/exploding gradients).

## 2.8 Fluxo completo de um bloco Transformer

```
input → self-attention → +residual → layer norm
      → feed-forward     → +residual → layer norm → output
```

Um LLM é essa unidade empilhada dezenas de vezes (GPT-2 pequeno: 12 blocos;
modelos de produção: 32-100+ blocos).

## Lab prático

[`labs/02-attention-do-zero.ipynb`](../../labs/02-attention-do-zero.ipynb) —
implementa scaled dot-product attention **do zero** com PyTorch puro (sem
usar a implementação pronta do `transformers`), visualiza a matriz de
attention scores, e compara com a saída da implementação real da biblioteca
pra confirmar que bate.
