.PHONY: help setup install test lint format clean

help:
	@echo "IA Engineer Crash Course - Available commands:"
	@echo ""
	@echo "  make setup      - Setup complete environment"
	@echo "  make install    - Install dependencies"
	@echo "  make test       - Run tests"
	@echo "  make lint       - Run linters"
	@echo "  make format     - Format code"
	@echo "  make clean      - Clean cache"

setup:
	python3 -m venv venv
	. venv/bin/activate && pip install -r requirements.txt
	cp .env.example .env
	@echo "✅ Setup complete!"

install:
	pip install -r requirements.txt

test:
	pytest -v

lint:
	flake8 .

format:
	black .

clean:
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name .pytest_cache -exec rm -rf {} + 2>/dev/null || true
