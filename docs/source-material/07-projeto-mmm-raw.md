# 📊 PROJETO #4: Marketing Mix Modeling (MMM) - Otimização de Budget com IA

---

## 🎯 O PROBLEMA REAL

**Empresa:** Qualquer marca (CPG, Retail, SaaS)
**Pergunta:** "Como aloco $1M de budget entre TV, Digital, Social, Outdoor?"
**Desafio:** Não é linear (diminuindo retorno)
**Solução:** Agent que otimiza usando AI + causality

---

## 📈 DADOS FICTÍCIOS (Realistas)

```python
# Historical data: 100 weeks de campanhas
campaigns = [
    {
        "week": 1,
        "tv_spend": 50000,
        "digital_spend": 80000,
        "social_spend": 30000,
        "outdoor_spend": 20000,
        "total_sales": 450000,
        "market_share": 12.5
    },
    # ... 99 more weeks
]

# Diminishing returns pattern:
# TV: High initial impact, diminishing
# Digital: Medium, scales better
# Social: Low baseline, high engagement
# Outdoor: Medium, brand awareness
```

---

## 🏗️ ARQUITETURA MMM AGENT

```
INPUT: Total Budget ($1M)
↓
[AGENT #1: HISTORICAL ANALYSIS]
├─ Gather: Historical campaigns + sales
├─ Inference: Calculate elasticity per channel
├─ Tools: Query database, run elasticity model
└─ Verify: Cross-validate with econometric model

↓
[AGENT #2: SCENARIO GENERATION] ← Synthetic Data
├─ Generate 1000 budget mixes
├─ Each mix different allocation
└─ Synthetic outcomes based on learned model

↓
[AGENT #3: OPTIMIZATION ROUTING] ← MoE + Constitutional AI
├─ Router: Different optimization strategies
│  ├─ Strategy A: Maximize revenue
│  ├─ Strategy B: Maximize ROI
│  ├─ Strategy C: Maximize market share
│  └─ Strategy D: Conservative (minimize risk)
├─ Constitutional Rules:
│  ├─ Min budget per channel: $10K
│  ├─ Max single channel: 40% of total
│  ├─ Budget constraint: = $1M
│  └─ Regulatory: Min outdoor 15%

↓
[AGENT #4: SPECULATIVE EXECUTION]
├─ Parallel simulation of top 5 mixes
├─ Predict outcomes fast (speculative decoding)
└─ Return: Recommended allocation

↓
OUTPUT: 
{
  "recommended_mix": {
    "tv": 350000,      // 35%
    "digital": 400000, // 40%
    "social": 150000,  // 15%
    "outdoor": 100000  // 10%
  },
  "expected_sales": 520000,
  "expected_roi": 1.85,
  "confidence": 0.88,
  "rationale": "Digital and TV show best elasticity..."
}
```

---

## 🧠 CONCEITOS SOTA EM MMM

### **1. Speculative Decoding** ⚡
**Problema:** Testar 1000 mixes é lento
**Solução:** 
- Draft model: Fast prediction (Claude 3.5 Haiku)
- Verifier: Accurate prediction (Claude 3.5 Sonnet)
- Result: 2.5x faster, same accuracy

```python
# Fast scenario generation
async def speculative_decoding():
    # Draft: Generate 1000 mixes quickly
    scenarios = await draft_model.generate_mixes(1000)
    
    # Verify: Check top 50 with accurate model
    verified = await verifier_model.verify(scenarios[:50])
    
    # Return: Best verified scenario
    return max(verified, key=lambda x: x.expected_roi)
```

### **2. Constitutional AI** 🎯
**Problema:** Agent pode violar constraints
**Solução:** Define "constitution" (rules)

```python
constitution = {
    "constraints": [
        "tv_spend <= 0.40 * total_budget",
        "digital_spend >= 0.20 * total_budget",
        "total_spend == 1000000",
        "all_channels >= 10000"
    ],
    "objectives": [
        "maximize(expected_roi)",
        "minimize(risk)"
    ],
    "safety_checks": [
        "no_regulatory_violations",
        "no_market_saturation"
    ]
}

# Agent respects constitution
@constitutional(constitution)
async def optimize_mix(budget):
    # Can't violate constraints!
    pass
```

