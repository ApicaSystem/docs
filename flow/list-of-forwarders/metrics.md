---
description: Forward OTEL-compatible metrics to OTEL destinations
---

# Metrics

The **OTLP Metrics Forwarder** lets you send metrics in OTLP format (OpenTelemetry Protocol) to any external HTTP-compatible backend. This is useful for integrating Ascent with Prometheus-compatible systems, custom observability backends, or third-party services that support OTLP.



You can find it in the Forwarders Section:

<figure><img src="../../.gitbook/assets/image (731).png" alt=""><figcaption></figcaption></figure>

***

### Configuration

<table><thead><tr><th width="154.4453125">Field</th><th width="82.66015625">Type</th><th width="88.203125">Required</th><th>Description</th></tr></thead><tbody><tr><td><code>endpoint</code></td><td>string</td><td>✅</td><td>Full URL to which OTLP metrics will be sent. Example: https://example.com/v1/metrics</td></tr><tr><td><code>headers</code></td><td>string</td><td>❌</td><td>Optional comma-separated list of headers (<code>key=value</code>) to include in POST.</td></tr><tr><td><code>input_format</code></td><td>string</td><td>✅</td><td>Must be <code>"otlp"</code>. Describes the format of incoming metrics.</td></tr><tr><td><code>output_format</code></td><td>string</td><td>✅</td><td>Must be <code>"otlp"</code>. Describes the format sent to the endpoint.</td></tr><tr><td><code>name</code></td><td>string</td><td>✅</td><td>Name of the forwarder</td></tr></tbody></table>





Once you create a forwarder, the forwarder can then be mapped to any of your `namespaces/apps` that are currently receiving OTEL formatted metrics.



<figure><img src="../../.gitbook/assets/image (732).png" alt=""><figcaption></figcaption></figure>

All the events that match the OTEL protocol - would be forwarded to the relevant endpoint given in the forwarder.
