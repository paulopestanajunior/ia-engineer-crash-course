# Semana 6-7: Orquestração em Grafo & LangGraph

## Visão Geral

Esse é o módulo de "Graph Engineering" — a terceira camada da arquitetura do
curso. Depois que você tem tools (Week 4) e um loop com stopping rules
(Week 5), o Graph é o que estrutura *a ordem* em que as coisas acontecem:
que passo vem depois de qual, quando ramificar, e onde o loop se encaixa
dentro do fluxo maior. Um grafo bem desenhado é também documentação viva —
dá pra visualizar o pipeline inteiro olhando pros nós e arestas.

---

## 6.1 Workflows Baseados em Grafo

- **Nodes** são funções que recebem o `state` atual e devolvem um `state`
  atualizado (ou parcialmente atualizado). **Edges** definem pra onde o
  fluxo vai depois de cada nó.
- **Conditional edges (routing):** em vez de sempre ir do nó A pro nó B, uma
  função decide dinamicamente o próximo nó baseado no `state` atual — é
  assim que o Projeto #2 decide entre diferentes caminhos de recomendação.
- **Parallel branches:** múltiplos nós podem rodar a partir do mesmo ponto
  quando não dependem um do outro.
- **Looping dentro do grafo:** uma aresta pode apontar de volta pra um nó
  anterior — é como você implementa a Agentic Loop da Week 5 *dentro* da
  estrutura do grafo, em vez de como um `while` solto no meio de uma função.

## 6.2 Implementação com LangGraph

**O que é:** LangGraph é o framework usado neste curso pra declarar o grafo
como código.

- **StateGraph:** você declara o schema do estado (aqui, sempre um
  `Pydantic BaseModel`) e registra nós com `graph.add_node(nome, função)`.
- **Edges:** `graph.add_edge(A, B)` pra fluxo fixo, `graph.add_conditional_edges(A, função_de_roteamento, {...})`
  pra fluxo condicional.
- **Compilation & invocation:** `graph.compile()` gera um objeto executável;
  `.invoke(state_inicial)` roda o grafo até chegar no `END`.
- **Visualização & debugging:** o grafo compilado pode ser desenhado (nós e
  arestas) — extremamente útil pra debugar fluxo complexo sem ler código
  linha a linha.

**Armadilha comum (documentada nos notebooks):** `graph.invoke(state)` **não
muta** o objeto `state` original — ele devolve um novo state (dict-like) com
os campos atualizados. Se você espera que `state.campo` mude depois do
invoke, vai se surpreender com `None`. Sempre capture o retorno:
`resultado = graph.invoke(state)`.

## 6.3 Workflows Complexos

- **Approval gates (human in the loop):** um nó que pausa o fluxo esperando
  aprovação humana antes de continuar — essencial quando a ação tem
  consequência real (ex.: enviar dinheiro, deletar dado).
- **Error recovery paths:** arestas condicionais que levam pra um nó de
  "lidar com erro" em vez de travar o grafo inteiro.
- **Subgraphs:** um grafo pode conter outro grafo como um nó — útil quando um
  sub-fluxo é reutilizado em múltiplos lugares.

## 6.4 Testes & Debugging

- Rodar o grafo nó a nó (step-by-step) durante desenvolvimento ajuda a
  isolar onde o `state` diverge do esperado.
- Inspecionar o `state` em cada nó (print/log) é o equivalente a um
  breakpoint pra pipelines de agente.

## 6.5 Prática

- **Notebooks:** os 4 projetos já usam `StateGraph` (LangGraph) desde o
  início:
  - [`projects/01-churn-prediction/notebook.ipynb`](../../projects/01-churn-prediction/notebook.ipynb) — Linear (Gather → Retrieve → Predict → Verify)
  - [`projects/02-marketing-campaigns/notebook.ipynb`](../../projects/02-marketing-campaigns/notebook.ipynb) — Branch condicional (`add_conditional_edges`)
  - [`projects/03-performance-analysis/notebook.ipynb`](../../projects/03-performance-analysis/notebook.ipynb) — Streaming (Ingest → Update → Report)
  - [`projects/04-mmm-optimization/notebook.ipynb`](../../projects/04-mmm-optimization/notebook.ipynb) — 4 nós encadeados (Analyze → Generate → Route → Optimize)

**🏗️ Architecture:** Graph = código estruturado + visualizável. É a
diferença entre "um monte de `if`s encadeados" e um pipeline que você
consegue desenhar, testar nó a nó, e explicar pra outra pessoa em 30
segundos.

---
