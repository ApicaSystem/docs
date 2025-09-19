---
description: This page explains how to forward logs to Elasticsearch from Apica.
---

# Elasticsearch Forwarding

To Generate API Key from Elasticsearch, please follow the instructions in this [link](https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-create-api-key.html).

### Steps to Create Elasticsearch Forwarding <a href="#steps-to-create-elasticsearch-forwarding" id="steps-to-create-elasticsearch-forwarding"></a>

To forward your logs to Elasticsearch, begin by logging into Apica's website.

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

* Next, head over to the **`Explore`** page and pick out a namespace you wish to forward your logs to Elasticsearch from.
* Click on the three dots icon located next to the calendar and opt for **`Map Forwarder`**; this will open a new modal which allows you to choose the newly created Elasticsearch forwarder schema (this can be identified via its Elasticsearch icon).
* Confirm your selection by clicking **`OK`**.
* A successful mapping is indicated by a popup showing that namespace-application pairs are connected with respective forwarders; additionally, you'll notice an updated Namespace Forwarder status in effect.
* Your logs are now being forwarded to Elasticsearch.

> To help make the steps easier to understand, below are the screenshots illustrating each of the instructions given above.



<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FJ4qNRDAcZvo13V4VcYoG%252FScreenshot%2520from%25202023-01-03%252019-23-05.png%3Falt%3Dmedia%26token%3Daba95491-8de2-47b9-b978-319dccb2588b&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=1b90603c&#x26;sv=1" alt=""><figcaption><p>Forwarders List (Create -> Forwarder)</p></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252Fyxagy0R7Yg2J1upt8DmB%252FScreenshot%2520from%25202023-01-03%252019-23-11.png%3Falt%3Dmedia%26token%3Dfa8f5593-b4b0-435d-8f4c-f2bf64157fc9&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=dd687d69&#x26;sv=1" alt=""><figcaption><p>New Forwarder</p></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FdN1u3ut95VyMOqBmylaH%252FScreenshot%2520from%25202023-01-03%252019-23-39.png%3Falt%3Dmedia%26token%3D23172fd8-3041-4656-a5e1-3a8a30206e8a&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=572d0f83&#x26;sv=1" alt=""><figcaption><p>Create Forwarder</p></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FmaSEi833oyQbAzxN7jZk%252FScreenshot%2520from%25202023-01-03%252019-23-49.png%3Falt%3Dmedia%26token%3D7f4b87c7-38f2-4856-8524-78570447affc&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=a1794da1&#x26;sv=1" alt=""><figcaption><p>Select a Namespace</p></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252F1psJ0vOCYMCaauk5kdm8%252FScreenshot%2520from%25202023-01-03%252019-24-25.png%3Falt%3Dmedia%26token%3De0d99aba-e014-41c9-91e8-64c988fd03a0&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=3ffb954f&#x26;sv=1" alt=""><figcaption><p>Map Forwarder</p></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252F63aAp2AHQWJ4HRibOpyb%252FScreenshot%2520from%25202023-01-03%252019-24-42.png%3Falt%3Dmedia%26token%3Db073e49c-080c-4405-86a9-6e464d2106ba&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=d13b33ae&#x26;sv=1" alt=""><figcaption><p>Selecting Elasticsearch schema</p></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FlXOziSYtg39kQRmp1VRh%252FScreenshot%2520from%25202023-01-03%252019-25-05.png%3Falt%3Dmedia%26token%3Dde99cbba-5700-432d-9a02-2d2c35503b9d&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=86b3dbc4&#x26;sv=1" alt=""><figcaption><p>Successful mapping</p></figcaption></figure>
