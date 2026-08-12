# Semana 9 — Reinforcement Learning para LLMs: PPO e GRPO

## Visão Geral

DPO (Semana 8) otimiza diretamente a partir de pares de preferência fixos.
RL "de verdade" é mais geral: o modelo gera, recebe uma recompensa (de
qualquer fonte — não só preferência humana, também verificadores
automáticos, Semana 7.8), e aprende a maximizar recompensa esperada. É o
regime que popularizou os "reasoning models" mais recentes.

---

## 9.1 Fundamentos de RL

- **Policy:** a estratégia de decisão — no nosso caso, o próprio LLM
  (dado um estado/prompt, decide qual ação/token tomar).
- **Action:** a escolha feita — gerar um token, ou (numa visão mais alta
  nível) gerar uma resposta completa.
- **Reward:** o sinal numérico de "quão boa" foi a ação/trajetória.
- **Trajectory:** a sequência completa de ações até um resultado final —
  no nosso caso, a resposta completa gerada.

## 9.2 On-policy vs Off-policy

**On-policy:** o modelo aprende a partir de trajetórias que ele mesmo
gerou com a política *atual* (não de dados de terceiros ou de versões
antigas do modelo). PPO e GRPO são on-policy — geram novas respostas a
cada iteração de treino, diferente de SFT/DPO que treinam num dataset
fixo, coletado antes.

## 9.3 Proximal Policy Optimization (PPO)

O algoritmo clássico de RL usado no RLHF original do InstructGPT/ChatGPT.
Ideia central: melhora a política, mas com uma restrição ("proximal") que
impede o modelo de mudar demais de uma vez — mudanças grandes de política
tendem a desestabilizar o treino (Semana 9.14). Precisa de 4 modelos
simultâneos em memória: a política sendo treinada, um modelo de
referência (pra medir o quanto mudou), um Reward Model (Semana 8.3), e um
"value model" (estima recompensa esperada) — computacionalmente caro.

## 9.4 Group Relative Policy Optimization (GRPO)

Simplificação popularizada pelo DeepSeek (2024): elimina o "value model"
separado do PPO. Em vez disso, gera **múltiplas respostas pro mesmo
prompt** (um "grupo"), calcula a recompensa de cada uma, e usa a
**recompensa relativa dentro do grupo** (quanto cada resposta se saiu
comparada à média do grupo) como sinal — mais barato em memória e mais
simples que PPO, mantendo boa parte da eficácia.

## 9.5 Reward functions e verificadores programáticos

Diferente do Reward Model aprendido do RLHF clássico, GRPO costuma usar
**funções de recompensa explícitas e verificáveis** — código que checa se
a resposta está correta (bateu com o resultado matemático certo?), segue
o formato pedido, ou passa em testes automatizados (código). Isso é o que
torna GRPO especialmente forte em domínios com resposta objetivamente
checável (matemática, código) — ver Fase 1, Semana 7.8.

## 9.6 KL divergence e controle de mudança de política

A **KL divergence** mede o quanto a distribuição de probabilidade da
política nova diverge da política de referência (o modelo antes do RL) —
usada como penalidade no treino pra evitar que o modelo "destrua"
capacidades gerais em troca de maximizar a recompensa específica
(catastrophic forgetting, Semana 5.7, aplicado ao contexto de RL).

## 9.7 Advantage estimation e credit assignment

**Advantage:** o quanto uma ação específica foi melhor que a média
esperada naquele estado — o sinal real usado pra ajustar a política (não
a recompensa bruta). **Credit assignment:** o problema de decidir *quais*
tokens/decisões específicas dentro de uma trajetória longa merecem
crédito (ou culpa) pelo resultado final — mais difícil quanto mais longa
a trajetória.

## 9.8 Reward hacking

Um risco central de RL: o modelo encontra uma forma de maximizar a
recompensa medida **sem** realmente atingir o comportamento desejado —
explorando uma falha na função de recompensa (ex.: gerar respostas
artificialmente longas se o reward favorece "detalhamento" sem
normalizar por tamanho — o mesmo viés de comprimento que encontramos na
prática no Lab 8!).

## 9.9 Instabilidade e colapso de treinamento

RL é notoriamente mais instável que SFT/DPO — pequenas mudanças de
hiperparâmetro podem levar a "colapso" (a política degenera, gerando
saídas sem sentido ou repetitivas que, por algum artefato, ainda
recebem recompensa alta). Monitoramento próximo do treino é essencial.

## 9.10 Comparação: PPO vs GRPO vs DPO vs SFT

| | SFT | DPO | PPO | GRPO |
|---|---|---|---|---|
| Precisa de dado rotulado | Sim (resposta certa) | Sim (par de preferência) | Não (reward function) | Não (reward function) |
| On-policy | Não | Não | Sim | Sim |
| Modelos em memória | 1 | 2 (política + referência) | 4 | 2-3 |
| Estabilidade de treino | Alta | Alta | Baixa-média | Média |
| Bom pra domínios verificáveis (matemática, código) | Limitado | Limitado | Sim | Especialmente forte |

## 9.11 GRPO aplicado a matemática, código e reasoning

O caso de uso que popularizou GRPO: gerar N soluções candidatas pra um
problema de matemática/código, verificar automaticamente quais estão
corretas (Semana 7.8), e usar isso como recompensa — sem precisar de
nenhuma anotação humana de preferência, só um verificador programático.

## Lab prático

[`labs/09-grpo-real.ipynb`](../../labs/09-grpo-real.ipynb) — usa o
`GRPOTrainer` real da `TRL` com uma reward function programática (diversidade
de tokens, penalizando repetição degenerada). No caminho, o lab documenta
um problema real de **reward esparsa** encontrado ao testar uma recompensa
binária ingênua — e como resolver.
