# Semana 3-4: Geração Aumentada por Recuperação (RAG)

## Visão Geral

Um LLM só "sabe" o que estava no seu treino (desatualizado) e o que você
coloca no prompt (limitado pelo context window). RAG é a técnica que busca
informação relevante de uma fonte externa (banco de dados, documentos,
histórico) e injeta no prompt — é assim que o agente responde sobre dados que
não existiam quando o modelo foi treinado.

---

## 3.1 RAG Tradicional (Estático)

**O que é:** o padrão clássico *retriever → reader*: você busca os documentos
mais relevantes pra pergunta, e só depois manda pro LLM gerar a resposta
usando esses documentos como contexto.

- **Vector embeddings & similarity search:** cada documento vira um vetor
  numérico (embedding) que captura seu significado; a busca compara o
  embedding da pergunta com os embeddings dos documentos por distância
  (cosseno, geralmente) e retorna os mais próximos.
- **Chunking strategies:** documentos grandes precisam ser divididos antes de
  virar embeddings — um chunk grande demais dilui o significado, um chunk
  pequeno demais perde contexto. "Sliding window" (chunks sobrepostos) e
  "semantic chunking" (dividir por parágrafo/seção) são as duas estratégias
  mais comuns.
- **Vector DB:** Pinecone (gerenciado, fácil), Weaviate (open source, mais
  features), Chroma (leve, bom pra prototipagem local) — a escolha depende de
  escala e se você quer gerenciar infra ou não.

## 3.2 RAG Avançado (SOTA 2026)

**O que é:** RAG "fixo" (sempre retrieva, sempre os mesmos top-K) desperdiça
custo e às vezes piora a resposta com contexto irrelevante. As técnicas
avançadas resolvem isso:

- **Adaptive RAG:** o agente decide *se* precisa buscar antes de buscar —
  perguntas simples não precisam de retrieval. É o padrão implementado no
  notebook do Projeto #1: só busca clientes similares se o cliente atual já
  mostra sinais de risco.
- **Hybrid search:** combina busca vetorial (semântica) com busca por
  keyword (léxica, tipo BM25) — pega tanto "documentos que significam a
  mesma coisa" quanto "documentos que citam o termo exato".
- **Re-ranking:** depois de buscar os top-N por similaridade bruta, um
  segundo modelo (mais caro, mais preciso) reordena esses N pra achar os
  realmente mais relevantes — troca custo por qualidade só onde importa.
- **Semantic caching:** cacheia resultados de retrieval por *significado*, não
  por hash exato do input — ver Week 7 para o padrão completo.

## 3.3 RAG para Diferentes Tipos de Dados

RAG não é só "buscar em documentos de texto":
- **Structured data (tabelas):** às vezes é melhor gerar uma query SQL do que
  fazer embedding de linhas de tabela.
- **Time-series:** buscar "situações parecidas no passado" (como no Projeto
  #3, histórico de temporadas do jogador) é RAG aplicado a dados temporais,
  normalmente com distância customizada em vez de embeddings de texto.
- **Semi-structured (logs, CSVs):** geralmente vale a pena pré-processar pra
  um formato mais estruturado antes de indexar.

## 3.4 Prática

- **Notebook:** [`projects/01-churn-prediction/notebook.ipynb`](../../projects/01-churn-prediction/notebook.ipynb) —
  seção 3, `retrieve_similar_churned`: RAG adaptativo por distância em
  features numéricas (não embeddings de texto, mas o mesmo princípio).
- **Notebook:** [`projects/02-marketing-campaigns/notebook.ipynb`](../../projects/02-marketing-campaigns/notebook.ipynb) —
  seção 2, cache semântico por bucket de métricas.
- **Project #1:** Retrieve similar churned customers
- **Project #2:** Campaign history retrieval

**💡 Key Insight:** Adaptive RAG evita retrieval desnecessário — no mock do
Projeto #1, só ~40% dos clientes (os com sinais de risco) disparam a busca.

---
