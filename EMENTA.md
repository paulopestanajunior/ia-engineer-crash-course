# 📚 EMENTA — IA Engineer Crash Course

## Currículo Detalhado (13 Semanas)

Este arquivo é o índice do curso. A explicação completa de cada semana
(o quê, por quê, como, com trechos de código dos notebooks) está em
`modules/weekNN-*/CONCEITOS.md` — os links abaixo levam direto pra lá.

---

## Estrutura Geral

```
FUNDAÇÃO       (Semanas 1-2)   → Conceitos base
INTERMEDIÁRIO  (Semanas 3-7)   → Aplicação prática
AVANÇADO       (Semanas 8-12)  → Produção
SOTA 2026      (Semana 13)     → Conceitos de ponta
```

## As 13 Semanas

| Semana | Tema | Conceitos-chave |
|---|---|---|
| [1-2](./modules/week01-fundamentos/CONCEITOS.md) | Fundamentos de LLMs em Produção | Arquitetura transformer, prompt engineering, integração com API |
| [2-3](./modules/week02-saidas-estruturadas/CONCEITOS.md) | Dados e Saídas Estruturadas | Pydantic, validação, parsing confiável |
| [3-4](./modules/week03-rag/CONCEITOS.md) | RAG (Retrieval-Augmented Generation) | RAG tradicional, RAG adaptativo, vector DBs |
| [4-5](./modules/week04-uso-ferramentas/CONCEITOS.md) | Uso de Ferramentas & Function Calling | Tools sequenciais/paralelas, tratamento de erro |
| [5-6](./modules/week05-agentes-loops/CONCEITOS.md) | Agentes & Loops Agênticos | Stopping rules, estado, orquestração |
| [6-7](./modules/week06-langgraph/CONCEITOS.md) | Orquestração em Grafo & LangGraph | StateGraph, edges condicionais, subgrafos |
| [7-8](./modules/week07-conceitos-avancados/CONCEITOS.md) | Conceitos Avançados | Confidence scoring, cache semântico, streaming |
| [8-9](./modules/week08-observabilidade/CONCEITOS.md) | Observabilidade & Monitoramento | Logs/traces/metrics, SLOs, alertas |
| [9-10](./modules/week09-avaliacao/CONCEITOS.md) | Avaliação & QA | Ground truth, LLM-as-judge, A/B testing |
| [10-11](./modules/week10-deploy/CONCEITOS.md) | Deploy & Infraestrutura | Docker, Cloud Run, Firestore, segurança |
| [11](./modules/week11-otimizacao-custo/CONCEITOS.md) | Otimização de Custo | Prompt caching, roteamento por custo |
| [12](./modules/week12-projeto-final/CONCEITOS.md) | Capstone & Prontidão pra Produção | Checklist de produção, case studies |
| [13](./modules/week13-avancado/CONCEITOS.md) | Conceitos Avançados (SOTA 2026) ⭐ | Speculative decoding, Constitutional AI, MoE, LoRA, dados sintéticos |

**Índice completo com status de cada semana:** [modules/README.md](./modules/README.md)

---

## Mapping: Conceitos ↔ Projetos

```
CONCEITO                    #1      #2      #3      #4
────────────────────────────────────────────────────────
Fundamentos                 ✅      ✅      ✅      ✅
Saídas Estruturadas         ✅
RAG                         ✅      ✅      ✅      ✅
Uso de Ferramentas          ✅      ✅      ✅      ✅
Agentes & Loops              ✅      ✅      ✅      ✅
LangGraph                   ✅      ✅      ✅      ✅
Confidence Scoring          ✅              ✅      ✅
Cache Semântico                      ✅              ✅
Streaming                                   ✅
Observabilidade              ⏳ parcial em todos
Avaliação                    ⏳ parcial em todos (asserts nos notebooks)
Deploy                       ⏳ parcial em todos (Dockerfile ok, sem GCP real)
Otimização de Custo          ⏳ pendente (ver bonus/04-smart-routing)
Speculative Decoding                                ✅
Constitutional AI                                   ✅
Mixture of Experts                                  ✅
Fine-tuning (LoRA)                                  ✅ real (modelo pequeno, treino genuíno)
Dados Sintéticos                                    ✅
```

`✅` = implementado no notebook do projeto · `⏳` = parcial ou documentado, falta a parte que depende de infra externa (conta GCP)

---

## Cronograma Semanal Sugerido

```
SEGUNDA:    Conceito teórico (30 min) — ler o CONCEITOS.md da semana
QUARTA:     Implementação prática (60 min) — rodar/adaptar o notebook
SEXTA:      Deploy & Monitoramento (30 min)
FIM DE SEMANA: Experimentação livre
```

---

## Resultados de Aprendizado

Ao final do curso:
- ✅ Entender arquiteturas modernas de LLM
- ✅ Construir pipelines de dados estruturados com RAG
- ✅ Criar agentes autônomos com loops agênticos
- ✅ Orquestrar workflows complexos com LangGraph
- ✅ Monitorar & avaliar agentes em produção
- ✅ Fazer deploy de agentes na nuvem (GCP) com observabilidade
- ✅ Otimizar custo & performance
- ✅ Ter 4 projetos no portfólio, com notebooks que rodam de verdade

---

**Status:** currículo com conteúdo real por semana + 4 notebooks funcionais.
**Duração:** 13 semanas.
**Resultado:** 4 projetos + 5 projetos bônus + expertise em AI Engineering.
