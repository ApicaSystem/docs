# IBM Cloud Pak for AIOps

To instrument the forwarding of telemetry logs from Apica Flow to IBM Cloud Pak for AIOps (CP4AIOps), the most scalable and reliable method is using a Kafka-based integration. This ensures that the high-volume log data required for AIOps anomaly detection is buffered and delivered securely.

#### Phase 1: Prepare IBM Cloud Pak for AIOps (The Sink)

Before configuring Apica, you must establish an ingestion point within the IBM environment.

1. Log into the IBM Cloud Pak Automation console.
2. Navigate to Data and tool connections > Add connection.
3. Select Kafka from the available integrations (or "Generic Log" if you prefer a direct Webhook, though Kafka is recommended for production).
4. Configure the Integration:
   * Connection Name: e.g., `Apica_Flow_Logs`.
   * Deployment: Select the appropriate instance.
   * Topic: Identify or create a specific topic for Apica logs (e.g., `apica-telemetry-logs`).
5. Secure the Connection:
   * Note the Bootstrap Servers address.
   * Download the CA Certificate (`iaf-system-cluster-ca-cert`) from your OpenShift/Kubernetes cluster. You will need this for the Apica Flow TLS configuration.
   * Generate/retrieve the SASL Credentials (Username and Password/API Key).

#### Phase 2: Configure Apica Flow (The Exporter)

In Apica Flow, you need to define the Kafka destination and the specific data "Exporter."

1. Access the Apica Flow UI/CLI.
2. Navigate to Settings > Destinations > Add New Destination.
3. Select Destination Type: `KAFKA`.
4. Input Configuration:
   * Name: `IBM_CP4AIOps_Target`.
   * Brokers: Enter the Bootstrap Server address obtained in Phase 1.
   * Topic: `apica-telemetry-logs`.
5. Security/Authentication:
   * Enable TLS/SSL.
   * Upload the IBM CA Certificate into the Apica Flow certificate store.
   * Select SASL/PLAIN or SASL/SCRAM (matching your IBM setup) and enter your credentials.

#### Phase 3: Define the Filtering & Forwarding Pipeline

This step ensures only relevant, high-fidelity data reaches the AIOps models to prevent "noise" and reduce ingestion costs.

1. Create a New Pipeline: In Apica Flow, go to Pipelines > Create.
2. Define Source: Select the log streams (Namespace, App, or Cluster) you want to monitor.
3. Apply Filtering Logic:
   * Use the Transformation Engine to drop low-priority logs (e.g., `level=info` or `level=debug` from non-critical services).
   * Standardize Format: Use a `mutate` filter to ensure all logs follow a consistent JSON schema. IBM CP4AIOps expects specific fields for its AI models:
     * `timestamp` (ISO8601)
     * `message`
     * `resource_id`
     * `severity`
4. Map to Destination: Select the `IBM_CP4AIOps_Target` created in Phase 2.

#### Phase 4: Validation and Mapping in CP4AIOps

Once data begins flowing, you must verify that the Cloud Pak is interpreting it correctly.

* Check the Kafka Topic: Use the IBM console to confirm messages are arriving in the topic.
* Log Training: In CP4AIOps, navigate to AI Model Management > Log Anomaly Detection.
* Configure Field Mapping: Point the model to the `message` and `timestamp` fields within the Apica Flow JSON payload.
* Run Initial Training: CP4AIOps typically requires 24–48 hours of baseline log data from Apica Flow to begin surfacing meaningful anomalies.

#### Troubleshooting Checklist

* MTU Issues: If using a VPN/Tunnel between Apica and IBM, ensure MTU settings are aligned to prevent packet fragmentation on large log batches.
* Time Sync: Ensure Apica Flow and the IBM cluster are synchronized via NTP. Significant clock skew (>$$ $300s$ $$) can cause CP4AIOps to discard logs as "too old" for real-time analysis.
* Schema Validation: If logs appear in Kafka but not in the AIOps dashboard, verify that the JSON is flat (preferred) rather than deeply nested.
