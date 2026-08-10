# Projeto #3: Performance Analysis

**Domínio:** Futebol — Premier League (dado real)
**Problema:** Como está o jogador? Vai melhorar? Qual o valor de mercado?
**Stack:** Python + LangGraph + Streaming + (Cloud Pub/Sub + Claude em produção)
**Dataset:** [Fantasy Premier League 2023-24](../../datasets/README.md) — 865 jogadores reais, MIT

## Conceitos cobertos

| Semana | Conceito | Onde no notebook |
|---|---|---|
| W1-2 | Fundamentos + Prompting | `mock_player_analysis` |
| W3 | RAG histórico | `retrieve_historical_seasons` |
| W5 | Tool Use | `tool_live_stats`, `tool_market_comparables` |
| W5-6 | Agentic Loop / streaming | loop de "ticks" simulando updates em tempo real |
| W6-7 | LangGraph (pipeline de tempo real) | Ingest → Update → Report |
| W7 | Streaming & Real-time | simulação de 3 ticks consecutivos |
| W7 | Confidence Scoring | combina qualidade do dado + concordância de mercado |
| W8 | Observability de latência | `tick_latency_ms` |

## Rodar

Abra [`notebook.ipynb`](./notebook.ipynb) no Colab ou Jupyter local.

- **Sem `ANTHROPIC_API_KEY`:** roda em modo mock, determinístico, sem custo.
- **Com `ANTHROPIC_API_KEY`** no ambiente: a análise de tendência/valor de
  mercado chama a Claude API de verdade.

**Testes:** seção final, valida range de confidence e categoria válida de
tendência.

**Docker:** `docker build -f Dockerfile -t performance-analysis ..` (a
partir da raiz do repo).

## Próximos passos pra produção

- Trocar o loop de "ticks" por consumo real de Cloud Pub/Sub
- `tool_live_stats` → API real de dados ao vivo (Opta, StatsBomb, etc)
- Avaliação real: valor previsto vs valor real de mercado (Transfermarkt)
- Deploy: Cloud Run com endpoint de streaming (SSE ou WebSocket)
