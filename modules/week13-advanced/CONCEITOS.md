## ⚡ WEEK 13: ADVANCED CONCEPTS (SOTA 2026)

### 13.1 Speculative Decoding ⚡
**Problem:** Testar 1000 scenarios é lento  
**Solution:** Draft (Haiku) + Verify (Sonnet)  
**Result:** 2.5x faster, same accuracy!

- Draft model: Quick generation (Claude Haiku)
- Verifier model: Accurate verification (Claude Sonnet)
- Async parallel execution
- Cost: 60% reduction

**Hands-On:** [`projects/04-mmm-optimization/notebook.ipynb`](../../projects/04-mmm-optimization/notebook.ipynb) — `draft_model_generate` + `verifier_model_verify`
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

**Hands-On:** [`projects/04-mmm-optimization/notebook.ipynb`](../../projects/04-mmm-optimization/notebook.ipynb) — validators do `MarketingMix`
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

**Hands-On:** [`projects/04-mmm-optimization/notebook.ipynb`](../../projects/04-mmm-optimization/notebook.ipynb) — `moe_routing`
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

**Hands-On:** ⏳ não implementado no mock — requer modelo aberto local, ver nota no notebook do #4
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

**Hands-On:** [`projects/04-mmm-optimization/notebook.ipynb`](../../projects/04-mmm-optimization/notebook.ipynb) — `generate_synthetic_scenarios`
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

