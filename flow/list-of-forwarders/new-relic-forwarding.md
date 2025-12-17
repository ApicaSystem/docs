---
description: This page explains how to forward logs to New Relic from Apica
---

# New Relic Forwarding

To Generate API Key from New Relic, please follow the instructions in this [link](https://docs.newrelic.com/docs/logs/log-api/introduction-log-api/#setup).

### Steps to Create New Relic Forwarding <a href="#steps-to-create-new-relic-forwarding" id="steps-to-create-new-relic-forwarding"></a>

To forward logs to New Relic, begin by logging into Apica's website.

* Navigate to the **`Create`** tab and select the option for **`Forwarder`**.
* Next, choose **`New Relic (HTTP event collector)`** from the available options; this will bring up a new form with fields such as `API Key`, `Host`, `Tags`, etc. Fill out the required data in these fields and click **`Create`**.

Create Forwarder:

Copy

```
Api_Key:       <NEW-RELIC-API-KEY>
Host:          log-api.newrelic.com
Tags:          logflow
Type:          _json
Name:          New Relic
```

* Next, head over to the **`Explore`** page and pick out a namespace to forward logs to New Relic from.
* Click on the three dots icon located next to the calendar and opt for **`Map Forwarder`**; this will open a new modal which allows choosing the newly created New Relic forwarder schema (this can be identified via its New Relic icon).
* Confirm selection by clicking **`OK`**.
* A successful mapping is indicated by a popup showing that namespace-application pairs are connected with respective forwarders; additionally, an updated Namespace Forwarder status should be in effect.
* Logs are now being forwarded to New Relic.
