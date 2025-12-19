# Fluent-bit Prometheus Remote Write Output Plugin

### How to Integrate Fluent-bit Prometheus Remote Write Output Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send metrics with Prometheus remote write to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the Prometheus Remote Write Plugin in Fluent-bit

Update your Fluent-bit.conf with an output for the Prometheus Remote Write Plugin:

```
[OUTPUT]
    Name      prometheus_remote_write
    Match     prom_scrape
    Host      <apica-ascent-endpoint>
    Port      443
    URI       /v1/receive/Prometheus
    Header    Authorization Bearer <Ingest-Token>
    TLS       On
```

This output should be combined with inputs such as the [Prometheus Scrape Metrics plugin](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-prometheus-scrape-metrics-plugin).

Restart Fluent-bit with `systemctl restart fluent-bit` and check the status with `systemctl status fluent-bit` to verify that it’s running correctly.

Helpful links:

* [Official Plugin documentation.](https://docs.fluentbit.io/manual/pipeline/outputs/prometheus-remote-write)
* [Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Queries

3\.     Click on New Query in the top right

4\.     Select Ascent Metrics in the dropdown on the left

5\.     Search for a metrics that you have scraped and click on the two arrows next to it to add them to the query

6\.     Click on Execute and verify if you get any metrics\
Example:

<figure><img src="../../../.gitbook/assets/image (1145).png" alt=""><figcaption></figcaption></figure>

#### 4. Troubleshooting

[Fluent-bit Troubleshooting](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

The host should not include https://
