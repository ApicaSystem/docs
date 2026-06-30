# Fluent-bit Dash0 Forwarder

### How to Forward logs from Apica Ascent to Dash0 using Fluent-bit

#### 1. Introduction

This guide explains how to forward logs from Apica Ascent to Dash0 using the HTTP input and the OpenTelemetry output plugins with Fluent-bit, and how to view them.

It’s possible to test the forwarder locally using an OpenTelemetry collector before you start sending your logs to Dash0

#### 2. Do any required port forwarding

The process will be different for each company, provider and OS.

If you manage your firewall at your provider level you will need to allow traffic on the desired port there and possibly on the server itself.

If you manage the firewall on the server level you should make the changes there, the methods will be different depending on your OS.

In our example we used port 4318.

Add a new inbound rule:

```
Type: TCP
Port Range: 4318
Source: 0.0.0.0/0
```

#### 3. Set up an input, filter and output

Update your Fluent-bit.conf with an input, (optional) filter and output.

In this example we use the [HTTP](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-http-input-plugin) input plugin, Modify filter and [OpenTelemetry](https://docs.apica.io/flow/list-of-forwarders/fluent-bit-forwarding/Fluent-bit-Opentelemetry-Forwarder) output.

```
[INPUT]
    Name    http
    Listen  0.0.0.0
    Port    4318
    Tag     ascent_logs
```

```
 [FILTER]
    Name   modify
    Match  ascent_logs
    Add    namespace Fluent-bit
    Add    app_name HTTP
```

```
[OUTPUT]
    Name                 opentelemetry
    Match                ascent_logs
    Host                 <REGION>
    Header               Authorization Bearer <TOKEN>
    Port                 443
    Metrics_uri          /v1/metrics
    Logs_uri             /v1/logs
    Traces_uri           /v1/traces
    Log_response_payload True
    Tls                  On
```

If you’re testing this locally with an OpenTelemetry collector you should remove or comment out the header and change to the following in your output (the port can be changed depending on your needs):

```
    Host                 localhost
    Port                 4319
```

#### 4. (Optional) Test the forwarder locally

You can test the forwarder locally by running an OpenTelemetry collector with docker: `docker run -d --network host -v ~/otel-test/otel-config.yaml:/etc/otel-config.yaml --name otel-collector otel/opentelemetry-collector-contrib:latest --config /etc/otel-config.yaml`

Then make sure that it’s running as healthy (you may have to wait for it to fully start): `docker ps`

If you don’t have any logs to test with you can use the [dummy](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-dummy-plugin) input plugin to send dummy logs:

```
[INPUT]
    Name   dummy
    Dummy  {"message": "custom dummy log"}
    Rate   1
    Tag    ascent_logs
```

You should see your logs with the following command if everything is correctly set up:

`docker logs -f otel-collector`

Example of when it’s successfully forwarding the logs:

{% code overflow="wrap" %}
```
2026-01-28T14:42:25.194Z        info    Logs    {"resource": {"service.instance.id": "054e1513-1ec4-4102-ac15-e3b5c6a77ac5", "service.name": "otelcol-contrib", "service.version": "0.143.1"}, "otelcol.component.id": "debug", "otelcol.component.kind": "exporter", "otelcol.signal": "logs", "resource logs": 1, "log records": 45}
```
{% endcode %}

#### 5. Set up a JavaScript code Forwarder

1\. Log in to Apica Ascent

2\. Navigate to **Integrations → Forwarders → Forwarders**

3\. Click on Add Forwarder

4\. Select the JavaScript code Forwarder

5\. Edit the fields to your needs, in this example we use the following:

```
let cfg = {
    method: "POST",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify(Events),
};
 
let ret = fetchSync("http://<serverIP>:4318/", cfg);
console.log("Response from the endpoint:", ret);
```

<figure><img src="../../../.gitbook/assets/image (1147).png" alt=""><figcaption></figcaption></figure>

#### 6. Set up pipelines in Apica Ascent to your needs

1\. Log in to Apica Ascent

2\. Navigate to **Explore → Pipelines → Pipelines**

3\. Create one or multiple pipelines (you should use the stream rule if you don’t want all logs in the namespace + application to be forwarded)

4\. Apply the pipelines to the logs that you want to forward

#### 7. Map the forwarder that you will use on your logs that you want to forward

This can be done in two ways:

1\. This method requires pipelines.\
In the pipelines page hover over the three dots on the right on your pipeline and click on Map Forwarder.\
Select your forwarder (deselect the default forwarder if you only want your new forwarder) and click on OK

2\. This method can be done with or without pipelines.\
Navigate to **Explore → Logs & Insights**

Select the logs that you want to forward, hover over the three dots on the right at the top of the list and click on Map Forwarder.\
Select your forwarder (deselect the default forwarder if you only want your new forwarder) and click on OK

#### 8. Verify that your logs arrive at the end destination

1\. Navigate to your Dash0 instance

2\. Click on Logging on the left

If everything has been set up correctly you should see your logs.

<figure><img src="../../../.gitbook/assets/image (1212).png" alt=""><figcaption></figcaption></figure>

#### 9. Troubleshooting

[Fluent-bit Troubleshooting](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

If logs are not being sent verify that the port is open and that the server can receive data there.

Verify that the logs are in a format that the HTTP plugin can read such as json.

If logs are not arriving in Dash0 verify that the region your account is in is correct and that the auth token are correct

If you don’t see any logs in Dash0 please test the forwarder locally with an OpenTelemetry collector if possible
