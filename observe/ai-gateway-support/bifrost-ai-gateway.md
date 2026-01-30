# Bifrost AI Gateway

Setting up the **Bifrost AI Gateway** to feed data into Apica Flow creates a high-performance observability bridge. Bifrost intercepts AI traffic with near-zero latency (\~11µs) and exports it via OpenTelemetry (OTLP) to Apica for redaction, cost analysis, and storage.

### 1. Bifrost Configuration (OTLP Plugin)

Bifrost uses a plugin-based architecture to export telemetry. You must enable the `otel` plugin and point it to your Apica Ascent ingestion endpoint.

#### Option A: Configuration via `config.json`

If you are running Bifrost as a binary or in a custom container, add the following to your `config.json`:

JSON

```
{
  "plugins": [
    {
      "name": "otel",
      "enabled": true,
      "config": {
        "endpoint": "https://<your-ascent-instance>/v1/otel",
        "protocol": "http",
        "headers": {
          "Authorization": "Bearer <Apica-Ingest-Token>",
          "x-apica-source": "bifrost-gateway"
        },
        "resource_attributes": {
          "service.name": "bifrost-ai-gateway",
          "deployment.environment": "production"
        }
      }
    }
  ]
}
```

#### Option B: Configuration via Helm (Kubernetes)

For Kubernetes deployments, update your `values.yaml` to include the plugin logic:

YAML

```
bifrost:
  plugins:
    otel:
      enabled: true
      config:
        endpoint: "https://<your-ascent-instance>/v1/otel"
        protocol: "http"
        headers:
          Authorization: "Bearer <Apica-Ingest-Token>"
```

### 2. Environment Variable Overrides

Bifrost follows OTel standards. You can globally configure the exporter using standard environment variables, which is often easier for Docker/K8s deployments:

* `OTEL_EXPORTER_OTLP_ENDPOINT`: `https://<your-ascent-instance>/v1/otel`
* `OTEL_EXPORTER_OTLP_HEADERS`: `Authorization=Bearer <token>`
* `OTEL_RESOURCE_ATTRIBUTES`: `service.name=bifrost,env=prod`

### 3. Data Flow Validation in Apica Flow

Once Bifrost is running and sending traffic, you need to verify and process the "AI Golden Signals" in the Apica Flow UI.

1. Source Check: Navigate to Explore > Logs and look for the `service.name: bifrost` attribute.
2. Telemetry Pipeline: Create an Apica Flow Pipeline with an OTLP Source.
3. Apply LLM Logic:
   * Filter: Use a filter to isolate `gen_ai` spans.
   * Transform: Use the Redaction Processor to mask the `gen_ai.prompt` and `gen_ai.response` attributes if they contain sensitive data.
   * Costing: Add a script processor to calculate `cost_usd` by multiplying `gen_ai.usage.total_tokens` by your model's price-per-token.

### 4. Key Implementation Notes

* Protocol Choice: Bifrost supports both `grpc` and `http`. For Apica Ascent, `http/protobuf` is recommended for its reliability through standard firewalls.
* Semantic Caching: If you enable Semantic Caching in Bifrost, it will still emit OTel spans for "Cache Hits." These will have a significantly lower latency, allowing you to track the ROI of your caching strategy in your Apica dashboards.
* Batching: Bifrost handles internal batching. In high-volume environments (5k+ RPS), ensure your Apica instance is scaled to handle the incoming batch sizes.

## Setting up the Bifrost Dashboard in Apica

To visualize the data flowing from your Bifrost AI Gateway into Apica Ascent, you can build a custom dashboard that focuses on "AI Golden Signals." Bifrost emits rich OpenTelemetry (OTel) data, including token counts, model latency, and cost per request, which can be queried in Ascent using its SQL-like query engine.

#### 1. Dashboard Logic: The SQL Queries

In the Apica Ascent UI, navigate to Dashboards > Create New and add widgets using the following query logic. These assume you have mapped your Bifrost attributes to the OTel `gen_ai` semantic conventions in your pipeline.

**Widget A: Real-Time Token Burn (Cost Tracking)**

This query calculates the total cost by multiplying input and output tokens by their respective model prices.

SQL

```
SELECT 
    sum(attributes['gen_ai.usage.input_tokens'] * 0.00001 + attributes['gen_ai.usage.output_tokens'] * 0.00003) as total_cost_usd,
    bin(timestamp, 1h) as time
FROM logs
WHERE resource.attributes['service.name'] = 'bifrost'
GROUP BY time
```

**Widget B: Model Latency Heatmap (P95 Performance)**

Identify which models are slowing down your agentic workflows.

SQL

```
SELECT 
    percentile(duration_ms, 95) as p95_latency,
    resource.attributes['gen_ai.request.model'] as model
FROM traces
WHERE resource.attributes['service.name'] = 'bifrost'
GROUP BY model
```

#### 2. Dashboard Layout Recommendation

A production-ready AI Gateway dashboard in Apica should be organized into three logical rows:

| **Row**            | **Widget Type** | **Data Points**                                  |
| ------------------ | --------------- | ------------------------------------------------ |
| Row 1: Health      | Single Stats    | Success Rate (%), Active Models, Total Requests  |
| Row 2: Performance | Time-Series     | Latency (P50/P95), Time-to-First-Token (TTFT)    |
| Row 3: FinOps      | Pie Charts      | Tokens by Model, Cost by API Key, Cache Hit Rate |

#### 3. Importing the Dashboard JSON

Apica Ascent supports importing dashboard definitions via JSON. While there isn't a single "public download" link, you can create a template by:

1. Creating one widget manually in the UI.
2. Exporting the Dashboard (Settings > Export).
3. Mass-editing the JSON to duplicate widgets for different models or providers.

#### 4. Key Performance Indicators (KPIs) to Include

* Cache Hit Ratio: If you use Bifrost's semantic caching, monitor how many requests are served from the cache vs. the provider.
* Provider Error Rate: Track 429 (Rate Limit) or 503 (Overloaded) errors per provider (OpenAI vs. Anthropic).
* Token Intensity: Monitor the average tokens per request to identify "runaway" agent loops.

Video: [Bifrost: Fastest LLM Gateway and Native Observability](https://www.youtube.com/watch?v=yGzpLaMKLQg)

This video provides a deep dive into how Bifrost handles ultra-low latency and natively supports OpenTelemetry, which is essential for building the dashboard visualizations.
