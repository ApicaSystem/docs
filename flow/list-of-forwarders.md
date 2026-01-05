---
description: >-
  Apica provides multiple targets to connect with your desired destination to
  collect, optimize, store, route, and replay your observability data –
  whenever, wherever you need it.
---

# List of Forwarders

Currently, **Apica** supports the following targets:

| Target                                                                                                         | Type               | Description                                                             |
| -------------------------------------------------------------------------------------------------------------- | ------------------ | ----------------------------------------------------------------------- |
| [ArcSight Logger](list-of-forwarders/arc-sight.md)                                                             | Syslog, TCP, CEF   | Forward syslog frames over TCP                                          |
| [ArcSight Logger](list-of-forwarders/arc-sight.md)                                                             | Syslog, TCP        | Forward ArcSight CEF frames over TCP                                    |
| [Datadog](list-of-forwarders/datadog-forwarding.md)                                                            | JSON               | Batched JSON forward to Datadog                                         |
| [Dynatrace HTTP Event Collector](list-of-forwarders/dynatrace-forwarding.md)                                   | JSON               | Batched JSON forward to Dynatrace                                       |
| [Elastic Compatible](list-of-forwarders/elasticsearch-forwarding.md)                                           | JSON               | Send data to an Elastic index                                           |
| [RSA NetWitness Syslog](list-of-forwarders/rsa-new-witness.md)                                                 | TCP                | Syslog forwarder for RSA Netwitness                                     |
| [RSA NetWitness Syslog (CEF)](list-of-forwarders/rsa-new-witness.md)                                           | TCP, CEF           | Syslog CEF forwarder for RSA Netwitness                                 |
| [NewRelic HTTP Event Collector](list-of-forwarders/new-relic-forwarding.md)                                    | JSON               | Batched JSON forward to NewRelic                                        |
| [Splunk HTTP Event Collector](list-of-forwarders/splunk-forwarding/splunk-http-event-collector-hec-forwarder/) | JSON               | Batched JSON forward to Splunk                                          |
| [Splunk Universal / Heavy Forwarder](../integrations/list-of-integrations/splunk-universal-forwarder.md)       | Syslog, TCP        | Syslog forwarder for Splunk                                             |
| [Splunk Universal CEF Forwarder](../integrations/list-of-integrations/splunk-universal-forwarder.md)           | Syslog, TCP, CEF   | Syslog CEF forwarder for Splunk                                         |
| [Splunk Universal Forwarder / Heavy Forwarder](../integrations/list-of-integrations/splunk-heavy-forwarder.md) | S2S                | Forward data to Apica in Cooked mode                                    |
| [Object Store](list-of-forwarders/s3-compatible.md) (S3)                                                       | S3 Compatible      | AWS S3, CEPH, Minio, GCP Cloud Storage, OCI Buckets                     |
| [Object Store](object-store-forwarding.md) (Azure Blob)                                                        | Azure Blob Storage | Native support for Azure blob storage API's                             |
| [OpenTelemetry](opentelemetry-forwarding.md)                                                                   | OpenTelemetry      | Forward Logs, Metrics, Traces to OpenTelemetry compatible destinations. |

