# AI Evaluation Forwarders

To maximize the value of **Apica Ascent for LLM and AI agent observability**, Apica should focus on building and deploying specific collectors and forwarders that align with the OTel GenAI Semantic Conventions.

These tools are designed to handle the unique challenges of AI telemetry—high-volume payloads (prompts/responses), nondeterministic workflows, and complex cost attribution.

### 1. Data Collectors: Ingesting the AI Stack

Apica should deploy specialized collectors (receivers) that act as "observability-aware proxies" or sidecars for your AI infrastructure.

#### A. The LLM Gateway Collector

Instead of instrumenting every microservice, Apica can utilize an AI Gateway (like _Helicone_ or _OpenLLMetry Hub_) that sits between your code and providers like OpenAI, Anthropic, or Azure.

* Function: Ingests standard OTLP spans and automatically injects GenAI metadata (model version, temperature, system fingerprints).
* Benefit: Instant visibility across 100+ models with a single configuration change.

#### B. Framework-Specific Receivers

Apica should leverage receivers that hook directly into the most popular AI orchestration frameworks:

* LangChain / LangGraph Receiver: Captures internal "thinking" steps, tool calls, and state transitions.
* Vector DB Receiver: Monitors retrievals from Pinecone, Weaviate, or Chroma, tracking `vector.search.score` and `latency`.
* Agentic State Receiver: Specifically designed to capture long-running "sessions" that span multiple independent traces.

### 2. Destination Forwarders: Routing Based on Value

The "Golden Rule" of LLM observability is that not all telemetry is created equal. A simple "Hello World" prompt shouldn't cost as much to monitor as a complex RAG (Retrieval-Augmented Generation) failure.

#### A. The "AI Evaluation" Forwarder

Forward data to specialized Evaluation Engines (like _Langfuse, Braintrust,_ or _Arize Phoenix_).

* Payload: Sends prompt-response pairs + user feedback.
* Purpose: Allows for "LLM-as-a-judge" grading, where another model evaluates the quality, groundedness, and toxicity of the forwarded logs.

#### B. The Compliance & Safety Forwarder

Directs high-risk traffic to security-focused destinations like Microsoft Sentinel or Exabeam.

* Logic: Use Apica Flow to identify patterns like Prompt Injection or PII leakage.
* Action: Routes these specific "Security Spans" to the SIEM for immediate alerting, while the rest of the telemetry goes to standard storage.

#### C. The Cost & FinOps Forwarder

A dedicated stream to cost-management platforms or internal billing systems.

* Metric Mapping: Aggregates token usage (`gen_ai.usage.input_tokens`) and maps it to a dollar value using real-time price tables before forwarding to LogicMonitor or Grafana Cloud.

### 3. Summary of Collector/Forwarder Architecture

| **Signal Type**  | **Preferred Collector**   | **Primary Forwarder Destination**       |
| ---------------- | ------------------------- | --------------------------------------- |
| Simple Inference | OTLP HTTP (Direct)        | Apica InstaStore (Audit & Compliance)   |
| Agentic Chains   | Framework SDK (LangChain) | Honeycomb (High-Cardinality Debugging)  |
| Security/PII     | Apica Flow (Scrubbing)    | Microsoft Sentinel (Threat Detection)   |
| Quality/Evals    | EvalOps / Eval2Otel       | Langfuse / Braintrust (Quality Scoring) |

### 4. Why Use "Apica Flow" as the Middleman?

The most critical "forwarder" is actually Apica Flow itself. It should be used as the central clearinghouse for all AI telemetry to perform three vital functions:

1. Redaction: Scrubbing secrets and PII from prompt/response bodies _before_ they leave your VPC.
2. Flattening: Converting multi-megabyte multimodal inputs (images/audio) into searchable metadata summaries to save storage costs.
3. Sampling: Forwarding 100% of "Hallucination" events while only sampling 1% of successful, low-latency requests.
