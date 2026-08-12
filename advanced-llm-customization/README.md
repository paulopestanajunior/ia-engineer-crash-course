# 🧬 Fase 2: Customização de LLMs

Trilha avançada — depois de dominar a Fase 1 (`modules/`, `projects/`,
construir agentes que *usam* LLMs via API), essa fase ensina a *customizar*
o modelo em si: fine-tuning, alinhamento, destilação, MoE, quantização.

Inspirada na ementa do curso pago **"Advanced AI — Customização de LLMs"**
(I2A2 Institute, R$3.500, 12 semanas) — mesma cobertura de tópicos, conteúdo
e código escritos do zero por nós, sem custo.

## Por que uma trilha separada da Fase 1

Fase 1 (`modules/`) ensina a construir **sistemas em cima** de um LLM já
treinado (Claude via API) — RAG, agentes, grafos. Fase 2 ensina o que
acontece **dentro** do LLM — como ele é treinado, como adaptar seus pesos.
São habilidades complementares, mas o público e a profundidade técnica são
diferentes o suficiente pra merecer currículo próprio.

## Sobre os labs práticos — GPU real vs este ambiente

O curso original dá acesso a GPUs pra treinar em modelos de produção. Este
repositório roda em CPU, sem infraestrutura paga. A solução: todo lab usa um
modelo **pequeno mas real** (`sshleifer/tiny-gpt2`, ~100k parâmetros, ou
`HuggingFaceTB/SmolLM2-135M` quando precisamos de um modelo que já entende
linguagem de verdade) — o treino é genuíno (gradiente de verdade,
`backward()`/`optimizer.step()` reais, bibliotecas de produção como
`transformers`/`peft`/`trl`/`bitsandbytes`), só a escala é de brinquedo.
**A mecânica é idêntica à de produção** — trocar `tiny-gpt2` por
`meta-llama/Llama-3-8B` numa GPU real não muda uma linha da lógica de
treino, só o tempo e o custo.

## As 12 Semanas

| Semana | Tema | Lab prático |
|---|---|---|
| [1](./modules/week01-fundamentos-llm/CONCEITOS.md) | Fundamentos de LLMs | [tokens, embeddings, logits, temperatura](./labs/01-tokenizacao-embeddings.ipynb) |
| [2](./modules/week02-transformers-attention/CONCEITOS.md) | Transformers, Attention e QKV | [attention calculada na mão](./labs/02-attention-do-zero.ipynb) |
| [3](./modules/week03-treinamento-llm/CONCEITOS.md) | Como um LLM é treinado | [loop de treino do zero](./labs/03-loop-de-treino.ipynb) |
| [4](./modules/week04-preparacao-datasets/CONCEITOS.md) | Preparação de datasets | [curadoria + chat template](./labs/04-curadoria-dataset.ipynb) |
| [5](./modules/week05-sft/CONCEITOS.md) | Supervised Fine-Tuning | [SFT real com TRL](./labs/05-sft-real.ipynb) |
| [6](./modules/week06-lora-qlora/CONCEITOS.md) | LoRA e QLoRA | [LoRA + QLoRA 4-bit real](./labs/06-lora-qlora-real.ipynb) |
| [7](./modules/week07-reasoning/CONCEITOS.md) | Reasoning | [CoT + self-consistency](./labs/07-reasoning-cot.ipynb) |
| [8](./modules/week08-alinhamento-preferencias/CONCEITOS.md) | Alinhamento por preferências | [DPO real com TRL](./labs/08-dpo-real.ipynb) |
| [9](./modules/week09-rl-ppo-grpo/CONCEITOS.md) | RL — PPO e GRPO | [GRPO real com TRL](./labs/09-grpo-real.ipynb) |
| [10](./modules/week10-distillation/CONCEITOS.md) | Model Distillation | [destilação teacher→student real](./labs/10-distillation-real.ipynb) |
| [11](./modules/week11-moe-quantizacao-inferencia/CONCEITOS.md) | MoE, Quantização, Inferência | [MoE do zero + quantização real](./labs/11-moe-quantizacao.ipynb) |
| [12](./modules/week12-projeto-final/CONCEITOS.md) | Projeto Final | [template + checklist](./labs/12-projeto-final-template.ipynb) |

## Pré-requisitos

Fase 1 completa (ou equivalente) + Python. Os labs instalam
`torch`, `transformers`, `peft`, `trl`, `bitsandbytes`, `datasets` — bem
mais pesado que a Fase 1. Use o `.venv` do repositório (`pip install -r requirements.txt`
nesta pasta).
