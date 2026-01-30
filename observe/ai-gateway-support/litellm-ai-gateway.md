# LiteLLM AI Gateway

To set up the LiteLLM AI Gateway for data ingestion into Apica Flow, you will utilize LiteLLM's built-in OpenTelemetry (OTel) callback system. This allows you to capture LLM-specific telemetry—like token usage, latency, and prompt/response metadata—and stream it directly to Apica for real-time processing and storage.

### 1. Prerequisites

Ensure your environment meets these requirements:

* LiteLLM Version: 1.76.3 or higher.
*   OpenTelemetry Packages: Install the necessary Python exporters:

    Bash

    ```
    pip install opentelemetry-api opentelemetry-sdk opentelemetry-exporter-otlp
    ```
* Apica Details: You will need your Apica Ingestion Token and your Ascent OTLP Endpoint (e.g., `https://<your-ascent-instance>/v1/otel`).

### 2. Configuration: Enabling the OTel Callback

LiteLLM can be configured via a `config.yaml` file (for the Proxy) or via Python environment variables (for the SDK).

#### Option A: LiteLLM Proxy (`config.yaml`)

Add the `otel` callback to your `litellm_settings` section:

YAML

```
model_list:
  - model_name: gpt-4o
    litellm_params:
      model: openai/gpt-4o
      api_key: "os.environ/OPENAI_API_KEY"

litellm_settings:
  callbacks: ["otel"] # Enables OTel spans and metrics
```

#### Option B: Python Environment Variables

To route the data to Apica, set the standard OTel exporter variables before starting LiteLLM:

Bash

```
# Point to your Apica Ascent instance
export OTEL_EXPORTER_OTLP_ENDPOINT="https://<your-ascent-instance>/v1/otel"

# Attach your Apica Ingest Token for authentication
export OTEL_EXPORTER_OTLP_HEADERS="Authorization=Bearer <Apica-Ingest-Token>"

# Optional: Identify your service in Apica dashboards
export OTEL_SERVICE_NAME="litellm-production-gateway"
export OTEL_RESOURCE_ATTRIBUTES="deployment.environment=prod,team=ai-ops"

# Set the protocol (Apica supports http/protobuf for high performance)
export OTEL_EXPORTER_OTLP_PROTOCOL="http/protobuf"
```

### 3. Advanced: Capturing Full Prompts & Responses

By default, some gateways only send metrics. To ensure Apica captures the full "semantic" content (the actual prompts and completions), ensure the following is true in your LiteLLM setup:

* `LITELLM_LOG="DEBUG"`: Enabling debug logging ensures the callback has access to the full payload.
* Logging Payload: LiteLLM's OTel integration automatically maps prompt/response data to standard attributes like `gen_ai.prompt` and `gen_ai.response`.

### 4. Setting Up the Pipeline in Apica Flow

Once data starts flowing from LiteLLM, you must configure Apica Flow to process it:

1. Ingestion: Create a new Source using the OpenTelemetry Ingest type.
2. PII Redaction: Use an Apica Flow Regex Processor to scrub sensitive data from the `gen_ai.prompt` field before it's indexed.
3. Cost Enrichment: Use a Script Processor to calculate the USD cost:
   * _Logic:_ `(input_tokens * model_input_rate) + (output_tokens * model_output_rate)`.
4. Routing: \* Route Anomalies (High latency/4xx errors) to your SIEM (e.g., LogRhythm or Sentinel).
   * Route All Logs to Apica InstaStore for cost-effective, long-term audit compliance.

### 5. Troubleshooting

* Verify Connectivity: Run `curl -X POST https://<your-ascent-instance>/v1/otel -H "Authorization: Bearer <token>"` to ensure the endpoint is reachable from your LiteLLM host.
* Check Startup Logs: When running LiteLLM, look for `success_callback: ['otel']` in the initialization logs to confirm the plugin is active.
* Batching: If you experience data loss, increase the `OTEL_BSP_MAX_QUEUE_SIZE` (default 2048) in your environment variables to handle higher LLM traffic spikes.

## SQL query to visualize the Latency vs. Token Count

In Apica Ascent, visualizing the relationship between Latency and Token Count is critical for identifying "token bloat" (where models become slower and more expensive as response length increases) and for benchmarking different LLM providers.

To create this visualization, you will use the LogQL/SQL interface within the Apica Ascent dashboard. These queries rely on the OpenTelemetry (OTel) GenAI Semantic Conventions that your LiteLLM or Bifrost gateway is sending.

#### 1. Latency vs. Token Count Scatter Plot

This query allows you to see if your latency is scaling linearly with token usage. In a healthy system, output tokens usually drive latency more than input tokens.

SQL

```
SELECT 
    attributes['gen_ai.usage.total_tokens'] as total_tokens,
    duration_ms as latency,
    resource.attributes['gen_ai.request.model'] as model_name
FROM traces
WHERE resource.attributes['service.name'] = 'litellm-production-gateway'
  AND attributes['gen_ai.usage.total_tokens'] IS NOT NULL
LIMIT 1000
```

* X-Axis: `total_tokens`
* Y-Axis: `latency` (ms)
* Group/Color by: `model_name`

#### 2. Efficiency Metric: "Tokens per Second" (TPS)

Tracking TPS helps you understand the actual throughput of the LLM provider, independent of the prompt length.

SQL

```
SELECT 
    bin(timestamp, 5m) as time,
    avg(attributes['gen_ai.usage.output_tokens'] / (duration_ms / 1000.0)) as avg_tokens_per_second,
    resource.attributes['gen_ai.request.model'] as model
FROM traces
WHERE attributes['gen_ai.usage.output_tokens'] > 0
GROUP BY time, model
```

* Visualization: Time-series line chart.
* Insight: If you see a dip in TPS for a specific model (e.g., `gpt-4o`), it may indicate provider-side throttling or high system load.

#### 3. "Costly Latency" Heatmap

This query identifies requests that are both slow and expensive, which are prime candidates for prompt optimization or semantic caching.

SQL

```
SELECT 
    attributes['gen_ai.usage.total_tokens'] as tokens,
    duration_ms as latency,
    (attributes['gen_ai.usage.input_tokens'] * 0.00001 + attributes['gen_ai.usage.output_tokens'] * 0.00003) as cost_usd
FROM traces
WHERE latency > 5000 -- Focus on requests over 5 seconds
ORDER BY cost_usd DESC
```

#### 4. How to add these to your Apica Dashboard

1. Log in to Apica Ascent and navigate to Observe > Dashboards.
2. Click Add Widget and select SQL Query.
3. Paste the desired query from above into the editor.
4. In the Visualizations tab:
   * For the first query, select Scatter Plot.
   * For the second query, select Line Chart.
   * Ensure the X-axis is set to `total_tokens` (for scatter) or `time` (for line).
5. Click Save.

#### Pro-Tip: Detecting "Runaway Agents"

If you see a cluster of points in your scatter plot with high tokens but low latency, it often indicates an AI agent stuck in a loop where it is repeating the same short response until it hits a token limit. You can set an Apica Alert based on the ratio of `total_tokens / duration_ms` to catch these loops in real-time.
