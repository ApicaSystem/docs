---
description: Configuring Splunk Universal Forwarder to send data to Apica Ascent
---

# Splunk Universal Forwarder

### Splunk Raw mode

{% hint style="info" %}
Splunk universal forwarders support forwarding raw data as it is collected as well in Splunk's proprietary protocol S2S. Apica Ascent can directly ingest from Splunk UF in the raw mode that does not use proprietary S2S protocol.
{% endhint %}

Splunk Universal Forwarder can be configured to send raw TCP data to Apica Ascent. To enable forwarding to Apica Ascent edit `$SPLUNK_HOME/etc/system/local/outputs.conf` file and enable TCP forwarding.

```
[tcpout]
disabled = false 
defaultGroup = logiq

[tcpout:logiq]
server = <logiq_instance>:<raw port>
sendCookedData=false
negotiateProtocolLevel = 0

```

### Splunk Cooked mode

Apica Ascent can ingest data from Splunk forwarders in cooked mode as well. You can create an S2S Ingest app extension to directly ingest data from Splunk universal forwarder and Heavy forwarder in cooked mode.

{% hint style="success" %}
Logs/Events/Metrics can be ingested into Apica Ascent using cooked mode
{% endhint %}

Go to "Explore" -> "App Extensions" and create your S2S Ingest app extension

<figure><img src="../../.gitbook/assets/Screen Shot 2023-01-02 at 1.20.49 PM.png" alt=""><figcaption><p>S2S Cooked mode plugin</p></figcaption></figure>

{% hint style="success" %}
Multiple S2s Ingest extensions can be running simultaneously
{% endhint %}
