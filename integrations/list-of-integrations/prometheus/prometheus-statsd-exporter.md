# Prometheus Statsd Exporter

How to Integrate **Prometheus Statsd Exporter** with **Apica Ascent:**

#### 1. Introduction

This guide explains how to send metrics collected and translated metrics from Statsd  to Apica Ascent, and how to monitor and visualize them.

You’ll learn:

* How to install Statsd Exporter
* How to configure Prometheus to scrape Statsd Exporter metrics
* How to connect Prometheus with Apica Ascent
* How to visualize metrics in dashboards

#### 2. Install and Run Prometheus Statsd Exporter

If you are new to Prometheus and Statsd Exporter, here is a simple step-by-step guide:

* Binary installation:
  * Follow the [Installation Guide](https://github.com/prometheus/statsd_exporter).
* Automated installs:
  * Use [Ansible playbooks](https://github.com/prometheus-community/ansible).
* Containerized deployment:
  * Follow the [Docker instructions](https://github.com/prometheus/statsd_exporter?tab=readme-ov-file#using-docker).

By default, Statsd Exporter runs on port 9102 and exposes metrics at:

```
http://localhost:9102/metrics
```

#### 3. Configure Prometheus to Scrape Statsd Exporter

Update your prometheus.yml with a scrape job for Statsd Exporter:

```
scrape_configs:
  - job_name: "Statsd"
    static_configs:
      - targets: ["localhost: 9102"]
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
3. Run a query such as:

```
statsd_exporter_tag_errors_total
statsd_exporter_tcp_connections_total
statsd_exporter_udp_packets_total
```

4\.     Execute and verify that results are populated.

#### 6. Example Dashboards

You can build dashboards for common system metrics:

* **System Overview**: TCP connections, UDP packets, Tags
* **Alerts**:
  * Tag errors  >  X
  * UDP packets > or < X
  * TCP connections > or < X
* **Dashboard templates**: [GitHub repository](https://github.com/)

#### 7. Troubleshooting

* Statsd Exporter not reachable → Check firewall on port 9102.
* Prometheus not scraping → Verify prometheus.yml.
* Metrics not in Apica → Validate remote\_write URL and ingest token.
