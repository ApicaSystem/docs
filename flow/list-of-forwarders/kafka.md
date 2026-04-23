# Kafka

To instrument a Kafka destination within Apica Flow, you must configure the secure handshake between the Flow engine and the Kafka brokers, define the serialization format, and establish the pipeline logic. This setup is standard for cloud-hosted Kafka services like Confluent Cloud, Amazon MSK, or IBM Event Streams.

#### 1. Prerequisite: Connectivity and Credentials

Before touching the Apica Flow configuration, verify the network path and gather the following from your cloud provider:

* Bootstrap Servers: The list of host:port combinations (e.g., `pkc-1234.us-east-1.aws.confluent.cloud:9092`).
* Security Protocol: Usually `SASL_SSL`.
* SASL Mechanism: Typically `PLAIN`, `SCRAM-SHA-256`, or `SCRAM-SHA-512`.
* API Key/Secret: Your username and password for the cluster.
* CA Certificate: If using a private CA, you will need the `.pem` file to verify the broker's identity.

#### 2. Step-by-Step Configuration

**A. Define the Kafka Destination**

In the Apica Flow UI (or your `config.yaml`), create a new destination. This acts as the "exit point" for your data.

1. Name: `Cloud_Kafka_Prod`
2. Type: `KAFKA`
3. Brokers: Paste your bootstrap server list.
4. Topic: The target topic name (e.g., `telemetry-logs-inbound`).
5. Authentication Settings:
   * Enable TLS: On.
   * SASL Mechanism: Select the one required by your provider.
   * Username/Password: Input your API keys.
6. Producer Settings:
   * Acks: Set to `all` for high durability or `1` for higher throughput.
   * Compression: Use `snappy` or `lz4` to reduce egress bandwidth costs.

**B. Create the Instrumentation Pipeline**

The pipeline dictates _what_ data gets sent and how it is reshaped.

1. Source: Select your incoming telemetry stream (e.g., Syslog, OTLP, or File).
2. Processors (Filters & Mutations):
   * Filter: Drop events that don't meet your "Importance" threshold (e.g., `if level == 'debug' then drop()`).
   * Format: Convert the data to JSON. Kafka-based AIOps and data lakes perform best with a flattened JSON structure.
   * Tagging: Add metadata such as `origin_cluster` or `customer_id` to the record before it leaves Apica.
3. Destination: Link this pipeline to the `Cloud_Kafka_Prod` destination created in Step A.

#### 3. Advanced Configuration: Schema and Partitioning

To ensure your Kafka consumers (like Snowflake, Elastic, or IBM Cloud Pak) can read the data effectively, consider these advanced settings:

| **Feature**     | **Configuration Detail**                                     | **Benefit**                                                              |
| --------------- | ------------------------------------------------------------ | ------------------------------------------------------------------------ |
| Partition Key   | Use a field like `host_id` or `service_name`.                | Ensures all logs from one host arrive in chronological order.            |
| Schema Registry | Provide the URL and credentials for Confluent/Glue registry. | Enables Avro or Protobuf serialization for smaller payloads.             |
| Batch Size      | Set to `16KB` or `32KB`.                                     | Optimizes throughput by grouping small logs into larger network packets. |

#### 4. Technical Validation (The "Smoke Test")

Once the pipeline is active, use the Apica Flow Live Stream or a CLI tool to verify the connection:

* Check Flow Logs: Look for `Producer connection established` messages.
*   Kafka Console Consumer: Run a quick check from your terminal to see if data is landing:

    Bash

    ```
    kafka-console-consumer --bootstrap-server <your-broker> \
      --topic telemetry-logs-inbound \
      --consumer.config client-ssl.properties \
      --from-beginning
    ```

#### Common Pitfalls to Avoid

* Timeouts: If your cloud Kafka has a firewall/ACL, ensure the Apica Flow egress IP addresses are whitelisted.
* Certificate Errors: Ensure the `ssl.endpoint.identification.algorithm` is set to `https` (standard for cloud Kafka) to prevent hostname mismatch errors during the SSL handshake.
* Large Message Handling: If a log message exceeds the Kafka `max.message.bytes` (default 1MB), the producer will fail. Use an Apica Flow "Truncate" processor to safeguard against oversized payloads.
