# LogRhythm Forwarder

Building a forwarder from Apica Ascent to LogRhythm requires a slightly different approach than modern SaaS OTLP targets. While LogRhythm is transitioning toward JSON-native ingestion via its Open Collector, it does not yet provide a public, direct OTLP/HTTP endpoint for general log streaming like Grafana or Honeycomb.

The most reliable "forwarder" approach involves using Apica to transform OTel data into a structured JSON format and delivering it to the LogRhythm Open Collector via Syslog or a Beat.

### 1. Prerequisites from LogRhythm

To receive data, you must have the LogRhythm Open Collector installed and configured:

1. Open Collector IP/Hostname: The address of the VM running your Open Collector.
2. Syslog Beat / Generic JSON Beat: Ensure a "Beat" is configured to listen on a specific port (typically `5044` for Beats or `514/1514` for Syslog).
3. Log Source Type: In the LogRhythm Console, create a new Log Source and set the type to "System : JSON - Open Collector".

### 2. Configuration Strategy: The Forwarder Pipeline

In the Apica Flow (Ascent) UI, you will configure a Syslog or Webhook forwarder that bridges OTel data into LogRhythm's JSON-native ingestion layer.

#### Step A: Destination Settings

| **Field**        | **Value**                           |
| ---------------- | ----------------------------------- |
| Destination Name | `LogRhythm_SIEM_Forwarder`          |
| Endpoint         | `<LogRhythm-OpenCollector-IP>`      |
| Protocol         | `TCP` (Recommended for reliability) |
| Port             | `1514` (Default for JSON Syslog)    |
| Format           | `JSON`                              |

#### Step B: Metadata Enrichment (OTTL)

LogRhythm's "Schema Dictionary" maps fields based on key names. To ensure your Apica logs are parsed automatically (auto-mapped), you should normalize your OTel attributes to match LogRhythm's expectations.

SQL

```
# 1. Map OTel severity to LogRhythm's priority scale
set(attributes["priority"], 5) where severity_number >= 13
set(attributes["priority"], 1) where severity_number <= 9

# 2. Extract the 'body' into a 'message' field (Standard for LR)
set(attributes["message"], body)

# 3. Add LogRhythm-specific metadata tags
set(attributes["vendor"], "Apica")
set(attributes["product"], "Ascent")
set(attributes["log_source_id"], "Apica_OTel_Pipeline")

# 4. Flatten high-cardinality OTel resource attributes
set(attributes["hostname"], resource.attributes["host.name"])
```

### 3. Detailed Reference: OTel Collector Bridge

If you are running a standalone OTel Collector managed by Apica to bridge data to LogRhythm, use the following configuration to output a LogRhythm-friendly stream:

YAML

```
exporters:
  # Using the TCP exporter to send JSON logs to LogRhythm Open Collector
  tcp/logrhythm:
    endpoint: "<OPEN_COLLECTOR_IP>:1514"
    # Convert OTel LogRecord into a single-line JSON object
    format: json 

service:
  pipelines:
    logs:
      receivers: [otlp]
      processors: [batch, transform/lr_mapping]
      exporters: [tcp/logrhythm]
```

### 4. Key Implementation Notes

* JSON Mapping: The LogRhythm Open Collector is designed to grab JSON fields. If you send nested OTel objects (e.g., `attributes.http.method`), ensure your Open Collector mapping file (the `.yaml` file for that specific Beat) is configured to flatten those fields or that you flatten them in Apica before sending.
* Timestamping: LogRhythm uses the `normalised_time` field for its index. Ensure Apica is sending the `timestamp` in ISO8601 format to avoid "Time Out of Sync" errors in the LogRhythm SIEM.
* Volume Control: Since SIEM licensing is often based on volume (Messages Per Second), use Apica's Flow Control to drop non-security related logs (like "Debug" or "Info") before they reach the Open Collector.

## Detailed Mapping Template and Policy Configuration

