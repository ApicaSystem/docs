# Fluent-bit Network I/O Metrics Plugin

### How to Integrate Fluent-bit Network I/O Metrics Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send Network I/O Metrics Logs to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the Network I/O Metrics Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the Network I/O Metrics Plugin:

```
[INPUT]
    Name       netif
    Tag        netif
    Interface  eth0
```

```
[FILTER]
    Name          modify
    Match         netif
    Add namespace Fluent-bit
    Add app_name  Network_I/O_Metrics
```

Restart Fluent-bit with `systemctl restart fluent-bit` and check the status with `systemctl status fluent-bit` to verify that it’s running correctly.

Helpful links:

* [Official Plugin documentation.](https://docs.fluentbit.io/manual/data-pipeline/inputs/network-io-metrics)
* [Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Explore → Logs & Insights

3\.     Look for the namespace and application name specified in the config file\
Example:

<figure><img src="../../../.gitbook/assets/image (1144).png" alt=""><figcaption></figcaption></figure>

#### 4. Example logs

Message:

{% code overflow="wrap" %}
```
{"app_name":"Network_IO_Metrics","date":1765795931.187838,"eth0.rx.bytes":0,"eth0.rx.errors":0,"eth0.rx.packets":0,"eth0.tx.bytes":0,"eth0.tx.errors":0,"eth0.tx.packets":0,"namespace":"Fluent-bit"}
```
{% endcode %}

StructuredData :

```
_size: 197
date: 1765795931.187838
eth0.rx.bytes: 0
eth0.rx.errors: 0
eth0.rx.packets: 0
eth0.tx.bytes: 0
eth0.tx.errors: 0
eth0.tx.packets: 0
```

#### 5. Troubleshooting

&#x20;[**Fluent-bit Troubleshooting**](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)
