# 📚 Plano de Estudos: Arquitetura AI Agents para GCP
## Harness Engineering → Loop Engineering → Graph Engineering

---

## 🎯 FASE 1: Fundamentos (Semanas 1-2)

### Semana 1: Entender as 3 Camadas

#### **1.1 Harness Engineering (The Environment)**
**Objetivo**: Dominar o ambiente de execução do agente

- [ ] Estudar componentes:
  - **Gather Zone**: Coleta contexto (memória, estado, entrada do usuário)
  - **Prompt Zone**: Prepara instrução para LLM
  - **LLM Inference**: Chamadas ao modelo (Cloud Vertex AI no GCP)
  - **Tools**: Execução de ações (fetch, API calls)
  - **Sub-agents**: Especialistas específicos
  - **Verifier**: Validação e testes

- [ ] **Hands-on GCP**:
  ```bash
  # Setup básico Vertex AI
  gcloud services enable aiplatform.googleapis.com
  gcloud services enable run.googleapis.com
  ```
  - Explorar Vertex AI Generative AI Studio
  - Testar chamadas à API do modelo Claude/Gemini
  - Entender rate limits e quotas

- [ ] **Implementar seu primeiro Harness**:
  - Classe Python com gather → process → verify flow
  - Conectar a um modelo LLM (Vertex AI ou Claude API)
  - Adicionar 2-3 ferramentas básicas (web search, calculator)

---

#### **1.2 Loop Engineering (The Feedback Cycle)**
**Objetivo**: Implementar feedback loop confiável

- [ ] Estudar componentes:
  - **Goal + Success Criteria**: Definição clara do sucesso
  - **Harness (Gather → Act → Verify)**: Ciclo de execução
  - **Stopping Rules**: 
    - Max iterations (hard cap)
    - Budget & time (controle de custo)
    - No progress (detecção de loop infinito)
    - Completion check (teste de sucesso)
  - **Final Response**: Resposta formatada

- [ ] **Implementar Loop básico**:
  ```python
  class ReliableLoop:
      def __init__(self, goal, max_iterations=5, timeout_sec=60):
          self.goal = goal
          self.max_iterations = max_iterations
          self.timeout = timeout_sec
          self.iterations = 0
          
      def execute(self):
          while self.iterations < self.max_iterations:
              # Gather: coleta contexto
              # Act: executa ação
              # Verify: valida resultado
              # Check stopping rules
  ```

- [ ] **Testes**:
  - Simular sucesso/falha
  - Testar timeout
  - Validar histórico de iterações

---

#### **1.3 Graph Engineering (Workflow Topology)**
**Objetivo**: Orquestrar fluxos complexos

- [ ] Estudar componentes:
  - **Start**: Entrada
  - **Task**: Unidade de trabalho
  - **Decision**: Branches condicionais
  - **Parallel Tasks**: Execução paralela
  - **Approval**: Gate manual
  - **Merge**: Consolidação de branches
  - **Finish**: Saída

- [ ] **Conceitual**:
  - DAG (Directed Acyclic Graph)
  - Orquestração de dependências
  - Estados e transições

---

### Semana 2: Integração com GCP

#### **2.1 Setup Completo**
- [ ] Criar projeto GCP
- [ ] Ativar serviços:
  - Vertex AI (modelos)
  - Cloud Run (orquestração)
  - Firestore (estado persistente)
  - Cloud Tasks (fila de jobs)
  - Cloud Logging (monitoramento)

#### **2.2 Primeira Arquitetura End-to-End**
```
┌─────────────────────────────────────────────────────────┐
│                    Google Cloud Run                     │
│  ┌──────────────────────────────────────────────────┐   │
│  │  Harness Layer (Python FastAPI)                  │   │
│  │  ├─ Gather (Firestore state)                     │   │
│  │  ├─ LLM Call (Vertex AI)                        │   │
│  │  ├─ Tools (Cloud Functions)                     │   │
│  │  └─ Verify (Custom validators)                  │   │
│  └──────────────────────────────────────────────────┘   │
│  ┌──────────────────────────────────────────────────┐   │
│  │  Loop Layer (Retry logic & Stopping rules)       │   │
│  │  ├─ Max iterations counter                       │   │
│  │  ├─ Budget tracker                               │   │
│  │  ├─ Progress detector                            │   │
│  │  └─ Success criteria validator                   │   │
│  └──────────────────────────────────────────────────┘   │
│  ┌──────────────────────────────────────────────────┐   │
│  │  Graph Layer (Cloud Tasks orchestration)         │   │
│  │  ├─ Task routing                                 │   │
│  │  ├─ Decision branching                           │   │
│  │  ├─ Parallel execution                           │   │
│  │  └─ Approval gates                               │   │
│  └──────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
       ↓
    Firestore (State)
    Cloud Logging (Monitoring)
```

