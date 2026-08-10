## 📊 WEEK 8-9: Observability & Monitoring

### 8.1 Observability Fundamentals
- Logs vs Traces vs Metrics (3 pillars)
- Structured logging
- OpenTelemetry standards
- Observability platforms (Datadog, New Relic, GCP)

### 8.2 LLM-Specific Monitoring
- Token tracking (input + output)
- Cost tracking (per request, per hour, per day)
- Latency monitoring (p50, p95, p99)
- Quality metrics (accuracy, hallucination rate)

### 8.3 Agent-Specific Metrics
- Agent success rate
- Tool execution success
- Loop iterations (avg, max)
- Human escalation rate

### 8.4 Alerting & SLOs
- Alert conditions & thresholds
- SLO definition (99.9% uptime, p95 latency < 2s)
- Error budgets
- Incident response procedures

### 8.5 Hands-On
- **Status:** ⏳ pendente. Os 4 notebooks já têm logging estruturado básico
  (`log_prediction` no #1, `latency_ms`/`tick_latency_ms` nos #2 e #3), mas
  OpenTelemetry real (traces, exporters pro Cloud Monitoring) ainda não foi
  implementado — fica como próximo passo de produção.
- Metrics per project:
  - #1 Churn: Prediction accuracy, false positive rate
  - #2 Marketing: Latency, recommendation adoption
  - #3 Performance: Real-time lag, prediction accuracy
  - #4 MMM: Scenario generation speed, constraint violations

**🎯 Production Ready:** Sem observability = não é production!

---

