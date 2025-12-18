# Fluent-bit Health Plugin

### How to Integrate Fluent-bit Health Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send Health metrics to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the Health Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the Health Plugin:

```
[INPUT]
    Name     health
    Host     127.0.0.1
    Tag      health
    Port     80
```

```
[FILTER]
    Name   modify
    Match  health
    Add    namespace Fluent-bit
    Add    app_name Health
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

<figure><img src="../../../.gitbook/assets/image (1143).png" alt=""><figcaption></figcaption></figure>

#### 4.Example logs

Message:

{% code overflow="wrap" %}
```
{"alive":false,"app_name":"Health","date":1765566810.188435,"namespace":"Fluent-bit"
```
{% endcode %}

StructuredData :

```
_size: 85
alive: false
date: 1765566810.188435
```

#### 5. Troubleshooting

&#x20; [**Fluent-bit Troubleshooting**](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)