- [ ] Deploy app básica no Cloud Run
- [ ] Implementar persistência no Firestore
- [ ] Configurar logging estruturado

---

## 🛠️ FASE 2: Implementação Hands-On (Semanas 3-5)

### Semana 3: Build Harness Completo

#### **3.1 Componentes**

**A. Gather Zone**
```python
class GatherZone:
    """Coleta contexto para o LLM"""
    def __init__(self, firestore_client):
        self.db = firestore_client
    
    def gather(self, user_id: str, task_id: str):
        # Recupera: estado anterior, histórico, memória
        state = self.db.collection('agent_state').document(user_id).get()
        history = self.db.collection('task_history').document(task_id).get()
        return {
            'state': state.to_dict(),
            'history': history.to_dict(),
            'timestamp': time.time()
        }
```

- [ ] **Tarefas**:
  - Implementar Gather zone com Firestore
  - Criar schema de estado
  - Implementar versionamento de histórico

**B. LLM Inference**
```python
from vertexai.generative_models import GenerativeModel

class LLMInference:
    def __init__(self, model_name="gemini-1.5-flash"):
        self.model = GenerativeModel(model_name)
    
    def call(self, prompt: str, system_prompt: str = None):
        response = self.model.generate_content([
            {"text": system_prompt or ""},
            {"text": prompt}
        ])
        return response.text
```

- [ ] **Tarefas**:
  - Configurar Vertex AI credentials
  - Testar diferentes modelos
  - Implementar retry logic
  - Monitorar custos

**C. Tools & Sub-agents**
```python
class ToolExecutor:
    def __init__(self):
        self.tools = {
            'web_search': self.web_search,
            'math_calculate': self.calculate,
            'fetch_data': self.fetch_api,
        }
    
    def execute(self, tool_name: str, params: dict):
        if tool_name not in self.tools:
            raise ValueError(f"Tool {tool_name} not found")
        return self.tools[tool_name](**params)
    
    async def web_search(self, query: str):
        # Implementar com SerpAPI ou similar
        pass
    
    async def calculate(self, expression: str):
        # Validar e executar expressão matemática
        pass
    
    async def fetch_api(self, url: str):
        # Fetch com timeout e retry
        pass
```

- [ ] **Tarefas**:
  - Integrar 5-10 ferramentas úteis
  - Implementar timeout e rate limiting
  - Adicionar logging de execução

**D. Verifier**
```python
class Verifier:
    """Valida saídas antes de prosseguir"""
    
    def verify(self, output: str, criteria: dict) -> tuple[bool, str]:
        """
        Retorna (is_valid, reason)
        """
        checks = [
            self.check_format(output, criteria.get('format')),
            self.check_content(output, criteria.get('required_fields')),
            self.check_safety(output),
        ]
        
        all_valid = all(check[0] for check in checks)
        reasons = [check[1] for check in checks if not check[0]]
        
        return all_valid, "; ".join(reasons)
    
    def check_format(self, output: str, format_spec: str) -> tuple[bool, str]:
        # JSON, Markdown, Plain text, etc.
        pass
    
    def check_content(self, output: str, required_fields: list) -> tuple[bool, str]:
        # Validar presença de campos obrigatórios
        pass
    
    def check_safety(self, output: str) -> tuple[bool, str]:
        # Detectar conteúdo perigoso
        pass
```

- [ ] **Tarefas**:
  - Criar validators reutilizáveis
  - Testes com prompts adversariais
  - Integrar content moderation

---

### Semana 4: Build Loop Completo

#### **4.1 Implementar Reliable Loop**

