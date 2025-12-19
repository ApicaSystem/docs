# Prometheus CloudWatch Exporter

How to Integrate Prometheus CloudWatch Exporter with Apica Ascent \
\
1\. Introduction
----------------

This guide explains how to collect AWS service metrics using Prometheus CloudWatch Exporter and send them to Apica Ascent for monitoring and visualization. You’ll learn:

* How to install and configure CloudWatch Exporter
* How to set up Prometheus to scrape CloudWatch metrics
* How to connect Prometheus with Apica Ascent
* How to visualize AWS metrics in dashboards

## 2. Install and Run Prometheus CloudWatch Exporter

### Binary installation:

Download the latest release from https://github.com/prometheus/cloudwatch\_exporter

### Containerized deployment:

Use the official Docker image:

```
docker run -p 9106:9106 \
-v /path/to/config.yml:/config/config.yml \
  prom/cloudwatch-exporter
```

By default, CloudWatch Exporter runs on port 9106 and exposes metrics at:

```
http://<host-ip>:9106/metrics
```

## 3. Configure Prometheus to Scrape CloudWatch Exporter

Update prometheus.yml:

```
scrape_configs:
  - job_name: "cloudwatch_exporter"
    static_configs:
      - targets: ["<host-ip>:9106"]
```

Restart Prometheus and verify on /targets page that metrics are being scraped.

## 4. Connect Prometheus to Apica Ascent

Add remote\_write configuration to prometheus.yml:

```
remote_write:
  - url: "https://<your-ascent-env>/v1/receive/prometheus"
    tls_config:
      insecure_skip_verify: true
    authorization:
      type: "Bearer"
      credentials: "<YOUR_INGEST_TOKEN>"
```

* [More on remote\_write](https://docs.apica.io/integrations/list-of-integrations/prometheus/prometheus-remote-write)
* [Generate an ingest token](https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token)

**Optional:** Relabel metrics for easier identification:

```
write_relabel_configs:
  - action: replace
    source_labels: [__name__]
    regex: "(.*)"
    target_label: __name__
    replacement: "ascent_$1"
```

## 5. Verify Metrics in Apica Ascent

* Log in to Apica Ascent
* Navigate to Queries → New Query

**Example queries:**

```
aws_ec2_cpuutilization_average
aws_sqs_numberofmessagessent_sum
```

## 6. Example Dashboards

**Create dashboards** for AWS services:

* EC2 Overview: CPU %, Network I/O, Disk Ops
* SQS Overview: Messages Sent, Queue Depth

**Alerts:**

* EC2 CPU > 80%
* SQS queue length > threshold

## 7. Troubleshooting

* **Exporter not reachable** → Check port 9106 and container logs.
* **Prometheus not scraping** → Validate prometheus.yml.
* **Metrics missing in Apica** → Check remote\_write URL and token.
* **AWS permissions** → Ensure IAM role has CloudWatch read access.
