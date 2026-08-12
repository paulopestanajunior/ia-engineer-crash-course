# Semana 6 — Fine-tuning Eficiente com LoRA e QLoRA

## Visão Geral

Full fine-tuning (Semana 5) atualiza **todos** os parâmetros do modelo —
caro em memória (Semana 3.9) e arriscado (catastrophic forgetting, Semana
5.7). LoRA resolve os dois problemas ao mesmo tempo, treinando uma fração
minúscula dos parâmetros. Já usamos LoRA de forma simples na Fase 1
(Semana 13.4) — essa semana aprofunda o mecanismo.

---

## 6.1 Parameter-Efficient Fine-Tuning (PEFT)

Categoria de técnicas que adaptam um modelo grande treinando só uma
pequena fração de parâmetros novos ou existentes, em vez do modelo
inteiro. LoRA é a técnica PEFT mais usada, mas existem outras (prefix
tuning, adapter layers, etc.).

## 6.2 A ideia central do LoRA: matrizes de baixo rank

Em vez de atualizar uma matriz de pesos `W` (grande, ex.: 4096×4096)
diretamente, LoRA **congela `W`** e aprende duas matrizes pequenas `A`
(4096×r) e `B` (r×4096), onde `r` (o **rank**) é bem menor que 4096
(tipicamente 4-64). A atualização efetiva é `W + A·B` — o produto `A·B`
tem o mesmo formato de `W`, mas foi construído a partir de muito menos
parâmetros livres (`4096×r + r×4096` em vez de `4096×4096`).

**Por que isso funciona:** a hipótese (validada empiricamente no paper
original) é que a *mudança necessária* nos pesos durante fine-tuning tem
"rank intrínseco" baixo — não precisa da expressividade total de uma
matriz cheia pra capturar a adaptação.

## 6.3 Rank, alpha e dropout

- **r (rank):** controla quantos parâmetros treináveis existem — maior r =
  mais capacidade de adaptação, mais parâmetros, mais memória.
- **alpha:** um fator de escala aplicado à saída de `A·B` antes de somar a
  `W` (a atualização efetiva é escalada por `alpha/r`) — controla "o quanto
  o adapter LoRA pesa" na saída final.
- **dropout:** regularização aplicada durante o treino do adapter, reduz
  overfitting no dataset de fine-tuning (que costuma ser pequeno).

## 6.4 Seleção dos módulos-alvo (target modules)

LoRA não precisa ser aplicado em todas as camadas — você escolhe quais
(`target_modules`). Comum: aplicar só nas projeções de attention (Query,
Key, Value — Semana 2.2) ou também nas camadas feed-forward (Semana 2.7).
Mais módulos = mais capacidade de adaptação, mais parâmetros treináveis.

## 6.5 QLoRA — LoRA sobre um modelo quantizado

QLoRA combina LoRA com **quantização** (Semana 11): o modelo base é
carregado em precisão reduzida (4 bits, em vez de 16/32 — ver **NF4**, um
formato de quantização desenhado especificamente pra pesos de redes
neurais, e **double quantization**, que quantiza até os próprios
parâmetros de quantização pra economizar ainda mais memória), enquanto os
adapters LoRA continuam treinando em precisão mais alta por cima. Resultado:
fine-tuning de modelos muito maiores no mesmo hardware, à custa de um
pouco de qualidade (a quantização introduz aproximação).

## 6.6 Merge de adapters e múltiplos adapters

Depois do treino, um adapter LoRA pode ser **mesclado** (merge) de volta
no modelo base (`W_novo = W + A·B`), virando um modelo único sem overhead
de inferência extra — ou mantido **separado**, permitindo trocar entre
múltiplos adapters (um por tarefa/cliente) sem duplicar o modelo base
inteiro na memória.

## 6.7 Versionamento e distribuição

Como um adapter LoRA é pequeno (megabytes, não gigabytes), é prático
versionar e distribuir vários adapters especializados separadamente do
modelo base — um padrão comum em produção (um modelo base compartilhado +
vários adapters leves por caso de uso).

## 6.8 Comparação: Full Fine-tuning vs LoRA vs QLoRA

| | Full FT | LoRA | QLoRA |
|---|---|---|---|
| Parâmetros treináveis | 100% | ~0.1-1% | ~0.1-1% |
| Memória de treino | Máxima | Baixa | Mínima |
| Qualidade potencial | Máxima | Próxima do full FT | Levemente abaixo do LoRA |
| Risco de catastrophic forgetting | Alto | Baixo | Baixo |
| Velocidade de treino | Mais lenta | Mais rápida | Rápida (mas quantização adiciona overhead) |

## Lab prático

[`labs/06-lora-qlora-real.ipynb`](../../labs/06-lora-qlora-real.ipynb) —
compara os 3 approaches (full fine-tuning, LoRA, QLoRA) no mesmo modelo e
dataset: número de parâmetros treináveis, uso de memória, e qualidade da
saída — tudo com treino real, usando `peft` (LoRA) e `bitsandbytes`
(quantização 4-bit) de produção.
