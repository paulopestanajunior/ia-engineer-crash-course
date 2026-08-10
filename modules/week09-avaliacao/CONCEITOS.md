# Semana 9-10: Avaliação & Garantia de Qualidade

## Visão Geral

Observabilidade (Semana 8) te diz *que* algo está acontecendo. Avaliação te
diz se o resultado está *certo*. Sem uma forma sistemática de medir
qualidade, cada mudança de prompt vira um "achismo" — você não sabe se
melhorou ou piorou até um usuário reclamar.

---

## 9.1 Frameworks de Avaliação

- **Definir métricas de qualidade** antes de começar a medir — o que
  significa "o agente acertou" pro seu domínio específico?
- **Ground truth dataset:** um conjunto de casos com a resposta certa
  conhecida, usado pra comparar contra a saída do agente.
- **Avaliação automática vs manual:** automática escala e roda a cada
  mudança de código; manual (revisão humana) é mais confiável mas não
  escala — geralmente você usa as duas, automática no dia a dia e manual
  periodicamente.
- **Benchmark suite:** um conjunto fixo de casos de teste que roda toda vez
  que algo muda (prompt, modelo, código) — o equivalente a testes
  automatizados, mas pra qualidade de resposta do LLM.

## 9.2 Avaliação de LLM

- **Semantic similarity scoring:** compara a resposta gerada com a esperada
  por significado (embeddings), não por match exato de texto.
- **Factuality checking:** verifica se as afirmações da resposta são
  factualmente corretas (mais relevante quando o agente tem RAG e pode
  "alucinar" além do que os documentos dizem).
- **LLM como juiz:** usar um segundo LLM (geralmente mais forte) pra avaliar
  a qualidade da resposta do primeiro — escala melhor que revisão 100%
  humana, mas precisa ser calibrado contra avaliação humana de vez em
  quando.

## 9.3 Avaliação de Agente

- **Taxa de conclusão de tarefa:** o agente realmente termina o que devia
  fazer, ou trava/desiste no meio?
- **Correção do uso de tools:** o agente chamou a tool certa, com os
  argumentos certos?
- **Qualidade da decisão:** pra agentes que decidem algo (ex.: recomendar
  uma ação), o quão boa foi a decisão comparada com o que um especialista
  humano faria?
- **Eficiência de custo:** o resultado obtido justifica o custo gasto
  (tokens, tempo, iterações de loop)?

## 9.4 Avaliação Contínua

- **A/B testing de agentes:** rodar duas versões em paralelo com tráfego
  real dividido, comparar métricas.
- **Shadow mode:** rodar uma versão nova em paralelo com a de produção, sem
  agir de fato — só pra comparar o que ela *teria* feito, sem risco.
- **Feedback loops:** capturar quando um usuário rejeita/corrige a saída do
  agente vira dado pra melhorar o sistema.

## 9.5 Prática

- **Status:** ⏳ parcial. Cada um dos 4 notebooks tem uma seção "Testes
  básicos" com `assert`s validando invariantes (confidence no range 0-1,
  stopping rule respeitada, schema correto) — não é uma suite `pytest`
  separada ainda, mas já é mais que "rodou sem erro".
- **Projeto #1:** accuracy vs churn real (observado após 30 dias)
- **Projeto #2:** taxa de adoção das recomendações
- **Projeto #3:** accuracy da predição vs performance real
- **Projeto #4:** detecção de violação de constraint

**🔍 Avaliação é essencial pra produção** — é a única forma de saber, com
dados, se uma mudança melhorou o agente ou só pareceu melhorar.

---
