# 🎓 CURSO COMPLETO: AI Engineering in Production
## Ementa Padrão de Mercado + 3 Projetos Educacionais

---

# 📚 ESTRUTURA DO CURSO

```
FUNDAMENTOS (Weeks 1-2)
    ↓
INTERMEDIATE (Weeks 3-6)
    ↓
ADVANCED (Weeks 7-10)
    ↓
CAPSTONE + DEPLOYMENT (Weeks 11-12)
```

---

# 🎯 EMENTA DETALHADA

## **MÓDULO 1: FUNDAMENTOS DE LLMs EM PRODUÇÃO** (Week 1-2)

### 1.1 LLM Architecture & How They Work
- Transformer basics
- Tokenization & embeddings
- Context windows & prompt engineering
- Model selection (Claude vs GPT-4o vs others)

### 1.2 Prompt Engineering Fundamentals
- **Concept**: Few-shot vs Zero-shot
- **Concept**: Chain-of-Thought (CoT)
- **Concept**: System prompts & roles
- Best practices & anti-patterns

### 1.3 API Integration Basics
- REST API calls
- Rate limiting & retry logic
- Cost tracking & budgeting
- Error handling patterns

**🎓 Projeto Mapping:**
- Todos 3 projetos usam isso como base
- Churn: Prompt pra análise de churn
- Marketing: Prompt pra campaign analysis
- Performance: Prompt pra análise de jogador

---

## **MÓDULO 2: STRUCTURED DATA & OUTPUTS** (Week 2-3)

### 2.1 Structured Outputs (NEW 2025-2026)
- **Concept**: JSON mode vs Tools vs Structured outputs
- **Concept**: Schema validation & type safety
- **Concept**: Parsing reliability (99.9% vs 98%)
- **Tool**: Pydantic v2 + JSON schema

### 2.2 Data Validation & Quality
- Input validation
- Output verification
- Error recovery patterns
- Fallback strategies

### 2.3 Working with Databases
- Querying data for context
- Schema design for AI agents
- Real-time data fetching
- Change Data Capture (CDC)

**🎓 Projeto Mapping:**
- **PROJETO #1: Churn Prediction**
  - Structured input: Customer data schema
  - Structured output: Churn risk report with exact format
  - Database: Query customer table → features
  - Validation: Ensure output fields correct type

---

## **MÓDULO 3: RETRIEVAL-AUGMENTED GENERATION (RAG)** (Week 3-4)

### 3.1 Traditional RAG (Static)
- **Concept**: Retriever-Reader architecture
- **Concept**: Vector embeddings & similarity search
- **Concept**: Chunking strategies
- **Tool**: Pinecone, Weaviate, Chroma

### 3.2 Advanced RAG (State-of-the-Art 2026)
- **Concept**: Adaptive RAG (decide when to retrieve)
- **Concept**: Hybrid search (vector + keyword)
- **Concept**: Re-ranking (improve relevance)
- **Concept**: Semantic caching (reduce redundant retrievals)
- **Concept**: Graph-based retrieval (RAG-as-graphs)

### 3.3 RAG for Different Data Types
- Text documents
- Structured data
- Time-series data
- Semi-structured data (logs, CSVs)

**🎓 Projeto Mapping:**
- **PROJETO #1: Churn Prediction**
  - Traditional RAG: Retrieves similar churned customers
  - Adaptive RAG: "Do I need to search for similar cases or can I decide based on rules?"
  - Output: Customer risk + similar cases from history

- **PROJETO #2: Marketing Campaigns**
  - Traditional RAG: Campaign history retrieval
  - Hybrid search: Find campaigns by performance + keywords
  - Semantic caching: Same campaign questions → reuse analysis

---

## **MÓDULO 4: TOOL USE & FUNCTION CALLING** (Week 4-5)

### 4.1 Tool Architecture
- **Concept**: Tools as agent capabilities
- **Concept**: Tool definitions & schemas
- **Concept**: Reliable tool calling (forcing JSON)
- **Tool**: Native Claude tool_use

