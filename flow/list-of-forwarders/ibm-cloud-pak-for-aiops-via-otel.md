# IBM Cloud Pak for AIOps (via OTel)

To instrument the forwarding of telemetry logs from Apica Flow to IBM Cloud Pak for AIOps (CP4AIOps), the most scalable and reliable method is using a Kafka-based integration (via OpenTelemetry). This ensures that the high-volume log data required for AIOps anomaly detection is buffered and delivered securely.

This architecture utilizes an OpenTelemetry (OTel) Collector as a high-performance intermediary. By using OTLP as the hand-off protocol from Apica Flow, you decouple your core pipeline from the specific security and connectivity requirements of the IBM Cloud Pak for AIOps (CP4AIOps) Kafka bus.

#### Phase 1: Prepare the IBM Cloud Pak Ingestion

IBM Cloud Pak for AIOps typically exposes an internal Kafka cluster (provided by IBM Automation Foundation) for high-volume log ingestion.

1. Identify Kafka Details: In the CP4AIOps console, go to Data and tool connections > Add connection > Kafka.
2. Define the Topic: Create or note the topic intended for log anomaly detection (e.g., `cp4aiops-ingest-logs`).
3. Security Assets: \* Download the CA Certificate for the cluster.
   * Retrieve the SASL credentials (Username/Password) and the Bootstrap Server address.

#### Phase 2: Configure the OTel Collector

The Collector receives OTLP data from Apica and uses its native Kafka exporter to push formatted JSON into the IBM environment.

`otel-collector-config.yaml` Snippet:

YAML

```
receivers:
  otlp:
    protocols:
      grpc:
        endpoint: "0.0.0.0:4317"

processors:
  batch:
    timeout: 5s
    send_batch_size: 1024
  
  # Ensure the log body is correctly mapped for IBM's AI models
  transform:
    log_statements:
      - context: log
        statements:
          - set(attributes["cp4aiops_priority"], "high")

exporters:
  kafka:
    brokers: ["${IBM_KAFKA_BOOTSTRAP_SERVER}"]
    topic: "cp4aiops-ingest-logs"
    auth:
      sasl:
        username: "${IBM_KAFKA_USER}"
        password: "${IBM_KAFKA_PASSWORD}"
        mechanism: "PLAIN"
    tls:
      ca_file: "/etc/otel/certs/ibm-ca.crt"
    encoding: otlp_json 

service:
  pipelines:
    logs:
      receivers: [otlp]
      processors: [batch, transform]
      exporters: [kafka]
```

#### Phase 3: Instrument Apica Flow

With the Collector acting as the gateway, Apica Flow only needs to be configured for a standard OTLP export.

1. Set Destination: In Apica Flow, create an OTLP Destination targeting the OTel Collector’s IP and port `4317`.
2. Pipeline Logic:
   * Filter: Use a "Drop" processor to remove noise (e.g., info logs from non-critical services) to save on IBM ingestion/licensing costs.
   * Enrich: Add mandatory OTel resource attributes like `service.name` and `deployment.environment`.
3. Forward: Point the output of this pipeline to the Collector destination.

#### Phase 4: AI Model Mapping in Cloud Pak

Once data is landing in the Kafka topic, you must "teach" CP4AIOps how to read it.

* Data Mapping: In the IBM console, navigate to your Kafka connection and select Field Mapping.
* JSON Pathing: Since the OTel Collector uses `otlp_json`, map the following:
  * Timestamp: `body.timestamp`
  * Log Message: `body.content`
  * Severity: `attributes.severity`
* Training: Go to AI Model Management > Log Anomaly Detection and trigger a "Live Data" baseline.

#### Summary of Component Responsibilities

| **Component**  | **Responsibility**         | **Why this matters**                                                         |
| -------------- | -------------------------- | ---------------------------------------------------------------------------- |
| Apica Flow     | Ingestion & Pre-processing | Filters data at the source to prevent "Garbage In, Garbage Out."             |
| OTel Collector | Protocol Translation       | Handles the complex SASL/TLS handshake for the IBM Kafka bus.                |
| IBM Kafka      | High-Volume Buffer         | Ensures no logs are lost if CP4AIOps processing components scale or restart. |
| CP4AIOps AI    | Anomaly Detection          | Scans the normalized OTLP logs for deviations from the learned baseline.     |

#### Implementation Note

If you are running the OTel Collector in a Kubernetes environment alongside Apica Flow, use the Collector's Service DNS name (e.g., `otel-collector.monitoring.svc.cluster.local`) as the endpoint in Apica Flow for the lowest possible latency and highest reliability.
