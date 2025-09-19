---
description: >-
  This guide provides a walkthrough of configuring your data pipelines using
  Ascent's Flow solution.
---

# Getting Started with Flow

## Quick Start Guide for Using Ascent's Flow Solution to Optimize Your Data Pipelines.

This guide will teach you how to use the Flow solution to optimize your data pipelines. You will learn how to create a processing pipeline that filters unnecessary data from your logs, reducing storage costs. Finally, you will learn how to route that streamlined data to a downstream observability platform, such as Datadog.

For a full video walkthrough, please refer to our video guide:

{% embed url="https://www.youtube.com/watch?v=An4RCgvGcko" %}

Let's begin.

Prerequisite: Make sure to have logs ingested into the Ascent platform before getting started.

### Step 1: Create A New Pipeline:

Go to -> Explore -> Pipeline

Click -> Actions -> Create Pipeline

<figure><img src="../../.gitbook/assets/image (1055).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (1056).png" alt=""><figcaption></figcaption></figure>

Enter a name for the new Pipeline and press "Create"

### Step 2: Create A Filter Rule:

Click on the 3 dotted lines menu for the Pipeline you created

* Click on "Configure Pipeline"

<figure><img src="../../.gitbook/assets/image (1057).png" alt=""><figcaption></figcaption></figure>

Click on "Add Rule" -> FILTER

<figure><img src="../../.gitbook/assets/image (1058).png" alt=""><figcaption></figcaption></figure>

Enter mandatory fields:

* Name / Group

<figure><img src="../../.gitbook/assets/image (1059).png" alt=""><figcaption></figcaption></figure>

Click on "Drop Labels"

Then, click on "Data Flows"

<figure><img src="../../.gitbook/assets/image (1060).png" alt=""><figcaption></figcaption></figure>

Next, you will select what labels you want to drop.

<figure><img src="../../.gitbook/assets/image (1061).png" alt=""><figcaption></figcaption></figure>

Enter the labels you want to drop on the left hand side as shown below:

<figure><img src="../../.gitbook/assets/image (1062).png" alt=""><figcaption></figcaption></figure>

To preview the changes, go to the right-hand side and click "Pipeline Preview" -> "Run Pipeline"

<figure><img src="../../.gitbook/assets/image (1063).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (1064).png" alt=""><figcaption></figcaption></figure>

Click "Save Pipeline"

Next, "Apply Pipeline" by clicking on the 3 dot menuand clicking "Apply Pipeline"

<figure><img src="../../.gitbook/assets/image (1065).png" alt=""><figcaption></figcaption></figure>

Then, select the namespace and logs you want to apply the new FILTER RULE ( in this case, we are applying it to our "OtelDemo" logs

<figure><img src="../../.gitbook/assets/image (1066).png" alt=""><figcaption></figcaption></figure>

Click "Apply"

<figure><img src="../../.gitbook/assets/image (1067).png" alt=""><figcaption></figcaption></figure>

### Step 2: Create A Filter Rule:

Create a Forwarder (Datadog in this example), to push our FILTERED OTEL logs downstair to another Observability platform.

Click on "Integrations" -> "Forwarders"

<figure><img src="../../.gitbook/assets/image (1069).png" alt=""><figcaption></figcaption></figure>

### Step 3: Create A Forwarder (DataDog in this example):

Click on "Add Forwarder" and select your destination (Datadog in our example)

<figure><img src="../../.gitbook/assets/image (1070).png" alt=""><figcaption></figcaption></figure>

Then, copy over the "DataDog (JSON) configs as shown below:

Buffer\_size: 16000

Host: app.datadog.com

Tags: logs

Type: JSON

Name: Datadog Forwarder

<figure><img src="../../.gitbook/assets/image (1071).png" alt=""><figcaption></figcaption></figure>

Click "Create"

### Step 4: Assign the Forwarder to the Logs:

Next, go back to "Pipelines" and

<figure><img src="../../.gitbook/assets/image (1072).png" alt=""><figcaption></figcaption></figure>

Click on "Map Forwarder" from the 3 dot menu:

<figure><img src="../../.gitbook/assets/image (1073).png" alt=""><figcaption></figcaption></figure>

Select the "DataDog Forwarder" that you created and click OK:

<figure><img src="../../.gitbook/assets/image (1074).png" alt=""><figcaption></figcaption></figure>

### Step 5: Verify Data in Destination (Datadog in this example):

Go to your Datadog dashboard and verify data coming in as expected:

<figure><img src="../../.gitbook/assets/image (1075).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (1076).png" alt=""><figcaption></figcaption></figure>

As you can see, data ingestion has decreased after the FILTER rule was applied:\


<figure><img src="../../.gitbook/assets/image (1078).png" alt=""><figcaption></figcaption></figure>

### Conclusion:

By following this guide, you have learned how to successfully use Flow to manage and optimize your telemetry data. You now know how to build a data pipeline that filters unneeded fields, drops irrelevant log messages entirely, and forwards the clean, cost-effective data to a downstream platform like Datadog. Applying these techniques allows you to significantly reduce observability costs while maintaining cleaner and more efficient data pipelines.

