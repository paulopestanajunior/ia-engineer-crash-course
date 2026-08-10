# Datasets Reais

Substituem os geradores sintéticos nos 4 notebooks principais. Todos são
dados públicos, reais (não fictícios), com licença que permite uso
educacional.

| Arquivo | Fonte | Licença | Linhas | Usado em |
|---|---|---|---|---|
| `telco_customer_churn.csv` | [IBM Telco Customer Churn](https://github.com/IBM/telco-customer-churn-on-icp4d) | Apache 2.0 | 7.043 clientes reais | Projeto #1 |
| `bank_marketing_campaigns.csv` | [UCI Bank Marketing](https://archive.ics.uci.edu/dataset/222/bank+marketing) (amostra de 10k) | Domínio público, uso em pesquisa/educação com citação (Moro et al., 2014) | 10.000 de 41.188 contatos reais | Projeto #2 |
| `fpl_player_stats_2023-24.csv` | [Fantasy Premier League](https://github.com/vaastav/Fantasy-Premier-League) (vaastav) | MIT | 865 jogadores reais | Projeto #3 |
| `advertising.csv` | [ISLR — An Introduction to Statistical Learning](https://www.statlearning.com/) | Distribuído livremente pelos autores para uso educacional | 200 semanas reais | Projeto #4 |

## Nota sobre o Projeto #2

O plano original do curso descrevia "1000 campanhas digitais fictícias"
(canais search/social/display/email com CTR/CPA). Não existe dataset
público real nesse formato exato — dados de performance de campanha digital
são informação comercial sensível, raramente publicada.

Em vez de forçar um dataset real dentro de um schema fictício, o Projeto #2
foi **honestamente adaptado** pro domínio do dado real disponível: campanhas
de telemarketing bancário (UCI Bank Marketing) — contato por telefone,
sucesso/fracasso da conversão, características do cliente e da campanha.
Os conceitos de arquitetura (RAG, Tool Use, Multi-Agent, LangGraph, Cache
Semântico) são os mesmos; o domínio de negócio mudou de "ads digitais" pra
"telemarketing", que é real.

## Citação

**Bank Marketing:** Moro, S., Cortez, P., & Rita, P. (2014). *A data-driven
approach to predict the success of bank telemarketing.* Decision Support
Systems, 62, 22-31.

## Como os notebooks usam isso

Cada notebook tenta carregar o CSV real primeiro (`pd.read_csv` ou
equivalente); se o arquivo não existir (ex.: você copiou só o notebook, sem
a pasta `datasets/`), cai num gerador sintético pequeno como fallback — o
mesmo padrão de fallback usado pra API real vs mock.
