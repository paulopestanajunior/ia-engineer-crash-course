# Roda o notebook do Projeto #4 (MMM + LoRA) como um job em batch.
#
# Build (a partir da RAIZ do repo, não desta pasta) — mais lento que os
# outros 3 projetos por causa do torch/transformers:
#   docker build -f projects/04-mmm-optimization/Dockerfile -t mmm-optimization .
#
# Run (modo mock pro Claude, mas o LoRA sempre treina de verdade):
#   docker run --rm mmm-optimization
#
# Run (API real da Anthropic pra elasticidade):
#   docker run --rm -e ANTHROPIC_API_KEY=sk-ant-... mmm-optimization
#
# Nota: a seção de LoRA baixa um modelo pequeno do Hugging Face Hub na
# primeira execução — o container precisa de acesso à internet em runtime,
# não só em build time.

FROM python:3.11-slim

WORKDIR /app

COPY projects/04-mmm-optimization/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY projects/04-mmm-optimization/notebook.ipynb .

CMD ["jupyter", "nbconvert", "--to", "notebook", "--execute", \
     "--output", "notebook_output.ipynb", "notebook.ipynb"]
