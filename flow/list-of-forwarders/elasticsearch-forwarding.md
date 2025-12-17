---
description: This page explains how to forward logs to Elasticsearch from Apica.
---

# Elasticsearch Forwarding

To Generate API Key from Elasticsearch, please follow the instructions in this [link](https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-create-api-key.html).

### Steps to Create Elasticsearch Forwarding <a href="#steps-to-create-elasticsearch-forwarding" id="steps-to-create-elasticsearch-forwarding"></a>

To forward logs to Elasticsearch, begin by logging into Apica's website.

* Navigate to the **`Create`** tab and select the option for **`Forwarder`**.
* Next, choose **`Elasticsearch(HTTP event collector)`** from the available options; this will bring up a new form with fields such as `API Token`, `Buffer Size`, `Index`, etc. Fill out the required data in these fields and click **`Create`**.

Create Forwarder:

Copy

```
Apitoken:      <ELASTIC-API-KEY>
Buffer_size:   20000
Index:         <INDEX-NAME>
Password:      <PASSWORD>
Type:          _json
Urls:          <ELASTIC-ENDPOINT>
User:          <USERNAME>
Name:          Elasticsearch
```

* Next, head over to the **`Explore`** page and pick out a namespace to forward logs to Elasticsearch from.
* Click on the three dots icon located next to the calendar and opt for **`Map Forwarder`**; this will open a new modal which allows choosing the newly created Elasticsearch forwarder schema (this can be identified via its Elasticsearch icon).
* Confirm selection by clicking **`OK`**.
* A successful mapping is indicated by a popup showing that namespace-application pairs are connected with respective forwarders; additionally, an updated Namespace Forwarder status should be in effect.
* Logs are now being forwarded to Elasticsearch.

