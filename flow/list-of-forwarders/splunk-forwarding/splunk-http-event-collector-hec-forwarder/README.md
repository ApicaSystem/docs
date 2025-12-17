# Splunk HTTP Event Collector (HEC) Forwarder

Apica supports forwarding data to **Splunk HEC (HTTP Event Collector)** indexes using the **HEC Forwarder** integration. You can configure forwarders for both:

1. [Metric Index](metric-indexes.md) (for time-series metric ingestion)
2. [Non-Metric Index](non-metric-indexes.md) (for log and JSON event ingestion)

{% hint style="info" %}
⚠️ **Note:** Ensure your Splunk HEC endpoint is configured correctly. HEC has data rate limits - misconfiguration may result in dropped events.
{% endhint %}

### 🛠️ Setup Steps (Common for All HEC Forwarders)

To configure a Splunk HEC Forwarder in Apica:

1. Go to the **Integrations** menu.
2. Navigate to the **Forwarders** tab.
3. Click **Add Forwarder**.
4. Choose **Splunk HTTP Event Collector (HEC)**.
5. Fill in the following fields:

| Field        | Description                                                                   |
| ------------ | ----------------------------------------------------------------------------- |
| **Host**     | URL or domain of the Splunk HEC endpoint (e.g., `https://splunk.company.com`) |
| **Port**     | HEC port (`8088` by default)                                                  |
| **User**     | Splunk username (typically `admin`)                                           |
| **Password** | The Splunk HEC **token** (not actual user password)                           |
| **Type**     | Choose `_metric` or `_json` depending on the index type                       |



<figure><img src="../../../../.gitbook/assets/Screenshot 2025-05-15 at 5.50.02 AM.png" alt=""><figcaption><p>Create a Splunk HEC Forwarder</p></figcaption></figure>

### 🔐 Creating a Splunk HEC Token in Splunk

To retrieve the HEC token from Splunk:

1. In Splunk, go to **Settings → Data → Data Inputs**.
2. Select **HTTP Event Collector**.
3. Click **Add new token**, set permissions and source types.
4. Copy the generated **HEC token** — use this as the **Password** in the Apica's forwarder setup.

For more details please refer the official [Splunk documentation](https://dev.splunk.com/enterprise/docs/devtools/httpeventcollector/).

***

### Additional Notes

* Both forwarder types support sending data to **external** Splunk HEC endpoints.
* For **non-TLS connections**, use `http://` in the Host URL.
* If you observe **data loss or ingestion issues**, validate the HEC token permissions and Splunk ingest capacity.
