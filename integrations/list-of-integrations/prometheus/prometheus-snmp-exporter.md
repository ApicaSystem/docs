# Prometheus SNMP Exporter

### How to Integrate Prometheus SNMP Exporter with Apica Ascent

#### 1. Introduction

This guide explains how to send SNMP metrics to Apica Ascent, and how to monitor and visualize them.

You’ll learn:

* How to install Snmp Exporter
* How to configure Prometheus to scrape Snmp Exporter metrics
* How to connect Prometheus with Apica Ascent
* How to visualize metrics in dashboards

#### 2. Install and Run Prometheus Snmp Exporter

If you are new to Prometheus and Snmp Exporter, here is a simple step-by-step guide:

* Binary installation:
  * Follow the [Installation Guide](https://github.com/prometheus/snmp_exporter).
* Automated installs:
  * Use [Ansible playbooks](https://github.com/prometheus-community/ansible).

By default, Snmp Exporter runs on port 9116 and exposes metrics at:

* [http://localhost:9116/metrics](http://localhost:9102/metrics%20)

#### 3. Configure Prometheus to Scrape Snmp Exporter

Update your prometheus.yml with a scrape job for Snmp Exporter:

```
scrape_configs:
  - job_name: "Snmp"
    static_configs:
      - targets: ["localhost: 9116"]
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

* [More on remote\_write](https://docs.apica.io/integrations/list-of-integrations/prometheus/prometheus-remote-write)
* [Generate an ingest token](https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token)

**Optional**: Relabel metrics for easier identification:

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
snmp_scrape_duration_seconds
snmp_scrape_request_errors_total
snmp_sys_uptime
```

4\.     Execute and verify that results are populated.&#x20;

#### 6. Example Dashboards

You can build dashboards for common system metrics:

* **System Overview:** System uptime, Interface in/outbound traffic, Snmp scrape duration/errors
* **Alerts:**
  * System uptime  >  X
  * Interface in/outbound traffic > or < X
  * Snmp scrape duration/errors > or < X
* **Dashboard templates:** [GitHub repository](https://github.com/)

#### 7. Troubleshooting

* Snmp Exporter not reachable → Check firewall on port 9116.
* Prometheus not scraping → Verify prometheus.yml.
* Metrics not in Apica → Validate remote\_write URL and ingest token.
