# Metric Indexes

Apica supports forwarding to splunk metrics indexes.&#x20;

Use this option to forward structured **metric data** into Splunk's **metrics index**.

#### Supported Formats:

* Traditional Splunk metric events (single metric per event)
* Enhanced format (multiple metrics per event)

### Configuration Example:

| Field        | Value                        |
| ------------ | ---------------------------- |
| **Host**     | `https://splunk.company.com` |
| **Port**     | `8088`                       |
| **User**     | `admin`                      |
| **Password** | `<your-hec-token>`           |
| **Type**     | `_metric`                    |

> 📌 Ensure the Splunk index receiving these events is a **metrics** index.

<figure><img src="../../../../.gitbook/assets/image (1120).png" alt=""><figcaption><p>Configuration example for an Metric Index Forwarder</p></figcaption></figure>
