# Fluent-bit Memory Metrics Plugin

### How to Integrate Fluent-bit Memory Metrics Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send Memory Metrics Logs to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the Memory Metrics Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the Memory Metrics Plugin:

```
[INPUT]
    Name mem
    Tag  memory
```

```
[FILTER]
    Name          modify
    Match         memory
    Add namespace Fluent-bit
    Add app_name  Memory Metrics
```

Restart Fluent-bit with `systemctl restart fluent-bit` and check the status with `systemctl status fluent-bit` to verify that it’s running correctly.

Helpful links:

* [Official Plugin documentation.](https://docs.fluentbit.io/manual/data-pipeline/inputs/memory-metrics)
* [Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Explore → Logs & Insights

3\.     Look for the namespace and application name specified in the config file\
Example:

<figure><img src="../../../.gitbook/assets/image (1133).png" alt=""><figcaption></figcaption></figure>

#### 4. Example logs

Message:

{% code overflow="wrap" %}
```
{"Mem.free":225272,"Mem.total":10174868,"Mem.used":9949596,"Swap.free":0,"Swap.total":0,"Swap.used":0,"app_name":"Memory_Metrics","date":1765792081.187694,"namespace":"Fluent-bit"}
```
{% endcode %}

StructuredData :

```
_size: 180
date: 1765792081.187694
mem.free: 225272
mem.total: 10174868
mem.used: 9949596
swap.free: 0
swap.total: 0
swap.used: 0
```

#### 5. Troubleshooting

&#x20; [**Fluent-bit Troubleshooting**](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)
