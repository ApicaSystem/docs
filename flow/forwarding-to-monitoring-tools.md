# Forwarding to Target Destinations

From Ascent, data can be filtered and forwarded to many different monitoring tools, resource management tools, and custom endpoints.&#x20;

Here is our [complete list of available forwarders](list-of-forwarders.md).

The process of configuring a forwarder is simple. To configure a Forwarder, **navigate to the Forwarder page** [**link**](list-of-forwarders.md) first and select your preferred forwarder.

#### Configuring a Forwarder (Example)

Below, an example of configuring a Splunk HTTP Event Collector:

1. **Creating an HTTP Event Collector Data Input key from Splunk**
   * Navigate to your Splunk Environment
   * Locate the Settings menu
   * Locate the Data Inputs sub-menu
   * Click on the New Token option, which is located on the top banner
   * Enter a Token name, and skip to the last pag,e and click Done
   * Use the generated **HTTP Event Collector** key in Ascent
2. **Creating a Splunk HTTP Event Collector on Apica**
   * Navigate to the Create Forwarders page
   * Click on Forwarders
   * Click on the Splunk HTTP Event Collector

<figure><img src="../.gitbook/assets/image (659).png" alt=""><figcaption><p>Create an Splunk Forwarder</p></figcaption></figure>

* Fill out all the below fields and click Create
  * **buffer\_size**: The Buffer size for logs
  * **host**: Splunk Endpoint
  * **password**: Data Input Key created in step 1
  * **port**: Splunk server receiving port (default 8088)
  * **type:** log format (_default_ \__json, or set to \_metric to send to a metric index_)
  * **user:** UI username of Splunk Endpoint
  * **name**: Name of the forwarder

That's it. You've successfully created the Splunk HTTP Event Collector forwarder. Now navigate to the Explore page and start doing Mapping or Replay operations.

Currently, **Ascent** supports the following target destinations (among others):

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
