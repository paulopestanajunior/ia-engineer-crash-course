# Semana 11 — Mixture of Experts, Quantização e Inferência Eficiente

## Visão Geral

A última semana de técnicas cobre três formas de reduzir custo sem
(necessariamente) sacrificar qualidade: arquiteturas que só "ativam" parte
do modelo por vez (MoE), representar pesos com menos bits (quantização), e
otimizar a mecânica de gerar texto em produção (inferência eficiente).

---

## 11.1 Modelos densos vs MoE

Num modelo **denso** (a arquitetura padrão que vimos desde a Semana 2),
todo parâmetro participa de todo forward pass. Num modelo **MoE**
(Mixture of Experts), a camada feed-forward é substituída por várias
sub-redes ("experts") — mas só um subconjunto pequeno delas processa cada
token. Resultado: o modelo pode ter *muito* mais parâmetros totais sem
aumentar proporcionalmente o custo computacional por token.

## 11.2 Experts, router e gating network

Cada **expert** é uma rede feed-forward independente (estrutura igual à
Semana 2.7, pesos diferentes). O **router** (ou gating network) é uma
pequena rede que, pra cada token, decide quais experts devem processá-lo —
tipicamente escolhendo os **Top-K** experts com maior score do router
(**sparse activation** — só K de N experts "acordam" por token).

## 11.3 Capacidade por expert e load balancing

Se o router mandar tokens demais pra um único expert, esse expert vira
gargalo (capacity overflow) e o resto fica ocioso — desperdiçando o
propósito do MoE. **Load balancing** (geralmente via uma **auxiliary
loss** que penaliza distribuição desigual entre experts durante o treino)
incentiva o router a espalhar carga de forma mais uniforme.

## 11.4 Expert collapse e especialização

**Expert collapse:** um problema onde o router aprende a usar só alguns
experts (ou até um só), tornando os outros inúteis — o auxiliary loss
(11.3) existe em parte pra prevenir isso. Quando o treino vai bem,
diferentes experts tendem a **se especializar** (um em código, outro em
matemática, outro em texto genérico, por exemplo) — emergente do treino,
não programado explicitamente.

## 11.5 Parâmetros totais vs parâmetros ativos

A métrica que importa mudar de comparação num MoE: um modelo pode ter,
por exemplo, 47B parâmetros *totais* mas só ~13B *ativos* por token (só
os experts escolhidos pelo router participam) — o custo de inferência
segue os parâmetros ativos, a capacidade de conhecimento segue (em parte)
os parâmetros totais.

## 11.6 Fine-tuning de MoE: routers, experts e LoRA

Fine-tunar um MoE tem uma decisão a mais que um modelo denso: treinar só
os experts (mantendo o router fixo), só o router (realocar quais experts
são usados, sem mudar o que cada um sabe), ou os dois. LoRA (Semana 6)
pode ser aplicado dentro de cada expert individualmente — mais granular
(e mais complexo) que aplicar num modelo denso.

## 11.7 Quantização: fundamentos

Representar pesos (e/ou ativações) com **menos bits** que o padrão de
treino (normalmente 16/32-bit) — reduz memória e, em muitos casos,
acelera inferência (menos dado pra mover). Sempre envolve alguma perda de
precisão numérica, cuidadosamente gerenciada pra não degradar qualidade
de forma perceptível.

## 11.8 INT8, INT4, e PTQ vs QAT

- **INT8/INT4:** representar pesos como inteiros de 8 ou 4 bits (em vez
  de float de 16/32 bits) — já vimos NF4 (uma variante de INT4) na Semana
  6.5, QLoRA.
- **Post-Training Quantization (PTQ):** quantiza um modelo **já treinado**,
  sem re-treinar — rápido de aplicar, pode perder um pouco de qualidade.
- **Quantization-Aware Training (QAT):** simula os efeitos da quantização
  **durante** o treino, deixando o modelo mais robusto à perda de
  precisão que virá depois — mais caro (precisa treinar), melhor
  qualidade final.

## 11.9 Granularidade e calibração

Quantização pode ser aplicada por tensor inteiro, por canal, ou por grupo
de valores (granularidades diferentes trocam simplicidade por precisão).
**Calibração:** o processo de decidir os parâmetros de quantização (escala,
zero-point) analisando uma amostra representativa de dados — calibração
ruim é uma causa comum de degradação inesperada de qualidade.

## 11.10 KV Cache

Durante geração autoregressiva (Semana 1.5), cada novo token recalcularia
as chaves (K) e valores (V) — Semana 2.2 — de **todos** os tokens
anteriores, do zero, se não fosse pelo **KV cache**: guardar K e V já
calculados e só computar os do token novo. Sem isso, gerar seria muito
mais lento (custo quadrático em vez de aproximadamente linear no
comprimento da sequência).

## 11.11 Batching, continuous batching, latência e throughput

**Batching:** processar múltiplas requisições juntas aproveita melhor o
hardware. **Continuous batching** (usado por servidores de inferência de
produção como vLLM): adiciona/remove requisições do batch dinamicamente
conforme terminam, em vez de esperar o batch inteiro terminar — muito mais
eficiente com requisições de tamanhos variados. **Latência** (tempo até a
resposta) e **throughput** (requisições/segundo no agregado) frequentemente
estão em tensão — otimizar um pode piorar o outro.

## Lab prático

[`labs/11-moe-quantizacao.ipynb`](../../labs/11-moe-quantizacao.ipynb) —
implementa uma camada MoE do zero em PyTorch (router + experts + Top-K
routing), mede a distribuição real de carga entre experts, e demonstra o
ganho de velocidade real do KV cache numa geração longa.
