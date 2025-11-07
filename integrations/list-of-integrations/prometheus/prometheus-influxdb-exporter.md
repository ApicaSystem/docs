# Prometheus Influxdb Exporter

How to Integrate **Prometheus Influxdb Exporter** with **Apica Ascent.**

#### 1. Introduction

This guide explains how to send metrics collected in the line protocol via HTTP API to Apica Ascent, and how to monitor and visualize them. The exporter supports float, int and boolean fields.

You’ll learn:

* How to install Influxdb Exporter
* How to configure Prometheus to scrape Influxdb Exporter metrics
* How to connect Prometheus with Apica Ascent
* How to visualize metrics in dashboards

#### 2. Install and Run Prometheus Influxdb Exporter

If you are new to Prometheus and Influxdb Exporter, here is a simple step-by-step guide:

* Binary installation:
  * Follow the [Installation Guide](https://github.com/prometheus/influxdb_exporter?tab=readme-ov-file#influxdb-exporter-).
* Automated installs:
  * Use [Ansible playbooks](https://github.com/prometheus-community/ansible).
* Containerized deployment:
  * Follow the [Docker instructions](https://docs.influxdata.com/influxdb/v2/install/use-docker-compose/).

By default, Influxdb Exporter runs on port 9122 and exposes metrics at:

```
http://localhost:9122/metrics/exporter 
```

#### 3. Configure Prometheus to Scrape Influxdb Exporter

Update your prometheus.yml with a scrape job for Influxdb Exporter:

```
scrape_configs:
  - job_name: "Influxdb"
    static_configs:
      - targets: ["localhost: 9122"]
```

Restart Prometheus and check the /targets page to verify that metrics are being scraped.

#### 4. Connect Prometheus to Apica Ascent

To send metrics to Apica Ascent, add the following remote\_write configuration to your prometheus.yml:

```
remote_write:
  - url: "https://<ascentEvironment>.apica.io/v1/receive/prometheus"
    tls_config:
      insecure_skip_verify: true
    authorization:
      type: "Bearer"
      credentials: "<YOUR_INGEST_TOKEN>"
```

References:

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
3. Run a query such as:

```
influxdb_http_requests_total
influxdb_write_points_total
influxdb_cache_hits_total
```

4\.     Execute and verify that results are populated.

#### 6. Example Dashboards

You can build dashboards for common system metrics:

* **System Overview**: HTTP requests, Failed writes, Cache hits
* **Alerts**:
  * HTTP requests > or <  X
  * Failed writes > X
  * Cache hits > or < X
* **Dashboard templates**: [GitHub repository](https://github.com/)

#### 7. Troubleshooting

* Influxdb Exporter not reachable → Check firewall on port 9122.
* Prometheus not scraping → Verify prometheus.yml.
* Metrics not in Apica → Validate remote\_write URL and ingest token.