```python
class ReliableLoop:
    def __init__(self, harness: HarnessLayer, config: dict):
        self.harness = harness
        self.goal = config['goal']
        self.success_criteria = config['success_criteria']
        self.max_iterations = config.get('max_iterations', 5)
        self.budget_tokens = config.get('budget_tokens', 10000)
        self.timeout_sec = config.get('timeout_sec', 300)
        
        self.iteration_count = 0
        self.tokens_used = 0
        self.start_time = None
    
    async def execute(self) -> dict:
        """Executa loop com todas as garantias"""
        self.start_time = time.time()
        
        while True:
            # 1. Check stopping rules (ANTES de executar)
            stopping_reason = self._check_stopping_rules()
            if stopping_reason:
                return {
                    'status': 'stopped',
                    'reason': stopping_reason,
                    'iterations': self.iteration_count,
                    'tokens_used': self.tokens_used
                }
            
            # 2. Execute harness
            try:
                result = await self.harness.execute({
                    'goal': self.goal,
                    'iteration': self.iteration_count,
                    'history': self.history
                })
            except Exception as e:
                logger.error(f"Harness execution failed: {e}")
                continue
            
            # 3. Verify
            is_valid, reason = self.harness.verify(result)
            if not is_valid:
                logger.warning(f"Verification failed: {reason}")
                self.iteration_count += 1
                continue
            
            # 4. Check success criteria
            if self._check_success(result):
                return {
                    'status': 'success',
                    'result': result,
                    'iterations': self.iteration_count,
                    'tokens_used': self.tokens_used
                }
            
            self.iteration_count += 1
    
    def _check_stopping_rules(self) -> str | None:
        """Retorna motivo de parada ou None para continuar"""
        
        # Max iterations
        if self.iteration_count >= self.max_iterations:
            return f"Max iterations reached: {self.max_iterations}"
        
        # Budget
        if self.tokens_used >= self.budget_tokens:
            return f"Token budget exceeded: {self.tokens_used}/{self.budget_tokens}"
        
        # Timeout
        if time.time() - self.start_time > self.timeout_sec:
            return f"Timeout exceeded: {self.timeout_sec}s"
        
        # Progress check (sem progresso por N iterações)
        if self._detect_no_progress():
            return "No progress detected"
        
        return None
    
    def _detect_no_progress(self) -> bool:
        """Detecta se não houve progresso nas últimas N iterações"""
        if len(self.history) < 3:
            return False
        
        # Comparar últimas 3 iterações
        last_3 = self.history[-3:]
        if all(item['status'] == 'failed' for item in last_3):
            return True
        
        return False
    
    def _check_success(self, result: dict) -> bool:
        """Valida contra success criteria"""
        for criterion in self.success_criteria:
            if not self._evaluate_criterion(result, criterion):
                return False
        return True
    
    def _evaluate_criterion(self, result: dict, criterion: dict) -> bool:
        # Implementar lógica de validação específica
        pass
```

- [ ] **Tarefas**:
  - Implementar todos os stopping rules
  - Testes com diferentes cenários (sucesso, falha, timeout)
  - Logging detalhado de cada iteração
  - Dashboard de monitoramento

---

### Semana 5: Build Graph & Orquestração

#### **5.1 Graph Executor**

```python
class GraphExecutor:
    """Orquestra múltiplos loops em DAG"""
    
    def __init__(self, graph_config: dict):
        self.graph = graph_config  # { 'nodes': [...], 'edges': [...] }
        self.state = {}
        self.results = {}
    
    async def execute(self, start_node: str):
        """Executa grafo topologicamente"""
        visited = set()
        queue = [start_node]
        
        while queue:
            node_id = queue.pop(0)
            if node_id in visited:
                continue
            
            node = self._get_node(node_id)
            
            # Executar node
            if node['type'] == 'task':
                result = await self._execute_task(node)
                self.results[node_id] = result
            
            elif node['type'] == 'decision':
                next_node = self._evaluate_decision(node)
                self.state[node_id] = next_node
            
            elif node['type'] == 'parallel':
                tasks = [self._execute_task(n) for n in node['tasks']]
                self.results[node_id] = await asyncio.gather(*tasks)
            
            elif node['type'] == 'approval':
                # Aguardar aprovação humana
                result = await self._wait_approval(node)
                self.results[node_id] = result
            
            visited.add(node_id)
            
            # Adicionar próximos nodes
            next_nodes = self._get_next_nodes(node_id)
            queue.extend([n for n in next_nodes if n not in visited])
        
        return self.results
    
    async def _execute_task(self, node: dict):
        """Executa task (pode conter um Loop)"""
        loop = ReliableLoop(harness, node['loop_config'])
        return await loop.execute()
    
    def _get_next_nodes(self, node_id: str) -> list:
        """Retorna nodes seguintes no grafo"""
        edges = [e for e in self.graph['edges'] if e['from'] == node_id]
        return [e['to'] for e in edges]
```

