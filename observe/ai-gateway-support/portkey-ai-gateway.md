# Portkey AI Gateway

Configuring Portkey to stream data into Apica Flow utilizes the industry-standard OpenTelemetry (OTLP) protocol. Portkey acts as the intelligent ingress point for your LLM traffic, while Apica Flow serves as the centralized "telemetry brain" for redaction, governance, and long-term storage.

#### 1. Unified Apica Destination Details

Before configuring Portkey, ensure you have your Apica Ascent OTLP details ready:

* Endpoint: `https://<your-ascent-instance>/v1/otel`
* Protocol: `http/protobuf` (Recommended for high performance)
* Authorization: `Bearer <Apica-Ingestion-Token>`

#### 2. Configuration for Self-Hosted Portkey Gateway

If you are running Portkey locally or in your own VPC (via Docker, Node.js, or Kubernetes), you can enable the OTel exporter using environment variables.

**Environment Variables (Docker/CLI)**

Set these variables on your Portkey container or server instance:

Bash

```
# Enable the OTel Push plugin
export OTEL_PUSH_ENABLED=true

# Point to your Apica Ascent endpoint
export OTEL_ENDPOINT="https://<your-ascent-instance>/v1/otel"

# Set the protocol to Protobuf for efficiency
export OTEL_EXPORTER_OTLP_PROTOCOL="http/protobuf"

# Add the required Apica Authorization header
export OTEL_EXPORTER_OTLP_HEADERS="Authorization=Bearer <Apica-Ingest-Token>"

# Optional: Set a service name to identify this gateway in Apica dashboards
export OTEL_RESOURCE_ATTRIBUTES="service.name=portkey-gateway,env=prod"
```

**Kubernetes (Helm)**

If deploying via Helm, update your `values.yaml` under the `environment.data` section:

YAML

```
environment:
  data:
    OTEL_PUSH_ENABLED: "true"
    OTEL_ENDPOINT: "https://<your-ascent-instance>/v1/otel"
    OTEL_EXPORTER_OTLP_HEADERS: "Authorization=Bearer <Apica-Ingest-Token>"
    OTEL_EXPORTER_OTLP_PROTOCOL: "http/protobuf"
```

#### 3. Configuration for Portkey Cloud (Hosted)

For the hosted version of Portkey, you can configure the export via the Gateway Console:

1. Navigate to the Configs tab in your Portkey dashboard.
2. Click on OTEL Config.
3. Toggle OTEL Traces Exporter Configuration to ON.
4. Enter the Apica Endpoint and Authorization Header in the form.
5. Select proto as the encoding type.

#### 4. Setting Up the Pipeline in Apica Flow

Once Portkey begins exporting data, you must configure the pipeline in the Apica Flow UI to process the "AI Golden Signals":

1. Ingestion Source: Add an OpenTelemetry Ingest source.
2. Processing (The Governance Layer):
   * Redaction: Use a Transform Processor with regex to mask sensitive data in the `gen_ai.prompt` and `gen_ai.response` attributes.
   * Costing: Map the `gen_ai.usage.total_tokens` attribute to a custom numeric field to track spending in real-time.
3. Intelligent Routing:
   * Route Critical Errors (e.g., model timeouts, 429 rate limits) to a SIEM like Microsoft Sentinel.
   * Route 100% of Logs to Apica InstaStore for cost-effective audit compliance.

#### 5. Key Implementation Notes

* Semantic Conventions: Portkey follows the standard [OpenTelemetry GenAI Semantic Conventions](https://github.com/open-telemetry/semantic-conventions/blob/main/docs/gen-ai/gen-ai-spans.md). This means your Apica dashboards will automatically recognize attributes like `gen_ai.request.model` and `gen_ai.usage.input_tokens`.
* Latency: Portkey's OTel export is asynchronous, ensuring that the observability layer does not add latency to your actual LLM requests.
* Payload Logging: If you wish to see the full content of prompts in Apica, ensure you haven't disabled payload logging in your Portkey Gateway config.

## Specific SQL Query Calculating "Token Burn Rate"

To visualize your Token Burn Rate in Apica Ascent, you will use the SQL Analytics engine to aggregate data sent from Portkey. Portkey adheres to the OpenTelemetry (OTel) GenAI semantic conventions, making it easy to calculate costs across different models and providers in a single view.

#### 1. The Token Burn Query

This query calculates the cumulative cost over time by multiplying the input and output tokens by their respective price points. Replace the "Price" values below with your specific contract rates if they differ from standard OpenAI/Anthropic pricing.

SQL

```
SELECT 
    bin(timestamp, 1h) as time_window,
    -- Calculation: (Input Tokens * Input Price) + (Output Tokens * Output Price)
    sum(
        (attributes['gen_ai.usage.input_tokens'] * 0.00001) + 
        (attributes['gen_ai.usage.output_tokens'] * 0.00003)
    ) as total_cost_usd,
    resource.attributes['gen_ai.request.model'] as model_name
FROM traces
WHERE resource.attributes['service.name'] = 'portkey-gateway'
  AND attributes['gen_ai.usage.input_tokens'] IS NOT NULL
GROUP BY time_window, model_name
ORDER BY time_window DESC
```

#### 2. Dashboard Visualization Setup

Once you run the query in the Apica Query Builder, follow these steps to turn it into a high-impact widget:

* Chart Type: Select Area Chart or Stacked Bar Chart.
* X-Axis: Set to `time_window`.
* Y-Axis: Set to `total_cost_usd`.
* Grouping: Group by `model_name` to see which specific model (e.g., `gpt-4o` vs `claude-3-sonnet`) is consuming your budget fastest.

#### 3. Creating a Real-Time "Burn Alert"

To prevent "bill shock," you can transform this query into a proactive alert in Apica. This will notify your team via Slack or PagerDuty if your spending exceeds a specific threshold (e.g., $50/hour).

1. Navigate to Alerts > Create Alert.
2. Source: Select the "Token Burn Query" above.
3. Condition: Set `total_cost_usd > 50` over a `15-minute` rolling window.
4. Action: Link to your Slack Webhook or OpsGenie endpoint.

#### 4. Key Attributes Captured from Portkey

When Portkey sends data to Apica, it includes these critical OTel attributes you can use to refine your queries:

| **OTel Attribute**           | **Description**                | **Use Case**                     |
| ---------------------------- | ------------------------------ | -------------------------------- |
| `gen_ai.usage.input_tokens`  | Tokens in the user prompt.     | Measuring input "weight."        |
| `gen_ai.usage.output_tokens` | Tokens generated by the model. | Identifying "chatty" agents.     |
| `gen_ai.request.model`       | The specific model ID used.    | Cost attribution per model.      |
| `gen_ai.response.id`         | Unique request identifier.     | Linking cost to specific traces. |
| `gen_ai.provider.name`       | OpenAI, Anthropic, Azure, etc. | Vendor spend analysis.           |