### 4.2 Tool Execution Patterns
- **Concept**: Sequential tools
- **Concept**: Parallel tool calling (speed up 5x)
- **Concept**: Tool composition
- **Concept**: Fallback mechanisms

### 4.3 External Integrations
- APIs (REST, GraphQL)
- Databases (CRUD operations)
- File systems
- Real-time data sources

### 4.4 Tool Error Handling
- **Concept**: Graceful degradation
- **Concept**: Retry logic with backoff
- **Concept**: Circuit breakers
- **Concept**: Human escalation

**🎓 Projeto Mapping:**
- **PROJETO #2: Marketing Campaigns**
  - Tools: Query campaign DB, fetch analytics, call prediction API
  - Parallel: Get campaign history + performance metrics simultaneously
  - Error handling: If API down, use cached data
  - Composition: Gather campaign → Fetch metrics → Analyze → Recommend

- **PROJETO #3: Performance Analysis**
  - Tools: Query player stats DB, fetch market data, call prediction model
  - Sequential: Get player history → Fetch current season → Analyze trend

---

## **MÓDULO 5: AGENTS & AGENTIC LOOPS** (Week 5-6)

### 5.1 Agent Architectures
- **Concept**: Tool-using agents (ReAct pattern)
- **Concept**: Planning agents (think before acting)
- **Concept**: Multi-agent systems (teams of agents)

### 5.2 Agentic Loops (THE CORE)
- **Concept**: Decide → Act → Observe → Loop
- **Concept**: Loop termination conditions
- **Concept**: Max iterations & budgets
- **Concept**: No progress detection

### 5.3 Agent State & Memory
- **Concept**: Conversation history
- **Concept**: Working memory (current task)
- **Concept**: Long-term memory (facts learned)
- **Concept**: Selective memory (what to forget?)

### 5.4 Agent Orchestration
- **Concept**: Supervisor agent
- **Concept**: Hierarchical agents
- **Concept**: Inter-agent communication
- **Concept**: Agent routing

**🎓 Projeto Mapping:**
- **PROJETO #1: Churn Prediction**
  - Single loop: Analyze customer → Predict churn → Generate actions
  - Loop control: Max 3 iterations (try 3 strategies)
  - Stopping rule: If confidence > 0.85 → stop
  - State: Keep customer data + predictions + confidence

- **PROJETO #2: Marketing Campaigns**
  - Multi-agent: Analyzer agent + Recommender agent
  - Hierarchical: Supervisor decides which agent to call
  - Orchestration: Analyzer → Recommender → Final report

- **PROJETO #3: Performance Analysis**
  - Streaming loop: As new data arrives → update analysis
  - Working memory: Current season stats
  - Long-term: Historical performance trends

---

## **MÓDULO 6: GRAPH ORCHESTRATION & LANGGRAPH** (Week 6-7)

### 6.1 Graph-Based Workflows
- **Concept**: Nodes, edges, state flow
- **Concept**: Conditional edges (routing)
- **Concept**: Parallel branches
- **Concept**: Looping within graphs

### 6.2 LangGraph Implementation
- StateGraph definition
- Node types (task, decision, parallel)
- Edge definition (deterministic + conditional)
- Compilation & invocation

### 6.3 Complex Workflows
- **Concept**: Approval gates (human in loop)
- **Concept**: Error recovery paths
- **Concept**: Subgraphs (nested graphs)
- **Concept**: Dynamic graph construction

### 6.4 Testing & Debugging Graphs
- Graph visualization
- Step-by-step execution
- State inspection
- Trace analysis

**🎓 Projeto Mapping:**
- Todos 3 projetos implementam isso!
- **PROJETO #1**: Linear graph (Analyze → Predict → Recommend)
- **PROJETO #2**: Branching graph (Analyzer → Decision → Recommender)
- **PROJETO #3**: Streaming graph (Real-time data ingestion → Update analysis)

