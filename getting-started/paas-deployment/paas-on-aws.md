---
description: >-
  This page describes the AWS CloudFormation based deployment for the Apica
  Ascent stack
---

# Deploying Apica Ascent PaaS on AWS

## Overview

Apica Ascent can be deployed on AWS in a single AMI instance in a 1-Click fashion using our CloudFormation template and the Apica Ascent AMI from the Amazon Marketplace.

All the resources required to create and configure Apica Ascent on AWS are taken care by the template. All you need to do is provide a few simple input parameters.

The CloudFormation template can be found in the software subscription at the AWS marketplace

```
https://aws.amazon.com/marketplace/pp/B083ZMYQNV
```

{% hint style="info" %}
Please note that using the Marketplace AMI is not free and you will be charged per the marketplace published rates for Apica Ascent
{% endhint %}

## Apica Ascent UI credentials <a href="#default-user-and-password" id="default-user-and-password"></a>

{% hint style="warning" %}
After the Cloud formation template is complete, it may take several minutes for the UI to be available on the AMI.

The deployment exposes the UI on an http port by default. You can install an ELB to front the UI via https. This is the recommended production setup.
{% endhint %}

Once the Apica Ascent instance is created, you can login to the instance using the below credentials

**user**: _flash-admin@foo.com_

**password**: _flash-password_

e.g. if CloudFormation stack is called Foo and bucket is called Bar the password is Foo-Bar

## AWS Quickstart video

{% embed url="https://www.youtube.com/watch?v=IDmJOF9y5Ac" %}

## Ingesting data

For setting up data ingestion from your endpoints and applications into Apica Ascent, please refer to the [Integrations section](../../integrations/overview/).
