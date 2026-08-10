# Projeto #1: Churn Prediction

**Domínio:** Telecom (dado real)
**Problema:** Qual cliente vai sair? Por quê? Como reter?
**Stack:** Python + LangGraph + Pydantic + (Firestore + Claude em produção)
**Dataset:** [IBM Telco Customer Churn](../../datasets/README.md) — 7.043 clientes reais, Apache 2.0

## Conceitos cobertos

| Semana | Conceito | Onde no notebook |
|---|---|---|
| W2 | Structured Outputs | `ChurnPrediction` (Pydantic) |
| W3-4 | RAG tradicional + adaptativo | `retrieve_similar_churned` |
| W5 | Tool Use | `tool_query_support_history` |
| W5-6 | Agentic Loop + stopping rule | `churn_agentic_loop` (para em confidence ≥ 0.85 ou 3 tentativas) |
| W6-7 | LangGraph (pipeline linear) | Gather → Retrieve → Predict → Verify |
| W7 | Confidence Scoring | escalonamento se confidence < 0.60 |
| W8 | Observability | `log_prediction` |

## Rodar

Abra [`notebook.ipynb`](./notebook.ipynb) no Colab ou Jupyter local.

- **Sem `ANTHROPIC_API_KEY`:** roda em modo mock, determinístico, sem custo.
- **Com `ANTHROPIC_API_KEY`** no ambiente: chama a Claude API de verdade
  (via `tool_use`, forçando saída estruturada). A primeira célula imprime
  `🔑 Modo: API REAL` ou `🔑 Modo: MOCK` confirmando qual está ativo.

O notebook já tem o output de uma execução real embutido em cada célula —
dá pra ler sem rodar nada.

**Testes:** seção final do notebook, com `assert`s validando range de
confidence, respeito à stopping rule, e escalonamento correto.

**Docker:** `docker build -f Dockerfile -t churn-prediction ..` (a partir da
raiz do repo) — ver comentários no [`Dockerfile`](./Dockerfile).

## Próximos passos pra produção

- Vector DB real (Chroma/Pinecone) no lugar do RAG por distância euclidiana
- Persistir estado no Firestore
- Deploy de fato no Cloud Run (o Dockerfile builda; falta o `gcloud run deploy`)
- Avaliação real: accuracy vs churn observado após 30 dias
