# CrowdStrike Falcon LogScale

Forwarding data from Apica Ascent to CrowdStrike Falcon LogScale (formerly Humio) is highly efficient because LogScale is built on a high-speed, index-free architecture that natively supports OpenTelemetry (OTLP) and the CrowdStrike Parsing Standard (CPS).

By using Apica Flow as the forwarder, you can normalize your telemetry to the CPS schema before it hits your LogScale ingest quota.

#### 1. Prerequisites in Falcon LogScale

You must first create a "landing zone" in your LogScale repository to receive the OTLP stream.

1. Select a Repository: Open the Falcon Console and navigate to Next-Gen SIEM > Log Management. Select the repository where you want the data to reside.
2. Create an Ingest Token: \* Go to Settings > Ingest Tokens.
   * Click + Add Token.
   * Give it a name (e.g., `Apica_Forwarder`).
   * Crucial: Assign a Parser to this token (e.g., `json` or a custom `CPS-compliant` parser). This ensures LogScale knows how to handle the incoming OTLP payload.
3. Capture the Ingest URL: Your endpoint depends on your region:
   * US-1: `https://cloud.us.humio.com/api/v1/ingest/otlp`
   * EU-1: `https://cloud.community.humio.com/api/v1/ingest/otlp`

#### 2. Configuration Strategy: The Forwarder

In the Apica Flow (Ascent) UI, you will create a new target destination using the OTLP/HTTP protocol.

| **Field**         | **Value**                                      |
| ----------------- | ---------------------------------------------- |
| Destination Name  | `CrowdStrike_LogScale_Forwarder`               |
| Endpoint          | `https://<your-region-url>/api/v1/ingest/otlp` |
| Protocol          | `http/protobuf`                                |
| Auth Header Key   | `Authorization`                                |
| Auth Header Value | `Bearer <Your-LogScale-Ingest-Token>`          |

#### 3. Detailed Reference: Metadata & Enrichment (CPS)

CrowdStrike uses the CPS (CrowdStrike Parsing Standard), which is based on the Elastic Common Schema (ECS). To make your Apica data "search-ready" in LogScale, you should map your OTel attributes to these specific keys.

SQL

```
# 1. Map Vendor and Product (Required for LogScale packages)
set(resource.attributes["#Vendor"], "apica")
set(resource.attributes["#Product"], "ascent")

# 2. Map LogScale Categorization
# This allows 'Advanced Event Search' to find your logs instantly
set(attributes["event.category"], ["host", "process"])
set(attributes["event.type"], ["info"])

# 3. Map the User and Host for Security Correlation
set(attributes["user.name"], attributes["enduser.id"])
set(attributes["host.name"], resource.attributes["host.name"])
```

#### 4. Implementation Reference: Exporter Configuration

If you are managing the forwarder via a standalone OTel Collector or the Apica Fleet Agent:

YAML

```
exporters:
  otlphttp/logscale:
    endpoint: "https://cloud.us.humio.com/api/v1/ingest/otlp"
    headers:
      # LogScale uses the ingest token as the Bearer token
      Authorization: "Bearer ${LOGSCALE_INGEST_TOKEN}"

service:
  pipelines:
    logs:
      receivers: [otlp]
      processors: [batch, transform/cps_mapping]
      exporters: [otlphttp/logscale]
```

#### 5. Key Implementation Notes

* Index-Free Speed: LogScale does not require you to pre-define schemas. However, using the `#Vendor` and `#Product` tags in Apica Flow will allow LogScale to automatically apply Marketplace Apps (dashboards and alerts) to your data.
* Batching for Performance: LogScale thrives on large batches. Ensure the `batch` processor in Apica is set to a high timeout (e.g., `5s`) or size (e.g., `1000` spans) to maximize ingestion throughput.
* Timestamping: Ensure you are sending the `Timestamp` attribute. LogScale uses this for its "Live Tail" view. If omitted, LogScale will use the "arrival time," which can cause issues with out-of-order events.
