# Fluent-bit Datadog Plugin

### How to Integrate Fluent-bit Datadog Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send logs with the Datadog plugin from Apica Ascent to Datadog with Fluent-bit, and how to view them.

#### 2. Configure the Datadog Plugin in Fluent-bit

Update your Fluent-bit.conf with an output for the Datadog Plugin:

```
[OUTPUT]
    Name   datadog
    Match  ascent_logs
    Host   <datadogRegionURL>
    TLS    on
    Apikey <apiKey>
```

Datadog region URLs:

```
US:  http-intake.logs.datadoghq.com
EU:  http-intake.logs.datadoghq.eu
US3: http-intake.logs.us3.datadoghq.com
US5: http-intake.logs.us5.datadoghq.com
```

This output should be combined with an input such as the [HTTP](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-http-input-plugin) plugin.

Restart Fluent-bit with `systemctl restart fluent-bit` and check the status with `systemctl status fluent-bit` to verify that it’s running correctly.

[Official Plugin documentation.](https://docs.fluentbit.io/manual/pipeline/outputs/datadog)

[Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Datadog

1\.     Log in to Datadog

2\.     Navigate to **Logs > Live Tail**

3\.     If you don’t see your logs you can search for them\
Example:

<figure><img src="../../../.gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>

#### 4. Example logs

Event Attributes:

{% code overflow="wrap" %}
```
{
app_name       Ascent_logs_From_Fluent-bit
event {
_size    373
_src_application         Exec
_src_namespace         Fluent-bit
date     1766416608.192148
exec     syslog.9.gz
hostname        localhost
message          {"This log has been exported from Apica Ascent","date":1766416608.192148,"exec":"syslog.9.gz","namespace":"Fluent-bit"}
timestamp      2025-12-22T15:16:49.210409017Z
}
host     localhost
namespace      Fluent-bit
severityString  info
sourcetype      _json
time     1766416609210
timestamp      2025-12-22T15:16:49Z
}
```
{% endcode %}

#### 5. Troubleshooting

[Fluent-bit Troubleshooting](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

If logs are not arriving in Datadog verify that the region your account is in is correct in the URL and that the api key is correct
