# Non Metric Indexes

Apica supports forwarding to splunk log indexes.&#x20;

Use this option to forward **logs or structured events** into standard Splunk **log/event indexes**.

Creating a splunk hec forwarder for logs is straight forward and uses the _"\_json"_ type when creating the forwarder

### Configuration Example:

| Field        | Value                        |
| ------------ | ---------------------------- |
| **Host**     | `https://splunk.company.com` |
| **Port**     | `8088`                       |
| **User**     | `admin`                      |
| **Password** | `<your-hec-token>`           |
| **Type**     | `_json`                      |

> Ensure the Splunk index receiving these events is a **standard event/log index**, not a metric index.

<figure><img src="../../../../.gitbook/assets/image (1121).png" alt=""><figcaption><p>Configuration example for a Non Metric Index Forwarder</p></figcaption></figure>
