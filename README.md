# 🚀 IA Engineer Crash Course
## Production-Ready AI Engineering in 13 Weeks

![Status](https://img.shields.io/badge/status-production--ready-green)
![Python](https://img.shields.io/badge/python-3.11+-blue)
![LangGraph](https://img.shields.io/badge/langgraph-0.2+-orange)
![License](https://img.shields.io/badge/license-MIT-green)

---

## 📋 Overview

**Um curso COMPLETO de AI Engineering** que leva você de zero a production-grade em 13 semanas.

```
✅ 13 Módulos de conceitos SOTA 2026
✅ 4 Projetos educacionais production-ready  
✅ Harness + Loop + Graph (aplicado)
✅ Advanced concepts (Speculative Decoding, Constitutional AI, MoE, etc)
✅ Deployment em GCP (Cloud Run, Firestore, Pub/Sub)
✅ Observability completa (OpenTelemetry, monitoring)
✅ Datasets realistas (fictícios mas bem-construídos)
✅ 100+ horas de código pronto pra rodar
```

---

## 🎯 O Que Você Vai Aprender

### **Conceitos Fundamentais**
- ✅ LLM Architecture & How They Work
- ✅ Prompt Engineering (Few-shot, CoT, System prompts)
- ✅ API Integration (Rate limiting, Cost tracking, Error handling)

### **Intermediate Concepts**
- ✅ Structured Outputs (JSON schema, Pydantic, Type safety)
- ✅ RAG (Traditional → Adaptive → Advanced)
- ✅ Tool Use & Function Calling (Sequential & Parallel)
- ✅ Agents & Agentic Loops (ReAct, Multi-agent)
- ✅ Graph Orchestration (LangGraph, StateGraph)

### **Advanced Concepts** 
- ✅ Confidence Scoring & Uncertainty Quantification
- ✅ Semantic Caching & Cost Optimization
- ✅ Streaming & Real-time Processing
- ✅ Observability & Monitoring (OpenTelemetry)
- ✅ Evaluation & A/B Testing

### **SOTA 2026 (Week 13)**
- ✅ **Speculative Decoding** (2.5x faster inference)
- ✅ **Constitutional AI** (Safety + Alignment)
- ✅ **Mixture of Experts** (Efficient routing)
- ✅ **Efficient Fine-tuning** (LoRA 99% reduction)
- ✅ **Synthetic Data** (10x data expansion)

### **Production Skills**
- ✅ Containerization (Docker)
- ✅ Cloud Deployment (GCP Cloud Run)
- ✅ Infrastructure as Code (Terraform)
- ✅ Security & Compliance
- ✅ Cost Optimization & Monitoring

---

## 📚 4 Projetos Educacionais

Cada projeto exemplifica múltiplos conceitos em produção:

### **#1: Churn Prediction** (Retenção)
**Domínio:** Qualquer empresa (SaaS, Streaming, Telecom)  
**Conceitos:** Structured Outputs, RAG, Tool Use, Loops, LangGraph  
**Dados:** 10k clientes fictícios realistas  
**Stack:** LangGraph + Pydantic + Firestore + Claude  
**Outcome:** Prediz quem vai sair + motivo + ação de retenção  

📁 `/projects/01-churn-prediction`

---

### **#2: Marketing Campaign Analysis** 
**Domínio:** Marketing (qualquer empresa)  
**Conceitos:** Tool Use, Multi-Agent, Semantic Caching, MoE  
**Dados:** 1000 campanhas fictícias  
**Stack:** LangGraph + Multi-Agent + Redis + Claude  
**Outcome:** Analisa campanhas + recomenda otimizações  

📁 `/projects/02-marketing-campaigns`

---

### **#3: Performance Analysis** (Seu Domínio!)
**Domínio:** Esportes / Performance  
**Conceitos:** Streaming, Real-time, Confidence Scoring  
**Dados:** Players com stats realistas  
**Stack:** LangGraph + Cloud Pub/Sub + Live Updates  
**Outcome:** Análise em tempo real + previsões de performance  

📁 `/projects/03-performance-analysis`

---

### **#4: Marketing Mix Modeling** ⭐ (SOTA)
**Domínio:** Marketing budgeting  
**Conceitos:** Speculative Decoding, Constitutional AI, MoE, Fine-tuning, Synthetic Data  
**Dados:** 100 weeks histórico + 1000 sintéticos  
**Stack:** LangGraph + Speculative + Constitutional  
**Outcome:** Aloca $1M budget entre 4 canais otimamente  
**Special:** Toca TODOS os conceitos avançados!  

📁 `/projects/04-mmm-optimization`

---

## 📊 Curriculum (13 Weeks)

```
WEEK 1-2:   Fundamentos de LLMs em Produção
WEEK 2-3:   Structured Data & Outputs (PROJETO #1 start)
WEEK 3-4:   RAG (Traditional + Adaptive)
WEEK 4-5:   Tool Use & Function Calling (PROJETO #2 start)
WEEK 5-6:   Agents & Agentic Loops (PROJETO #3 start)
WEEK 6-7:   Graph Orchestration (LangGraph)
WEEK 7-8:   Advanced Concepts (Confidence, Caching, Streaming)
WEEK 8-9:   Observability & Monitoring
WEEK 9-10:  Evaluation & Quality Assurance
WEEK 10-11: Deployment & Infrastructure
WEEK 11:    Cost Optimization
WEEK 12:    Capstone & Production Readiness

WEEK 13:    ADVANCED CONCEPTS (SOTA 2026)
            ├─ Speculative Decoding
            ├─ Constitutional AI
            ├─ Mixture of Experts
            ├─ Efficient Fine-tuning
            └─ Synthetic Data (PROJETO #4 - MMM)
```

**Detalhes:** Ver [EMENTA.md](./EMENTA.md)

---

## 🏗️ Estrutura do Repositório

```
ia-engineer-crash-course/
│
├── 📖 README.md (você está aqui!)
├── 📚 EMENTA.md (curriculum detalhado)
├── 📋 GETTING_STARTED.md (setup guide)
│
├── 📁 docs/
│   ├── ARCHITECTURE.md (system design)
│   ├── CONCEPTS.md (explicações conceituais)
│   └── DEPLOYMENT.md (production guide)
│
├── 📁 modules/ (CONCEITOS EXPLICATIVOS)
│   ├── week01-fundamentos/
│   ├── week02-structured-outputs/
│   ├── week03-rag/
│   ├── ...
│   └── week13-advanced/
│
├── 📁 projects/ (4 PROJETOS)
│   ├── 01-churn-prediction/
│   ├── 02-marketing-campaigns/
│   ├── 03-performance-analysis/
│   └── 04-mmm-optimization/
│
├── 📁 datasets/ (DADOS FICTÍCIOS)
│   ├── customers/ (10k rows)
│   ├── campaigns/ (1000 rows)
│   ├── players/ (500 rows)
│   └── marketing/ (100 weeks)
│
├── 📁 shared/ (CÓDIGO COMPARTILHADO)
│   ├── common/
│   │   ├── harness.py
│   │   ├── loop.py
│   │   └── graph_utils.py
│   └── utils/
│       ├── api_client.py
│       ├── database.py
│       └── cache.py
│
├── 📁 deploy/ (INFRASTRUCTURE)
│   ├── docker/
│   │   ├── Dockerfile
│   │   └── docker-compose.yml
│   └── terraform/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── 📁 monitoring/ (OBSERVABILITY)
│   ├── dashboards/
│   └── alerts/
│
├── ⚙️ requirements.txt
├── 🔒 .gitignore
├── 📄 setup.py
└── 🎯 Makefile
```

---

## 🚀 Quick Start

### **1. Clone o repositório**
```bash
git clone https://github.com/paulopestanajunior/ia-engineer-crash-course
cd ia-engineer-crash-course
```

### **2. Setup do ambiente**
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

### **3. Configurar credenciais**
```bash
cp .env.example .env
# Edite .env com suas chaves de API (Claude, GCP, etc)
```

### **4. Comece Week 1**
```bash
cd modules/week01-fundamentos
python colab_hello_world.py
```

Veja [GETTING_STARTED.md](./GETTING_STARTED.md) para detalhes.

---

## 📖 Módulos Conceituais

Cada semana tem um módulo conceitual explicativo:

```
modules/
├── week01-fundamentos/
│   ├── CONCEITOS.md (explicações teóricas)
│   ├── colab_hello_world.py
│   └── examples/
│
├── week02-structured-outputs/
│   ├── CONCEITOS.md
│   ├── colab_pydantic.py
│   └── examples/
│
├── week03-rag/
│   ├── CONCEITOS.md
│   ├── colab_vector_db.py
│   └── examples/
│
... (weeks 4-12)

└── week13-advanced/
    ├── CONCEITOS_SPECULATIVE.md
    ├── CONCEITOS_CONSTITUTIONAL.md
    ├── CONCEITOS_MOE.md
    ├── CONCEITOS_FINETUNING.md
    ├── CONCEITOS_SYNTHETIC.md
    ├── colab_speculative_decoding.py
    ├── colab_constitutional_ai.py
    ├── colab_mixture_of_experts.py
    ├── colab_lora_finetuning.py
    └── colab_synthetic_data.py
```

Cada CONCEITOS.md explica:
- ✅ Problema que resolve
- ✅ Como funciona (diagrama)
- ✅ Código exemplo
- ✅ Quando usar
- ✅ Trade-offs

---

## 📊 Datasets

Dados fictícios mas realistas para cada projeto:

### **Churn Prediction**
- 10,000 clientes
- 50+ features (engagement, spending, support, etc)
- Labels: churned yes/no
- Format: CSV

**📁** `datasets/customers/`

---

### **Marketing Campaigns**
- 1,000 campanhas
- Fields: channel, budget, performance, ROI, etc
- Realistic patterns (seasonality, diminishing returns)
- Format: CSV

**📁** `datasets/campaigns/`

---

### **Performance Analysis**
- 500 players
- Stats: age, games played, goals, assists, market value
- Time series (season progression)
- Format: CSV

**📁** `datasets/players/`

---

### **Marketing Mix Modeling**
- 100 weeks de dados históricos
- 4 canais: TV, Digital, Social, Outdoor
- Sales outcomes (realistas)
- Format: CSV + gerador de dados sintéticos

**📁** `datasets/marketing/`

---

## 🎯 Learning Path

```
┌─────────────────────┐
│   Week 1-2          │
│ Fundamentos LLM     │
└──────────┬──────────┘
           │
┌──────────▼──────────┐
│   Week 2-3          │
│ Structured Outputs  │
│ (PROJETO #1 start)  │
└──────────┬──────────┘
           │
┌──────────▼──────────┐
│   Week 3-4          │
│ RAG                 │
└──────────┬──────────┘
           │
┌──────────▼──────────┐
│   Week 4-5          │
│ Tool Use            │
│ (PROJETO #2 start)  │
└──────────┬──────────┘
           │
┌──────────▼──────────┐
│   Week 5-6          │
│ Agents & Loops      │
│ (PROJETO #3 start)  │
└──────────┬──────────┘
           │
┌──────────▼──────────┐
│   Week 6-7          │
│ LangGraph           │
└──────────┬──────────┘
           │
┌──────────▼──────────┐
│   Week 7-12         │
│ Advanced + Deploy   │
└──────────┬──────────┘
           │
┌──────────▼──────────┐
│   Week 13 ⭐⭐⭐    │
│ ADVANCED CONCEPTS   │
│ (PROJETO #4 - MMM)  │
└─────────────────────┘
       ↓
 4 PRODUCTION-READY
     PROJECTS
```

---

## 🛠️ Tech Stack

**Languages & Frameworks:**
- Python 3.11+
- LangChain & LangGraph 0.2+
- Pydantic v2 (data validation)

**LLMs:**
- Claude 3.5 Sonnet (primary)
- Claude 3.5 Haiku (draft/speculative)
- GPT-4o (optional comparison)

**Databases & Storage:**
- PostgreSQL (structured data)
- Firestore (NoSQL)
- Redis (caching)
- Cloud Storage (files)

**Cloud Platform:**
- GCP (Google Cloud Platform)
  - Cloud Run (serverless containers)
  - Cloud Tasks (job queue)
  - Cloud Pub/Sub (event streaming)
  - Cloud Monitoring (observability)

**Observability:**
- OpenTelemetry (standard tracing)
- Datadog / New Relic (optional monitoring)
- Cloud Logging (GCP native)

**Testing & Quality:**
- pytest (unit testing)
- pytest-asyncio (async testing)
- langchain-testing (LLM evaluation)

**Deployment:**
- Docker (containerization)
- Terraform (IaC)
- Docker Compose (local development)

---

## 📈 Expected Outcomes

Ao final de 13 semanas:

```
✅ Knowledge
   • 13 módulos de AI Engineering dominados
   • Harness + Loop + Graph profundamente entendido
   • 5 conceitos SOTA 2026 implementados

✅ Code
   • 4 projetos production-ready
   • 100+ horas de código escrito
   • 50+ test cases
   • 100% coverage em funções críticas

✅ Deployment
   • 4 projetos rodando em GCP Cloud Run
   • Observability completa (OpenTelemetry)
   • Monitoring + Alerts configurados
   • Cost tracking implementado
   • SLOs definidos

✅ Portfolio
   • GitHub repository premium
   • Detailed case studies
   • Architecture documentation
   • Performance benchmarks

✅ Job Ready
   • Pode trabalhar como AI Engineer production-grade
   • Pode vender soluções de AI para empresas
   • Pode liderar projects de AI em produção
```

---

## 📚 Recursos Adicionais

### **Documentação Completa**
- [EMENTA.md](./EMENTA.md) - Curriculum detalhado
- [GETTING_STARTED.md](./GETTING_STARTED.md) - Setup guide
- [docs/ARCHITECTURE.md](./docs/ARCHITECTURE.md) - System design
- [docs/CONCEPTS.md](./docs/CONCEPTS.md) - Explained concepts

### **Por Projeto**
- [projects/01-churn-prediction/README.md](./projects/01-churn-prediction/README.md)
- [projects/02-marketing-campaigns/README.md](./projects/02-marketing-campaigns/README.md)
- [projects/03-performance-analysis/README.md](./projects/03-performance-analysis/README.md)
- [projects/04-mmm-optimization/README.md](./projects/04-mmm-optimization/README.md)

### **Conceitos**
- [modules/week01-fundamentos/CONCEITOS.md](./modules/week01-fundamentos/CONCEITOS.md)
- [modules/week02-structured-outputs/CONCEITOS.md](./modules/week02-structured-outputs/CONCEITOS.md)
- ... (todas as semanas)
- [modules/week13-advanced/](./modules/week13-advanced/) (5 conceitos SOTA)

---

## 🤝 Contributing

Este é um curso educacional. Contribuições são bem-vindas!

- 🐛 Bug reports: Abra uma issue
- 💡 Suggestions: Abra uma discussion
- 📝 Improvements: Faça um PR

Veja [CONTRIBUTING.md](./CONTRIBUTING.md) para detalhes.

---

## 📄 License

MIT License - Veja [LICENSE](./LICENSE) para detalhes.

---

## 👋 Autor

Criado por **Paulo Pestana** - [@paulopestanajunior](https://github.com/paulopestanajunior)

Com inspiração em currículos de Anthropic, OpenAI, e melhores práticas de AI Engineering em produção.

---

## 🚀 Getting Started

**Pronto pra começar?**

```bash
# Clone e setup
git clone https://github.com/paulopestanajunior/ia-engineer-crash-course
cd ia-engineer-crash-course
make setup

# Ou manual
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Comece Week 1
cd modules/week01-fundamentos
python colab_hello_world.py
```

**Mais detalhes:** [GETTING_STARTED.md](./GETTING_STARTED.md)

---

**Status:** ✅ Production-Ready  
**Duration:** 13 weeks  
**Intensity:** 30 hours/week  
**Result:** 4 production-grade AI projects + AI Engineering expertise  

**Let's go! 🚀**

