---
description: Resends previously ingested unmapped logs to a chosen destination.
---

# Replay

Apica's **Replay** feature allows you to send previously ingested logs to a configured destination (e.g., S3 bucket, Splunk HEC endpoint) even if those logs were not mapped to a destination at the time of their ingestion. Replay allows selective resending of logs to the desired destination by user-defined criteria such as time range and attribute match.

&#x20;Replay especially comes in handy when there is an investigation of a historical incident, where a subset of logs can be sent to a destination.\


### How it works:

1. A [forwarder](list-of-forwarders.md) must be configured that sends the logs to the desired destination.\


<figure><img src="../.gitbook/assets/Screenshot from 2025-06-11 11-37-16.png" alt=""><figcaption></figcaption></figure>

2. Navigate to the explore page and select the namespace-application whose logs must be sent to a destination.

<figure><img src="../.gitbook/assets/Screenshot from 2025-06-11 11-44-38.png" alt=""><figcaption></figcaption></figure>

3. Hover over the Ellipsis button, placed above the list of namespace-applications. Once the dropdown appears, click on the  _Replay_ option.

<figure><img src="../.gitbook/assets/Screenshot from 2025-06-11 11-48-48.png" alt=""><figcaption></figcaption></figure>

4. Upon clicking the **Replay** option, a **Replay Configuration** modal will appear. Here, you can select logs from different namespace-application pairs along with their ingestion time range. In the **Forwarder** column, choose the configured forwarder from the dropdown menu.

<figure><img src="../.gitbook/assets/Screenshot from 2025-06-11 11-53-49.png" alt=""><figcaption></figcaption></figure>

5. Additionally, a filter expression can also be added to send only a subset of logs for that particular time range.

<figure><img src="../.gitbook/assets/Screenshot from 2025-06-11 11-55-44.png" alt=""><figcaption></figcaption></figure>
