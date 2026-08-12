# Semana 12 — Projeto Final de Customização de LLMs

## Visão Geral

Não é uma semana de conceito novo — é onde você junta o que as Semanas
1-11 ensinaram numa solução completa, aplicada a um problema real seu.

---

## 12.1 Estrutura do projeto

1. **Definição do problema e caso de uso** — que comportamento específico
   você quer customizar, e por quê (o quê o modelo base/API já faz mal
   ou não faz)?
2. **Seleção do modelo-base** (Semana 5.3) — tamanho, licença, se já é
   instruct ou base.
3. **Preparação e validação do dataset** (Semana 4) — real, limpo,
   formatado, com split treino/validação/teste.
4. **Baseline** — meça o modelo *sem* customização primeiro. Sem
   baseline, você não sabe se a customização ajudou.
5. **Escolha da estratégia de customização:**
   - SFT puro (Semana 5) — se o problema é "ensinar um formato/domínio novo"
   - LoRA/QLoRA (Semana 6) — quase sempre a escolha default por custo-benefício
   - Alinhamento (DPO e variantes, Semana 8) — se o problema é "qual entre
     respostas corretas é melhor"
   - RL/GRPO (Semana 9) — se existe uma reward function/verificador
     objetivo pro seu domínio
   - Distillation (Semana 10) — se o objetivo é reduzir custo/latência
     mantendo qualidade de um modelo maior
   - MoE customization (Semana 11) — só se você já parte de uma
     arquitetura MoE existente
6. **Treino** — usando os padrões das semanas anteriores (mesmo que numa
   GPU real, não no `tiny-gpt2`/`SmolLM2` de brinquedo deste curso).
7. **Quantização e otimização de inferência** (Semana 11) — se o alvo é
   produção.
8. **Benchmarks e avaliação** — quantitativa (métricas objetivas) e
   qualitativa (amostras revisadas manualmente), sempre comparando com o
   baseline da etapa 4.
9. **Documentação das decisões técnicas** — por que essa estratégia, que
   trade-offs foram aceitos, o que você faria diferente.
10. **Apresentação dos resultados** — qualidade, latência, memória, custo,
    lado a lado com o baseline.

## 12.2 O que NÃO pular

O erro mais comum em projetos de customização de LLM: pular a etapa 4
(baseline) ou a etapa 8 (avaliação real) e confiar em "parece melhor".
Todas as 11 semanas anteriores mostraram exemplos de métricas que só
fazem sentido *comparadas* a um antes/depois — nunca assuma, meça.

## Lab prático

[`labs/12-projeto-final-template.ipynb`](../../labs/12-projeto-final-template.ipynb) —
não é um exercício com resultado fixo, é um **template funcional**: a
estrutura de código (schema de config, harness de baseline/treino/avaliação)
pronta pra você preencher com o seu problema, seu modelo e seu dataset —
já testada de ponta a ponta com `tiny-gpt2` como placeholder, pra garantir
que a estrutura funciona antes de você trocar pelos componentes reais.
