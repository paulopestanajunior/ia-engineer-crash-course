# 📚 EMENTA - IA Engineer Crash Course
## Curriculum Detalhado (13 Semanas)

---

## 📋 Estrutura Geral

```
FOUNDATION (Weeks 1-2)     → Conceitos base
INTERMEDIATE (Weeks 3-7)   → Aplicação prática
ADVANCED (Weeks 8-12)      → Production-grade
SOTA 2026 (Week 13)        → Cutting-edge concepts
```

---

## ⚡ WEEK 1-2: Fundamentos de LLMs em Produção

### 1.1 LLM Architecture & How They Work
- Transformer basics (attention, self-attention)
- Tokenization & embeddings
- Context windows & limitations
- Model selection (Claude vs GPT-4o vs others)
- Cost-benefit analysis

### 1.2 Prompt Engineering Fundamentals
- Few-shot vs Zero-shot learning
- Chain-of-Thought (CoT) prompting
- System prompts & role assignment
- Temperature & sampling parameters
- Best practices & anti-patterns

### 1.3 API Integration Basics
- REST API calls (HTTP requests)
- Rate limiting & retry logic
- Cost tracking & budgeting
- Error handling patterns
- Async/await patterns

### 1.4 Hands-On
- **Colab:** `colab_hello_world.py`
- **Examples:** Basic ChatBot, Structured output, Error handling
- **Project:** Setup environment for all 4 projects

**📊 Mapping aos Projetos:**
- #1 Churn: Prompt pra análise de churn
- #2 Marketing: Prompt pra campaign analysis
- #3 Performance: Prompt pra player analysis

---

## 🎯 WEEK 2-3: Structured Data & Outputs

### 2.1 Structured Outputs (NEW 2025-2026)
- JSON mode vs Tools vs Structured outputs
- Schema validation & type safety
- Parsing reliability (99.9% vs 98%)
- Pydantic v2 for schema definition

### 2.2 Data Validation & Quality
- Input validation strategies
- Output verification & fallbacks
- Error recovery patterns
- Graceful degradation

### 2.3 Working with Databases
- Querying data for context
- Schema design for AI agents
- Real-time data fetching
- Change Data Capture (CDC) basics

### 2.4 Hands-On
- **Colab:** `colab_pydantic_schemas.py`
- **Examples:** Customer schema, Campaign schema
- **Project #1 Start:** Churn Prediction setup

**Conceito Chave:** Structured outputs garantem parsing 99.9% correto

---

## 📖 WEEK 3-4: Retrieval-Augmented Generation (RAG)

### 3.1 Traditional RAG (Static)
- Retriever-Reader architecture
- Vector embeddings & similarity search
- Chunking strategies (sliding window, semantic)
- Vector DB comparison (Pinecone, Weaviate, Chroma)

### 3.2 Advanced RAG (SOTA 2026)
- Adaptive RAG (decide when to retrieve)
- Hybrid search (vector + keyword)
- Re-ranking (improve relevance)
- Semantic caching (reduce redundant retrievals)
- Graph-based retrieval

### 3.3 RAG for Different Data Types
- Text documents
- Structured data (tables)
- Time-series data
- Semi-structured data (logs, CSVs)

### 3.4 Hands-On
- **Colab:** `colab_vector_db.py`
- **Examples:** Embed documents, Search similar items
- **Project #1:** Retrieve similar churned customers
- **Project #2:** Campaign history retrieval

**💡 Key Insight:** Adaptive RAG 10x mais eficiente que RAG fixo

---

## 🔧 WEEK 4-5: Tool Use & Function Calling

### 4.1 Tool Architecture
- Tools como agent capabilities
- Tool definitions & schemas
- Reliable tool calling (forcing JSON)
- Native Claude tool_use format

### 4.2 Tool Execution Patterns
- Sequential tools (passo a passo)
- Parallel tool calling (5x speedup!)
- Tool composition (chains)
- Fallback mechanisms

### 4.3 External Integrations
- REST APIs
- Databases (CRUD operations)
- File systems
- Real-time data sources

### 4.4 Tool Error Handling
- Graceful degradation
- Retry logic with exponential backoff
- Circuit breakers
- Human escalation

### 4.5 Hands-On
- **Colab:** `colab_parallel_tools.py`
- **Examples:** Query DB, Fetch API, File operations
- **Project #2 Start:** Marketing campaign tools

**🚀 Speed:** Parallel tools = 2-5x mais rápido!

---

## 🤖 WEEK 5-6: Agents & Agentic Loops

