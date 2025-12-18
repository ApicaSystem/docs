# Fluent-bit Forward Plugin

### How to Integrate Fluent-bit Forward Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send Forward metrics to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the Forward Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the Forward Plugin:

```
[INPUT]
    Name    forward
    Listen  0.0.0.0
    Port    24224
    Tag     forward
```

```
[FILTER]
    Name   modify
    Match  forward
    Add    namespace Fluent-bit
    Add    app_name Forward
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

<figure><img src="../../../.gitbook/assets/image (1146).png" alt=""><figcaption></figcaption></figure>

#### 4.Example logs

Message:

{% code overflow="wrap" %}
```
hello from forward
```
{% endcode %}

&#x20;StructuredData:

```
_size: 103
date: 1765893329.187519
```

#### 5. Troubleshooting

&#x20; [**Fluent-bit Troubleshooting**](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)