### **3. MoE Routing** 🧠
**Problema:** Uma estratégia não serve pra tudo
**Solução:** 3 experts, router escolhe

```python
class MMM_MoE:
    experts = {
        "aggressive": OffensiveStrategy(),      # Max growth
        "balanced": BalancedStrategy(),         # ROI balanced
        "conservative": ConservativeStrategy()  # Min risk
    }
    
    async def route(self, budget, market_condition):
        if market_condition == "boom":
            return await self.experts["aggressive"].optimize(budget)
        elif market_condition == "recession":
            return await self.experts["conservative"].optimize(budget)
        else:
            return await self.experts["balanced"].optimize(budget)
```

### **4. Synthetic Data Generation** 🏭
**Problema:** Só temos 100 semanas de dados
**Solução:** Gera 10k cenários sintéticos

```python
# Use Claude pra gerar synthetic historical data
async def generate_synthetic_data():
    prompt = """
    Generate 100 realistic marketing campaign scenarios.
    Each with TV, Digital, Social, Outdoor spend.
    Include realistic sales outcomes based on:
    - Diminishing returns
    - Channel interactions
    - Seasonality
    - Market dynamics
    
    Format: JSON array of {tv, digital, social, outdoor, sales}
    """
    
    synthetic = await claude.generate(prompt)
    # Now we have 200 data points instead of 100!
    return combine(real_data, synthetic)
```

### **5. Efficient Fine-tuning** 📚
**Problema:** Treinar modelo MMM é caro
**Solução:** LoRA pra adaptar modelo base

```python
# Instead of full model: 50K params
# LoRA: só 500 params! (99% reduction)

from peft import LoraConfig

config = LoraConfig(
    r=8,
    lora_alpha=32,
    lora_dropout=0.05
)

# Adapt Claude pra dados específicos da empresa
finetuned = get_peft_model(claude_base, config)
finetuned.train(company_data)
# Result: Tuned pro seu dataset, super eficiente!
```

---

## 💻 CÓDIGO COMPLETO (Starter)

