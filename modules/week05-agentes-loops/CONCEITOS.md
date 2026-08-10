# Semana 5-6: Agentes & Loops Agênticos

## Visão Geral

Esse é o módulo central do curso — a "Loop Engineering" da arquitetura
Harness + Loop + Graph. Um agente não é um LLM respondendo uma vez; é um
processo que decide, age, observa o resultado, e repete até atingir um
critério de parada. Sem uma regra de parada clara (stopping rule), um agente
"loopa" infinitamente ou desiste cedo demais — os dois são falhas de
produção.

---

## 5.1 Arquiteturas de Agente

- **Tool-using agents (ReAct):** o padrão Reason → Act → Observe, repetido.
  O modelo raciocina sobre o que fazer, chama uma tool, observa o resultado,
  raciocina de novo.
- **Planning agents:** em vez de decidir passo a passo, o agente monta um
  plano completo antes de agir — melhor pra tarefas onde a ordem das ações
  importa e replanejar no meio é caro.
- **Multi-agent systems:** múltiplos agentes especializados (ex.: Analyzer +
  Recommender no Projeto #2) em vez de um agente generalista fazendo tudo —
  cada um com um prompt/responsabilidade mais estreita, geralmente mais
  confiável que um agente "faz-tudo".
- **Hierarchical agents:** um agente supervisor que decide qual
  sub-agente/especialista chamar (ver Week 13, Mixture of Experts).

## 5.2 Loops Agênticos (O NÚCLEO)

**O padrão:** Decide → Act → Observe → Loop. O agente decide uma estratégia,
executa, observa a confiança/qualidade do resultado, e se não for suficiente,
tenta de novo com uma estratégia diferente (não repete a mesma exata —
senão o resultado não muda).

**Stopping rules — a parte que mais gente esquece de implementar:**
- **Confidence threshold:** para quando a confiança do resultado atinge um
  limiar (ex.: 0.85 no Projeto #1).
- **Max iterations:** nunca deixe o loop rodar indefinidamente — um número
  máximo de tentativas é obrigatório, mesmo que a confiança nunca chegue lá.
- **Budget (tempo/custo):** pare se already gastou X segundos ou X tokens,
  independente de iterações.
- **No progress detection:** se a confiança não está melhorando entre
  tentativas, continuar é desperdício — pare e escale.

No notebook do Projeto #1 (`churn_agentic_loop`), as três primeiras regras
aparecem juntas: 3 estratégias diferentes, confidence mínima de 0.85, e um
`max_iterations` fixo como teto de segurança.

## 5.3 Estado & Memória do Agente

- **Conversation history:** o que já foi dito na sessão atual.
- **Working memory:** dados da tarefa em andamento (ex.: o `CustomerState`
  do Projeto #1 carrega tudo que o agente já descobriu sobre aquele
  cliente).
- **Long-term memory:** fatos aprendidos que persistem entre sessões (não
  implementado nos notebooks mock — normalmente vai num banco vetorial ou
  key-value).
- **Selective memory (pruning):** descartar histórico irrelevante antes de
  estourar o context window.

## 5.4 Orquestração de Agentes

- **Supervisor agent:** um agente cuja única função é decidir pra quem
  rotear a tarefa (ver `moe_routing` no Projeto #4).
- **Inter-agent communication:** como um agente passa contexto pro próximo
  numa cadeia — no LangGraph, isso é literalmente o `state` passado entre
  nós (Week 6).

## 5.5 Prática

- **Notebook:** [`projects/01-churn-prediction/notebook.ipynb`](../../projects/01-churn-prediction/notebook.ipynb) —
  seção 5, `churn_agentic_loop`: 3 estratégias, para em confidence ≥ 0.85.
- **Notebook:** [`projects/03-performance-analysis/notebook.ipynb`](../../projects/03-performance-analysis/notebook.ipynb) —
  seção 6, loop de streaming (3 "ticks" simulando dados chegando em tempo
  real).
- **Project #1:** 3-strategy loop (stop at 0.85 confidence)
- **Project #3 Start:** Streaming loop

**🎯 Core Pattern:** Decide → Act → Observe → Learn — e sempre com uma regra
de parada explícita.

---
