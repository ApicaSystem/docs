# Grafana Forwarder (via OTel)

To build a forwarder from Apica to Grafana Labs using OpenTelemetry (OTel), you are essentially configuring Apica's Flow or Pipeline engine to act as a routing and transformation layer that exports data via the OTLP protocol. Since Grafana Cloud provides a native OTLP intake, this is a clean, standard-based integration.

### 1. Prerequisites from Grafana Labs

Before configuring Apica, you must obtain your OTLP connection details from your Grafana Cloud portal:

1. Log in to your **Grafana Cloud Portal**.
2. Navigate to **OpenTelemetry** or look for the OTLP Endpoint tile.
3. Note the following values:
4. OTLP Endpoint: (e.g., https://otlp-gateway-prod-us-central-0.grafana.net/otlp)
5. Instance ID/Username: (Usually a 5-6 digit number)
6. API Token/Password: Your generated Cloud Access Policy token with metrics:write, logs:write, and traces:write permissions.

### 2. Apica Configuration Strategy: The OTLP Forwarder

In the Apica UI (Ascent/Flow), you will create a Forwarder (or Target Destination) that uses the OpenTelemetry (OTLP) exporter.&#x20;

#### Step A: Define the Target

In the Apica Pipeline configuration, you define the Grafana endpoint. Because Grafana Cloud requires Basic Authentication, your OTLP headers must be encoded.

* **Endpoint**: https://\<otlp-endpoint>
* **Protocol**: http/protobuf (recommended over gRPC for standard web-hook style forwarding)
* **Headers**: Your encoded cloud access policy token. Example:

<pre data-overflow="wrap"><code><strong>Authorization=Basic MTIzNDU6Z2xjX0FCQ0RFRkFHRkk= 
</strong>Note: You can encode using this command on linux: echo -n "12345:glc_ABCDEFGHIJ1234567890" | base64
# produces e.g. MTIzNDU6Z2xjX0FCQ0RFRkFHRkk=
</code></pre>

#### Step B: Pipeline Setup (The "Forwarder")

In the Apica "Flow" or "Pipeline" section, you will create a rule to route specific filtered data to this new destination.

1. **Select Source**: Choose the incoming OTel data or system logs you want to forward.
2. **Apply Filters**: (Optional) Use Apica's filtering to drop noisy metrics or sensitive log data to save on Grafana Cloud costs.
3. **Select Destination**: Choose the OTLP/Grafana Labs target created in **Step A**.

#### Otel Forwarder:

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>
