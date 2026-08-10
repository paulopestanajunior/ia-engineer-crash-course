# Projeto #2: Marketing Campaign Analysis

**Domínio:** Marketing (qualquer empresa)
**Problema:** Qual campanha funciona? Por quê? Como otimizar o próximo ciclo?
**Stack:** Python + LangGraph + Multi-Agent + Cache semântico + (Claude em produção)

## Conceitos cobertos

| Semana | Conceito | Onde no notebook |
|---|---|---|
| W1 | Prompt Engineering | `analyzer_agent` (raciocínio explícito) |
| W3-4 | RAG + Semantic Caching | `cached_analysis` (cache por bucket de métricas) |
| W5 | Tool Use paralelo | `gather_context_parallel` (asyncio.gather) |
| W6 | Multi-Agent | `analyzer_agent` + `recommender_agent` |
| W6-7 | LangGraph com branch condicional | `route_by_performance` |
| W7 | Extended Thinking | `reasoning` list em `analyzer_agent` |
| W8 | Observability de latência | `latency_ms` no state |

## Rodar

Abra [`notebook.ipynb`](./notebook.ipynb) no Colab ou Jupyter local. Todo o
código usa mocks — não precisa de API key pra rodar como está.

## Próximos passos pra produção

- Trocar `analyzer_agent`/`recommender_agent` por chamadas reais à Anthropic
- Semantic cache real (Vertex AI Embeddings + Redis)
- Dataset real do BigQuery no lugar do gerador sintético
- Avaliação real: taxa de adoção das recomendações pelo time de marketing