---

## **MÓDULO 7: ADVANCED CONCEPTS** (Week 7-8)

### 7.1 Confidence Scoring & Uncertainty
- **Concept**: Confidence metrics
- **Concept**: When to escalate to human?
- **Concept**: Uncertainty-aware routing
- **Concept**: Calibration (80% confident = 80% correct?)

### 7.2 Semantic Caching (NEW)
- **Concept**: Cache by meaning, not hash
- **Concept**: Prompt caching techniques
- **Concept**: Embeddings for cache lookup
- **Concept**: Cost reduction (up to 90%)

### 7.3 Extended Thinking / Chain-of-Thought
- **Concept**: Expose reasoning process
- **Concept**: Structured thinking (outline before answer)
- **Concept**: Reflection loops
- **Concept**: Self-verification

### 7.4 Streaming & Real-time Processing
- **Concept**: Token streaming (real-time UI updates)
- **Concept**: Event-driven architectures
- **Concept**: Backpressure handling
- **Concept**: Buffering strategies

**🎓 Projeto Mapping:**
- **PROJETO #1: Churn Prediction**
  - Confidence scoring: "85% sure of churn risk"
  - When to escalate: If confidence < 60% → ask human

- **PROJETO #2: Marketing Campaigns**
  - Semantic caching: "Analyze Campaign A" → cache → "Analyze Campaign A variant" → reuse
  - Extended thinking: "Think about why Campaign X failed"

- **PROJETO #3: Performance Analysis**
  - Streaming: Real-time game data → update player analysis live
  - Confidence scoring: Market value prediction confidence

---

## **MÓDULO 8: OBSERVABILITY & MONITORING** (Week 8-9)

### 8.1 Observability Fundamentals
- **Concept**: Logs vs Traces vs Metrics
- **Concept**: Structured logging
- **Concept**: OpenTelemetry standards
- **Concept**: Observability platforms (Datadog, New Relic, etc)

### 8.2 LLM-Specific Monitoring
- **Concept**: Token tracking (input + output)
- **Concept**: Cost tracking (per request, per hour, per day)
- **Concept**: Latency monitoring (p50, p95, p99)
- **Concept**: Quality metrics (accuracy, hallucination rate)

### 8.3 Agent-Specific Metrics
- **Concept**: Agent success rate
- **Concept**: Tool execution success
- **Concept**: Loop iterations (avg, max)
- **Concept**: Human escalation rate

### 8.4 Alerting & SLOs
- **Concept**: Alert conditions
- **Concept**: SLO definition (99.9% uptime, p95 latency < 2s)
- **Concept**: Error budgets
- **Concept**: Incident response

**🎓 Projeto Mapping:**
- Todos 3 projetos têm observability completa
- Métricas por projeto:
  - **Churn**: Prediction accuracy, false positive rate
  - **Marketing**: Campaign analysis latency, recommendation adoption
  - **Performance**: Real-time update lag, prediction accuracy

---

## **MÓDULO 9: EVALUATION & QUALITY ASSURANCE** (Week 9-10)

### 9.1 Evaluation Frameworks
- **Concept**: Defining quality metrics
- **Concept**: Ground truth datasets
- **Concept**: Automated vs manual evaluation
- **Concept**: Benchmark suites

### 9.2 LLM Evaluation
- **Concept**: Semantic similarity (vs exact match)
- **Concept**: Factuality checking
- **Concept**: Relevance scoring
- **Concept**: Using another LLM as judge

### 9.3 Agent Evaluation
- **Concept**: Task completion rate
- **Concept**: Tool usage correctness
- **Concept**: Decision quality
- **Concept**: Cost efficiency

