# 🚀 IA Engineer Crash Course
## AI Engineering aplicado, em 13 semanas

![Status](https://img.shields.io/badge/status-em%20constru%C3%A7%C3%A3o-yellow)
![Python](https://img.shields.io/badge/python-3.11+-blue)
![LangGraph](https://img.shields.io/badge/langgraph-0.2+-orange)
![License](https://img.shields.io/badge/license-MIT-green)

---

## O que é

Curso prático de AI Engineering: 13 semanas de conceitos (`modules/`) +
4 projetos com notebook funcional (`projects/`) que aplicam Harness + Loop +
Graph Engineering em domínios reais — churn, marketing, performance
esportiva e marketing mix modeling.

**Pra rodar:** veja [GETTING_STARTED.md](./GETTING_STARTED.md).
**Pra entender o currículo semana a semana:** veja [EMENTA.md](./EMENTA.md).

---

## Status real (atualizado)

✅ **Funciona de verdade:**
- 13 semanas com explicação completa (`modules/weekNN-*/CONCEITOS.md`)
- 4 notebooks principais, testados ponta a ponta, com output real embutido
- Cada notebook chama a **API real da Anthropic** se você definir
  `ANTHROPIC_API_KEY`, e cai automaticamente pra um mock determinístico sem
  ela — não precisa de chave pra estudar a arquitetura
- Testes básicos (asserts) dentro de cada notebook
- LoRA fine-tuning **real** no Projeto #4 (treino genuíno num modelo pequeno,
  não decorativo)
- 5 projetos bônus fora da ementa oficial (`projects/bonus-agent-patterns/`)

⏳ **Ainda não existe:**
- Deploy de verdade em GCP (precisa da sua conta/projeto GCP — fora do
  escopo do que dá pra fazer sem suas credenciais)
- Suite de testes formal (`pytest` com arquivos `test_*.py` separados —
  hoje os testes são células dentro dos notebooks)
- OpenTelemetry / tracing completo (hoje é logging estruturado simples)
- `datasets/` com CSVs reais (os notebooks geram dados sintéticos on-the-fly)

Ver [modules/README.md](./modules/README.md) pra status semana a semana.

---

## Os 4 Projetos

### #1: Churn Prediction
**Domínio:** SaaS/Streaming/Telecom · **Pergunta:** quem vai cancelar, por quê, como reter
**Conceitos:** Saídas Estruturadas, RAG, Tool Use, Agentic Loop, LangGraph, Confidence Scoring
📁 [`projects/01-churn-prediction/`](./projects/01-churn-prediction/)

### #2: Marketing Campaign Analysis
**Domínio:** Marketing · **Pergunta:** qual campanha funciona e como otimizar
**Conceitos:** Tool Use paralelo, Multi-Agent, Cache Semântico, LangGraph com branch
📁 [`projects/02-marketing-campaigns/`](./projects/02-marketing-campaigns/)

### #3: Performance Analysis
**Domínio:** Esportes · **Pergunta:** como está o jogador, vai melhorar, qual o valor
**Conceitos:** RAG histórico, Streaming/tempo real, Confidence Scoring
📁 [`projects/03-performance-analysis/`](./projects/03-performance-analysis/)

### #4: Marketing Mix Modeling ⭐ (SOTA 2026 — integra tudo)
**Domínio:** Marketing budgeting · **Pergunta:** como alocar $1M entre 4 canais
**Conceitos:** Speculative Decoding, Constitutional AI, Mixture of Experts,
Dados Sintéticos, e **LoRA fine-tuning real** (treino genuíno, modelo pequeno)
📁 [`projects/04-mmm-optimization/`](./projects/04-mmm-optimization/)

### Bônus: 5 padrões de agente fora da ementa
Sales SDR, Invoice Processing, Customer Service, Smart Routing, HR Screening
— código funcional, prática extra de padrões comuns de mercado.
📁 [`projects/bonus-agent-patterns/`](./projects/bonus-agent-patterns/)

---

## As 13 Semanas

| Semanas | Tema |
|---|---|
| 1-2 | Fundamentos de LLMs em Produção |
| 2-3 | Dados e Saídas Estruturadas |
| 3-4 | RAG (Retrieval-Augmented Generation) |
| 4-5 | Uso de Ferramentas & Function Calling |
| 5-6 | Agentes & Loops Agênticos |
| 6-7 | Orquestração em Grafo & LangGraph |
| 7-8 | Conceitos Avançados (confidence, cache, streaming) |
| 8-9 | Observabilidade & Monitoramento |
| 9-10 | Avaliação & QA |
| 10-11 | Deploy & Infraestrutura |
| 11 | Otimização de Custo |
| 12 | Capstone & Prontidão pra Produção |
| 13 | SOTA 2026 (Speculative Decoding, Constitutional AI, MoE, LoRA, Dados Sintéticos) |

Detalhe de cada semana, com explicação e link pro código: [EMENTA.md](./EMENTA.md)

---

## Estrutura do Repositório

```
ia-engineer-crash-course/
├── README.md                  (você está aqui)
├── EMENTA.md                  (índice das 13 semanas)
├── GETTING_STARTED.md         (setup passo a passo)
├── CONTRIBUTING.md
├── LICENSE
├── requirements.txt
├── .env.example / .gitignore
│
├── modules/                   (explicação semana a semana)
│   └── weekNN-*/CONCEITOS.md
│
├── projects/
│   ├── 01-churn-prediction/       (README + notebook + Dockerfile)
│   ├── 02-marketing-campaigns/    (README + notebook + Dockerfile)
│   ├── 03-performance-analysis/   (README + notebook + Dockerfile)
│   ├── 04-mmm-optimization/       (README + notebook + Dockerfile)
│   └── bonus-agent-patterns/      (5 notebooks extras)
│
└── docs/source-material/      (rascunhos originais de planejamento, numerados)
```

---

## Stack

**Linguagem/Framework:** Python 3.11+, LangGraph 0.2+, Pydantic v2
**LLM:** Claude (Haiku pra draft/velocidade, conceito de Sonnet pra verificação — ver Semana 13)
**LoRA:** PyTorch + HuggingFace Transformers + PEFT (modelo pequeno real, não mockado)
**Cloud (planejado, não implementado ainda):** GCP — Cloud Run, Firestore, Pub/Sub

---

## Recursos

- [EMENTA.md](./EMENTA.md) — currículo detalhado, semana a semana
- [GETTING_STARTED.md](./GETTING_STARTED.md) — setup e troubleshooting
- [modules/README.md](./modules/README.md) — índice dos módulos com status
- [docs/source-material/README.md](./docs/source-material/README.md) — documentos de planejamento originais

---

## Contribuindo

Curso educacional — contribuições são bem-vindas. Veja [CONTRIBUTING.md](./CONTRIBUTING.md).

## Licença

MIT — veja [LICENSE](./LICENSE).

## Autor

**Paulo Pestana** — [@paulopestanajunior](https://github.com/paulopestanajunior)