- [ ] **Tarefas**:
  - Modelar fluxo como grafo
  - Implementar decisões condicionais
  - Testes com paralelização
  - Visualizar grafo (GraphViz ou similar)

---

## 📊 FASE 3: Testes & Produção (Semanas 6-8)

### Semana 6: Testes Completos

#### **6.1 Unit Tests**
```python
import pytest

@pytest.mark.asyncio
async def test_loop_max_iterations():
    """Loop deve parar ao atingir max_iterations"""
    config = {'max_iterations': 3, 'goal': 'test'}
    loop = ReliableLoop(mock_harness, config)
    result = await loop.execute()
    assert result['iterations'] == 3
    assert result['reason'] == "Max iterations reached"

@pytest.mark.asyncio
async def test_loop_success():
    """Loop deve terminar ao atingir sucesso"""
    config = {
        'max_iterations': 10,
        'goal': 'test',
        'success_criteria': [{'field': 'status', 'equals': 'success'}]
    }
    # Mock harness que retorna sucesso na 2ª iteração
    loop = ReliableLoop(mock_success_harness, config)
    result = await loop.execute()
    assert result['status'] == 'success'
    assert result['iterations'] == 2

@pytest.mark.asyncio
async def test_harness_verify_fails():
    """Harness deve retry se verifier falhar"""
    harness = HarnessLayer(mock_llm, mock_tools)
    result = await harness.execute()
    is_valid, reason = harness.verify(result)
    assert is_valid == True
```

- [ ] **Tarefas**:
  - Escrever 20+ testes
  - Coverage mínimo 80%
  - Testes de carga
  - Testes com edge cases

#### **6.2 Integration Tests**
```python
@pytest.mark.integration
async def test_end_to_end_agent():
    """Teste completo: Harness + Loop + Graph"""
    graph_config = {
        'nodes': [...],
        'edges': [...]
    }
    executor = GraphExecutor(graph_config)
    results = await executor.execute('start')
    
    assert results['finish']['status'] in ['success', 'stopped']
```

- [ ] **Tarefas**:
  - Setup Firestore emulador
  - Mock Vertex AI
  - Testes end-to-end
  - Stress tests

---

### Semana 7: Monitoramento & Observabilidade

#### **7.1 Logging Estruturado**
```python
import logging
from google.cloud import logging as cloud_logging

# Setup Cloud Logging
logging_client = cloud_logging.Client()
logging_client.setup_logging()

logger = logging.getLogger(__name__)

# Log estruturado
logger.info("Loop iteration", extra={
    'labels': {
        'iteration': 5,
        'tokens_used': 2341,
        'elapsed_sec': 45.2,
        'goal': 'research_topic'
    }
})
```

- [ ] **Tarefas**:
  - Implementar structured logging
  - Criar dashboards Cloud Monitoring
  - Alertas para falhas
  - Rastreamento distribuído

#### **7.2 Métricas Importantes**
```
- iterations_per_task (histograma)
- tokens_used_per_task (histograma)
- success_rate (%)
- avg_time_per_iteration (segundos)
- stopping_reason_distribution (categorias)
- verification_failure_rate (%)
- tool_execution_time (por ferramenta)
```

---

### Semana 8: Deploy Produção

#### **8.1 Containerização**
```dockerfile
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
ENV PORT=8080
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
```

- [ ] **Tarefas**:
  - Build imagem Docker
  - Push para Artifact Registry
  - Testes de imagem

#### **8.2 Deploy Cloud Run**
```bash
# Build e deploy
gcloud run deploy ai-agent \
  --source . \
  --platform managed \
  --region us-central1 \
  --memory 2Gi \
  --timeout 300 \
  --set-env-vars PROJECT_ID=seu-projeto \
  --allow-unauthenticated

# Auto-scaling
gcloud run services update-traffic ai-agent --to-revisions LATEST=100
```

- [ ] **Tarefas**:
  - Configurar Cloud Run
  - Setup auto-scaling
  - Configurar alertas
  - Load testing

---

## 🚨 FASE 4: Diagnóstico (Semana 9)

