# Projeto #1: Churn Prediction

**Domínio:** SaaS, Streaming, Telecom — qualquer empresa com clientes recorrentes
**Problema:** Qual cliente vai sair? Por quê? Como reter?
**Stack:** Python + LangGraph + Pydantic + (Firestore + Claude em produção)

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

Abra [`notebook.ipynb`](./notebook.ipynb) no Colab ou Jupyter local. Todo o
código usa mocks — não precisa de API key pra rodar como está.

## Próximos passos pra produção

- Trocar `mock_llm_call` por `anthropic.Anthropic().messages.create(...)`
- Vector DB real (Chroma/Pinecone) no lugar do RAG por distância euclidiana
- Persistir estado no Firestore
- Deploy no Cloud Run
- Avaliação real: accuracy vs churn observado após 30 dias
