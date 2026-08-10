# Semana 2-3: Dados e Saídas Estruturadas

## Visão Geral

Um agente que só devolve texto livre é inútil em produção — seu código
downstream (banco de dados, outro serviço, uma UI) precisa de um formato
previsível. Essa semana ensina a garantir que a saída do LLM seja sempre um
objeto validado, não uma string que você torce pra dar `parse()`.

---

## 2.1 Saídas Estruturadas (NOVO 2025-2026)

**O que é:** técnicas pra forçar o LLM a devolver dados num schema fixo, em
vez de texto livre que você tenta interpretar depois.

- **JSON mode vs Tools vs Structured outputs:** três formas diferentes de
  conseguir JSON de um LLM. JSON mode pede "responda em JSON" no prompt (o
  menos confiável); Tools/function calling usa o mecanismo nativo do modelo
  pra chamar uma "função" com argumentos tipados; Structured outputs
  (Pydantic + validação) é a camada que você controla no seu código,
  independente de o modelo cooperar ou não.
- **Pydantic v2** é a ferramenta usada neste curso: você declara um
  `BaseModel` com os campos esperados (tipos, ranges via `Field(ge=..., le=...)`,
  validators customizados) e valida a resposta do modelo contra ele. Se a
  validação falhar, você sabe imediatamente — em vez de propagar um erro
  silencioso pro resto do pipeline.
- **Parsing reliability:** com JSON mode "cru" a taxa de parsing correto fica
  em torno de 98% — os 2% que falham geralmente quebram em produção sem
  aviso. Validação explícita com Pydantic transforma esse erro invisível num
  `ValidationError` que você trata.

## 2.2 Validação e Qualidade de Dados

**O que é:** garantir que os dados que entram e saem do agente fazem sentido,
não só que têm o formato certo.

- **Input validation:** valide o que chega antes de gastar tokens processando
  (ex.: um `customer_id` vazio não deveria nem chegar no LLM).
- **Output verification & fallbacks:** mesmo com schema validado, o
  *conteúdo* pode estar errado (ex.: `confidence=0.99` mas a justificativa é
  vaga). Isso é o papel do "Verifier" no padrão Harness — uma camada de
  checagem separada da geração.
- **Graceful degradation:** se a validação falhar após N tentativas, o agente
  deve devolver um resultado parcial ou escalar pra humano, nunca travar.

## 2.3 Trabalhando com Bancos de Dados

**O que é:** como o agente busca e usa dados estruturados existentes (não
gerados pelo LLM) como contexto.

- Query de dados pra dar contexto ao LLM (ex.: histórico do cliente antes de
  prever churn) é diferente de RAG (Week 3) — aqui os dados já são
  estruturados (linhas de banco), não texto não-estruturado pra buscar por
  similaridade.
- **Schema design pra agentes:** pense em quais campos o agente vai
  realmente consultar, e indexe por eles — cada chamada de tool que faz uma
  query lenta é latência que o usuário sente.

## 2.4 Prática

- **Notebook:** [`projects/01-churn-prediction/notebook.ipynb`](../../projects/01-churn-prediction/notebook.ipynb) —
  seção 1 define `ChurnPrediction` (schema de saída) e `CustomerState`
  (schema de estado do agente), ambos com Pydantic v2 e validação de range
  via `Field`.
- **Examples:** Customer schema, Campaign schema
- **Project #1 Start:** Churn Prediction setup

**Conceito Chave:** Structured outputs garantem parsing confiável — sem eles,
todo o resto do pipeline (RAG, tools, loops, grafo) fica sobre uma base
instável.

---
