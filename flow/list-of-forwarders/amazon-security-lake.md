# Amazon Security Lake

Forwarding data from Apica Ascent to Amazon Security Lake requires a transition from raw OpenTelemetry (OTel) signals into the Open Cybersecurity Schema Framework (OCSF). Unlike standard SIEMs that ingest streams, Security Lake is a data lake that expects data to be "dropped" into an S3 bucket in a highly structured, query-optimized format.

#### 1. The Architectural Strategy

Amazon Security Lake does not provide a direct OTLP/HTTP endpoint. Instead, Apica acts as the OCSF Producer.

* Format: Data must be converted to Apache Parquet.
* Schema: Logs must be mapped to specific OCSF Event Classes (e.g., _Class 4001: Network Activity_).
* Delivery: Apica Flow pushes data to a designated Amazon S3 bucket.

#### 2. Prerequisites in AWS

Before configuring Apica, you must prepare the "Custom Source" in the AWS Console:

1. Enable Security Lake: Ensure the service is active in your preferred region.
2. Create a Custom Source:
   * Navigate to Security Lake > Sources > Add Custom Source.
   * Give it a name (e.g., `Apica_Synthetics`).
   * Note the S3 Bucket Name and the IAM Role ARN provided by AWS.
3. Identify OCSF Class: Decide which OCSF class fits your data. For Apica's AI and Synthetic monitoring, Class 2001 (Security Finding) or Class 4001 (Network Activity) are most common.

#### 3. Detailed Reference: Metadata & Mapping (OTTL)

Because Security Lake is strictly schema-bound, you must use Apica Flow (OTTL) to transform OTel attributes into OCSF fields.

SQL

```
# 1. Map OTel attributes to OCSF 'metadata'
set(attributes["metadata.product.vendor_name"], "Apica")
set(attributes["metadata.product.name"], "Ascent")
set(attributes["metadata.version"], "1.1.0") # OCSF Version

# 2. Map Event Class (e.g., Security Finding)
set(attributes["class_uid"], 2001)
set(attributes["category_uid"], 2) # Findings category

# 3. Map Time and Source (Required for S3 Partitioning)
set(attributes["time"], timestamp)
set(attributes["device.hostname"], resource.attributes["host.name"])
```

#### 4. Implementation: The S3 Forwarder Configuration

In Apica Flow, you will configure an S3 Export Destination. Security Lake requires a specific folder structure (partitioning) to allow Amazon Athena to query the data efficiently.

| **Configuration Field** | **Required Value / Format**                                          |
| ----------------------- | -------------------------------------------------------------------- |
| S3 Bucket               | `aws-security-data-lake-<region>-<account-id>`                       |
| S3 Path Prefix          | `ext/<Source_Name>/region=<region>/accountid=<account_id>/eventDay=` |
| File Format             | Apache Parquet (Snappy or Zstd compression)                          |
| Batch Interval          | 5 minutes (Recommended for query performance)                        |

#### 5. Key Implementation Notes

* The "Unmapped" Field: OCSF is strict. If you have unique Apica data that doesn't fit a standard OCSF field, map it to the `unmapped` attribute as a JSON string. Security Lake will still store it, and you can query it via Athena.
* Partitioning: Security Lake relies on the `eventDay=YYYYMMDD` folder structure. Ensure your Apica S3 forwarder is configured to dynamically generate this path based on the log's timestamp.
* Parquet Conversion: Apica Flow handles the conversion of JSON OTel spans into Parquet files. Ensure the "Parquet" option is toggled in the destination settings to avoid "Invalid Data Format" errors in AWS Glue.
