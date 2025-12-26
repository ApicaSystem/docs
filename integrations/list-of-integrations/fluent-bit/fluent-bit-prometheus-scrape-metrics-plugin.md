# Fluent-bit Prometheus Scrape Metrics Plugin

### How to Integrate Fluent-bit Prometheus Scrape Metrics Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send metrics scraped from Prometheus to Apica Ascent with Fluent-bit, and how to view them.

As this is a metrics input it will require specific output plugins such as Prometheus Exporter or Prometheus Remote Write.

#### 2. Configure the Prometheus Scrape Metrics Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the Prometheus Scrape Metrics Plugin:

```
[INPUT]
    Name prometheus_scrape
    Tag  prom_scrape
    Host 127.0.0.1
    Port 9090
```

If you have not added one of the required output plugins you can find them in the links below:

[Prometheus Remote Write](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-prometheus-remote-write-output-plugin)

[Prometheus Exporter](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-prometheus-exporter-plugin)

Restart Fluent-bit with `systemctl restart fluent-bit` and check the status with `systemctl status fluent-bit` to verify that it’s running correctly.

Helpful links:

* [Official Plugin documentation.](https://docs.fluentbit.io/manual/data-pipeline/inputs/prometheus-scrape-metrics)
* [Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Queries

3\.     Click on New Query in the top right

4\.     Select Ascent Metrics in the dropdown on the left

5\.     Search for a metrics that you have scraped and click on the two arrows next to it to add them to the query

6\.     Click on Execute and verify if you get any metrics\
Example:

<figure><img src="../../../.gitbook/assets/image (1) (7).png" alt=""><figcaption></figcaption></figure>

#### 4. Troubleshooting

[Fluent-bit Troubleshooting](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

You can verify if there are any metrics to scrape with the following command: `curl http://127.0.0.1:9090/metrics`
