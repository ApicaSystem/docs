---
description: This page explains how to forward logs to New Relic from Apica
---

# New Relic Forwarding

To Generate API Key from New Relic, please follow the instructions in this [link](https://docs.newrelic.com/docs/logs/log-api/introduction-log-api/#setup).

### Steps to Create New Relic Forwarding <a href="#steps-to-create-new-relic-forwarding" id="steps-to-create-new-relic-forwarding"></a>

To forward your logs to New Relic, begin by logging into Apica's website.

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

* Next, head over to the **`Explore`** page and pick out a namespace you wish to forward your logs to New Relic from.
* Click on the three dots icon located next to the calendar and opt for **`Map Forwarder`**; this will open a new modal which allows you to choose the newly created New Relic forwarder schema (this can be identified via its New Relic icon).
* Confirm your selection by clicking **`OK`**.
* A successful mapping is indicated by a popup showing that namespace-application pairs are connected with respective forwarders; additionally, you'll notice an updated Namespace Forwarder status in effect.
* Your logs are now being forwarded to New Relic.

> To help make the steps easier to understand, below are the screenshots illustrating each of the instructions given above.

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FSOYUDvFQUAZCLXXtkeIm%252FScreenshot%2520from%25202023-01-03%252015-00-19.png%3Falt%3Dmedia%26token%3D8764162b-7c89-4b67-9af8-7d6f87a0c182&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=ca4b9054&#x26;sv=1" alt=""><figcaption><p>Creating New Forwarder from <strong><code>Create -> Forwarder</code></strong> page</p></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FHHhl5qrngXFJzc95YrJF%252FScreenshot%2520from%25202023-01-03%252015-01-00.png%3Falt%3Dmedia%26token%3D325f6d86-4ce0-498f-ad56-729bbac7fbb5&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=98099ae6&#x26;sv=1" alt=""><figcaption><p>Create Forwarder Modal</p></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FanYr0f2brcEMswD0pHWk%252FScreenshot%2520from%25202023-01-03%252015-01-23.png%3Falt%3Dmedia%26token%3Da376a72f-59ed-4411-be09-3517f2611d6a&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=7a972709&#x26;sv=1" alt=""><figcaption><p>Explore page selecting a namespace</p></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FDOWV2grPx0CY4VKrR9s3%252FScreenshot%2520from%25202023-01-03%252015-01-32.png%3Falt%3Dmedia%26token%3Dc8fd7d1d-192d-4154-a37d-888345e5b8b9&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=dc941be7&#x26;sv=1" alt=""><figcaption><p>Map Forwarder</p></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252F6vT6iOVqLPzaUpKQclvg%252FScreenshot%2520from%25202023-01-03%252015-01-45.png%3Falt%3Dmedia%26token%3Dc2d0d04f-393f-431f-a458-cb08d6298861&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=d5ee8f55&#x26;sv=1" alt=""><figcaption><p>Selecting New Relic Forwarder Schema from Dropdown</p></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FxIycg27Wt8QKxRdoJ6iR%252FScreenshot%2520from%25202023-01-03%252015-01-55.png%3Falt%3Dmedia%26token%3D9534890d-20e7-4f9c-913c-b7990ed0d359&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=f514a9bd&#x26;sv=1" alt=""><figcaption><p>Success message after a successful mapping</p></figcaption></figure>
