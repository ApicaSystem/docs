# AI Gateway Support

To use an AI Gateway with Apica Flow effectively, you should treat the gateway as the "front door" for your AI traffic and Apica Flow as the "traffic controller" for the telemetry that traffic generates.

Apica has officially released Ascent 2.15.0, which introduces native AI and LLM Observability capabilities. This means that while Apica itself is not a standalone "gateway" (in the sense of a proxy like OpenAI), it now includes purpose-built collectors and dashboards designed to integrate directly with AI gateways.

#### 1. The Best Way to Use Them Together

The most robust architecture involves a "Gateway-to-Pipeline" sandwich.

1. **Ingress (The AI Gateway)**: Use an AI Gateway (like Bifrost, LiteLLM, or Portkey) to unify your API calls to providers like OpenAI or Bedrock. The gateway handles load balancing, model failover, and semantic caching.
2. **Telemetry (OpenTelemetry)**: Configure the AI Gateway to export its logs and traces via OTLP (OpenTelemetry) to your Apica endpoint.
3. **Processing (Apica Flow)**: This is where the magic happens. Apica Flow intercepts the OTel stream and performs:
   1. PII Masking: It scrubs sensitive user data from the prompts _before_ they are stored.
   2. Token Cost Calculation: It attaches real-time cost metadata based on the usage.total\_tokens attribute.
   3. Dynamic Routing: It sends high-value "Hallucination" events to a SIEM (like Sentinel) while routing routine "200 OK" logs to low-cost InstaStore.

#### 2. Does an Integration Exist Today?

Yes. Apica Ascent (v2.15+) provides specific features that make this integration "out-of-the-box":

* Native LLM Dashboards: In the Observe tab, there are now predefined dashboards for token usage, latency, and model-specific performance.
* AI-Aware Forwarders: Apica has built-in forwarders that understand GenAI semantic conventions, allowing you to route data directly to evaluation platforms (like Langfuse) or security platforms.
* Built-in AI Assistant: Apica's "Observe" product now includes a Generative AI assistant that can help you query the very LLM logs you are collecting, allowing you to ask, _"Show me all prompts that resulted in a 401 error yesterday."_

#### 3. Recommended AI Gateways for Apica

If you are choosing a gateway to pair with Apica today, these three offer the best OTel compatibility:

| **Gateway**           | **Why it works with Apica**                                                                               |
| --------------------- | --------------------------------------------------------------------------------------------------------- |
| Bifrost (by Maxim AI) | Native OTel support and ultra-low latency (11µs). Perfect for high-volume Apica pipelines.                |
| LiteLLM               | The most flexible open-source option. It can be easily configured to send custom JSON logs to Apica Flow. |
| Kong AI Gateway       | Best if you already use Kong. It uses a plugin to emit OTel spans that Apica's Fleet agents can ingest.   |

#### Key Implementation Tip: The "LOG\_FLOW\_ONLY" Mode

With the latest update, you can use Apica's LOG\_FLOW\_ONLY mode. This allows you to process high-volume LLM logs through the pipeline (for real-time alerting on prompt injections, for example) without actually storing them in the expensive "Lake" index unless they meet specific error criteria. This can reduce your observability costs by up to 40%.

<a class="button secondary"></a> <a class="button secondary"></a>
