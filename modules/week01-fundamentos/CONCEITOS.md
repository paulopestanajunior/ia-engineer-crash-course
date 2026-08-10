# Semana 1-2: Fundamentos de LLMs em Produção

## Visão Geral

Antes de construir agentes, você precisa entender o que está por baixo do
capô: como um LLM processa texto, como escrever prompts que geram resultados
confiáveis, e como conversar com a API sem quebrar em produção (rate limits,
custos, erros de rede). Essa semana é a base de tudo que vem depois — os
outros 12 módulos assumem que você domina isso.

---

## 1.1 Arquitetura de LLMs e Como Funcionam

**O que é:** Um LLM (Large Language Model) prevê o próximo token de uma
sequência de texto, um de cada vez, usando uma arquitetura *transformer*.
"Self-attention" é o mecanismo que permite ao modelo pesar a relevância de
cada palavra do input em relação às outras — é isso que dá contexto a uma
frase como "o banco quebrou" (financeiro) vs "sentei no banco" (móvel).

**Por que importa pra quem constrói agentes:** você não precisa implementar
um transformer, mas precisa entender as consequências práticas da
arquitetura:
- **Context window** (ex.: 200k tokens no Claude) é um limite físico — se seu
  agente injeta histórico + RAG + tool results sem controle, estoura.
- **Tokenização** não é 1 palavra = 1 token. Números, código e português com
  acento costumam gastar mais tokens que inglês simples — isso afeta custo.
- **Model selection**: modelos maiores (Sonnet) raciocinam melhor mas custam
  mais e são mais lentos; modelos menores (Haiku) são ótimos pra tarefas
  simples e classificação. O padrão do curso é usar o modelo pequeno como
  "draft" e o grande como "verificador" (ver Week 13, Speculative Decoding).

## 1.2 Fundamentos de Prompt Engineering

**O que é:** a técnica de estruturar o input pro modelo de forma que ele
produza a saída que você quer, de forma consistente.

- **Zero-shot** (só pede) vs **few-shot** (dá exemplos no prompt): few-shot
  quase sempre aumenta a consistência do formato de saída, ao custo de mais
  tokens.
- **Chain-of-Thought (CoT):** pedir pro modelo "pensar antes de responder"
  melhora tarefas que envolvem raciocínio (matemática, lógica, decisões
  multi-critério) — é a base do que os projetos deste curso chamam de
  *extended thinking* (Week 7).
- **System prompt:** define o papel/persona e as regras que valem pra
  conversa inteira — é onde você coloca constraints de negócio (ex.:
  "nunca recomende gastar mais que o budget", que reaparece como
  *Constitutional AI* na Week 13).
- **Temperature:** 0 = determinístico (bom pra extração/classificação), 1 =
  mais criativo/variado (bom pra geração de conteúdo). Agentes de decisão
  quase sempre usam temperature baixa.

## 1.3 Fundamentos de Integração com API

**O que é:** os detalhes operacionais de chamar um LLM em produção, que não
aparecem em tutoriais mas quebram sistemas reais.

- **Rate limiting & retry:** toda API de LLM tem limite de requests/min e de
  tokens/min. Sem retry com backoff exponencial, seu agente cai na primeira
  hora de tráfego alto.
- **Cost tracking:** cada chamada tem custo de input + output tokens. Sem
  rastrear isso por request, você só descobre que estourou o budget no
  fechamento do mês.
- **Error handling:** timeouts, respostas malformadas, e o modelo "recusando"
  a tarefa são erros esperados, não exceções raras — o agente precisa de um
  caminho de fallback pra cada um.
- **Async/await:** chamadas de LLM são I/O-bound (esperando resposta de rede)
  — rodar várias em paralelo com `asyncio` é o que torna Tool Use paralelo
  (Week 4) e Speculative Decoding (Week 13) possíveis.

## 1.4 Prática

- **Notebooks:** os 4 notebooks em `projects/0{1..4}-*/notebook.ipynb` já
  servem de "hello world" — cada um roda ponta a ponta com mocks, sem API key.
  Antes de rodar os notebooks, vale testar uma chamada real e simples à
  Anthropic API pra ver os conceitos acima na prática (rate limit, tokens,
  custo por request).
- **Examples:** Basic ChatBot, Structured output, Error handling
- **Project:** Setup environment for all 4 projects

**📊 Mapping aos Projetos:**
- #1 Churn: Prompt pra análise de churn
- #2 Marketing: Prompt pra campaign analysis
- #3 Performance: Prompt pra player analysis

---