### 5.1 Agent Architectures
- Tool-using agents (ReAct pattern)
- Planning agents (think before act)
- Multi-agent systems (teams)
- Hierarchical agents

### 5.2 Agentic Loops (THE CORE)
- Decide → Act → Observe → Loop
- Loop termination conditions
- Max iterations & budgets
- No progress detection

### 5.3 Agent State & Memory
- Conversation history
- Working memory (current task)
- Long-term memory (facts learned)
- Selective memory (pruning)

### 5.4 Agent Orchestration
- Supervisor agent (dispatcher)
- Hierarchical orchestration
- Inter-agent communication
- Agent routing strategies

### 5.5 Hands-On
- **Colab:** `colab_agentic_loops.py`
- **Examples:** Multi-strategy loops, State management
- **Project #1:** 3-strategy loop (stop at 0.85 confidence)
- **Project #3 Start:** Streaming loop

**🎯 Core Pattern:** Decide → Act → Observe → Learn

---

## 🕸️ WEEK 6-7: Graph Orchestration & LangGraph

### 6.1 Graph-Based Workflows
- Nodes, edges, state flow
- Conditional edges (routing)
- Parallel branches
- Looping within graphs

### 6.2 LangGraph Implementation
- StateGraph definition
- Node types (task, decision, parallel)
- Edge definition (deterministic + conditional)
- Compilation & invocation
- Visualization & debugging

### 6.3 Complex Workflows
- Approval gates (human in loop)
- Error recovery paths
- Subgraphs (nested graphs)
- Dynamic graph construction

### 6.4 Testing & Debugging
- Graph visualization
- Step-by-step execution
- State inspection at each node
- Trace analysis & debugging

### 6.5 Hands-On
- **Colab:** `colab_langgraph.py`
- **Examples:** Linear, branching, parallel graphs
- **Refactor All Projects:** 
  - #1: Linear (Analyze → Predict → Recommend)
  - #2: Branching (Analyzer → Decision → Recommender)
  - #3: Streaming (Ingest → Update → Report)

**🏗️ Architecture:** Graph = código estruturado + visualizável

---

## 🔍 WEEK 7-8: Advanced Concepts

### 7.1 Confidence Scoring & Uncertainty
- Confidence metrics calculation
- When to escalate to human?
- Uncertainty-aware routing
- Calibration (80% confident = 80% correct?)

### 7.2 Semantic Caching (NEW)
- Cache by meaning, not hash
- Prompt caching techniques
- Embeddings for cache lookup
- Cost reduction (up to 90%!)

### 7.3 Extended Thinking / Chain-of-Thought
- Expose reasoning process
- Structured thinking (outline before answer)
- Reflection loops
- Self-verification

### 7.4 Streaming & Real-time
- Token streaming (real-time UI updates)
- Event-driven architectures
- Backpressure handling
- Buffering strategies

### 7.5 Hands-On
- **Concepts:** Confidence, Caching, Streaming
- **Project #1:** Confidence scoring + escalation
- **Project #2:** Semantic caching integration
- **Project #3:** Real-time streaming updates

**💰 Cost Saving:** Semantic caching reduz custos 70-90%!

---

## 📊 WEEK 8-9: Observability & Monitoring

### 8.1 Observability Fundamentals
- Logs vs Traces vs Metrics (3 pillars)
- Structured logging
- OpenTelemetry standards
- Observability platforms (Datadog, New Relic, GCP)

### 8.2 LLM-Specific Monitoring
- Token tracking (input + output)
- Cost tracking (per request, per hour, per day)
- Latency monitoring (p50, p95, p99)
- Quality metrics (accuracy, hallucination rate)

### 8.3 Agent-Specific Metrics
- Agent success rate
- Tool execution success
- Loop iterations (avg, max)
- Human escalation rate

### 8.4 Alerting & SLOs
- Alert conditions & thresholds
- SLO definition (99.9% uptime, p95 latency < 2s)
- Error budgets
- Incident response procedures

### 8.5 Hands-On
- **Colab:** `colab_observability.py`
- **Projects:** Add OpenTelemetry to all 4
- Metrics per project:
  - #1 Churn: Prediction accuracy, false positive rate
  - #2 Marketing: Latency, recommendation adoption
  - #3 Performance: Real-time lag, prediction accuracy
  - #4 MMM: Scenario generation speed, constraint violations

**🎯 Production Ready:** Sem observability = não é production!

---

## ✅ WEEK 9-10: Evaluation & Quality Assurance

