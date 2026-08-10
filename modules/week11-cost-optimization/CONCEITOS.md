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
- **Status:** ⏳ pendente pra #1/#3. O padrão de roteamento por custo já
  existe em [`projects/bonus-agent-patterns/04-smart-routing.ipynb`](../../projects/bonus-agent-patterns/04-smart-routing.ipynb)
  (roteia query pro modelo mais barato que resolve) — vale de referência.
- **Cost Tracking:** Por projeto, por request
- **Optimization:** Implement caching, routing, batching
- **Benchmarks:** Cost per prediction, per recommendation

**💵 Typical Savings:** 60-70% com otimizações!

---

