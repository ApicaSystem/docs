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