### 9.1 Evaluation Frameworks
- Defining quality metrics
- Ground truth dataset creation
- Automated vs manual evaluation
- Benchmark suite design

### 9.2 LLM Evaluation
- Semantic similarity scoring
- Factuality checking
- Relevance scoring
- Using another LLM as judge

### 9.3 Agent Evaluation
- Task completion rate
- Tool usage correctness
- Decision quality scoring
- Cost efficiency metrics

### 9.4 Continuous Evaluation
- A/B testing agents
- Shadow mode (run parallel, don't act)
- Feedback loops & collection
- Automatic retraining triggers

### 9.5 Hands-On
- **Testing:** Unit, integration, E2E tests
- **Project #1:** Accuracy vs actual churn (after 30 days)
- **Project #2:** Recommendation adoption rate
- **Project #3:** Prediction accuracy vs actual performance
- **Project #4:** Constraint violation detection

**🔍 Evaluation:** Essential pra production!

---

## 🚀 WEEK 10-11: Deployment & Infrastructure

### 10.1 Containerization & Orchestration
- Docker containers (Dockerfile)
- Kubernetes basics (if scaling needed)
- Container registries
- Version management

### 10.2 Cloud Deployment (GCP Focus)
- Cloud Run (serverless - perfeito pra agents!)
- Cloud Tasks (job queues)
- Firestore (NoSQL database)
- Cloud Storage (file storage)
- Cloud Pub/Sub (event streaming)

### 10.3 Database Strategies
- Relational vs NoSQL trade-offs
- Caching layers (Redis)
- Replication for HA
- Backup & recovery

### 10.4 Security & Compliance
- API key management (Secret Manager)
- Access control (IAM)
- Data encryption (in transit + at rest)
- Compliance (GDPR, etc)

### 10.5 Hands-On
- **Deploy:** Todos 4 projetos no Cloud Run
- **Infrastructure:** Terraform configs
- **Security:** Secret management
- **Monitoring:** Cloud Monitoring dashboards

**☁️ Cloud:** GCP é natural pra agents!

---

## 💰 WEEK 11: Cost Optimization

### 11.1 Token Economics
- Input vs output token pricing
- Caching savings (prompt caching)
- Model selection economics
- Batch processing vs streaming

### 11.2 Agent Cost Optimization
- Reducing unnecessary tool calls
- Smart model routing (cheap vs expensive)
- Parallel vs sequential execution
- Caching at every level

### 11.3 Infrastructure Costs
- Serverless vs containers
- Scaling strategies
- Data transfer cost optimization
- Storage optimization

### 11.4 Hands-On
- **Cost Tracking:** Por projeto, por request
- **Optimization:** Implement caching, routing, batching
- **Benchmarks:** Cost per prediction, per recommendation

**💵 Typical Savings:** 60-70% com otimizações!

---

## 🎓 WEEK 12: Capstone & Production Readiness

### 12.1 System Design
- Scaling agents horizontally
- Multi-region deployment
- Disaster recovery
- Performance optimization

### 12.2 Production Checklist
- ✅ Observability: Logging, tracing, metrics
- ✅ Testing: Unit, integration, E2E tests
- ✅ Security: No secrets in code, proper IAM
- ✅ Documentation: README, architecture, runbooks
- ✅ Monitoring: Alerts, SLOs, dashboards
- ✅ Cost: Tracked, optimized, within budget

### 12.3 Case Study Reviews
- Architectural decisions
- Trade-offs made
- Lessons learned
- What would you do differently?

### 12.4 Hands-On
- **Refine:** Todos 4 projetos pra production
- **Test:** Full E2E tests
- **Document:** Case studies, architecture docs
- **Monitor:** Live dashboards

**🏆 Production-Ready:** Tudo checklist verde!

---

## ⚡ WEEK 13: ADVANCED CONCEPTS (SOTA 2026)

### 13.1 Speculative Decoding ⚡
**Problem:** Testar 1000 scenarios é lento  
**Solution:** Draft (Haiku) + Verify (Sonnet)  
**Result:** 2.5x faster, same accuracy!

- Draft model: Quick generation (Claude Haiku)
- Verifier model: Accurate verification (Claude Sonnet)
- Async parallel execution
- Cost: 60% reduction

**Hands-On:** `colab_speculative_decoding.py`  
**Project:** #4 MMM (1000 mixes em 5s)

---

### 13.2 Constitutional AI 🎯
**Problem:** Agent pode violar constraints  
**Solution:** Define "constitution" (rules rígidas)  
**Result:** Alignment garantida!

- Hard constraints (budget, regulatory)
- Value alignment
- No hallucinations
- Pydantic validators

**Hands-On:** `colab_constitutional_ai.py`  
**Project:** #4 MMM (budget constraints)

---

### 13.3 Mixture of Experts 🧠
**Problem:** Uma estratégia não serve pra tudo  
**Solution:** N experts + router  
**Result:** Condicional compute = eficiente!

- Aggressive expert (max growth)
- Balanced expert (ROI optimized)
- Conservative expert (min risk)
- Router logic

**Hands-On:** `colab_mixture_of_experts.py`  
**Project:** #4 MMM (3 strategies)

---

### 13.4 Efficient Fine-tuning 📚
**Problem:** Treinar modelo é caro  
**Solution:** LoRA (99% parameter reduction!)  
**Result:** Treina em 5 min, não 5 horas!

- LoRA vs QLoRA
- Adapter tuning
- Company-specific customization
- Cost: 99% reduction

**Hands-On:** `colab_lora_finetuning.py`  
**Project:** #4 MMM (adapt pra seu dataset)

---

### 13.5 Synthetic Data 🏭
**Problem:** Só temos 100 samples  
**Solution:** AI gera dados realistas!  
**Result:** 10x mais data!

- Generate realistic scenarios
- Expand dataset 10x
- Privacy-preserving
- Realistic patterns (diminishing returns, seasonality)

**Hands-On:** `colab_synthetic_data.py`  
**Project:** #4 MMM (100→1000 scenarios)

---

## 🎯 WEEK 13 INTEGRATION

**Project #4: Marketing Mix Modeling** toca TUDO:

```
INPUT: $1M Budget
  ↓
[Speculative Decoding] ← Fast generation
  ├─ Draft: 1000 mixes em 0.5s
  └─ Verify: Top 50 accurately
  ↓
[Constitutional AI] ← Enforce rules
  ├─ Min per channel: $10K
  ├─ Max per channel: 40%
  ├─ Total = $1M
  └─ Regulatory compliance
  ↓
[MoE Routing] ← Choose strategy
  ├─ Market boom → aggressive
  ├─ Market stable → balanced
  └─ Market recession → conservative
  ↓
[Synthetic Data] ← Expand dataset
  ├─ Historical: 100 weeks
  └─ Synthetic: 1000 scenarios
  ↓
[Fine-tuning] ← Personalize
  └─ Adapt pra seu company data
  ↓
OUTPUT: Optimal budget allocation
```

---

## 📊 Mapping: Conceitos ↔ Projetos

```
CONCEITO                    #1      #2      #3      #4
────────────────────────────────────────────────────────
Fundamentos                 ✅      ✅      ✅      ✅
Structured Outputs          ✅              
RAG                         ✅      ✅      ✅      ✅
Tool Use                    ✅      ✅      ✅      ✅
Agents & Loops              ✅      ✅      ✅      ✅
LangGraph                   ✅      ✅      ✅      ✅
Confidence Scoring          ✅              ✅      ✅
Semantic Caching                    ✅              ✅
Streaming                                   ✅      
Observability               ✅      ✅      ✅      ✅
Evaluation                  ✅      ✅      ✅      ✅
Deployment                  ✅      ✅      ✅      ✅
Cost Optimization           ✅      ✅      ✅      ✅
Speculative Decoding                                ✅
Constitutional AI                                   ✅
Mixture of Experts                                  ✅
Fine-tuning                                         ✅
Synthetic Data                                      ✅
```

**Resultado:** 100% de cobertura conceitual!

---

## 📈 Weekly Schedule

```
SEGUNDA:   Conceito teórico (30 min)
QUARTA:    Implementação prática (60 min)
SEXTA:     Deploy & Monitoring (30 min)
FIM-SEMANA: Self-paced experimentation
```

---

## 🎯 Learning Outcomes

By end of course:
- ✅ Entender moderne LLM architectures
- ✅ Build structured data pipelines com RAG
- ✅ Create autonomous agents com agentic loops
- ✅ Orchestrate complex workflows com LangGraph
- ✅ Monitor & evaluate agents em produção
- ✅ Deploy agents to cloud (GCP) com observability
- ✅ Optimize costs & performance
- ✅ Ter 4 production-ready projects no portfolio
- ✅ Ser AI Engineer production-grade

---

**Status:** ✅ Production-Ready Curriculum  
**Duration:** 13 weeks @ 30 hours/week  
**Result:** 4 production projects + AI Engineering expertise

