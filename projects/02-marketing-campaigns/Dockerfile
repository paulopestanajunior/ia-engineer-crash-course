# Roda o notebook do Projeto #2 (Marketing Campaign Analysis) como um job em batch.
#
# Build (a partir da RAIZ do repo, não desta pasta):
#   docker build -f projects/02-marketing-campaigns/Dockerfile -t marketing-campaigns .
#
# Run (modo mock, sem custo):
#   docker run --rm marketing-campaigns
#
# Run (API real da Anthropic):
#   docker run --rm -e ANTHROPIC_API_KEY=sk-ant-... marketing-campaigns

FROM python:3.11-slim

WORKDIR /app

COPY projects/02-marketing-campaigns/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY projects/02-marketing-campaigns/notebook.ipynb .

CMD ["jupyter", "nbconvert", "--to", "notebook", "--execute", \
     "--output", "notebook_output.ipynb", "notebook.ipynb"]
