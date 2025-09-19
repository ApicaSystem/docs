---
description: Configuring Splunk Heavy Forwarder to send data to Apica Ascent
---

# Splunk Heavy Forwarder

### Splunk Raw mode

{% hint style="info" %}
Splunk heavy forwarders support forwarding raw data as it is collected as well in Splunk's proprietary protocol S2S. Apica Ascent can directly ingest from Splunk heavy forwarder in raw mode that does not use proprietary S2S protocol.
{% endhint %}

Splunk Heavy Forwarder can be configured to send raw TCP data to Apica Ascent. To enable forwarding to Apica Ascent edit `$SPLUNK_HOME/etc/system/local/outputs.conf` file and enable TCP forwarding.

```
[tcpout]
disabled = false 
defaultGroup = logiq

[tcpout:logiq]
server = <logiq_instance>:<logiq raw port>
sendCookedData=false
negotiateProtocolLevel = 0

```

### Syslog

#### outputs.conf

```
[syslog]
defaultGroup = forwarders_logiq_syslog

[syslog:forwarders_logiq_syslog]
server = <logiq_instance>:<logiq syslog_port>
```

### RFS:S3

Apica Ascent also fronts an S3 compatible protocol port where Splunk Heavy Forwarders can directly forward data using rfs:s3 output specification. Example is below

#### outputs.conf

```
[rfs:s3]
batchSizeThresholdKB = 3072
batchTimeout = 1
compression = none
path = s3://lq/lq
remote.s3.access_key = <access key>
remote.s3.encryption = none
remote.s3.endpoint = <logiq s3 endpoint>
remote.s3.secret_key = <secret key>
remote.s3.signature_version = v2
remote.s3.supports_versioning = false
remote.s3.url_version = v1
remote.s3.auth_region = us-east-1
```

### Splunk Cooked mode

Apica Ascent can ingest data from splunk forwarders in Cooked mode as well. You can create a S2S Ingest app extension to directly ingest data from Splunk universal forwarder and Heavy forwarder in cooked mode.

{% hint style="success" %}
Logs/Events/Metrics can be ingested into Apica Ascent using cooked mode
{% endhint %}

Go to _"Explore"_ -> _"App Extensions"_ and create your S2S Ingest app extension

<figure><img src="../../.gitbook/assets/Screen Shot 2023-01-02 at 1.20.49 PM.png" alt=""><figcaption><p>S2S Cooked mode plugin</p></figcaption></figure>

{% hint style="success" %}
Multiple S2s Ingest extensions can be running simultaneously
{% endhint %}
