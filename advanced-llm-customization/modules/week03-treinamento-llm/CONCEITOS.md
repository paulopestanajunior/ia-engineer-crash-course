# Semana 3 — Como um LLM é treinado

## Visão Geral

A Semana 1 mostrou como o modelo *gera* texto (inferência). Essa semana
mostra como os pesos que produzem essa geração são **aprendidos** —
o ciclo de treino que transforma um modelo com pesos aleatórios (Semana 2,
Lab 2, onde usamos `torch.randn`) num modelo que realmente entende
linguagem.

---

## 3.1 Objetivo de previsão do próximo token

O objetivo de treino de um LLM é simples de enunciar: dado um texto, prever
cada próximo token a partir dos anteriores — a mesma tarefa da geração
(Semana 1.5), só que agora comparando a previsão do modelo com o token
**real** que veio a seguir no texto de treino, e ajustando os pesos pra
errar menos da próxima vez.

## 3.2 Labels e deslocamento da sequência

Não existe "rótulo" separado — o próprio texto é o rótulo, deslocado em 1
posição. Se o texto é `[A, B, C, D]`, o modelo vê `[A, B, C]` como input e
`[B, C, D]` como o que deveria ter previsto em cada posição (prever B a
partir de A, prever C a partir de A,B, prever D a partir de A,B,C).

## 3.3 Cross-entropy loss

A métrica de erro: para cada posição, compara a distribuição de
probabilidade que o modelo previu (depois do softmax, Semana 1.6) com o
token real (representado como "probabilidade 100% no token certo"). Quanto
mais longe a probabilidade prevista do token certo estava de 100%, maior o
loss. Loss baixo = o modelo estava confiante e certo.

## 3.4 Backpropagation e Gradient Descent

**Backpropagation** calcula, pra cada peso do modelo, o quanto uma pequena
mudança naquele peso mudaria o loss (o gradiente). **Gradient descent**
usa esse gradiente pra ajustar cada peso na direção que reduz o loss —
repetido milhões de vezes, isso é o que "treina" o modelo.

## 3.5 Learning rate, batch size e otimizadores

- **Learning rate:** o tamanho do passo dado a cada ajuste de peso. Grande
  demais = o treino "pula" o mínimo e diverge; pequeno demais = treino
  lentíssimo.
- **Learning rate scheduler:** varia o LR ao longo do treino (comum: warmup
  no início + decay no final).
- **Batch size:** quantos exemplos processados antes de cada ajuste de
  peso. **Gradient accumulation** simula um batch maior acumulando
  gradientes de vários batches pequenos antes de aplicar o ajuste — útil
  quando a memória da GPU não cabe um batch grande de uma vez.
- **Otimizador (Adam/AdamW):** o algoritmo que usa o gradiente pra decidir
  o ajuste exato — mantém "momentum" (direção das mudanças anteriores) em
  vez de só seguir o gradiente cru.

## 3.6 Épocas, steps e checkpoints

Um **step** é um ajuste de peso (processar um batch). Uma **época** é
passar pelo dataset inteiro uma vez. **Checkpoints** são snapshots dos
pesos salvos periodicamente — permitem retomar treino interrompido ou
comparar o modelo em diferentes pontos do treino.

## 3.7 Overfitting, generalização e gradient clipping

**Overfitting:** o modelo "decora" o dataset de treino em vez de aprender
padrões generalizáveis — performa bem no treino, mal em dados novos.
Detectado comparando loss de treino vs loss de validação (dados que o
modelo nunca viu). **Gradient clipping:** limita o tamanho máximo do
gradiente — evita que um batch "estranho" cause um ajuste de peso
gigante e desestabilize o treino.

## 3.8 Precisão numérica: FP32, FP16, BF16

Os pesos e cálculos podem usar diferentes precisões de número
de ponto flutuante:
- **FP32** (32 bits): mais preciso, mais memória, mais lento.
- **FP16** (16 bits): metade da memória, mas risco de "overflow" numérico
  em alguns casos.
- **BF16** (16 bits, mais bits de expoente): o padrão em treino moderno —
  quase a velocidade do FP16 com estabilidade numérica melhor.

## 3.9 Uso de memória durante treino vs inferência

Treinar usa **muito mais memória** que só rodar o modelo (inferência),
porque precisa guardar, além dos parâmetros: os **gradientes** (mesmo
tamanho dos parâmetros), o **estado do otimizador** (Adam guarda 2x o
tamanho dos parâmetros em momentums) e as **ativações** intermediárias de
cada camada (necessárias pra calcular os gradientes no backward pass).
Regra prática: treinar full fine-tuning precisa de ~4x mais memória que só
inferência — é exatamente esse problema que LoRA (Semana 6) resolve.

## Lab prático

[`labs/03-loop-de-treino.ipynb`](../../labs/03-loop-de-treino.ipynb) —
implementa um loop de treino completo do zero (forward → loss →
backward → optimizer.step()) no `tiny-gpt2`, visualiza o loss caindo ao
longo dos steps, e mede o uso de memória antes/depois de ativar o cálculo
de gradientes.
