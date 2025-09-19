# F5 Big-Ip System

**F5** **BIG-IP** is a comprehensive suite of software and hardware solutions developed by F5 Networks. It’s designed to enhance application availability, access control, and security. &#x20;

One can enhance the Big-Ip system with telemetry streaming capability to push the system's telemetry to the Apica Ascent observability platform.  &#x20;

The process, in brief, is

1. Install the telemetry streaming package (plug-in) to the software.
2. Configure the system telemetry streaming configuration base.
3. Details of the steps are described here.  [https://clouddocs.f5.com/products/extensions/f5-telemetry-streaming/latest/quick-start.html](https://clouddocs.f5.com/products/extensions/f5-telemetry-streaming/latest/quick-start.html)

The telemetry streaming configuration base for Apica Ascent follows,

```
{
    "class": "Telemetry",
    "My_Consumer": {
        "class": "Telemetry_Consumer",
        "type": "Generic_HTTP",
        "host": "replace: Apica endpoint",
        "protocol": "https",
        "port": 443,
        "path": "/v1/json_batch",
        "method": "POST",
        "headers": [
            {
                "name": "content-type",
                "value": "application/json"
            },
            {
                "name": "Authorization",
                "value": "Bearer `>@/passphrase`"
            }
        ],
        "passphrase": {
            "cipherText": "replace: Apica API bearer token here"
        },
        "outputMode": "processed",
        "compressionType": "gzip",
        "customOpts": [
            { "name": "keepAlive", "value": false },
            { "name": "maxSockets", "value": 30 },
            { "name": "maxFreeSockets", "value": 30 }
        ]
    }
}
```

The passphrase is the ingestion API key obtained from the Apica Ascent platform. To retrieve it, refer to the following link:  [https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token](https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token). &#x20;

An optional setting to the above is not to verify the TLS using the optional +setting, _allowSelfSignedCert=true,_

```
// NO TLS verified

"allowSelfSignedCert": true,

```

F5 Big-Ip logs can also be shipped to remote Apica Ascent using the secure syslog port - 7514. If an insecure port is needed for trial, please let the Apica team know.

```
## Activate or goto TMO shell (tmsh)
% tmsh

## modify /sys syslog remote-servers add { <name> { host <IP address or FQDN> remote-port <port> }}
% modify /sys syslog remote-servers add { mysyslog { host 192.68.1.40 remote-port 7514 }}

## save configuration
% save /sys config
```

