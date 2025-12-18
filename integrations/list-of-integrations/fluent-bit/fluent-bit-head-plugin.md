# Fluent-bit Head Plugin

### How to Integrate Fluent-bit Head Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send Head metrics to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the Head Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the Head Plugin:

```
[INPUT]
    Name    head
    Tag     head
    File    /var/log/prometheus/prometheus.log.1
```

```
[FILTER]
    Name   modify
    Match  head
    Add    namespace Fluent-bit
    Add    app_name Head
```

Restart Fluent-bit with `systemctl restart fluent-bit` and check the status with `systemctl status fluent-bit` to verify that it’s running correctly.

Helpful links:

* [Official Plugin documentation.](https://docs.fluentbit.io/manual/pipeline/inputs/forward)
* [Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Explore → Logs & Insights

3\.     Look for the namespace and application name specified in the config file\
Example:

<figure><img src="../../../.gitbook/assets/image (1142).png" alt=""><figcaption></figcaption></figure>

#### 4.Example logs

Message:

{% code overflow="wrap" %}
```
{"app_name":"Head","date":1765563662.187878,"head":"time=2025-12-08T01:00:06.395Z level=INFO source=compact.go:598 msg=\"write block\" component=tsdb mint=1765144800590 maxt=1765152000000 ulid=01KBXQHYFTT25P541BJP6TABK2 duration=5.504793919s ooo=false\ntime=2025-12-08T01:00:06.597Z level=INFO source=db.go:1824","namespace":"Fluent-bit"}
```
{% endcode %}

StructuredData :

```
_size: 338
date: 1765563662.187878
head: time=2025-12-08T01:00:06.395Z level=INFO source=compact.go:598 msg="write block" component=tsdb mint=1765144800590 maxt=1765152000000 ulid=01KBXQHYFTT25P541BJP6TABK2 duration=5.504793919s ooo=false
time=2025-12-08T01:00:06.597Z level=INFO source=db.go:1824
```

#### 5. Troubleshooting

&#x20; [**Fluent-bit Troubleshooting**](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)
