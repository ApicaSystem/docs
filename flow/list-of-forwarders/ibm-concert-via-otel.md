# IBM Concert (via OTel)

**To instrument the forwarding of telemetry logs from Apica Flow to IBM Concert, you should focus on the OpenTelemetry (OTLP) protocol.** IBM Concert is designed to provide risk and operational insights by consuming data that is contextualized with application metadata.

There are two primary ways to achieve this: a direct OTLP push or a mediated push via Instana.

#### Method 1: Direct OTLP Forwarding (High Velocity)

This method is best if you want to feed raw, filtered log events directly into Concert’s analysis engine without using Instana as a middleman.

**1. Obtain IBM Concert Credentials**

* Log in to your IBM Concert instance.
* Navigate to Administration > Integrations.
* Generate an API Key specifically for data ingestion.
* Note your Ingestion Endpoint URL (usually formatted as `https://<instance-id>.concert.ibm.com/api/v1/otlp`).

**2. Configure the Destination in Apica Flow**

* Go to Destinations > Add New.
* Select OTLP as the type.
* Endpoint: Enter your Concert OTLP URL.
* Authentication: Add a Header.
  * Key: `Authorization` (or `X-IBM-Concert-Key`, depending on your specific instance version).
  * Value: `Bearer <Your_API_Key>`.

**3. Metadata Tagging (The "Concert Requirement")**

IBM Concert organizes data by "Application" and "Environment." If your logs don't have these tags, Concert will treat them as "Unassigned" noise.

* In the Apica Flow Pipeline, add a Mutate/Transform step.
* Inject the following standard OTLP resource attributes:
  * `service.name`: The name of the microservice.
  * `deployment.environment`: (e.g., `production`, `staging`).
  * `ibm.concert.application.id`: The specific App ID defined in Concert.

#### Method 2: The Instana-Concert Bridge (Recommended for Context)

IBM Concert is most powerful when it sees logs in the context of a live topology. Since Concert has a native "Data Source" connector for Instana, it is often more efficient to forward data from Apica → Instana → Concert.

**1. Configure Apica Flow to Instana**

* Set up an OTLP exporter in Apica Flow pointing to your Instana Agent or SaaS EUM/Olympos endpoint.
* Ensure logs are being correlated with Trace IDs in Instana.

**2. Link Instana to Concert**

* In IBM Concert, go to Connections > Data Sources.
* Select IBM Instana.
* Provide your Instana API Token and Unit URL.
* Concert will now automatically "pull" the telemetry that Apica Flow has pushed into Instana, preserving the relationship between the logs and the infrastructure components.

#### Data Optimization: Filtering in Apica Flow

To ensure Concert isn't overwhelmed by volume (which can obscure the "Risk" signals it tries to identify), apply these filters in your Apica Flow pipeline:

* Filter by Severity: Only forward `WARN`, `ERROR`, and `FATAL` logs to Concert.
* Deduplication: Use the Apica "Unique" filter to ensure that 5,000 identical "Connection Timeout" logs are sent as a single event with a `count` attribute.
* Sensitivity Scrubbing: Use Apica Flow’s Redact function to strip out PII or internal IP addresses before the logs leave your environment, ensuring compliance with data privacy standards before the data hits the IBM cloud.

#### Verification

Once configured, check the Concert "Operational View":

1. Verify that the Topology map shows data flowing into the defined Application.
2. Check the Insights tab to see if Concert is correlating Apica's logs with any known vulnerabilities or CVEs in your environment.

Below is a detailed example of how to configure the OTLP Exporter in your `apica-flow.yaml` (or via the Flow UI) specifically to satisfy the metadata requirements for IBM Concert.

The key is ensuring that the `resource_attributes` block contains the mapping Concert uses to associate logs with a specific application risk profile.

## Apica Flow YAML: OTLP Exporter Snippet

Here is an example of YAML for the OTLP exporter from Apica Flow:

```
destinations:
  - name: ibm_concert_otlp
    type: otlp
    config:
      endpoint: "https://<your-concert-instance>.concert.ibm.com/api/v1/otlp"
      protocol: http/protobuf # or grpc depending on your network path
      headers:
        Authorization: "Bearer ${CONCERT_API_KEY}"
      
      # Resource Attributes are critical for Concert's "Application" views
      resource_attributes:
        - key: "service.name"
          value: "checkout-service" # Replace with your service name
        - key: "deployment.environment"
          value: "production"
        - key: "ibm.concert.application.id"
          value: "APP-12345-RETAIL" # Your unique Concert App ID
        - key: "telemetry.sdk.name"
          value: "apica-flow"
        - key: "host.name"
          value: "${HOSTNAME}" # Dynamically pull host from environment
```

#### Key Attribute Mapping Explained

IBM Concert uses these attributes to place your logs into the correct "bucket" in its operational risk dashboard. Without them, your logs will likely appear as "Unassociated Data".

| **Attribute Key**            | **Purpose for IBM Concert**                              | **Recommended Source**             |
| ---------------------------- | -------------------------------------------------------- | ---------------------------------- |
| `service.name`               | Identifies the specific microservice or component.       | `app_name` or `container_name`     |
| `deployment.environment`     | Groups risks by stage (e.g., Prod vs. Dev).              | `env` or `namespace`               |
| `ibm.concert.application.id` | Hard-links the log stream to a Concert-defined App.      | Found in Concert "App Settings"    |
| `resource.id`                | (Optional) Used for linking to specific cloud resources. | `arn`, `instance_id`, or `pod_uid` |

***

#### Pro-Tip: Dynamic Attribute Injection

Instead of hard-coding every value (which is impossible at scale), use Apica Flow’s Mutate Function in your pipeline before the data hits the destination. This allows you to pull tags directly from the log source (like Kubernetes labels or AWS tags) and map them to the OTLP keys:

YAML

```
pipeline:
  processors:
    - type: mutate
      config:
        operations:
          - set:
              key: "attributes['ibm.concert.application.id']"
              value: "${metadata.kubernetes.labels.app_id}"
```

#### Validation Check

Once you apply this configuration, run a quick trace. If you see the logs in Concert but they aren't triggering "Insights," check that the Service Name in the logs exactly matches the Service Name in the SBOM (Software Bill of Materials) you uploaded to Concert. If they don't match, Concert won't be able to correlate log errors with code vulnerabilities.
