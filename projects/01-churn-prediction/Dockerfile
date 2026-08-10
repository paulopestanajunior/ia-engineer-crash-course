# Roda o notebook do Projeto #1 (Churn Prediction) como um job em batch.
#
# Build (a partir da RAIZ do repo, não desta pasta):
#   docker build -f projects/01-churn-prediction/Dockerfile -t churn-prediction .
#
# Run (modo mock, sem custo):
#   docker run --rm churn-prediction
#
# Run (API real da Anthropic):
#   docker run --rm -e ANTHROPIC_API_KEY=sk-ant-... churn-prediction

FROM python:3.11-slim

WORKDIR /app

COPY projects/01-churn-prediction/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY projects/01-churn-prediction/notebook.ipynb .

# Executa o notebook de ponta a ponta e salva o resultado com output atualizado.
# Sem servidor HTTP — este projeto é um job, não uma API (ver Semana 10 pra
# como isso evoluiria pra um serviço real no Cloud Run).
CMD ["jupyter", "nbconvert", "--to", "notebook", "--execute", \
     "--output", "notebook_output.ipynb", "notebook.ipynb"]
