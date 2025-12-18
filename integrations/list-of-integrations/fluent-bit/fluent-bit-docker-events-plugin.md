# Fluent-bit Docker Events Plugin

### How to Integrate Fluent-bit Docker Events Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send Docker events to Apica Ascent with Fluent-bit, and how to view them.

#### 2. Configure the Docker Event Plugin in Fluent-bit

Update your Fluent-bit.conf with an input and filter for the Docker Event Plugin:

```
[INPUT]
    Name docker_events
    Tag  docker_events
```

```
[FILTER]
    Name   modify
    Match  docker_events
    Add    namespace Fluent-bit:Docker
    Add    app_name Events
 
```

Restart Fluent-bit with `systemctl restart fluent-bit` and check the status with `systemctl status fluent-bit` to verify that it’s running correctly.

Helpful Links:

* [Official Plugin documentation.](https://docs.fluentbit.io/manual/data-pipeline/inputs/docker-events)
* [Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in Apica Ascent

1\.     Log in to Apica Ascent

2\.     Navigate to Explore → Logs & Insights

3\.     Look for the namespace and application name specified in the config file<br>

Example:

<figure><img src="../../../.gitbook/assets/unknown (2).png" alt=""><figcaption></figcaption></figure>

#### &#x20;4. Example logs

Message:

{% code overflow="wrap" %}
```
{"status":"create","id":"598100eb4e301ea850e9ef5243e3051fc340d9c1c5ec961c08b420e8cd18e412","from":"alpine","Type":"container","Action":"create","Actor":{"ID":"598100eb4e301ea850e9ef5243e3051fc340d9c1c5ec961c08b420e8cd18e412","Attributes":{"image":"alpine","name":"youthful_montalcini"}},"scope":"local","time":1764598461,"timeNano":1764598461000012944}
{"status":"attach","id":"598100eb4e301ea850e9ef5243e3051fc340d9c1c5ec961c08b420e8cd18e412","from":"alpine","Type":"container","Action":"attach","Actor":{"ID":"598100eb4e301ea850e9ef5243e3051fc340d9c1c5ec961c08b420e8cd18e412","Attributes":{"image":"alpine","name":"youthful_montalcini"}},"scope":"local","time":1764598461,"timeNano":1764598461092540325}
{"Type":"network","Action":"connect","Actor":{"ID":"510af1adbe04640399d3b3123c3f6ebaebb6ce7996b8edc818e81a64de74d844","Attributes":{"container":"598100eb4e301ea850e9ef5243e3051fc340d9c1c5ec961c08b420e8cd18e412","name":"bridge","type":"bridge"}},"scope":"local","time":1764598461,"timeNano":1764598461500917157}
{"status":"start","id":"598100eb4e301ea850e9ef5243e3051fc340d9c1c5ec961c08b420e8cd18e412","from":"alpine","Type":"container","Action":"start","Actor":{"ID":"598100eb4e301ea850e9ef5243e3051fc340d9c1c5ec961c08b420e8cd18e412","Attributes":{"image":"alpine","name":"youthful_montalcini"}},"scope":"local","time":1764598465,"timeNano":1764598465490355732}
{"Type":"network","Action":"disconnect","Actor":{"ID":"510af1adbe04640399d3b3123c3f6ebaebb6ce7996b8edc818e81a64de74d844","Attributes":{"container":"598100eb4e301ea850e9ef5243e3051fc340d9c1c5ec961c08b420e8cd18e412","name":"bridge","type":"bridge"}},"scope":"local","time":1764598466,"timeNano":1764598466893594461}
{"status":"die","id":"598100eb4e301ea850e9ef5243e3051fc340d9c1c5ec961c08b420e8cd18e412","from":"alpine","Type":"container","Action":"die","Actor":{"ID":"598100eb4e301ea850e9ef5243e3051fc340d9c1c5ec961c08b420e8cd18e412","Attributes":{"execDuration":"0","exitCode":"0","image":"alpine","name":"youthful_montalcini"}},"scope":"local","time":1764598468,"timeNano":1764598468191876214}
{"status":"destroy","id":"598100eb4e301ea850e9ef5243e3051fc340d9c1c5ec961c08b420e8cd18e412","from":"alpine","Type":"container","Action":"destroy","Actor":{"ID":"598100eb4e301ea850e9ef5243e3051fc340d9c1c5ec961c08b420e8cd18e412","Attributes":{"image":"alpine","name":"youthful_montalcini"}},"scope":"local","time":1764598468,"timeNano":1764598468200884059}
{"status":"pull","id":"alpine:latest","Type":"image","Action":"pull","Actor":{"ID":"alpine:latest","Attributes":{"name":"alpine"}},"scope":"local","time":1764598469,"timeNano":1764598469701502511}
```
{% endcode %}

StructuredData :

```
_size: 3043
date: 1764598483.494424
```

#### 5. Troubleshooting

&#x20;[**Fluent-bit Troubleshooting**](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

If you don’t see any docker event logs in Apica Ascent you can verify if your docker generates any events with the following command on your server:&#x20;

```
docker events
```

And in another terminal run the following commands:

```
docker run --rm alpine echo hi
```

```
docker pull alpine
```
