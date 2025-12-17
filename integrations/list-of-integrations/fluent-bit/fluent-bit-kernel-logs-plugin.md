# Fluent-bit Kernel Logs Plugin

### How to Integrate Fluent-bit Kernel Logs Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send Kernel Logs to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the Kernel Logs Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the Kernel Logs Plugin:

```
[INPUT]
    Name kmsg
    Tag  kernel
```

```
[FILTER]
    Name          modify
    Match         kernel
    Add namespace Fluent-bit
    Add app_name  Kernel_Logs
```

Restart Fluent-bit with systemctl restart fluent-bit and check the status with systemctl status fluent-bit to verify that it’s running correctly.

Helpful links:

[Official Plugin documentation.](https://docs.fluentbit.io/manual/data-pipeline/inputs/kernel-logs)

[Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Explore → Logs & Insights

3\.     Look for the namespace and application name specified in the config file\
Example:

<figure><img src="../../../.gitbook/assets/image (1132).png" alt=""><figcaption></figcaption></figure>

#### 4. Example logs

Message:

{% code overflow="wrap" %}
```
{"app_name":"Kernel_Logs","date":1765459972.04074,"msg":"systemd-journald[448]: Failed to open system journal: No space left on device","namespace":"Fluent-bit","priority":4,"sec":170736,"sequence":3239959,"usec":40740}
```
{% endcode %}

StructuredData :

```
_size: 219
date: 1765459972.04074
msg: systemd-journald[448]: Failed to open system journal: No space left on device
sec: 170736
sequence: 3239959
usec: 40740
```

#### 5. Troubleshooting

&#x20; [**Fluent-bit Troubleshooting**](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)
