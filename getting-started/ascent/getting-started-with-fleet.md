---
description: >-
  This guide provides a walkthrough of setting up two different types of
  monitoring agents (OTEL / Fluent bit) on a server using the Apica Fleet
  management tool.
---

# Getting Started with Fleet

## Quick Start Guide

This Quick Start Guide for Fleet Management enables a user to quickly enable ingesting metrics and logs into Ascent, and provides step-by-step instructions for deploying monitoring agents using Apica Fleet. By completing this tutorial, you will be able to automatically collect and forward critical server metrics and application logs directly into the Ascent platform for complete visibility.

For the purposes of this guide, we will install and deploy both an OTEL and Fluent Bit collector agent.&#x20;

For a full video walkthrough, please refer to our video guide:

{% embed url="https://www.youtube.com/watch?v=cNCRO2l6jOk" %}

Let's begin:

## Part 1: Installing and Deploying an OpenTelemetry Collector Agent.

### Step 1: Install Agent Manager:

Go to -> Explore -> Fleet

Click -> Install Manager

<figure><img src="../../.gitbook/assets/image (1006).png" alt=""><figcaption></figcaption></figure>

Select Platform: Linux

Select  Agent Type: OpenTelemetry Collector

Click 'Proceed'

<figure><img src="../../.gitbook/assets/image (1007).png" alt=""><figcaption></figcaption></figure>

Click on "Download All"

* Open 'README' file for detailed instructions.

<figure><img src="../../.gitbook/assets/image (1008).png" alt=""><figcaption></figcaption></figure>

### Go to Your Linux Terminal:

NOTE: Transfer 'Fleet Installation File' to the Linux host that you will collect data from.

* make sure file has permissions to allow to 'execute'
* Execute the following command to install the Agent Manager:
* `$ sudo ./fleet-install.sh`

<figure><img src="../../.gitbook/assets/image (1009).png" alt=""><figcaption></figcaption></figure>

Verify that the hostname is in the Fleet "Agents" UI tab:&#x20;

<figure><img src="../../.gitbook/assets/image (1011).png" alt=""><figcaption></figcaption></figure>

### Step 2: Update Your Configuration File:

Go to "Configurations" tab and search for:

* 'otelcol linux default config'

<figure><img src="../../.gitbook/assets/image (1012).png" alt=""><figcaption></figcaption></figure>

Then, click into the file to open the configuration file:

<figure><img src="../../.gitbook/assets/image (1014).png" alt=""><figcaption></figcaption></figure>

Copy the below code block of the Configuration file:

NOTE: You will have to insert your \[ENV\_URL\_HERE]

* Your \[ENV\_URL\_HERE] is your domain name:

<figure><img src="../../.gitbook/assets/image (1015).png" alt=""><figcaption></figcaption></figure>

Copy the below code block into the "Update Configuration" section in the UI:

```
receivers:
  hostmetrics:
    collection_interval: 60s
    scrapers:
      cpu:
        metrics:
          system.cpu.utilization:
            enabled: true
      memory:
        metrics:
          system.linux.memory.available:
            enabled: true
          system.memory.utilization:
            enabled: true
      disk:
      network:
      load:
      filesystem:
        include_virtual_filesystems: true
        metrics:
          system.filesystem.inodes.usage:
            enabled: true
          system.filesystem.usage:
            enabled: true
          system.filesystem.utilization:
            enabled: true
      paging:
      processes:
  filelog:
    include:
      - /var/log/syslog
      - /var/log/auth.log
    start_at: beginning
    operators:
      - type: add
        field: attributes.log_source
        value: ubuntu
      - type: move
        from: attributes["log_source"]
        to: resource["log_source"]
processors:
  attributes/os:
    actions:
      - key: ostype
        value: "linux"
        action: upsert
  attributes/host:
    actions:
      - key: hostname
        value: "{{$ .Agent.host_name }}"
        action: upsert
  batch:
    send_batch_size: 1000
    timeout: 5s
    
exporters:
  debug:
    verbosity: detailed
  prometheus:
    endpoint: 0.0.0.0:9464
  otlphttp/apicametrics:
    compression: gzip
    disable_keep_alives: true
    encoding: proto
    metrics_endpoint: "{{$ .Agent.secret.otelmetrics.endpoint }}"
    headers:
      Authorization: "Bearer {{$ .Agent.secret.otellogs.token }}"
    tls:
      insecure: false
      insecure_skip_verify: true
  otlphttp/logs:
    compression: gzip
    disable_keep_alives: true
    encoding: json
    logs_endpoint: "https://[ENV_URL_HERE]/v1/json_batch/otlplogs?namespace=Linux&application=otellogs"
    headers:
      Authorization: "Bearer {{$ .Agent.secret.otellogs.token }}"
    tls:
      insecure: false
      insecure_skip_verify: true
    sending_queue:
      queue_size: 10000
extensions:
service:
  extensions:
  pipelines:
    metrics/out:
      receivers: [hostmetrics]
      processors: [attributes/host, attributes/os]
      exporters: [otlphttp/apicametrics]
    logs/out:
      receivers: [filelog]
      processors: [attributes/host, batch]
      exporters: [otlphttp/logs]
```

