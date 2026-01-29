# Fluent-bit Disk Plugin

### How to Integrate Fluent-bit Disk Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send Disk metrics to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the Disk Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the Disk Plugin:

```
[INPUT]
    Name Disk
    Tag  Disk
    Interval_Sec  1
    Interval_NSec 0 
```

```
[FILTER]
    Name   modify
    Match  Disk
    Add    namespace Fluent-bit
    Add    app_name Disk
 
```

Restart Fluent-bit with `systemctl restart fluent-bit` and check the status with `systemctl status fluent-bit` to verify that it’s running correctly.

Helpful Links:&#x20;

* [Official Plugin documentation.](https://docs.fluentbit.io/manual/data-pipeline/inputs/disk-io-metrics)
* [Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Explore → Logs & Insights

3\.     Look for the namespace and application name specified in the config file<br>

Example:

<figure><img src="../../../.gitbook/assets/unknown (1) (1).png" alt=""><figcaption></figcaption></figure>

#### 4. Example logs

Message:

{% code overflow="wrap" %}
```
{"app_name":"Disk","date":1764593736.599246,"namespace":"Fluent-bit","read_size":532480,"write_size":40468480}
```
{% endcode %}

StructuredData :

```
_size: 110
date: 1764593736.599246
read_size: 532480
write_size: 40468480
```

#### 5. Troubleshooting

&#x20;[**Fluent-bit Troubleshooting**](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

If you match the logs on disk and they don’t show up in Apica Ascent, you may have to match on **disk.\*** instead as the disk plugin will tag the logs with something like disk.
