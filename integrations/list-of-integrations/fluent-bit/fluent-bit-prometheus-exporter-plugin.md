# Fluent-bit Prometheus Exporter Plugin

### How to Integrate Fluent-bit Prometheus Exporter Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send expose metrics with Prometheus Exporter and export them to Apica Ascent with Fluent-bit and Prometheus, and how to view them.

You do not have to use Prometheus to scrape and export the metrics, use can use other methods but it’s not possible to use only fluent-bit with the Prometheus Exporter plugin.

#### 2. Configure the Prometheus Exporter Plugin in Fluent-bit

Update your Fluent-bit.conf with an output for the Prometheus Exporter Plugin:

```
[OUTPUT]
    Name     prometheus_exporter
    Match    prom_scrape
```

This output should be combined with inputs such as the [Prometheus Scrape Metrics plugin](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-prometheus-scrape-metrics-plugin) and a way to scrape and export the metrics.

Restart Fluent-bit with `systemctl restart fluent-bit` and check the status with `systemctl status fluent-bit` to verify that it’s running correctly.

Helpful links:

* [Official Plugin documentation.](https://docs.fluentbit.io/manual/data-pipeline/outputs/prometheus-exporter)
* [Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Configure your scraper and exporter

In this example we will use [Prometheus](https://docs.apica.io/integrations/list-of-integrations/prometheus/prometheus-remote-write), update your prometheus.yml with the following scrape config:

```
scrape_configs:
  - job_name: fluent-bit
    static_configs:
      - targets: ['127.0.0.1:2021']
```

#### 4. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Queries

3\.     Click on New Query in the top right

4\.     Select Ascent Metrics in the dropdown on the left

5\.     Search for a metrics that you have scraped and click on the two arrows next to it to add them to the query

6\.     Click on Execute and verify if you get any metrics\
Example:

<figure><img src="../../../.gitbook/assets/image (1145).png" alt=""><figcaption></figcaption></figure>

#### 5. Troubleshooting

[Fluent-bit Troubleshooting](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

&#x20;
