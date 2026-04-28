# Fluent-bit Slack Forwarder

### How to Forward logs from Apica Ascent to Slack using Fluent-bit

#### 1. Introduction

This guide explains how to forward logs from Apica Ascent to Slack using the slack output plugin with Fluent-bit, and how to view them.

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

In this example we use the [HTTP](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-http-input-plugin) input plugin, Modify filter and the slack output.

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
    Name     slack
    Match    ascent_logs
    Webhook  https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX
```

#### 4. Set up a JavaScript code Forwarder

1\.     Log in to Apica Ascent

2\.     Navigate to **Integrations → Forwarders → Forwarders**

3\.     Click on Add Forwarder

4\.     Select the JavaScript code Forwarder

5\.     Edit the fields to your needs, in this example we use the following:

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

<figure><img src="../../../.gitbook/assets/image (1253).png" alt=""><figcaption></figcaption></figure>

#### 5. Set up pipelines in Apica Ascent to your needs

1\.     Log in to Apica Ascent

2\.     Navigate to **Explore → Pipelines → Pipelines**

3\.     Create one or multiple pipelines (you should use the stream rule if you don’t want all logs in the namespace + application to be forwarded)

4\.     Apply the pipelines to the logs that you want to forward

#### 6. Map the forwarder that you will use on your logs that you want to forward

This can be done in two ways:

1\.     This method requires pipelines.\
In the pipelines page hover over the three dots on the right on your pipeline and click on Map Forwarder.\
Select your forwarder (deselect the default forwarder if you only want your new forwarder) and click on OK

2\.     This method can be done with or without pipelines.\
Navigate to **Explore → Logs & Insights**

Select the logs that you want to forward, hover over the three dots on the right at the top of the list and click on Map Forwarder.\
Select your forwarder (deselect the default forwarder if you only want your new forwarder) and click on OK

#### 7. Verify that your logs arrive at the end destination

1\.        Open your slack app

2\.        Click on the channel that you added in the fluent-bit config

<figure><img src="../../../.gitbook/assets/image (1254).png" alt=""><figcaption></figcaption></figure>

#### 8. Troubleshooting

[Fluent-bit Troubleshooting](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

If logs are not being sent verify that the port is open and that the server can receive data there.

Verify that the logs are in a format that the HTTP plugin can read such as json.

Verify that the webhook url is correct, this can be tested with the following command:

```
curl -v -X POST <YOUR_WEBHOOK_URL> \
  -H "Content-Type: application/json" \
  -d '{"text":"Testing slack webhook for fluent-bit"}'
```
