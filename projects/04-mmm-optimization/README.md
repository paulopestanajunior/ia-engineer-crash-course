# Projeto #4: Marketing Mix Modeling (MMM) — SOTA 2026 ⭐

**Domínio:** Marketing budgeting
**Problema:** Como aloco $1M de budget entre TV, Rádio e Jornal?
**Stack:** Python + LangGraph + Speculative Decoding + Constitutional AI
**Dataset:** [Advertising (ISLR/Stanford)](../../datasets/README.md) — 200 observações reais, uso educacional livre. Só 3 canais (não 4) — honesto com o dado real disponível.

Projeto de integração final — toca os 5 conceitos SOTA da Week 13, além de
tudo que veio antes.

## Conceitos cobertos

| Conceito (Semana 13) | Onde no notebook |
|---|---|
| Speculative Decoding | `draft_model_generate` (1000 rápido) + `verifier_model_verify` (top 20 preciso) |
| Constitutional AI | validators do `MarketingMix` + retry loop em `optimization` |
| Mixture of Experts | `moe_routing` — aggressive/balanced/conservative |
| Dados Sintéticos | `generate_synthetic_scenarios` — expande histórico 5x |
| Fine-tuning (LoRA) | **real** — seção 9, treino genuíno com PyTorch + PEFT num modelo pequeno (`sshleifer/tiny-gpt2`) |

Mais os conceitos das semanas 1-12 (saídas estruturadas, RAG, tool use,
agentic loop, LangGraph, observabilidade) já demonstrados nos projetos #1-3.

## Rodar

Abra [`notebook.ipynb`](./notebook.ipynb) no Colab ou Jupyter local.

- **Sem `ANTHROPIC_API_KEY`:** a análise de elasticidade roda em modo mock;
  a seção de LoRA **sempre treina de verdade** (não depende de API key —
  usa um modelo local pequeno).
- **Com `ANTHROPIC_API_KEY`** no ambiente: a análise de elasticidade chama a
  Claude API de verdade.
- A seção de LoRA baixa um modelo (~100k parâmetros) do Hugging Face Hub na
  primeira execução — precisa de internet.

**Testes:** validados via execução completa do pipeline (a seção 8 já
confere que o mix soma exatamente o budget e respeita a constituição).

**Docker:** `docker build -f Dockerfile -t mmm-optimization ..` (a partir
da raiz do repo) — mais lento que os outros 3 por causa do PyTorch.

## Próximos passos pra produção

- Elasticidade real via regressão (statsmodels) como complemento/validação do Claude
- Dataset real do BigQuery no lugar do gerador sintético
- LoRA com um modelo aberto de verdade (Llama 3, Mistral) numa GPU
- Deploy: Cloud Run + Cloud Scheduler pra rodar semanalmente
