# Fluent-bit MQTT Plugin

### How to Integrate Fluent-bit MQTT Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send MQTT Logs to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the MQTT Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the MQTT Plugin:

```
[INPUT]
    Name mqtt
    Tag  mqtt
```

```
[FILTER]
    Name          modify
    Match         mqtt
    Add namespace Fluent-bit
    Add app_name  MQTT
```

Restart Fluent-bit with systemctl restart fluent-bit and check the status with systemctl status fluent-bit to verify that it’s running correctly.

Helpful links:

[Official Plugin documentation.](https://docs.fluentbit.io/manual/data-pipeline/inputs/mqtt)

[Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Explore → Logs & Insights

3\.     Look for the namespace and application name specified in the config file\
Example:

<figure><img src="../../../.gitbook/assets/image (1134).png" alt=""><figcaption></figcaption></figure>

#### 4. Example logs

Message:

{% code overflow="wrap" %}
```
{"app_name":"MQTT","date":1765794008.603475,"msg":"hello","namespace":"Fluent-bit","topic":"test"}
```
{% endcode %}

StructuredData :

```
_size: 98
date: 1765794008.603475
msg: hello
topic: test
```

#### 5. Troubleshooting

&#x20;[**Fluent-bit Troubleshooting**](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

If you’re testing locally and something is blocking the default port you may need to listen on another one such as 1884
