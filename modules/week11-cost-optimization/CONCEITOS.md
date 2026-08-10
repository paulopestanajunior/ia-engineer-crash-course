# Semana 11: Otimização de Custo

## Visão Geral

Um agente que funciona bem mas custa caro demais não sobrevive em produção.
Essa semana foca em reduzir custo sem sacrificar qualidade — geralmente
através de escolhas arquiteturais (roteamento, cache, batching) mais do que
"escrever prompt menor".

---

## 11.1 Economia de Tokens

- **Input vs output pricing:** tokens de output geralmente custam mais que
  input — respostas mais concisas custam menos, não só input mais enxuto.
- **Prompt caching:** a API da Anthropic permite cachear a parte fixa de um
  prompt (ex.: instruções de sistema longas) e só pagar a diferença nas
  chamadas seguintes — grande economia quando o mesmo contexto é reusado
  muitas vezes.
- **Model selection econômico:** usar o modelo mais barato que resolve a
  tarefa, reservando o modelo caro só pra onde a qualidade extra realmente
  importa (ver Mixture of Experts, Semana 13).
- **Batch vs streaming:** processar em lote costuma ser mais barato que
  streaming individual quando não precisa de resposta em tempo real.

## 11.2 Otimização de Custo do Agente

- **Reduzir tool calls desnecessárias:** cada chamada de tool que não muda o
  resultado final é dinheiro/tempo jogado fora — RAG adaptativo (Semana 3)
  é um exemplo direto disso.
- **Roteamento inteligente (barato vs caro):** o notebook bônus
  [`04-smart-routing.ipynb`](../../projects/bonus-agent-patterns/04-smart-routing.ipynb)
  implementa exatamente isso — roteia cada query pro modelo mais barato
  capaz de resolvê-la.
- **Paralelo vs sequencial:** rodar em paralelo (Semana 4) reduz *latência*,
  não necessariamente *custo* — são otimizações diferentes, às vezes em
  tensão.
- **Cache em todas as camadas:** cache semântico (Semana 7) é a maior
  alavanca de custo quando há repetição nos inputs.

## 11.3 Custos de Infraestrutura

- **Serverless vs containers dedicados:** serverless (Cloud Run) custa por
  uso — ótimo pra tráfego intermitente; containers dedicados fazem sentido
  só com tráfego constante e previsível.
- **Estratégias de scaling:** autoscaling bem configurado evita pagar por
  capacidade ociosa.
- **Otimização de transferência de dados e storage:** custos "escondidos"
  que só aparecem em escala — vale monitorar desde cedo.

## 11.4 Prática

- **Status:** ⏳ pendente pra Projetos #1/#3. O padrão de roteamento por
  custo já existe em
  [`projects/bonus-agent-patterns/04-smart-routing.ipynb`](../../projects/bonus-agent-patterns/04-smart-routing.ipynb)
  (roteia query pro modelo mais barato que resolve) — vale de referência.
- Rastreamento de custo: por projeto, por request
- Otimização: implementar cache, roteamento, batching
- Benchmarks: custo por predição, por recomendação

**💵 Economia típica:** 60-70% com as otimizações certas (cache + roteamento
+ redução de tool calls desnecessárias) combinadas.

---