Referência do diagrama: "Diagnose by Failure"

### **Harness Issues** 🔨
| Problema | Sintoma | Solução |
|----------|---------|---------|
| Tools faltando | Agent não consegue executar ação | Adicionar ferramenta/API |
| Permissões erradas | Erro 403 em API calls | Revisar IAM roles |
| Memória pobre | Contexto incompleto | Expandir gather zone |
| Context drift | Informações inconsistentes | Adicionar validation |

**Testes**:
- [ ] Mock tool failures
- [ ] Test com permissions insuficientes
- [ ] Test context corruption

### **Loop Issues** 🔄
| Problema | Sintoma | Solução |
|----------|---------|---------|
| Repetição infinita | Mesma ação em loop | Melhorar success criteria |
| Drift | Sai do objetivo | Reforçar verificação |
| Bad evaluations | Aceita respostas ruins | Tighten verifier |
| Sem feedback | Não aprende de erros | Adicionar logging de erros |

**Testes**:
- [ ] Teste loop infinito
- [ ] Teste com verifier fraco
- [ ] Teste sem progresso

### **Graph Issues** 📊
| Problema | Sintoma | Solução |
|----------|---------|---------|
| Ordem errada | Tasks em sequência indevida | Revisar DAG |
| Branching quebrado | Branches não executa | Revisar condições |
| Join issues | Deadlock em merge | Timeout em parallelization |
| Falta paralelização | Lento | Adicionar parallel tasks |

**Testes**:
- [ ] Teste decisões
- [ ] Teste paralelização
- [ ] Teste merge de branches

---

## 📝 Checklist de Implementação

### ✅ Harness Layer
- [ ] Gather zone com Firestore
- [ ] LLM inference com Vertex AI
- [ ] 10+ ferramentas integradas
- [ ] Verifier com múltiplos checks
- [ ] Logging completo

### ✅ Loop Layer
- [ ] Max iterations stopping rule
- [ ] Budget stopping rule
- [ ] Timeout stopping rule
- [ ] Progress detection
- [ ] Success criteria validation

### ✅ Graph Layer
- [ ] DAG parser
- [ ] Task executor
- [ ] Decision router
- [ ] Parallel task executor
- [ ] Approval gate

### ✅ GCP Integration
- [ ] Vertex AI setup
- [ ] Firestore schema
- [ ] Cloud Run deployment
- [ ] Cloud Logging
- [ ] Monitoring dashboard

### ✅ Testing
- [ ] 50+ unit tests
- [ ] Integration tests
- [ ] Load tests
- [ ] Failure scenario tests

### ✅ Production Ready
- [ ] Docker container
- [ ] Cloud Run deployed
- [ ] Auto-scaling configured
- [ ] Monitoring alerts
- [ ] Disaster recovery plan

---

## 🎓 Recursos Recomendados

1. **Documentação GCP**:
   - https://cloud.google.com/vertex-ai/docs
   - https://cloud.google.com/run/docs
   - https://cloud.google.com/firestore/docs

2. **Bibliotecas Python**:
   - `vertexai` - Google Vertex AI SDK
   - `google-cloud-firestore` - Firestore client
   - `google-cloud-tasks` - Cloud Tasks
   - `pydantic` - Data validation
   - `tenacity` - Retry logic

3. **Papers & Blogs**:
   - "Reliable AI Agents" (REDIT framework)
   - Prompt engineering best practices
   - Cost optimization em LLMs

---

## 🏁 Timeline Estimado

- **Semanas 1-2**: Conceitos + Setup = Fundamentação sólida
- **Semanas 3-5**: Implementação dos 3 layers = Sistema funcional
- **Semanas 6-8**: Testes + Deploy = Produção
- **Semana 9**: Diagnóstico + Tuning = Operacional

**Total: ~9-10 semanas** de estudo dedicado

---

## 💡 Dicas Importantes

1. **Comece simples**: Uma ferramenta, um loop, um task
2. **Teste frequentemente**: Não deixe tudo pro final
3. **Documente tudo**: Código + decisões arquiteturais
4. **Monitore desde dia 1**: Logs são seus melhores amigos
5. **Prepare-se para falhas**: Toda agent vai falhar em produção

---

**Criado com base em**: Arquitetura de Reliable AI Agents (Harness + Loop + Graph Engineering)
**Autor Referência**: @rakeshgohel01
**Data**: Agosto 2026
