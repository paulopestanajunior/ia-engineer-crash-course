# 🎁 Bonus: Agent Patterns (fora da ementa oficial)

5 projetos extras gerados numa iteração anterior do planejamento do curso.
Não fazem parte do currículo oficial de 13 semanas ([EMENTA.md](../../EMENTA.md))
nem dos 4 projetos principais ([README.md](../../README.md)), mas têm código
funcional (mockado, sem API keys) e valem como prática extra de padrões de
agente comuns no mercado.

| Notebook | Padrão demonstrado |
|---|---|
| [01-sales-sdr-agent.ipynb](./01-sales-sdr-agent.ipynb) | Qualificação de lead + outreach automatizado |
| [02-invoice-processing-agent.ipynb](./02-invoice-processing-agent.ipynb) | Extração estruturada + validação de documentos |
| [03-customer-service-agent.ipynb](./03-customer-service-agent.ipynb) | Tool use + escalonamento humano |
| [04-smart-routing.ipynb](./04-smart-routing.ipynb) | Roteamento condicional (Mixture-of-Experts leve) |
| [05-hr-screening-agent.ipynb](./05-hr-screening-agent.ipynb) | Triagem de candidatos com scoring |

Todo código tem mocks — sem chamadas reais de API. Pra rodar de verdade,
troque o mock do LLM pela sua chave da Anthropic (`ANTHROPIC_API_KEY` no `.env`).

Fonte original: [`docs/source-material/04-codigo-projetos-bonus.md`](../../docs/source-material/04-codigo-projetos-bonus.md).
