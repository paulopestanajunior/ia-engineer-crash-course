# Semana 12: Capstone & Prontidão pra Produção

## Visão Geral

A última semana "regular" do curso não introduz conceito novo — é onde você
junta tudo (semanas 1-11) e leva os 4 projetos de "notebook que roda com
mock" pra "sistema que você confiaria em produção". É também onde você
documenta as decisões, pra si mesmo no futuro e pra qualquer outra pessoa que
for mexer no código.

---

## 12.1 Design de Sistema

- **Escalar agentes horizontalmente:** múltiplas instâncias do mesmo agente
  rodando em paralelo pra atender mais tráfego — precisa que o `state` não
  dependa de memória local do processo (por isso Firestore/Redis, não uma
  variável Python global).
- **Deploy multi-região:** reduz latência pra usuários geograficamente
  distantes e dá resiliência se uma região cair.
- **Disaster recovery:** ter um plano (não só um desejo) pra quando algo
  crítico falhar — backup testado, não só configurado.
- **Otimização de performance:** nesse ponto, geralmente é sobre revisar
  onde o tempo/custo realmente vai (profiling), não sobre reescrever tudo.

## 12.2 Checklist de Produção

Um agente só está pronto pra produção quando todos os itens abaixo estão
verdes — não é opcional pular um:

- ✅ **Observabilidade:** logging, tracing, métricas (Semana 8)
- ✅ **Testes:** unitários, integração, E2E (Semana 9)
- ✅ **Segurança:** nenhum secret no código, IAM configurado corretamente (Semana 10)
- ✅ **Documentação:** README, arquitetura, runbooks
- ✅ **Monitoramento:** alertas, SLOs, dashboards (Semana 8)
- ✅ **Custo:** rastreado, otimizado, dentro do orçamento (Semana 11)

## 12.3 Revisão de Estudos de Caso

Documentar, pra cada projeto: que decisões arquiteturais foram tomadas e
por quê, que trade-offs foram aceitos conscientemente, o que você faria
diferente sabendo o que sabe agora. Isso vira tanto material de portfólio
quanto conhecimento institucional se outra pessoa herdar o projeto.

## 12.4 Prática

- **Status:** ⏳ etapa final — depende de Semanas 8-11 estarem implementadas
  primeiro.
- Refinar: os 4 projetos pra produção
- Testar: testes E2E completos
- Documentar: case studies, docs de arquitetura
- Monitorar: dashboards ao vivo

**🏆 Pronto pra produção** = todo item do checklist 12.2 verde, não "o
código roda sem erro no meu teste manual".

---
