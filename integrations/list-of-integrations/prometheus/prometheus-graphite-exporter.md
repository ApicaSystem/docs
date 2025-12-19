# Prometheus Graphite Exporter

How to Integrate **Prometheus Graphite Exporter** with **Apica Ascent**:

#### 1. Introduction

This guide explains how to send metrics exported in the Graphite plaintext protocol to Apica Ascent, and how to monitor and visualize them.

You’ll learn:

* How to install Graphite Exporter
* How to configure Prometheus to scrape Graphite Exporter metrics
* How to connect Prometheus with Apica Ascent
* How to visualize metrics in dashboards

#### 2. Install and Run Prometheus Graphite Exporter

If you are new to Prometheus and Graphite Exporter, here is a simple step-by-step guide:

* **Binary installation:**
  * Follow the [Installation Guide](https://github.com/prometheus/graphite_exporter?tab=readme-ov-file#graphite-exporter).
* **Automated installs:**
  * Use [Ansible playbooks](https://github.com/prometheus-community/ansible).
* **Containerized deployment:**
  * Follow the [Docker instructions](https://github.com/prometheus/graphite_exporter?tab=readme-ov-file#using-docker).

By default, Graphite Exporter runs on port 9108 and exposes metrics at:

```
http://localhost:9108/metrics
```

#### 3. Configure Prometheus to Scrape Graphite Exporter

Update your prometheus.yml with a scrape job for Graphite Exporter:

```
scrape_configs:
  - job_name: "graphite_exporter"
    static_configs:
      - targets: ["localhost:9108"]
```

Restart Prometheus and check the /targets page to verify that metrics are being scraped.

#### 4. Connect Prometheus to Apica Ascent

To send metrics to Apica Ascent, add the following remote\_write configuration to your prometheus.yml:

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

Optional: Relabel metrics for easier identification:

```
write_relabel_configs:
  - action: replace
    source_labels: [__name__]
    regex: "(.*)"
    target_label: __name__
    replacement: "ascent_$1"
```

This will rename metrics to ascent\_\<metric-name> before sending them.

#### 5. Verify Metrics in Apica Ascent

1. Log in to Apica Ascent
2. Navigate to Queries → New Query
3. Run a query such as:&#x20;

```
graphite_last_processed_timestamp_seconds
graphite_samples_received_total
graphite_samples_dropped_total
```

4\.     Execute and verify that results are populated.

#### 6. Example Dashboards

You can build dashboards for common system metrics:

* **System Overview**: CPU usage, Memory usage, TCP connections, Samples received/dropped
* **Alerts:**
  * TCP connections > X
  * Samples > or < X
* **Dashboard templates**: [GitHub repository](https://github.com/)

#### 7. Troubleshooting

* Graphite Exporter not reachable → Check firewall on port 9108.
* Prometheus not scraping → Verify prometheus.yml.
* Metrics not in Apica → Validate remote\_write URL and ingest token.
