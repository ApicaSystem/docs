# Fluent-bit Dummy Plugin

### How to Integrate Fluent-bit Dummy Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send Dummy logs to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the Dummy Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the Dummy Plugin:

```
[INPUT]
    Name        dummy
    Dummy    {"message": "custom dummy"}
    Rate          0.1
    Tag            dummy
```

```
[FILTER]
    Name   modify
    Match  dummy
    Add      namespace Fluent-bit
    Add      app_name Dummy
 
```

Restart Fluent-bit with systemctl restart fluent-bit and check the status with systemctl status fluent-bit to verify that it’s running correctly.

Helpful Links:

* [Official Plugin documentation.](https://docs.fluentbit.io/manual/data-pipeline/inputs/dummy)
* [Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### &#x20;3. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Explore → Logs & Insights

3\.     Look for the namespace and application name specified in the config file

Example:

<figure><img src="../../../.gitbook/assets/unknown (3).png" alt=""><figcaption></figcaption></figure>

#### 4. Example logs

Message:

```
custom dummy
```

StructuredData :

```
_size: 95
date: 1764688718.599576
```

#### 5. Troubleshooting

&#x20; [**Fluent-bit Troubleshooting**](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)
