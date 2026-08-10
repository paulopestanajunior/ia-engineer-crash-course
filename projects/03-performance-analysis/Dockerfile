# Roda o notebook do Projeto #3 (Performance Analysis) como um job em batch.
#
# Build (a partir da RAIZ do repo, não desta pasta):
#   docker build -f projects/03-performance-analysis/Dockerfile -t performance-analysis .
#
# Run (modo mock, sem custo):
#   docker run --rm performance-analysis
#
# Run (API real da Anthropic):
#   docker run --rm -e ANTHROPIC_API_KEY=sk-ant-... performance-analysis

FROM python:3.11-slim

WORKDIR /app

COPY projects/03-performance-analysis/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY projects/03-performance-analysis/notebook.ipynb .

CMD ["jupyter", "nbconvert", "--to", "notebook", "--execute", \
     "--output", "notebook_output.ipynb", "notebook.ipynb"]
