# OpenLLMetry Hub AI Gateway

To set up the OpenLLMetry Hub (the AI Gateway component of the OpenLLMetry ecosystem) for ingestion into Apica Flow, you will leverage its native OpenTelemetry (OTLP) Exporter.

OpenLLMetry Hub acts as an observability-aware proxy that centralizes standardized OTel spans from your LLM traffic, ensuring that all model calls—regardless of the provider—are normalized before reaching Apica.

#### 1. Unified Apica Destination Details

Before configuring the Hub, verify your Apica Ascent OTLP settings:

* Endpoint: `https://<your-ascent-instance>/v1/otel`
* Protocol: `http/protobuf`
* Authorization: `Bearer <Apica-Ingest-Token>`

#### 2. Configuration for OpenLLMetry Hub (Self-Hosted)

The OpenLLMetry Hub is typically deployed as a containerized gateway. You can configure it using environment variables to route its centralized telemetry to Apica Flow.

**Environment Variables (Docker/K8s)**

Add these variables to your deployment to enable the OTLP push:

Bash

```
# Enable the OpenTelemetry Exporter in the Hub
export HUB_OTEL_EXPORTER_ENABLED=true

# Point the Hub's outgoing telemetry to Apica
export OTEL_EXPORTER_OTLP_ENDPOINT="https://<your-ascent-instance>/v1/otel"

# Set the authentication header for Apica
export OTEL_EXPORTER_OTLP_HEADERS="Authorization=Bearer <Apica-Ingest-Token>"

# Set the protocol to Protobuf for high-performance ingestion
export OTEL_EXPORTER_OTLP_PROTOCOL="http/protobuf"

# Resource tagging for Apica dashboards
export OTEL_RESOURCE_ATTRIBUTES="service.name=openllmetry-hub,env=production"
```

#### 3. Usage with the Traceloop SDK

If you are using the Traceloop SDK (the core library behind OpenLLMetry) alongside the Hub, you simply point your application to the Hub's ingress. The Hub then manages the heavy lifting of forwarding to Apica.

Python

```
from traceloop.sdk import Traceloop

Traceloop.init(
    app_name="my-ai-app",
    # Point this to your OpenLLMetry Hub address, NOT Apica directly
    api_endpoint="http://openllmetry-hub:4318", 
    disable_batch=False
)
```

#### 4. Data Processing in Apica Flow

Once the Hub starts forwarding standardized GenAI spans, configure your Apica Flow Pipeline to handle the incoming data:

1. OTLP Source: Listen for the spans on your configured OTLP endpoint.
2. GenAI Transformation: \* Normalization: Since OpenLLMetry Hub uses the latest OTel GenAI Semantic Conventions, your spans will already contain `gen_ai.prompt`, `gen_ai.completion`, and `gen_ai.usage.token` attributes.
   * PII Masking: Use the Apica Redaction Processor to scan `gen_ai.prompt` for sensitive patterns (SSNs, API keys) before they are stored.
3. Cost Enrichment: Use a Script Processor to calculate the real-time cost based on the token usage attributes captured by the Hub.

#### 5. Key Implementation Notes

* Normalized Spans: The primary benefit of the Hub is that it handles provider-specific oddities (OpenAI vs. Anthropic) and sends a consistent schema to Apica. This makes your "Token Burn" and "Model Latency" dashboards in Apica much easier to maintain.
* Privacy: If you wish to exclude the content of the prompts for security reasons but keep the token counts, you can set `HUB_OTEL_TRACE_CONTENT=false` in the Hub's environment variables.
* Batching: For production loads, ensure `HUB_OTEL_BATCH_TIMEOUT` is tuned (e.g., `5s`) to balance between real-time visibility and network efficiency when sending to Apica.

### SQL Query for "Top 5 Most Expensive Models"

In Apica Ascent, identifying the "Top 5 Most Expensive Models" is a straightforward process once your OpenLLMetry Hub data is flowing. Because the Hub adheres to the OpenTelemetry (OTel) GenAI semantic conventions, you can query attributes like `gen_ai.request.model` and token usage with precision.

#### 1. The Cost Attribution Query

The following query aggregates token usage by model and applies a standard pricing multiplier. This identifies which models are driving the highest expenditure across your entire infrastructure.

SQL

```
SELECT 
    resource.attributes['gen_ai.request.model'] as model_name,
    -- Calculation: (Input Tokens * $0.01/1k) + (Output Tokens * $0.03/1k)
    sum(
        (attributes['gen_ai.usage.input_tokens'] * 0.00001) + 
        (attributes['gen_ai.usage.output_tokens'] * 0.00003)
    ) as total_model_spend_usd
FROM traces
WHERE resource.attributes['service.name'] = 'openllmetry-hub'
  AND attributes['gen_ai.usage.input_tokens'] IS NOT NULL
GROUP BY model_name
ORDER BY total_model_spend_usd DESC
LIMIT 5
```

#### 2. Visualization Setup

To maximize the impact of this data on your dashboard, use a Pie Chart or a Horizontal Bar Chart.

* X-Axis (or Label): `model_name`
* Y-Axis (or Value): `total_model_spend_usd`

#### 3. Deep-Dive: Average Cost per Request

If you want to know which model is the most "expensive to run" on average (rather than just the highest total spend), use this variation:

SQL

```
SELECT 
    resource.attributes['gen_ai.request.model'] as model,
    avg(
        (attributes['gen_ai.usage.input_tokens'] * 0.00001) + 
        (attributes['gen_ai.usage.output_tokens'] * 0.00003)
    ) as avg_cost_per_call
FROM traces
GROUP BY model
ORDER BY avg_cost_per_call DESC
```

#### 4. Refining Data with OpenLLMetry Attributes

OpenLLMetry Hub provides specific attributes that allow for even more granular FinOps analysis in your Apica Dashboards:

| **OTel Attribute**      | **Significance**                                                                              |
| ----------------------- | --------------------------------------------------------------------------------------------- |
| `gen_ai.provider.name`  | Allows you to compare spend between Azure OpenAI, Anthropic, and OpenAI.                      |
| `gen_ai.response.model` | Identifies the _actual_ model version used (e.g., `gpt-4o-2024-05-13`) vs. the requested one. |
| `gen_ai.operation.name` | Lets you distinguish costs between `chat` vs. `embeddings` operations.                        |

#### 5. Next Step: Smart Alerts

Using the query above, you can set an Apica Threshold Alert to trigger if any single model's hourly spend increases by more than 50% over its 7-day baseline. This is highly effective at catching "unoptimized prompts" or "recursive agent loops" before they deplete your budget.
