# Ascent 2.10.3

We are excited to introduce the **v2.10.3** release of Flow, focused on expanding metrics capabilities, enhancing pipelines, and improving system performance.

{% hint style="info" %}
"Ascent v2.10.3 is now Generally Available — with OTEL Metrics support in Apica Telemetry Pipeline, and new JSON functions!"
{% endhint %}

***

### Flow

#### OpenTelemetry Metrics Support in Apica Telemetry Pipeline is now GA.

* **OpenTelemetry Metrics in Telemetry Pipelines**:\
  Apica Flow now fully supports **receiving and forwarding OpenTelemetry (OTLP)-compatible metrics** within Apica telemetry pipelines.
* **OTLP Metrics Endpoint**:\
  You can now ingest metrics through the `/v1/metrics` OTLP-compatible endpoint.
* **Flexible Storage Options**:\
  Configure whether metrics are sent to internal Ascent Prometheus storage or forwarded externally to another OTLP compatible metric storage OR archive to an external object store.
* **OTLP Metrics and Logs Forwarders** to compatible external systems.

***

### Pipelines and Rules Enhancements

#### New Functions

* **`flatten(input: object)`**:\
  Flattens nested JSON structures into simple key-value pairs.
* **`unflatten(input: object)`**:\
  Reconstructs nested JSON objects from flattened structures, enabling full roundtrip transformations.

***

This release further strengthens Apica Flow’s telemetry capabilities, giving you more flexibility, deeper observability, and better control over your pipelines and metrics.

### **Component Versions - Ascent v2.10.3**

| **Component**                          | **Versions**                                    |
| -------------------------------------- | ----------------------------------------------- |
| Coffee                                 | v3.16.6                                         |
| Flash                                  | v3.15.4                                         |
| ASM                                    | 13.34.0                                         |
| NG Private Agent                       | 1.0.8                                           |
| Check Execution Container: Browser     | fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0 |
| Check Execution Container: Zebratester | zt-7.5a-p0-r-2025.04.02-0-base-1.2.0            |
| Check Execution Container: Runbin      | runbin-2025.04.17-0-base-2.2.1                  |
| Check Execution Container: Postman     | postman-2025.04.17-0-base-1.4.0                 |
| Bnet (Chrome Version)                  | 10.2.1 (Chrome 130)                             |
| Zebratester                            | 7.0B                                            |
| ALT                                    | 6.13.3.240                                      |
| IronDB                                 | 1.5.0                                           |
