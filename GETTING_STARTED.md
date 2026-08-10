# 🚀 Getting Started - IA Engineer Crash Course

Bem-vindo! Este guia vai te ajudar a configurar o ambiente e começar o curso.

---

## 📋 Pré-requisitos

- **Python:** 3.11+
- **Git:** Pra clonar o repositório
- **GCP Account:** (Opcional, mas recomendado pra Week 10+)
- **Claude API Key:** [Get here](https://console.anthropic.com/)
- **2-3 horas** para setup inicial

---

## 🔧 Setup em 5 Passos

### **Passo 1: Clone o Repositório**

```bash
git clone https://github.com/paulopestanajunior/ia-engineer-crash-course
cd ia-engineer-crash-course
```

### **Passo 2: Create Python Virtual Environment**

```bash
# Create venv
python3 -m venv venv

# Activate
# On macOS/Linux:
source venv/bin/activate

# On Windows:
venv\Scripts\activate
```

### **Passo 3: Install Dependencies**

```bash
pip install -r requirements.txt
```

**Nota:** Se encontrar problemas com versões, edite `requirements.txt` para versões mais recentes.

### **Passo 4: Configure Environment Variables**

```bash
# Copy example to .env
cp .env.example .env

# Edit .env with your keys
nano .env  # ou use seu editor favorito
```

**Required variables:**
```env
# Claude API
ANTHROPIC_API_KEY=your_key_here

# GCP (para Week 10+)
GCP_PROJECT_ID=your-project-id
GCP_CREDENTIALS_PATH=/path/to/credentials.json

# Optional
OPENAI_API_KEY=your_key_here  # Se quiser usar GPT-4o

```

### **Passo 5: Verify Installation**

```bash
# Test Claude API
cd modules/week01-fundamentos
python colab_hello_world.py
```

**Expected output:**
```
✅ Claude API is working!
Your model: claude-3-5-sonnet-20241022
```

---

## 📁 Estrutura do Repositório

Após clone, você terá:

```
ia-engineer-crash-course/
├── README.md           ← Start here!
├── EMENTA.md          ← Curriculum
├── GETTING_STARTED.md ← You are here
├── requirements.txt
├── .env.example
├── .gitignore
│
├── modules/           ← Conceitos explicativos
│   ├── week01-fundamentos/
│   ├── week02-structured-outputs/
│   ├── ... (weeks 3-12)
│   └── week13-advanced/
│
├── projects/          ← 4 Projetos educacionais
│   ├── 01-churn-prediction/
│   ├── 02-marketing-campaigns/
│   ├── 03-performance-analysis/
│   └── 04-mmm-optimization/
│
├── datasets/          ← Dados fictícios
│   ├── customers/
│   ├── campaigns/
│   ├── players/
│   └── marketing/
│
├── shared/            ← Código compartilhado
│   ├── common/
│   └── utils/
│
├── deploy/            ← Infrastructure
│   ├── docker/
│   └── terraform/
│
└── monitoring/        ← Observability
    ├── dashboards/
    └── alerts/
```

---

## ✅ Primeira Execução

### **Week 1: Fundamentos**

```bash
# Navegue para week 1
cd modules/week01-fundamentos

# Execute o exemplo Hello World
python colab_hello_world.py

# Veja o output esperado
# Output: 
#   ✅ Claude API Working
#   Model: claude-3-5-sonnet-20241022
#   Greeting: Hello Paulo! ...
```

---

## 🧠 Entendendo a Estrutura

### **Módulos (modules/)**

Cada semana tem:
- `CONCEITOS.md` - Explicações teóricas
- `colab_*.py` - Código prático rodável
- `examples/` - Exemplos adicionais

**Exemplo Week 1:**
```
modules/week01-fundamentos/
├── CONCEITOS.md
├── colab_hello_world.py
├── colab_prompt_engineering.py
├── colab_api_integration.py
└── examples/
    ├── chatbot_simple.py
    ├── error_handling.py
    └── cost_tracking.py
```

### **Projetos (projects/)**

Cada projeto tem:
- `README.md` - Descrição + objetivos
- `src/` - Código fonte
- `data/` - Dataset
- `tests/` - Testes
- `deploy/` - Dockerfile + terraform

**Exemplo Projeto #1:**
```
projects/01-churn-prediction/
├── README.md
├── src/
│   ├── agent.py
│   ├── graph.py
│   ├── tools.py
│   └── evaluator.py
├── data/
│   ├── customers.csv
│   └── README.md
├── tests/
│   ├── test_agent.py
│   └── test_tools.py
├── deploy/
│   ├── Dockerfile
│   └── terraform.tf
└── requirements.txt
```

### **Datasets (datasets/)**

Dados fictícios mas realistas:
- `customers/` - 10k clientes (churn prediction)
- `campaigns/` - 1000 campanhas (marketing analysis)
- `players/` - 500 jogadores (performance analysis)
- `marketing/` - 100 weeks histórico (MMM)

---

## 🎯 Plano de Estudos Recomendado

### **Semana 1 (Você está aqui!)**
- [ ] Setup ambiente completo
- [ ] Ler README.md e EMENTA.md
- [ ] Execute `colab_hello_world.py`
- [ ] Leia `modules/week01-fundamentos/CONCEITOS.md`
- [ ] Execute todos os Colabs da Week 1

### **Semana 2**
- [ ] Conceito: Structured Outputs
- [ ] Execute `modules/week02-structured-outputs/colab_pydantic.py`
- [ ] Inicie Projeto #1: Churn Prediction
- [ ] Setup ambiente do Projeto #1

### **Semana 3-4**
- [ ] RAG concepts
- [ ] Vector DB setup
- [ ] Integre RAG no Projeto #1

**... Continue assim por 13 semanas!**

---

## 🐛 Troubleshooting

### **Erro: `ModuleNotFoundError: No module named 'anthropic'`**

```bash
# Certifique-se que o venv está ativado
source venv/bin/activate

# Reinstale dependencies
pip install -r requirements.txt
```

### **Erro: `ANTHROPIC_API_KEY not found`**

```bash
# Verifique se .env existe
cat .env

# Se não existir, crie:
cp .env.example .env
nano .env  # Add your API key
```

### **Erro: `google-cloud-firestore requires authentication`**

Até Week 10 você não precisa. Mas se quiser testar cedo:

```bash
# Setup GCP authentication
gcloud auth login
gcloud config set project YOUR_PROJECT_ID
```

### **Erro: `Port 8080 already in use`**

Se running Cloud Run locally:
```bash
PORT=8081 python your_app.py
```

### **Conexão lenta / Timeout**

```bash
# Verifique sua conexão internet
ping google.com

# Se ainda lento, aumente timeout
export ANTHROPIC_TIMEOUT=60
```

---

## 📚 Recursos Úteis

### **Documentação Oficial**
- [Anthropic Claude API](https://docs.anthropic.com/)
- [LangChain](https://python.langchain.com/)
- [LangGraph](https://langchain-ai.github.io/langgraph/)
- [GCP Cloud Run](https://cloud.google.com/run/docs)

### **Community**
- Anthropic Discord (join no site)
- GitHub Discussions (issues no repo)
- LangChain Community Forum

### **Learning Resources**
- Deep Learning Fundamentals (3Blue1Brown)
- Attention is All You Need (Transformer paper)
- Prompt Engineering Guide (OpenAI)

---

## 🚀 Quick Commands

```bash
# Ativar venv
source venv/bin/activate

# Instalar packages
pip install -r requirements.txt

# Run Week 1 example
cd modules/week01-fundamentos && python colab_hello_world.py

# Run tests
pytest projects/01-churn-prediction/tests/

# Format code
black .

# Run linter
flake8 .

# Type checking
mypy .

# Deploy (after Week 10)
cd projects/01-churn-prediction && make deploy
```

---

## ✅ Setup Checklist

- [ ] Python 3.11+ installed
- [ ] Repository cloned
- [ ] Virtual environment created & activated
- [ ] Requirements installed
- [ ] `.env` file created with API keys
- [ ] `colab_hello_world.py` runs successfully
- [ ] Understand repository structure
- [ ] Read README.md and EMENTA.md

---

## 🎓 Próximo Passo

Após completar setup:

1. **Leia:** `modules/week01-fundamentos/CONCEITOS.md`
2. **Execute:** `colab_hello_world.py`
3. **Experimente:** Modifique o código, teste coisas
4. **Comece:** Week 1 de estudos!

---

## 💬 Perguntas?

- Check [README.md](./README.md) primeiro
- See [EMENTA.md](./EMENTA.md) pra curriculum
- Look for existing issues no GitHub
- Abra uma nova issue se problema novo

---

**Pronto pra começar? 🚀**

```bash
cd modules/week01-fundamentos
python colab_hello_world.py
```

**Let's go! 🎓**

