# Semana 8-9: Observabilidade & Monitoramento

## Visão Geral

"Funciona na minha máquina" não serve pra um agente em produção — você
precisa saber, em tempo real, se ele está lento, caro, ou dando respostas
ruins, sem precisar reproduzir o problema manualmente. Observabilidade é a
diferença entre descobrir um problema pelo usuário reclamando e descobrir por
um alerta antes disso.

---

## 8.1 Fundamentos de Observabilidade

**Os 3 pilares:**
- **Logs:** eventos discretos ("essa predição aconteceu, com esse resultado").
- **Traces:** o caminho completo de uma requisição através do sistema
  (útil pra ver *onde* o tempo foi gasto num grafo com vários nós).
- **Metrics:** números agregados ao longo do tempo (latência média, taxa de
  erro, custo por hora).

**Structured logging:** logar como objeto (`{"event": ..., "campo": valor}`),
não como string livre — é isso que permite buscar/filtrar logs depois. Os
notebooks já fazem isso (`log_prediction` no Projeto #1).

**OpenTelemetry** é o padrão de mercado pra instrumentar tracing de forma
agnóstica de plataforma — você instrumenta uma vez, e manda pra qualquer
backend (Cloud Monitoring, Datadog, New Relic).

## 8.2 Monitoramento Específico de LLM

- **Token tracking:** contar tokens de input e output por request — é a base
  de qualquer cálculo de custo.
- **Cost tracking:** agregar o custo por request, por hora, por dia — sem
  isso você só descobre o gasto no boleto do mês.
- **Latency (p50, p95, p99):** a média esconde os piores casos. p95/p99 é o
  que o usuário mais lento da sua base realmente sente.
- **Quality metrics:** taxa de alucinação, accuracy — geralmente precisam de
  uma segunda camada de avaliação (Semana 9), não vêm de graça da API.

## 8.3 Métricas Específicas de Agente

- **Taxa de sucesso do agente:** quantas execuções terminam num resultado
  útil (não travado, não escalado por erro).
- **Sucesso de execução de tools:** quantas chamadas de tool falham vs
  funcionam.
- **Iterações do loop (média, máximo):** se a maioria das execuções está
  batendo no `max_iterations`, é sinal de que a estratégia não está
  convergindo — vale investigar antes de aumentar o limite.
- **Taxa de escalonamento humano:** quantas execuções precisaram de
  intervenção — um proxy direto de quanto o agente realmente está
  automatizando.

## 8.4 Alertas & SLOs

- **SLO (Service Level Objective):** meta mensurável, ex. "99.9% uptime",
  "p95 de latência < 2s".
- **Error budget:** quanto de falha você tolera antes de violar o SLO —
  ajuda a decidir se um novo deploy arriscado vale a pena.
- **Resposta a incidente:** ter um runbook (o que fazer quando o alerta
  dispara) definido *antes* do incidente acontecer.

## 8.5 Prática

- **Status:** ⏳ pendente. Os 4 notebooks já têm logging estruturado básico
  (`log_prediction` no #1, `latency_ms`/`tick_latency_ms` nos #2 e #3), mas
  OpenTelemetry real (traces, exporters pro Cloud Monitoring) ainda não foi
  implementado — fica como próximo passo de produção.
- Métricas por projeto:
  - #1 Churn: accuracy da predição, taxa de falso positivo
  - #2 Marketing: latência, adoção das recomendações
  - #3 Performance: atraso de tempo real, accuracy da predição
  - #4 MMM: velocidade de geração de cenários, violações de constraint

**🎯 Sem observabilidade, não é produção** — é só código rodando sem
ninguém saber se está funcionando direito.

---
