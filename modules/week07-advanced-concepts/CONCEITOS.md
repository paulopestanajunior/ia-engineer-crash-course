# Semana 7-8: Conceitos Avançados

## Visão Geral

Com fundamentos, RAG, tools, loops e grafo prontos, essa semana adiciona
técnicas que separam um protótipo de um sistema pronto pra produção: saber
quando o agente não tem certeza (e o que fazer sobre isso), economizar custo
sem perder qualidade, e lidar com respostas em tempo real.

---

## 7.1 Confidence Scoring & Incerteza

**O que é:** medir o quão confiável é a resposta do agente, não só gerar uma
resposta.

- **Cálculo de confiança:** pode vir da própria probabilidade do modelo, de
  quão consistentes são múltiplas tentativas (self-consistency), ou de uma
  heurística de negócio (ex.: qualidade dos dados de entrada, como no
  Projeto #3).
- **Quando escalar pra humano:** definir um limiar abaixo do qual o agente
  não decide sozinho — no Projeto #1, confiança < 0.60 dispara escalonamento.
- **Roteamento por incerteza:** casos de alta confiança seguem o caminho
  automático; casos de baixa confiança vão pra um caminho mais caro (mais
  verificação, revisão humana).
- **Calibração:** a pergunta que ninguém faz — "quando o modelo diz 80% de
  confiança, ele está certo 80% das vezes?" Sem medir isso contra resultados
  reais, a confiança é só um número decorativo.

## 7.2 Cache Semântico (NOVO)

**O que é:** cachear por *significado*, não por hash exato do input. Duas
perguntas com palavras diferentes mas a mesma intenção devem bater no mesmo
cache.

- Em vez de comparar o texto exato, você compara embeddings (ou, como no
  mock do Projeto #2, um "bucket" de métricas arredondadas) — se dois inputs
  caem no mesmo bucket/vizinhança, reusa o resultado.
- **Redução de custo:** como a maioria das chamadas repetidas nunca precisa
  gerar de novo, cache semântico bem implementado corta custo de LLM em
  70-90% em cargas de trabalho com muita repetição (ex.: muitas campanhas
  parecidas).

## 7.3 Extended Thinking / Chain-of-Thought

**O que é:** expor o raciocínio do modelo antes da conclusão final, em vez de
pedir só a resposta.

- **Structured thinking:** pedir pro modelo esboçar os passos antes de
  responder reduz erros em tarefas com múltiplos critérios (ver
  `analyzer_agent` no Projeto #2, que lista o `reasoning` antes de decidir
  a ação).
- **Reflection loops:** o modelo revisa a própria resposta antes de
  finalizar — mais caro, mas reduz erros bobos em tarefas críticas.
- **Self-verification:** o modelo (ou um segundo agente) checa se a resposta
  realmente responde a pergunta original antes de devolver.

## 7.4 Streaming & Tempo Real

**O que é:** em vez de esperar a resposta completa, processar/mostrar dados
conforme chegam.

- **Token streaming:** mostra a resposta do LLM sendo gerada palavra por
  palavra — melhora percepção de velocidade numa UI.
- **Arquiteturas orientadas a evento:** o agente reage a eventos que chegam
  (ex.: um novo dado de partida) em vez de rodar sob demanda — é o padrão do
  Projeto #3.
- **Backpressure:** se os eventos chegam mais rápido do que o agente processa,
  precisa de uma estratégia (fila, descarte, batching) pra não sobrecarregar.

## 7.5 Prática

- **Projeto #1** ([notebook](../../projects/01-churn-prediction/notebook.ipynb)): Confidence scoring + escalação (seção 6, `node_verify`)
- **Projeto #2** ([notebook](../../projects/02-marketing-campaigns/notebook.ipynb)): Cache semântico (seção 2) + extended thinking (seção 3)
- **Projeto #3** ([notebook](../../projects/03-performance-analysis/notebook.ipynb)): Streaming em tempo real (seção 6)

**💰 Economia de custo:** cache semântico bem aplicado reduz custo de LLM em
70-90% em cenários com muita repetição.

---
