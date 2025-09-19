---
description: Google Pub/Sub is the GCP managed service for real-time stream processing
---

# Google Pub/Sub

Apica's LogFlow can be used to push data to a PubSub topic with just a few clicks. You can forward data as is, morph the data by stripping down attributes or pick and choose the fields that you want to be sent to the Google PubSub topic

#### Pre-requisites <a href="#pre-requisites" id="pre-requisites"></a>

You will need the following before you can configure forwarding to Google PubSub

1. Name of the Google PubSub topic
2. Project id ( full name not an integer ) for your GCP account project where you created the topic
3. Service account access JSON

{% hint style="info" %}
The service account must have _**pubsub.topics.publish**_ permissions
{% endhint %}

You can check your service account json permissions with gcloud cli

Copy

```bash
$ gcloud auth activate-service-account --project=my-project-123 \
--key-file=sevice_account_key_file.json
$ gcloud pubsub topics publish my-gcp-topic-1 --message="hello"
messageIds:
- '6470211179713996'
$ gcloud pubsub subscriptions pull my-gcp-topic-1-sub --auto-ack
┌───────┬──────────────────┬──────────────┬────────────┬──────────────────┐
│  DATA │    MESSAGE_ID    │ ORDERING_KEY │ ATTRIBUTES │ DELIVERY_ATTEMPT │
├───────┼──────────────────┼──────────────┼────────────┼──────────────────┤
│ hello │ 6470211179713996 │              │            │                  │
└───────┴──────────────────┴──────────────┴────────────┴──────────────────┘
```

#### Creating the forwarder <a href="#creating-the-forwarder" id="creating-the-forwarder"></a>

<figure><img src="../../.gitbook/assets/image (525).png" alt=""><figcaption><p>Create Google PubSub forwarder</p></figcaption></figure>

#### Enter forwarder configuration <a href="#enter-forwarder-configuration" id="enter-forwarder-configuration"></a>

\
![](<../../.gitbook/assets/image (527).png>)Forwarder configuration

#### &#x20;Testing the Google PubSub forwarding <a href="#testing-the-google-pubsub-forwarding" id="testing-the-google-pubsub-forwarding"></a>

You can now test a data replay with a test stream to see if data went through

![](https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FrKQy2e98KGGC6kxaXE7r%252FScreen%2520Shot%25202022-12-02%2520at%252012.41.29%2520PM.png%3Falt%3Dmedia%26token%3D4680879a-bf42-434a-9576-9890e85d584c\&width=768\&dpr=4\&quality=100\&sign=15929889\&sv=1)Replay data to Google PubSub

![](https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FQk21vAu3gBanLmi1rTbC%252FScreen%2520Shot%25202022-12-02%2520at%252012.42.16%2520PM.png%3Falt%3Dmedia%26token%3Dac686a03-01bb-4305-a04f-ee9f1ac7d4dc\&width=768\&dpr=4\&quality=100\&sign=a9454e37\&sv=1)Replay status for Google PubSub forwarded data

![](https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FZZrzGBIGhC4G8LDHbCY7%252FScreen%2520Shot%25202022-12-02%2520at%252012.45.22%2520PM.png%3Falt%3Dmedia%26token%3D880327a5-f9d2-47ca-9a83-c5d697347e37\&width=768\&dpr=4\&quality=100\&sign=4338e289\&sv=1)Visualizing data forwarding to Google PubSub
