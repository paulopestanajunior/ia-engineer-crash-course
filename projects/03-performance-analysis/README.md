# Projeto #3: Performance Analysis

**Domínio:** Esportes / Performance de jogadores
**Problema:** Como está o jogador? Vai melhorar? Qual o valor de mercado?
**Stack:** Python + LangGraph + Streaming + (Cloud Pub/Sub + Claude em produção)

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

Abra [`notebook.ipynb`](./notebook.ipynb) no Colab ou Jupyter local. Todo o
código usa mocks — não precisa de API key pra rodar como está.

## Próximos passos pra produção

- Trocar o loop de "ticks" por consumo real de Cloud Pub/Sub
- `tool_live_stats` → API real de dados ao vivo (Opta, StatsBomb, etc)
- Avaliação real: valor previsto vs valor real de mercado (Transfermarkt)
- Deploy: Cloud Run com endpoint de streaming (SSE ou WebSocket)
