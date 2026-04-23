# Kafka Forwarding

To implement an end-to-end telemetry pipeline from Apica Flow to a Cloud-based Kafka source using an OpenTelemetry (OTel) Collector, follow these instructions.

This architecture uses Apica Flow for initial ingestion and filtering, the OTel Collector for protocol conversion, and a native Kafka exporter for secure cloud delivery.

#### Step 1: Prepare the Cloud Kafka Cluster

Before configuring the software, ensure your cloud destination (e.g., Confluent Cloud, AWS MSK, or IBM Event Streams) is ready:

1. Create a Topic: e.g., `telemetry.logs.unified`.
2. Generate Credentials: Obtain your Bootstrap Server URL, API Key, and API Secret.
3. Network Access: If your OTel Collector is running in a private subnet, ensure egress traffic is allowed to the Kafka broker's port (usually `9092` or `9094`).

#### Step 2: Configure the OpenTelemetry Collector

The Collector acts as the "Traffic Controller." It receives OTLP data from Apica and exports it to Kafka.

1\. Create a `config.yaml` for the Collector:

YAML

```
receivers:
  otlp:
    protocols:
      grpc:
        endpoint: "0.0.0.0:4317" # Apica Flow will target this

processors:
  batch:
    send_batch_size: 1000
    timeout: 10s
  resourcedetection: # Optional: Adds infrastructure context
    detectors: ["env", "system"]

exporters:
  kafka:
    brokers: ["${KAFKA_BOOTSTRAP_SERVER}"]
    topic: "telemetry.logs.unified"
    auth:
      sasl:
        username: "${KAFKA_API_KEY}"
        password: "${KAFKA_API_SECRET}"
        mechanism: "PLAIN"
    tls:
      insecure: false # Required for Cloud Kafka
    encoding: otlp_json # Standard structured format

service:
  pipelines:
    logs:
      receivers: [otlp]
      processors: [batch, resourcedetection]
      exporters: [kafka]
```

2\. Deploy the Collector: Ensure it is running as a service or container reachable by your Apica Flow instance.

#### Step 3: Configure Apica Flow (The Producer)

Now, configure Apica Flow to ship its processed telemetry to the Collector.

1\. Define the OTLP Destination:

* In the Apica Flow UI, navigate to Destinations > Add New.
* Select OTLP.
* Endpoint: `http://<otel-collector-ip>:4317`
* Protocol: `grpc`

2\. Instrument the Forwarding Pipeline:

* Source: Select your raw log or telemetry stream.
* Transformation (Optional but Recommended): Use an Apica Flow "Mutate" processor to inject a `partition_key`. This ensures logs from the same service stay in order within Kafka.
  * _Operation:_ Set `attributes['routing.key']` to `${service_name}`.
* Output: Select the OTLP destination created above.

#### Step 4: Verification and Data Flow Validation

Once the pipeline is active, verify the data flow at each stage of the "hops."

| **Stage**      | **Verification Action**             | **Success Metric**                   |
| -------------- | ----------------------------------- | ------------------------------------ |
| Apica Flow     | Check Destination Health in UI      | Status: `Connected`                  |
| OTel Collector | Inspect stdout logs                 | No `Exporting failed` errors.        |
| Cloud Kafka    | Use a CLI consumer or Cloud Console | JSON packets appearing in the topic. |

#### Technical Advantages of this Approach

* Payload Resilience: If your Cloud Kafka cluster undergoes a maintenance window, the OTel Collector can be configured with a `file_storage` extension to buffer Apica Flow's data on local disk until the cloud connection is restored.
* Reduced Complexity in Flow: Apica Flow does not need to manage Kafka certificates, SASL handshakes, or topic partitioning logic; it simply exports standard OTLP.
* Simplified Scaling: You can scale the OTel Collector layer independently of Apica Flow to handle sudden spikes in telemetry volume.

#### Common Implementation Tip

When data arrives in Kafka via the `otlp_json` encoding, it will be a nested JSON. If your downstream analytics tools require a flat structure, you can add a Transform Processor to the OTel Collector's pipeline (Step 2) to flatten the JSON attributes before they are sent to the Kafka exporter.
