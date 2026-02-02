# Langfuse - AI Evaluation Engine

To use Langfuse as a downstream AI Evaluation Engine for data processed by Apica Flow, you leverage Langfuse's native OpenTelemetry (OTLP) ingestion capabilities.

Apica Flow acts as the "Observability Pipeline"—scrubbing PII, calculating costs, and normalizing data—before "forking" a high-fidelity copy of the AI traces to Langfuse for evaluation (LLM-as-a-judge, scoring, and versioning).

#### 1. Prerequisites in Langfuse

Before configuring the forwarder in Apica, generate your credentials in the Langfuse dashboard:

1. Navigate to Settings > API Keys.
2. Create a new set of keys and copy the Public Key, Secret Key, and Host URL.
3.  Generate the Auth String: Langfuse uses Basic Authentication. You must encode your keys as a Base64 string in the format `pk-lf-xxx:sk-lf-xxx`.

    > Command: `echo -n "your-public-key:your-secret-key" | base64`

#### 2. Configuration Strategy: The Forwarder

In the Apica Flow (Ascent) UI, you will create a new Export Destination using the OTLP/HTTP protocol.

| **Configuration Field** | **Required Value**                                              |
| ----------------------- | --------------------------------------------------------------- |
| Destination Name        | `Langfuse_Evaluation_Engine`                                    |
| Endpoint                | `https://cloud.langfuse.com/api/public/otel/v1/traces`          |
| Protocol                | `http/protobuf` (Note: Langfuse does not support gRPC for OTel) |
| Auth Header Key         | `Authorization`                                                 |
| Auth Header Value       | `Basic <Your-Base64-Encoded-Auth-String>`                       |

#### 3. Detailed Reference: Metadata Mapping (OTTL)

Langfuse maps standard OTel GenAI attributes automatically. However, to unlock advanced Langfuse features (like grouping by User ID or Session), you should map these specific attributes in your Apica Flow pipeline:

SQL

```
# 1. Map Langfuse-specific attributes
set(attributes["langfuse.user.id"], attributes["enduser.id"])
set(attributes["langfuse.session.id"], attributes["session.id"])
set(attributes["langfuse.tags"], ["production", "apica-forwarded"])

# 2. Ensure GenAI Semantic Conventions are intact
# Langfuse requires these to identify "Generations" (LLM calls)
set(attributes["gen_ai.request.model"], attributes["model_name"])
set(attributes["gen_ai.usage.total_tokens"], attributes["total_tokens"])
```

#### 4. Implementation: The Dual-Sink Flow

The power of this setup is that Apica Flow allows you to send data to multiple "Sinks" simultaneously.

* Sink 1 (Security/SIEM): Receives redacted, low-volume security events.
* Sink 2 (Langfuse): Receives 100% of the raw (or semi-scrubbed) AI traces for evaluation and quality monitoring.

#### 5. Key Implementation Notes

* Batching: Langfuse is optimized for batch ingestion. Ensure the `batch` processor in Apica Flow is enabled with a `timeout` of at least `5s` to minimize the number of HTTP requests to the Langfuse API.
* Region-Specific Endpoints: \* EU: `https://cloud.langfuse.com/api/public/otel/v1/traces`
  * US: `https://us.cloud.langfuse.com/api/public/otel/v1/traces`
* Trace Visibility: Data forwarded via OTLP may take 1–3 minutes to appear in the Langfuse UI as it passes through their internal processing queues.
