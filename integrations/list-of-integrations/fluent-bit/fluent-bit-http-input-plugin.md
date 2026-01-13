# Fluent-bit HTTP Input Plugin

### How to integrate Fluent-bit HTTP input plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send logs with the HTTP input plugin to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the HTTP input Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the HTTP input Plugin:

```
[INPUT]
    Name    http
    Listen  0.0.0.0
    Port    4318
    Tag     ascent_logs
```

```
[FILTER]
    Name   modify
    Match  ascent_logs
    Add    namespace Fluent-bit
    Add    app_name HTTP
```

You could use any free port, port 4318 is not required, it was chosen for this example.

Restart Fluent-bit with `systemctl restart fluent-bit` and check the status with `systemctl status fluent-bit` to verify that it’s running correctly.

[Official Plugin documentation.](https://docs.fluentbit.io/manual/pipeline/inputs/http)

[Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Apica Ascent

1\.     Log in to **Apica Ascent**

2\.     Navigate to **Explore → Logs & Insights**

3\.     Look for the namespace and application name specified in the config file\
Example:

<figure><img src="../../../.gitbook/assets/image (11).png" alt=""><figcaption></figcaption></figure>

#### 4. Example logs

message :

{% code overflow="wrap" %}
```
{"app_name":"HTTP","date":1766477120.303412,"event":{"_size":"373","_src_application":"Exec","_src_namespace":"Fluent-bit","date":"1766477118.191342","exec":"syslog.6.gz","hostname":"localhost","message":"{\"This log has been exported from Apica Ascent\",\"date\":1766477118.191342,\"exec\":\"syslog.6.gz\",\"namespace\":\"Fluent-bit\"}","timestamp":"2025-12-23T08:05:19.208678196Z"},"host":"localhost","namespace":"Fluent-bit","severityString":"info","sourcetype":"_json","time":1766477119208,"timestamp":"2025-12-23T08:05:19Z"}
```
{% endcode %}

StructuredData :

```
_size: 529
date: 1766477120.303412
event._size: 373
event._src_application: Exec
event._src_namespace: Fluent-bit
event.date: 1766477118.191342
event.exec: syslog.6.gz
event.hostname: localhost
event.message: {"This log has been exported from Apica Ascent","date":1766477118.191342,"exec":"syslog.6.gz","namespace":"Fluent-bit"}
event.timestamp: 2025-12-23T08:05:19.208678196Z
sourcetype: _json
```

#### 5. Troubleshooting

[Fluent-bit Troubleshooting](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

If logs are not being sent verify that the port is open and that the server can receive data there.

Verify that the logs are in a format that the HTTP plugin can read such as json.
