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
- **Notebooks:** os 4 projetos já usam `StateGraph` (LangGraph) desde o início:
  - [`projects/01-churn-prediction/notebook.ipynb`](../../projects/01-churn-prediction/notebook.ipynb) — Linear (Gather → Retrieve → Predict → Verify)
  - [`projects/02-marketing-campaigns/notebook.ipynb`](../../projects/02-marketing-campaigns/notebook.ipynb) — Branch condicional (`add_conditional_edges`)
  - [`projects/03-performance-analysis/notebook.ipynb`](../../projects/03-performance-analysis/notebook.ipynb) — Streaming (Ingest → Update → Report)
  - [`projects/04-mmm-optimization/notebook.ipynb`](../../projects/04-mmm-optimization/notebook.ipynb) — 4 nós encadeados (Analyze → Generate → Route → Optimize)

**🏗️ Architecture:** Graph = código estruturado + visualizável

---

