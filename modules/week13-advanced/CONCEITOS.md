# Semana 13: Conceitos Avançados (SOTA 2026) ⚡

## Visão Geral

A semana de integração final. Os 5 conceitos abaixo não são "mais uma
feature" — são técnicas que resolvem problemas específicos de custo,
confiabilidade e eficiência que só aparecem quando um sistema de agentes já
está em produção de verdade. O Projeto #4 (Marketing Mix Modeling) foi
desenhado especificamente pra tocar nos 5 ao mesmo tempo.

---

## 13.1 Speculative Decoding ⚡

**Problema:** testar 1000 cenários com o modelo mais preciso (e mais caro) é
lento e caro.
**Solução:** gerar rápido com um modelo barato (draft), verificar só os
melhores candidatos com um modelo preciso (verify).
**Resultado:** ~2.5x mais rápido, mesma qualidade final — porque você só
paga o custo do modelo caro numa fração pequena dos candidatos.

- Draft model: geração rápida (Claude Haiku)
- Verifier model: verificação precisa (Claude Sonnet)
- Execução assíncrona em paralelo
- Redução de custo: ~60%

**Hands-On:** [`projects/04-mmm-optimization/notebook.ipynb`](../../projects/04-mmm-optimization/notebook.ipynb) — `draft_model_generate` + `verifier_model_verify`
**Projeto:** #4 MMM (1000 mixes em segundos)

---

## 13.2 Constitutional AI 🎯

**Problema:** um agente pode gerar uma resposta que viola uma regra de
negócio (ex.: alocar mais que o teto permitido num canal).
**Solução:** definir uma "constituição" — regras rígidas que a resposta
precisa satisfazer, verificadas em código, não só pedidas no prompt.
**Resultado:** alinhamento garantido — a regra não pode ser "esquecida" pelo
modelo, porque não depende do modelo cumprir, e sim do seu código validar.

- Constraints rígidas (budget, regulatório)
- Alinhamento de valores
- Sem alucinação de regras
- Validators do Pydantic como mecanismo de aplicação

**Hands-On:** [`projects/04-mmm-optimization/notebook.ipynb`](../../projects/04-mmm-optimization/notebook.ipynb) — validators do `MarketingMix`
**Projeto:** #4 MMM (constraints de budget)

---

## 13.3 Mixture of Experts 🧠

**Problema:** uma única estratégia não serve pra todas as condições (ex.:
mercado em alta vs em recessão pedem alocações de budget diferentes).
**Solução:** múltiplos "experts" especializados + um roteador que escolhe
qual usar de acordo com a condição atual.
**Resultado:** compute condicional — você só "ativa" a expertise relevante
pro contexto atual, em vez de um modelo genérico tentando servir tudo.

- Expert agressivo (máximo crescimento)
- Expert balanceado (ROI otimizado)
- Expert conservador (mínimo risco)
- Lógica de roteamento

**Hands-On:** [`projects/04-mmm-optimization/notebook.ipynb`](../../projects/04-mmm-optimization/notebook.ipynb) — `moe_routing`
**Projeto:** #4 MMM (3 estratégias)

---

## 13.4 Fine-tuning Eficiente 📚

**Problema:** treinar um modelo do zero (ou fazer fine-tuning completo) pra
adaptar a um domínio específico é caro e lento.
**Solução:** LoRA (Low-Rank Adaptation) — treina só um pequeno conjunto de
parâmetros "adaptadores" em cima do modelo base, em vez do modelo inteiro.
**Resultado:** redução de ~99% nos parâmetros treinados, treino em minutos
em vez de horas.

- LoRA vs QLoRA
- Adapter tuning
- Customização específica da empresa
- Redução de custo: ~99%

**Hands-On:** ⏳ não implementado no mock — LoRA requer um modelo aberto
rodando localmente (não a API da Anthropic), então não faz sentido mockar.
Ver nota no notebook do Projeto #4.
**Projeto:** #4 MMM (adaptar pro dataset da empresa)

---

## 13.5 Dados Sintéticos 🏭

**Problema:** você só tem uma amostra pequena de dados reais (ex.: 100
semanas de histórico de campanha).
**Solução:** usar o próprio LLM pra gerar cenários sintéticos realistas que
expandem o dataset.
**Resultado:** 5-10x mais dados pra treinar/validar modelos, preservando
privacidade (dado sintético não é dado real de cliente).

- Gerar cenários realistas
- Expandir dataset em 5-10x
- Preserva privacidade
- Padrões realistas (retornos decrescentes, sazonalidade)

**Hands-On:** [`projects/04-mmm-optimization/notebook.ipynb`](../../projects/04-mmm-optimization/notebook.ipynb) — `generate_synthetic_scenarios`
**Projeto:** #4 MMM (100 → 500+ cenários)

---

## 🎯 Integração da Semana 13

**Projeto #4: Marketing Mix Modeling** toca todos os 5 conceitos juntos:

```
INPUT: $1M de Budget
  ↓
[Speculative Decoding] ← Geração rápida
  ├─ Draft: 1000 mixes em ~0.01s (mock)
  └─ Verify: Top 20 com precisão
  ↓
[Constitutional AI] ← Aplica as regras
  ├─ Mínimo por canal: $10K
  ├─ Máximo por canal: implícito no mix gerado
  ├─ Total = $1M
  └─ Validação via Pydantic
  ↓
[Roteamento MoE] ← Escolhe estratégia
  ├─ Mercado em alta → agressivo
  ├─ Mercado estável → balanceado
  └─ Mercado em recessão → conservador
  ↓
[Dados Sintéticos] ← Expande o dataset
  ├─ Histórico real: 20 semanas
  └─ Sintético: ~100 cenários adicionais
  ↓
[Fine-tuning] ← Personalização (não implementado no mock)
  └─ Adaptar pros dados da empresa
  ↓
OUTPUT: Alocação de budget otimizada
```

---
