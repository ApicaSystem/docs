---
description: >-
  This page explains how to forward logs to Azure Log Analytics from Apica
  Ascent
---

# Azure Log Analytics Forwarding

You can forward your logs to the Azure log analytics platform. This will enable you to run queries on our log data which will provide more insights from your data.

#### Prerequisite <a href="#prerequisite" id="prerequisite"></a>

* Azure log analytics workspace

#### Create Log Analytics Forwarder <a href="#create-log-analytics-forwarder" id="create-log-analytics-forwarder"></a>

* Navigate to the integrations page and select the forwarders tab

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252Feanls8MZMqOHIozLh8o9%252FScreenshot%2520from%25202023-09-07%252018-26-51.png%3Falt%3Dmedia%26token%3D5fa8881e-54ba-4ddf-b28b-c8d94a5ad7d6&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=94d8538f&#x26;sv=1" alt=""><figcaption></figcaption></figure>

* Click on the "Add Forwarder" Button and select Log analytics

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FN9wj9pvhY8iUJRhEt59p%252FScreenshot%2520from%25202023-09-07%252018-32-32.png%3Falt%3Dmedia%26token%3D3c7ac14c-de63-46ae-bede-8c4032918e84&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=ed9780a3&#x26;sv=1" alt=""><figcaption></figcaption></figure>

* Provide the `workspace id` of your Log Analytics workspace
* Provide the `Shared Key` from your Log Analytics workspace. This can be found under the agents menu in log analytics
* Select the log type If `Use source type in log as log type` is selected, then the value in the source type attribute from your log will be used as a custom table name. For example, if your log has source\_type `fluent bit` then those logs will be stored under `fluent bit` table in your log analytics workspace. If `Provide log type manually` is selected, then you should provide the log type manually in the `Custom log type` text field.

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FWoXN2XIBChDBCi6hUHvO%252FScreenshot%2520from%25202023-09-07%252018-35-03.png%3Falt%3Dmedia%26token%3Dcd39ec12-b281-417a-984c-54f5bd270f5c&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=8f4d1962&#x26;sv=1" alt=""><figcaption></figcaption></figure>

* You can choose whether you want to send filtered data or raw data to your forwarder by providing the boolean value in `Filter Forward` field
* Provide a name for the forwarder
* Click on Create

After creating the log analytics forwarder, it can be mapped to any namespace and application. Your Log Analytics workspace will get the data once the logs are ingested into the namespace/application that is mapped.
