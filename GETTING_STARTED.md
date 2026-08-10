# 🚀 Getting Started

Guia passo a passo pra rodar o curso na sua máquina. Se você quer entender
*o que* é o curso antes de instalar algo, leia o [README.md](./README.md)
primeiro — este arquivo é só o "como configurar e rodar".

---

## Pré-requisitos

- **Python 3.11+**
- **Git**
- **Chave da Anthropic API** — opcional. Sem ela, os 4 notebooks principais
  rodam em modo mock (determinístico, sem custo). Com ela, chamam a API de
  verdade. [Pegue uma aqui](https://console.anthropic.com/).
- **~15 minutos** pra setup (a maior parte é baixar o PyTorch, usado só no
  LoRA do Projeto #4).

---

## Setup

```bash
git clone https://github.com/paulopestanajunior/ia-engineer-crash-course
cd ia-engineer-crash-course

python -m venv venv
source venv/bin/activate      # Windows: venv\Scripts\activate

pip install -r requirements.txt

cp .env.example .env
# Edite .env e coloque sua ANTHROPIC_API_KEY (opcional — sem ela, roda em modo mock)
```

## Rodando os notebooks

```bash
jupyter notebook
```

Abra qualquer `projects/0N-*/notebook.ipynb` e rode célula por célula
(`Shift+Enter`). Cada notebook já tem o output real de uma execução
anterior embutido — dá pra ler sem nem rodar, só pra entender o que
acontece.

**Comece por:** [`projects/01-churn-prediction/notebook.ipynb`](./projects/01-churn-prediction/notebook.ipynb)
— é o mais simples dos 4, e a primeira célula de cada notebook imprime
`🔑 Modo: MOCK` ou `🔑 Modo: API REAL`, confirmando se sua chave foi
detectada.

---

## Estrutura do Repositório

```
ia-engineer-crash-course/
├── README.md                 ← visão geral do curso, comece aqui
├── EMENTA.md                 ← índice das 13 semanas
├── GETTING_STARTED.md         ← você está aqui
├── requirements.txt
├── .env.example
│
├── modules/                  ← explicação de cada semana (CONCEITOS.md)
│   ├── week01-fundamentos/
│   ├── week02-saidas-estruturadas/
│   ├── ... (semanas 3-12)
│   └── week13-avancado/
│
├── projects/                 ← 4 projetos principais + 5 bônus
│   ├── 01-churn-prediction/
│   ├── 02-marketing-campaigns/
│   ├── 03-performance-analysis/
│   ├── 04-mmm-optimization/
│   └── bonus-agent-patterns/
│
└── docs/source-material/     ← rascunhos originais de planejamento (numerados)
```

Veja [modules/README.md](./modules/README.md) pra status de cada semana e
[docs/source-material/README.md](./docs/source-material/README.md) pra
entender os documentos de planejamento.

---

## Troubleshooting

**`ModuleNotFoundError: No module named 'anthropic'` (ou `torch`, `peft`, etc.)**
```bash
source venv/bin/activate   # confirme que o venv está ativado
pip install -r requirements.txt
```

**Notebook roda em modo MOCK mesmo com `.env` configurado**

O `.env` não é lido automaticamente pelo Jupyter — exporte a variável no
terminal antes de abrir o Jupyter, ou carregue com `python-dotenv` na
primeira célula:
```python
from dotenv import load_dotenv
load_dotenv()
```

**Download do modelo do Projeto #4 (LoRA) muito lento**

A seção de LoRA baixa um modelo pequeno (`sshleifer/tiny-gpt2`, ~100k
parâmetros) do Hugging Face Hub na primeira execução — precisa de internet.
Depois disso fica em cache local (`~/.cache/huggingface/`).

**`pytest` não encontra testes**

Os testes deste curso são células dentro dos próprios notebooks (rode o
notebook — as células de teste têm um cabeçalho "Testes básicos" e
imprimem `✓ ... passou`), não arquivos `test_*.py` separados ainda.

---

## Próximo Passo

1. Leia [`modules/week01-fundamentos/CONCEITOS.md`](./modules/week01-fundamentos/CONCEITOS.md)
2. Rode [`projects/01-churn-prediction/notebook.ipynb`](./projects/01-churn-prediction/notebook.ipynb) célula por célula
3. Siga a ordem sugerida em [EMENTA.md](./EMENTA.md)

**Bons estudos! 🚀**
