# Fluent-bit Docker Metrics Plugin

### How to Integrate Fluent-bit Docker Metrics Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send Docker Metrics to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the Docker Metric Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for Docker Metric Plugin:

```
[INPUT]
    Name docker
    Include      9935eb87ac23
    Tag  docker_metrics
```

```
[FILTER]
    Name   modify
    Match  docker_metrics
    Add    namespace Fluent-bit
    Add    app_name Docker_Metrics
 
```

Restart Fluent-bit with systemctl restart fluent-bit and check the status with systemctl status fluent-bit to verify that it’s running correctly.

If you want to monitor multiple docker containers it needs to be in the following format (a space in between them): \<DockerID> \<DockerID>

Helpful links:

* [Official Plugin documentation.](https://docs.fluentbit.io/manual/data-pipeline/outputs)
* [Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Explore → Logs & Insights

3\.     Look for the namespace and application name specified in the config file.<br>

Example:

<figure><img src="../../../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

#### 4. Example logs

message :

{% code overflow="wrap" %}
```
{"app_name":"Docker_Metrics","cpu_used":423039433,"date":1764676638.402941,"id":"9935eb87ac23","mem_limit":9223372036854772000,"mem_used":3567616,"name":"test-container","namespace":"Fluent-bit"}
```
{% endcode %}

StructuredData :

```
_size: 195
cpu_used: 423039433
date: 1764676638.402941
id: 9935eb87ac23
mem_limit: 9223372036854772000
mem_used: 3567616
name: test-container
```

#### 5. Troubleshooting

* Find running containers: docker ps
* Find all containers: docker ps -a
* Check docker.sock permissions: ls -l /var/run/docker.sock
* Test docker API: sudo curl --unix-socket /var/run/docker.sock [http://localhost/containers/json](http://localhost/containers/json)
* Verify if there are any metrics to scrape: docker stats
