# Semana 10-11: Deploy & Infraestrutura

## Visão Geral

Um notebook rodando na sua máquina não é um produto. Essa semana cobre como
levar os agentes dos 4 projetos pra rodar de forma confiável, segura e
escalável no GCP — a plataforma usada neste curso.

---

## 10.1 Containerização & Orquestração

- **Docker:** empacota o agente + dependências num container reprodutível —
  "funciona no meu Docker" é mais confiável que "funciona na minha máquina".
- **Kubernetes:** só necessário se você precisa de orquestração complexa
  (múltiplos serviços, autoscaling fino); pra a maioria dos agentes deste
  curso, Cloud Run (serverless) é suficiente e mais simples.
- **Container registries:** onde a imagem Docker fica armazenada antes do
  deploy (Artifact Registry no GCP).

## 10.2 Deploy em Nuvem (Foco GCP)

- **Cloud Run:** roda containers sem você gerenciar servidor, escala a zero
  quando não tem tráfego — o ajuste natural pra agentes com uso
  intermitente (não constante).
- **Cloud Tasks:** fila de jobs assíncronos — útil quando o agente processa
  algo que não precisa de resposta imediata (ex.: processar um lote de
  invoices).
- **Firestore:** banco NoSQL gerenciado, bom pra guardar o `state` dos
  agentes (ex.: `CustomerState`) sem gerenciar schema de banco relacional.
- **Cloud Pub/Sub:** streaming de eventos — é o que substituiria o loop de
  "ticks" simulado no notebook do Projeto #3 por dados reais chegando.

## 10.3 Estratégias de Banco de Dados

- **Relacional vs NoSQL:** dados com relações complexas e necessidade de
  transações → relacional (Postgres/Cloud SQL); dados semi-estruturados de
  alto volume → NoSQL (Firestore).
- **Camada de cache (Redis):** guarda resultados frequentes fora do banco
  principal — é onde o cache semântico da Semana 7 realmente viveria em
  produção.
- **Replicação pra alta disponibilidade** e **backup & recovery** — não
  opcional pra qualquer coisa que lida com dado de cliente.

## 10.4 Segurança & Compliance

- **Gestão de API keys (Secret Manager):** nunca hardcode chave no código —
  nem em `.env` commitado (ver `.gitignore` deste repo).
- **Controle de acesso (IAM):** cada serviço só deve ter permissão pro que
  realmente precisa fazer.
- **Criptografia** em trânsito e em repouso — padrão do GCP, mas precisa ser
  verificado, não assumido.
- **Compliance (LGPD/GDPR):** relevante sempre que o agente processa dado
  pessoal (ex.: `customer_id`, email, nos 4 projetos).

## 10.5 Prática

- **Status:** ⏳ pendente — nenhum Dockerfile/Terraform criado ainda.
- **Referência:** [`docs/source-material/08-plano-estudos-gcp.md`](../../docs/source-material/08-plano-estudos-gcp.md)
  tem o plano original de deploy em GCP (Cloud Run, Firestore, Pub/Sub) —
  usar como ponto de partida.
- Deploy: os 4 projetos no Cloud Run
- Infraestrutura: configs Terraform
- Segurança: gestão de secrets
- Monitoramento: dashboards no Cloud Monitoring

**☁️ GCP é natural pra agentes:** serverless (Cloud Run) casa bem com o
padrão de "agente que roda sob demanda", sem precisar manter servidor ligado
o tempo todo.

---
