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

Abra [`notebook.ipynb`](./notebook.ipynb) no Colab ou Jupyter local.

- **Sem `ANTHROPIC_API_KEY`:** roda em modo mock, determinístico, sem custo.
- **Com `ANTHROPIC_API_KEY`** no ambiente: `analyzer_agent` chama a Claude
  API de verdade (extended thinking via `tool_use`).

**Testes:** seção final, valida que CTR/CPA nunca são negativos e que a
recomendação bate com a classificação de performance.

**Docker:** `docker build -f Dockerfile -t marketing-campaigns ..` (a
partir da raiz do repo).

## Próximos passos pra produção

- Semantic cache real (Vertex AI Embeddings + Redis)
- Dataset real do BigQuery no lugar do gerador sintético
- Avaliação real: taxa de adoção das recomendações pelo time de marketing
