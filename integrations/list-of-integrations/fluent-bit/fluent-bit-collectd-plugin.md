# Fluent-bit Collectd Plugin

### How to Integrate Fluent-bit Collectd Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send collectd metrics to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the Collectd Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the Collectd Plugin:

```
[INPUT]
    Name    collectd
    Listen  0.0.0.0
    Port    25826
    Tag     collectd
    TypesDB /usr/share/collectd/types.db
```

```
 [FILTER]
    Name   modify
    Match  collectd
    Add    namespace Fluent-bit
    Add    app_name Collectd
```

Restart Fluent-bit with `systemctl restart fluent-bit` and check the status with `systemctl status fluent-bit` to verify that it’s running correctly.

Helpful links:

* [Official Plugin documentation.](https://docs.fluentbit.io/manual/data-pipeline/inputs/collectd)
* [Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Explore → Logs & Insights

3\.     Look for the namespace and application name specified in the config file\
Example:

<figure><img src="../../../.gitbook/assets/image (1137).png" alt=""><figcaption></figcaption></figure>

#### 4. Example logs

message :

{% code overflow="wrap" %}
```
{"app_name":"Collectd","date":1765310916.194747,"host":"integration","interval":10,"namespace":"Fluent-bit","plugin":"irq","plugin_instance":"","time":1765310914.815458,"type":"irq","type_instance":"HYP","value":4}
```
{% endcode %}

StructuredData :

```
_size: 228 
date: 1765311555.253928
interval: 10
plugin: processes
type: ps_state
type_instance: 
running value: 0
```

#### 5. Troubleshooting

&#x20;[**Fluent-bit Troubleshooting**](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

Make sure the TypesDB file path is set correctly, wrong path can cause initialization error in fluent-bit.

&#x20;
