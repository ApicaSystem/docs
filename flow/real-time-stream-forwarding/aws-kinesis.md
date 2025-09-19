---
description: AWS Kinesis is the AWS managed service for doing real time stream processing
---

# AWS Kinesis

### Pre-Requisites <a href="#pre-requisites" id="pre-requisites"></a>

* Access Key and Secret Key of the IAM role which has access to aws kinesis
* Stream should be available for receiving messages in aws kinesis

### Steps to Create AWS Kinesis Forwarding <a href="#steps-to-create-aws-kinesis-forwarding" id="steps-to-create-aws-kinesis-forwarding"></a>

* Navigate to `Create Forwarder` page
* Select AWS Kinesis forwarder
* Click `Create Forwarder`
* Provide the name for forwarder
* Provide access key, secret key, and stream name
* Click `Create` button

<figure><img src="../../.gitbook/assets/image (523).png" alt=""><figcaption></figcaption></figure>

Whenever the data is getting ingested and its attributes are mapped to AWS kinesis, then that data will be forwarded to the kinesis stream. All types of machine data are supported: logs, metrics, events, alerts, and traces.

[\
](https://logflow-docs.logiq.ai/real-time-stream-forwarding/overview)