To implement the forwarder approach for LogRhythm, you will primarily use the LogRhythm JSON Policy Builder (introduced in version 7.17) or a custom JQ-based Pipeline if you are on an older version.

Below is the detailed mapping template and policy configuration designed specifically for the Apica OTel attributes we established (e.g., `priority`, `message`, `vendor`, `product`).

### 1. The Logic: JSON Policy Mapping

In the LogRhythm Web Console (Settings > Open Collector > JSON Policy Builder), you will map the incoming JSON fields from Apica to the LogRhythm Schema Dictionary.

| **Apica JSON Field (Source)** | **LogRhythm Schema Field (Target)** | **Logic / Reason**                          |
| ----------------------------- | ----------------------------------- | ------------------------------------------- |
| `attributes.priority`         | `Priority`                          | Maps the calculated 1–5 scale from Apica.   |
| `attributes.message`          | `Message`                           | The core log body text for indexing.        |
| `attributes.vendor`           | `Vendor`                            | Set to `Apica` for parser identification.   |
| `attributes.product`          | `Product`                           | Set to `Ascent` for product categorization. |
| `attributes.hostname`         | `Origin Host`                       | Essential for UEBA and entity linking.      |
| `attributes.log_source_id`    | `Subject`                           | Identifies the specific Apica pipeline.     |
| `severity_text`               | `Severity`                          | Maps "INFO", "WARN", "ERROR" etc.           |
| `timestamp`                   | `Normalised Time`                   | Must be ISO8601 for correct sequencing.     |

### 2. The Template: Custom JQ Pipeline (`transform.jq`)

If you are using the high-performance Open Collector Pipeline (CLI-based), use this JQ snippet to normalize the data before it hits the System Monitor.

Code snippet

```
# Apica-to-LogRhythm Mapping Template
# This JQ filter transforms OTel-standard JSON into LogRhythm Schema

def transform:
  # 1. Initialize the LogRhythm IO format
  {
    "input": .,
    "output": {
      "original_message": . | tojson,
      "beatname": "apica_ascent_otel",
      "device_type": "apica_siem_forwarder"
    }
  } |
  # 2. Map core identity fields
  .output.vendor = .input.attributes.vendor |
  .output.product = .input.attributes.product |
  
  # 3. Map Security & Severity
  .output.priority = .input.attributes.priority |
  .output.severity = .input.severity_text |
  
  # 4. Map Message & Metadata
  .output.message = .input.attributes.message |
  .output.sname = .input.attributes.hostname | # Subject Name
  .output.subject = .input.attributes.log_source_id |
  
  # 5. Final output for Syslog delivery
  .output;
```

### 3. Implementation Steps in LogRhythm

Once you have the mapping defined, follow these steps to activate the forwarder:

1. Initialize the Beat: Configure a Generic Beat or Webhook Beat on your Open Collector to receive the TCP/HTTP stream from Apica.
2.  Upload the Policy: If using the Web UI, upload the generated JSON Policy. If using the CLI, import the `.pipe` file:

    `cat apica_ascent.pipe | ./lrctl oc pipe import`
3. Log Source Virtualization (LSV): \* In the Client Console, go to Log Source Virtualization.
   * Create a new Virtual Log Source for "Apica" using the `device_type` defined in the JQ above (`apica_siem_forwarder`).
   * This ensures LogRhythm treats these logs as a unique source rather than generic Syslog.

### 4. Key Reference: Field Mapping Table

Use this table as a reference for your MPE (Message Processing Engine) rules if you need to build custom sub-rules for specific Apica events.

| **Apica Event Attribute**  | **Suggested Common Event** | **SIEM Classification** |
| -------------------------- | -------------------------- | ----------------------- |
| `log.type: "auth_failure"` | `Authentication Failed`    | Access Control          |
| `log.type: "system_alert"` | `System Warning`           | Operations              |
| `log.type: "api_error"`    | `Application Error`        | Error                   |