NOTE: Currently, this configuration file is set up to collect syslogs. If you would like to collect different types of logs adjust the path to the logs you want to ingest:

```
   filelog:
    include:
      - /var/log/syslog
      - /var/log/auth.log
```

### Step 3: Apply the Changes Made to the Configuration File:

Copy the below code block into the "Update Configuration" section in the UI:

<figure><img src="../../.gitbook/assets/image (1016).png" alt=""><figcaption></figcaption></figure>

Click "Update".

Then, go back to the "Agent" tab and click into the Linux hostname (where you'll be ingesting data from):

<figure><img src="../../.gitbook/assets/image (740).png" alt=""><figcaption></figcaption></figure>

### Step 4: Verify Metrics/Logs Are Being Ingested into Ascent:

Verify that logs/metrics are coming in and that it shows as "active":

<figure><img src="../../.gitbook/assets/image (741).png" alt=""><figcaption></figcaption></figure>

To verify Metrics are being ingested, go to Queries -> New Query and search for the host to verify data is there:

<figure><img src="../../.gitbook/assets/image (744).png" alt=""><figcaption></figcaption></figure>

## Part 2: Installing and Deploying a  Fluent Bit Agent.

Similar to Part 1 (installing/deploying OTEL Agent), we will now install a Fluent Bit agent to collect logs.

### Step 1: Install Agent Manager:

Go to -> Explore -> Fleet

Click -> Install Manager

<figure><img src="../../.gitbook/assets/image (1006).png" alt=""><figcaption></figcaption></figure>

Select Platform: Linux

Select  Agent Type: Fluent-bit

Click 'Proceed'

<figure><img src="../../.gitbook/assets/image (745).png" alt=""><figcaption></figcaption></figure>

Click on "Download All"

* Open 'README' file for detailed instructions.

<figure><img src="../../.gitbook/assets/image (1008).png" alt=""><figcaption></figcaption></figure>

### Go to Your Linux Terminal:

NOTE: Transfer 'Fleet Installation File' to the Linux host that you will collect data from.

* make sure file has permissions to allow to 'execute'
* Execute the following command to install the Agent Manager:
* `$ sudo ./fleet-install.sh`

<figure><img src="../../.gitbook/assets/image (1009).png" alt=""><figcaption></figcaption></figure>

Verify that the hostname is in the Fleet "Agents" UI tab:

<figure><img src="../../.gitbook/assets/image (748).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (749).png" alt=""><figcaption></figcaption></figure>

### Step 2: Update Your Configuration File:

1. In the configuration, specify the following:
   * The file path to your application logs.
   * The hostname attribute.
   * Your ingest token.



<figure><img src="../../.gitbook/assets/image (750).png" alt=""><figcaption></figcaption></figure>

From the Fleet UI, select the Fluent Bit agent and apply this new configuration.

You can verify that the token and hostname have been applied correctly within the agent's detail view.

<figure><img src="../../.gitbook/assets/image (751).png" alt=""><figcaption></figcaption></figure>

### Step 4: Verify Logs Are Being Ingested into Ascent:

Verify that logs/metrics are coming in and that it shows as "active":

<figure><img src="../../.gitbook/assets/image (752).png" alt=""><figcaption></figcaption></figure>

Finally, go to Explore -> 'Logs & Insights' to verify the datasource is there:

<figure><img src="../../.gitbook/assets/image (753).png" alt=""><figcaption></figcaption></figure>

Click into the "Source Application" and you can then drill down into a log entry:

<figure><img src="../../.gitbook/assets/image (754).png" alt=""><figcaption></figcaption></figure>

### Conclusion:

You have now completed the setup for both metrics and log collection using Apica Fleet. With your agents actively reporting, you can fully leverage the Ascent platform to analyze performance, troubleshoot issues, and gain deeper insights into your system. To expand your coverage, simply repeat these steps for other hosts and applications in your infrastructure.
