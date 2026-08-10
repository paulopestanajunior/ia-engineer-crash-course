## 📖 WEEK 3-4: Retrieval-Augmented Generation (RAG)

### 3.1 Traditional RAG (Static)
- Retriever-Reader architecture
- Vector embeddings & similarity search
- Chunking strategies (sliding window, semantic)
- Vector DB comparison (Pinecone, Weaviate, Chroma)

### 3.2 Advanced RAG (SOTA 2026)
- Adaptive RAG (decide when to retrieve)
- Hybrid search (vector + keyword)
- Re-ranking (improve relevance)
- Semantic caching (reduce redundant retrievals)
- Graph-based retrieval

### 3.3 RAG for Different Data Types
- Text documents
- Structured data (tables)
- Time-series data
- Semi-structured data (logs, CSVs)

### 3.4 Hands-On
- **Notebook:** [`projects/01-churn-prediction/notebook.ipynb`](../../projects/01-churn-prediction/notebook.ipynb) — seção 3 (`retrieve_similar_churned`, adaptive RAG)
- **Notebook:** [`projects/02-marketing-campaigns/notebook.ipynb`](../../projects/02-marketing-campaigns/notebook.ipynb) — seção 2 (semantic cache)
- **Project #1:** Retrieve similar churned customers
- **Project #2:** Campaign history retrieval

**💡 Key Insight:** Adaptive RAG 10x mais eficiente que RAG fixo

---

