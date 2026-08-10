# Módulos (13 Semanas)

Cada pasta tem um `CONCEITOS.md` extraído de [EMENTA.md](../EMENTA.md), com
links pros notebooks que implementam o conceito na prática.

| Semana | Módulo | Hands-on |
|---|---|---|
| 1-2 | [week01-fundamentos](./week01-fundamentos/CONCEITOS.md) | 4 notebooks (setup) |
| 2-3 | [week02-saidas-estruturadas](./week02-saidas-estruturadas/CONCEITOS.md) | Projeto #1 |
| 3-4 | [week03-rag](./week03-rag/CONCEITOS.md) | Projetos #1, #2 |
| 4-5 | [week04-uso-ferramentas](./week04-uso-ferramentas/CONCEITOS.md) | Projeto #2 |
| 5-6 | [week05-agentes-loops](./week05-agentes-loops/CONCEITOS.md) | Projetos #1, #3 |
| 6-7 | [week06-langgraph](./week06-langgraph/CONCEITOS.md) | Projetos #1-4 |
| 7-8 | [week07-conceitos-avancados](./week07-conceitos-avancados/CONCEITOS.md) | Projetos #1-3 |
| 8-9 | [week08-observabilidade](./week08-observabilidade/CONCEITOS.md) | ⏳ parcial (logging estruturado, sem OTel) |
| 9-10 | [week09-avaliacao](./week09-avaliacao/CONCEITOS.md) | ⏳ parcial (asserts nos notebooks, sem pytest) |
| 10-11 | [week10-deploy](./week10-deploy/CONCEITOS.md) | ⏳ parcial (Dockerfile ok, sem GCP real) |
| 11 | [week11-otimizacao-custo](./week11-otimizacao-custo/CONCEITOS.md) | ⏳ pendente (ver bonus/04-smart-routing) |
| 12 | [week12-projeto-final](./week12-projeto-final/CONCEITOS.md) | ⏳ pendente (depende das anteriores) |
| 13 | [week13-avancado](./week13-avancado/CONCEITOS.md) | Projeto #4 (MMM) — 4 de 5 conceitos SOTA implementados, incluindo LoRA real |

**✅** = implementado e testado · **⏳ parcial** = parte roda de verdade, parte
depende de infra que este ambiente não tem (conta GCP) · **⏳ pendente** =
documentado, sem código ainda.

**Todos os 4 notebooks principais chamam a API real da Anthropic quando
`ANTHROPIC_API_KEY` está definida** — sem ela, caem num mock determinístico
automaticamente. Ver [GETTING_STARTED.md](../GETTING_STARTED.md).