```python
from langgraph.graph import StateGraph, START, END
from pydantic import BaseModel, validator
import asyncio

# ===== STATE & SCHEMA =====
class MarketingMix(BaseModel):
    tv: float
    digital: float
    social: float
    outdoor: float
    
    @validator('tv', 'digital', 'social', 'outdoor')
    def min_spend(cls, v):
        if v < 10000:
            raise ValueError('Minimum spend $10k per channel')
        return v
    
    def total(self):
        return self.tv + self.digital + self.social + self.outdoor

class MMMState(BaseModel):
    budget: float = 1000000
    historical_data: list = None
    scenarios: list = []
    best_mix: MarketingMix = None
    expected_sales: float = 0
    confidence: float = 0
    routing_strategy: str = None

# ===== AGENTS =====

async def historical_analysis(state: MMMState):
    """Analyze past campaigns"""
    context = f"Analyze these {len(state.historical_data)} campaigns"
    
    analysis = await claude.invoke({
        "system": "You are a marketing analytics expert",
        "user": context + str(state.historical_data[:5])
    })
    
    # Parse elasticity per channel
    elasticity = {
        "tv": 0.8,      # Diminishing
        "digital": 1.1, # Scales well
        "social": 0.6,  # Lower
        "outdoor": 0.7
    }
    
    return {"elasticity": elasticity}

async def scenario_generation(state: MMMState):
    """Generate synthetic scenarios"""
    
    # Use speculative decoding pra gerar rápido
    prompt = f"""
    Generate 100 realistic marketing budget allocations.
    Total: ${state.budget}
    Constraints:
    - Each channel min $10K
    - Each channel max 40% of total
    - Based on elasticity: {elasticity}
    
    Return JSON array of mixes with predicted sales.
    """
    
    # Draft: Quick generation
    scenarios = await draft_model.generate(prompt)
    
    # Verify: Accurate calculation
    verified = await verifier_model.verify(scenarios[:20])
    
    state.scenarios = verified
    return state

async def moe_routing(state: MMMState):
    """Choose optimization strategy"""
    
    # Constitution rules
    constitution = {
        "max_single_channel": 0.40,
        "min_single_channel": 0.01,  # $10k minimum
        "total_budget": state.budget,
        "regulatory_min_outdoor": 0.10
    }
    
    # MoE: Choose strategy
    strategies = {
        "aggressive": {"tv": 0.35, "digital": 0.45, "social": 0.15, "outdoor": 0.05},
        "balanced": {"tv": 0.35, "digital": 0.40, "social": 0.15, "outdoor": 0.10},
        "conservative": {"tv": 0.30, "digital": 0.35, "social": 0.10, "outdoor": 0.25}
    }
    
    # Pick strategy based on market condition
    state.routing_strategy = "balanced"  # Default
    
    return state

async def optimization(state: MMMState):
    """Final optimization"""
    
    best_scenario = max(state.scenarios, key=lambda x: x.roi)
    
    state.best_mix = MarketingMix(
        tv=best_scenario.tv,
        digital=best_scenario.digital,
        social=best_scenario.social,
        outdoor=best_scenario.outdoor
    )
    state.expected_sales = best_scenario.sales
    state.confidence = best_scenario.confidence
    
    return state

# ===== GRAPH =====
graph = StateGraph(state_schema=MMMState)

graph.add_node("analyze", historical_analysis)
graph.add_node("generate", scenario_generation)
graph.add_node("route", moe_routing)
graph.add_node("optimize", optimization)

graph.add_edge(START, "analyze")
graph.add_edge("analyze", "generate")
graph.add_edge("generate", "route")
graph.add_edge("route", "optimize")
graph.add_edge("optimize", END)

mmm_agent = graph.compile()

# ===== RUN =====
async def run_mmm():
    state = MMMState(budget=1000000)
    result = await mmm_agent.ainvoke(state)
    
    print(f"🎯 Recommended Mix:")
    print(f"   TV: ${result.best_mix.tv:,.0f}")
    print(f"   Digital: ${result.best_mix.digital:,.0f}")
    print(f"   Social: ${result.best_mix.social:,.0f}")
    print(f"   Outdoor: ${result.best_mix.outdoor:,.0f}")
    print(f"   Expected Sales: ${result.expected_sales:,.0f}")
    print(f"   Confidence: {result.confidence:.0%}")

asyncio.run(run_mmm())
```

---

## 🎯 COMO MMM TOCA CONCEITOS AVANÇADOS

### **Speculative Decoding** ⚡
- Scenario generation: Draft (1000 mixes) + Verify (top 20)
- 2.5x faster que rodar tudo com Sonnet

### **Constitutional AI** 🎯
- Budget constraints (total = $1M)
- Channel constraints (min/max per channel)
- Regulatory constraints (outdoor minimum)
- Agent respeita TUDO

### **MoE Routing** 🧠
- Router escolhe strategy (aggressive/balanced/conservative)
- Based on market conditions
- Cada expert tem sua própria otimização

### **Synthetic Data** 🏭
- Gera 100 cenários sintéticos
- Expande dataset de 100 → 200 semanas
- Melhora model accuracy

### **Efficient Fine-tuning** 📚
- Treina LoRA no dataset da empresa
- Só 500 params vs 7B do modelo base
- Super rápido e barato

---

## 📊 METRICAS DO PROJETO

**Input:**
- Budget: $1M
- Historical: 100 weeks de campanha
- Constraints: 5 business rules

**Output:**
- Optimal mix (4 channels)
- Expected sales (forecast)
- ROI (return on investment)
- Confidence (0-100%)
- Recommendation rationale

**Success Criteria:**
- ✅ Respects all constitutional constraints
- ✅ Outputs run in < 5 seconds (speculative)
- ✅ Confidence > 80%
- ✅ Back-tested vs historical (accuracy)

---

## 🚀 QUANDO FAZER

**Timeline:**
- Week 13-14: Conceitos avançados
- Week 14-15: Implement MMM
- Week 16: Deploy + Monitoring
- Week 17: A/B test recommendations vs manual

---

## 💡 BONUS: Multi-Channel Attribution

```python
# Além da MMM base, adicione:
# "Qual foi o impacto de cada touchpoint?"

attribution = {
    "first_touch": tv,      # Awareness
    "middle_touch": digital, # Consideration
    "last_touch": social    # Conversion
}
```