### 9.4 Continuous Evaluation
- **Concept**: A/B testing agents
- **Concept**: Shadow mode (run parallel, don't act)
- **Concept**: Feedback loops
- **Concept**: Automatic retraining triggers

**🎓 Projeto Mapping:**
- **PROJETO #1: Churn Prediction**
  - Evaluate: Prediction vs actual churn (after 30 days)
  - Metric: Precision, Recall, F1 score
  - A/B test: Strategy 1 vs Strategy 2

- **PROJETO #2: Marketing Campaigns**
  - Evaluate: Recommendation adoption rate
  - Metric: % of recommendations implemented
  - Feedback: Track which recommendations worked

- **PROJETO #3: Performance Analysis**
  - Evaluate: Prediction accuracy (compare to actual performance)
  - Metric: MAE, RMSE of player value predictions

---

## **MÓDULO 10: DEPLOYMENT & INFRASTRUCTURE** (Week 10-11)

### 10.1 Containerization & Orchestration
- **Concept**: Docker containers
- **Concept**: Kubernetes for scaling
- **Concept**: Container registries
- **Concept**: Version management

### 10.2 Cloud Deployment (GCP Focus)
- **Concept**: Cloud Run (serverless)
- **Concept**: Cloud Tasks (job queues)
- **Concept**: Firestore (NoSQL DB)
- **Concept**: Cloud Storage (file storage)
- **Concept**: Cloud Pub/Sub (event streaming)

### 10.3 Database Strategies
- **Concept**: Relational vs NoSQL
- **Concept**: Caching layers (Redis)
- **Concept**: Replication for HA
- **Concept**: Backup & recovery

### 10.4 Security & Compliance
- **Concept**: API key management
- **Concept**: Secret management (Google Secret Manager)
- **Concept**: Access control (IAM)
- **Concept**: Data encryption
- **Concept**: Compliance (GDPR, etc)

**🎓 Projeto Mapping:**
- Todos 3 projetos têm deployment completo
- Stack: GCP Cloud Run + Firestore + Cloud Tasks
- Cada projeto tem dockerfile + terraform configs

---

## **MÓDULO 11: COST OPTIMIZATION** (Week 11)

### 11.1 Token Economics
- **Concept**: Input vs output token pricing
- **Concept**: Caching savings (prompt caching)
- **Concept**: Model selection economics
- **Concept**: Batch processing vs streaming

### 11.2 Agent Cost Optimization
- **Concept**: Reducing tool calls
- **Concept**: Smart routing (cheap vs expensive models)
- **Concept**: Parallel vs sequential execution
- **Concept**: Caching at every level

### 11.3 Infrastructure Costs
- **Concept**: Serverless vs containers
- **Concept**: Scaling strategies
- **Concept**: Data transfer costs
- **Concept**: Storage optimization

### 11.4 Monitoring Costs
- **Concept**: Cost per request
- **Concept**: Cost per successful output
- **Concept**: Cost trends
- **Concept**: Cost anomaly detection

**🎓 Projeto Mapping:**
- **PROJETO #1**: Cost tracking per customer analysis
- **PROJETO #2**: Cost per campaign recommendation
- **PROJETO #3**: Cost per real-time update

---

## **MÓDULO 12: CAPSTONE & PRODUCTION READINESS** (Week 11-12)

### 12.1 System Design
- **Concept**: Scaling agents horizontally
- **Concept**: Multi-region deployment
- **Concept**: Disaster recovery
- **Concept**: Performance optimization

### 12.2 Production Checklist
- ✅ Observability: Logging, tracing, metrics
- ✅ Testing: Unit, integration, E2E tests
- ✅ Security: No secrets in code, proper IAM
- ✅ Documentation: README, architecture docs, runbooks
- ✅ Monitoring: Alerts, SLOs, dashboards
- ✅ Cost: Tracked, optimized, within budget

### 12.3 Case Study Reviews
- Architectural decisions
- Trade-offs made
- Lessons learned
- What would you do differently?

### 12.4 Capstone Project
- Integrate all concepts
- Production deployment
- Live monitoring
- Continuous improvement

**🎓 Projeto Mapping:**
- Todos 3 projetos SÃO capstone projects
- Cada um é production-ready desde dia 1
- Deployment, monitoring, cost tracking, tudo incluído

---

# 📊 CURRICULUM MAPPING

```
WEEK  MODULE                    CONCEITOS                    PROJETOS
────────────────────────────────────────────────────────────────────────
1     Fundamentos              LLM basics, Prompting         Intro
2     Structured Outputs       JSON schema, Validation       PROJETO #1
3     RAG                      Retrieval, Embeddings         PROJETO #1
4     RAG (Advanced)           Adaptive RAG, Caching         PROJETO #1+2
5     Tool Use                 Function calling, APIs        PROJETO #2
6     Agents & Loops           ReAct, Loops                  PROJETO #2+3
7     Graph Orchestration      LangGraph, StateGraph         PROJETO #1+2+3
8     Advanced Concepts        Confidence, Streaming         PROJETO #3
9     Observability            Logging, Metrics, Tracing     TODOS
10    Evaluation               Testing, A/B testing          TODOS
11    Deployment               Docker, GCP, K8s              TODOS
11    Cost Optimization        Token economics, Routing      TODOS
12    Capstone & Production    Integration, Checklist        TODOS
```

---

# 🎓 ESTRUTURA DE CADA SEMANA

```
SEGUNDA: Conceitos teóricos (30 min)
↓
QUARTA: Implementação no projeto (60 min)
↓
SEXTA: Deploy & Monitoring (30 min)
↓
FIM DE SEMANA: Experimentação livre (self-paced)
```

---

# 📈 PROGRESSION

```
Week 1-2:   Foundations
            └─ "I understand LLMs & APIs"

Week 2-4:   Structured Data & Retrieval
            └─ "I can build data pipelines with RAG"

Week 4-6:   Tools & Agents
            └─ "I can build autonomous agents"

Week 6-8:   Graph Orchestration & Advanced
            └─ "I can orchestrate complex workflows"

Week 8-10:  Observability & Quality
            └─ "I can monitor & evaluate agents"

Week 10-12: Deployment & Production
            └─ "I can deploy agents to production"

FINAL:      Portfolio-ready, production projects
            └─ "I'm a production AI engineer"
```

---

# 🎯 LEARNING OUTCOMES

By end of course, you will:
- ✅ Understand modern LLM architectures & how to use them
- ✅ Build structured data pipelines with RAG & retrieval
- ✅ Create autonomous agents with agentic loops
- ✅ Orchestrate complex workflows with LangGraph
- ✅ Monitor & evaluate agents in production
- ✅ Deploy agents to cloud (GCP) with observability
- ✅ Optimize costs & performance
- ✅ Have 3 production-ready projects in portfolio

---

# 📚 TECH STACK

**Languages**: Python 3.11+
**Frameworks**: LangChain, LangGraph
**LLMs**: Claude 3.5 Sonnet, GPT-4o (optional)
**Vector DB**: Pinecone / Weaviate / Chroma
**Cloud**: GCP (Cloud Run, Firestore, Cloud Tasks)
**Databases**: PostgreSQL + Redis
**Observability**: OpenTelemetry, Datadog/NewRelic
**Testing**: pytest, langchain-testing
**Deployment**: Docker, Terraform

---

# 📊 GRADING (If in institutional setting)

- **Projects**: 60% (3 projects × 20% each)
- **Observability**: 15% (monitoring & metrics)
- **Testing & Eval**: 15% (unit + integration tests)
- **Documentation**: 10% (README, architecture docs)

---

**Course Duration**: 12 weeks (30 hours/week = ~360 hours total)
**Difficulty**: Intermediate → Advanced
**Prerequisites**: Python basics, understanding of APIs
**Target**: AI Engineers, ML Engineers, SWE → AI transition

---

Criado: Agosto 2026
Status: Production-Ready Curriculum ✅

