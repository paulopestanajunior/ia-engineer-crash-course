# Projeto #4: Marketing Mix Modeling (MMM) — SOTA 2026 ⭐

**Domínio:** Marketing budgeting (CPG, Retail, SaaS)
**Problema:** Como aloco $1M de budget entre TV, Digital, Social e Outdoor?
**Stack:** Python + LangGraph + Speculative Decoding + Constitutional AI

Projeto de integração final — toca os 5 conceitos SOTA da Week 13, além de
tudo que veio antes.

## Conceitos cobertos

| Conceito (Week 13) | Onde no notebook |
|---|---|
| Speculative Decoding | `draft_model_generate` (1000 rápido) + `verifier_model_verify` (top 20 preciso) |
| Constitutional AI | validators do `MarketingMix` + retry loop em `optimization` |
| Mixture of Experts | `moe_routing` — aggressive/balanced/conservative |
| Synthetic Data | `generate_synthetic_scenarios` — expande histórico 5x |
| Efficient Fine-tuning (LoRA) | não implementado no mock — ver nota no notebook |

Mais os conceitos das semanas 1-12 (structured outputs, RAG, tool use, agentic
loop, LangGraph, observability) já demonstrados nos projetos #1-3.

## Rodar

Abra [`notebook.ipynb`](./notebook.ipynb) no Colab ou Jupyter local. Todo o
código usa mocks — não precisa de API key pra rodar como está.

## Próximos passos pra produção

- Elasticidade real via regressão (statsmodels) ou o próprio Claude interpretando os dados
- Dataset real do BigQuery no lugar do gerador sintético
- LoRA fine-tuning real (requer modelo aberto, não a API da Anthropic)
- Deploy: Cloud Run + Cloud Scheduler pra rodar semanalmente
