---
description: >-
  This document describes how to configure Apica to forward logs to Grafana
  Cloud Loki using the Loki HTTP Push API (/loki/api/v1/push).
---

# Grafana Loki Forwarder – Log Push from Apica

### Prerequisite: Create Grafana Cloud Loki HTTP Connection & Access Policy Token

Before configuring the **Grafana Cloud Loki Forwarder** in Apica, you must create an **HTTP Logs connection** in Grafana Cloud and generate an **Access Policy Token** with permission to push logs.

#### Step 1: Log in to Grafana Cloud

1. Open the **Grafana Cloud Portal**
2. Log in using your Grafana Cloud credentials

#### Step 2: Navigate to Connections

1. Select Add new Connections
2. Select **Custom data**
3. Choose **Logs HTTP**
4. Click **Configure sending logs via HTTP**

#### Step 3: Configure Logs HTTP Connection

1. Under **Select format**, choose:
   * **Via HTTP**
2. Review the Loki HTTP push endpoint shown (this will be used by the forwarder later)

#### Step 4: Generate an Access Policy Token

1. Enter the following details:
   * **Token name**\
     Example: `loki-http-forwarder-token`
   * **Expiration date**\
     Choose based on your security policy
2. Create the token
3.  **Copy and securely store the token**

    > ⚠️ The token will not be shown again

{% hint style="info" %}
#### Required Permissions&#x20;
{% endhint %}

Ensure the selected Access Policy includes the following scopes:

* ✅ logs:write\
  If this is not enabled, log forwarding to **Grafana Loki** will fail.
* ✅ logs:read\
  This must be enabled to query and view logs in **Grafana Cloud**.

#### Step 5: Loki HTTP Endpoint Details

You will need the following values for the forwarder configuration:

* Loki Push Endpoint

```
https://logs-prod-XXXX.grafana.net/loki/api/v1/push
```

* Authorization Header Format

```
Authorization: Bearer <instance_id>:<access_policy_token>
```

#### Step 6: Sample Curl Command (Validation)

Use the following `curl` command to validate that the token and endpoint are working correctly:

{% code overflow="wrap" %}
```
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer <instance_id>:your-api-key" -d '{"streams": [{"stream": {"Language": "Curl", "source": "Shell"},"values": [["'"$(($(date +%s)*1000000000))"'", "This is my log line"]]}]}' https://logs-prod-XXXX.grafana.net/loki/api/v1/push
```
{% endcode %}

#### Step 7: Create New Grafana Loki Forwarder In Ascent

1. Login to **Apica Ascent**
2. Click on **integrations** menu item
3. Click on **Forwarders** tab&#x20;
4. Click on **Add Forwarders** button
5. From the modal select **Grafana Forwarder**
6. Enter the required details click **Create** to create the forwarder

<figure><img src="../../.gitbook/assets/Screenshot from 2026-02-09 14-37-09.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot from 2026-02-09 16-51-19.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (1163).png" alt=""><figcaption></figcaption></figure>

#### Step 8: Map the Forwarder

After creating the Grafana Forwarder, associate it with a data flow to forward logs to Grafana Loki.

1. Navigate to **Logs & Insights**
2. Select the tab called  **Data**
3. **Select the data flow using the check box**
4. **Click on 3 dots, and select Map Forwarder**
5. **From the** Create forwarder mapping modal, select the Grafana Forwarder **and click OK**
6. After successful mapping, the data will start flowing...

<figure><img src="../../.gitbook/assets/Screenshot from 2026-02-09 14-50-50.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot from 2026-02-09 14-52-35.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot from 2026-02-09 14-55-53.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot from 2026-02-09 14-57-50.png" alt=""><figcaption></figcaption></figure>

#### Step 9: Verify the Logs in Grafana Logs

After sending logs successfully to Grafana Cloud Loki, verify that the logs are visible in Grafana.

1. Open the Grafana Cloud stack
2. In the left sidebar, click **Explore**
3. Select **Logs** as the data source
4. Ensure the correct **Loki data source** is selected
5. Use LogQL to query logs, for example:

```
{service_name="ascent-logs"}
```

6. Adjust the time range to **Last 5 minutes** or **Last 15 minutes**
7. Confirm that the log entries forwarded via ascent is visible



<figure><img src="../../.gitbook/assets/image (1164).png" alt=""><figcaption></figcaption></figure>
