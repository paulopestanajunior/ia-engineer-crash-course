# Semana 4-5: Uso de Ferramentas & Function Calling

## Visão Geral

Um LLM sozinho só gera texto — pra ele agir no mundo real (consultar um
banco, chamar uma API, ler um arquivo), ele precisa de *tools*: funções que
você define, com um schema de argumentos, que o modelo decide quando e como
chamar.

---

## 4.1 Arquitetura de Tools

**O que é:** uma tool é uma função do seu código exposta ao LLM com uma
descrição em linguagem natural + um schema dos argumentos esperados. O
modelo não executa a função — ele decide *que* função chamar e *com quais
argumentos*, e o seu código executa e devolve o resultado pro modelo
continuar.

- **Tool definitions & schemas:** quanto mais clara a descrição da tool (o
  que ela faz, quando usar), melhor o modelo escolhe entre múltiplas tools
  disponíveis.
- **Reliable tool calling:** o formato nativo `tool_use` da Claude API é mais
  confiável que pedir "responda em JSON" no prompt — o modelo foi treinado
  especificamente pra esse formato estruturado.

## 4.2 Padrões de Execução de Tools

- **Sequential:** cada tool call espera o resultado da anterior antes de
  continuar — necessário quando uma depende do resultado da outra.
- **Parallel tool calling:** quando as tools são independentes (ex.: buscar
  benchmark do canal E buscar teto de budget ao mesmo tempo), rodar em
  paralelo com `asyncio.gather` corta a latência total em 2-5x — é
  literalmente o tempo da chamada mais lenta, não a soma de todas.
- **Tool composition:** encadear tools onde a saída de uma vira entrada da
  próxima (chains).
- **Fallback mechanisms:** se uma tool falha (API externa fora do ar), o
  agente precisa de um plano B — não travar a resposta inteira por causa de
  uma tool não-crítica.

## 4.3 Integrações Externas

Tools tipicamente encapsulam: chamadas REST a serviços externos, operações
CRUD em banco de dados, leitura/escrita de arquivos, ou consumo de dados em
tempo real (ex.: `tool_live_stats` no Projeto #3). O ponto chave: a tool é a
*fronteira* entre o raciocínio do LLM e o mundo real — é ali que você valida
input/output e mede latência.

## 4.4 Tratamento de Erros em Tools

- **Graceful degradation:** tool falhou → devolve um resultado parcial em vez
  de propagar a exceção pro usuário.
- **Retry com exponential backoff:** essencial pra APIs externas com rate
  limit ou instabilidade momentânea.
- **Circuit breakers:** se uma tool está falhando repetidamente, pare de
  tentar por um tempo em vez de continuar batendo numa API com problema.
- **Human escalation:** algumas falhas de tool devem virar "preciso de ajuda
  humana", não um retry infinito.

## 4.5 Prática

- **Notebook:** [`projects/02-marketing-campaigns/notebook.ipynb`](../../projects/02-marketing-campaigns/notebook.ipynb) —
  seção 4, `gather_context_parallel`: duas tools (`tool_fetch_benchmark`,
  `tool_fetch_budget_cap`) rodando em paralelo via `asyncio.gather`, com
  latência medida antes/depois pra comprovar o ganho.
- **Examples:** Query DB, Fetch API, File operations
- **Project #2 Start:** Marketing campaign tools

**🚀 Speed:** no notebook, as duas tools levam ~50ms cada; rodando em
paralelo o total fica ~50-60ms em vez de ~100ms sequencial.

---
