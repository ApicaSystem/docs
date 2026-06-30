# Fluent-bit Elasticsearch Forwarder

### How to Forward logs from Apica Ascent to Elasticsearch using Fluent-bit

#### 1. Introduction

This guide explains how to forward logs from Apica Ascent to Elasticsearch using the Elasticsearch (es) output plugin with Fluent-bit, and how to view them.

It’s possible to test this locally by setting up Elasticsearch with docker.

The logs need to be in a json format.

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

In this example we use the [HTTP](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-http-input-plugin) input plugin, Modify filter and the es output.

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
    Name               es
    Match              ascent_logs
    Host               127.0.0.1
    Port               9200
    Index              fluentbit-test
    Logstash_Format    Off
    Retry_Limit        False
    Replace_Dots       On
    Suppress_Type_Name On
```

AWS example:

```
[OUTPUT]
  Name       es
  Match      *
  Host       vpc-test-domain-ke7thhzoo7jawsrhmm6mb7ite7y.us-west-2.es.amazonaws.com
  Port       443
  Index      my_index
  Type       _doc
  AWS_Auth   On
  AWS_Region us-west-2
  tls        On
```

Elastic Cloud example:

```
[OUTPUT]
  Name               es
  Include_Tag_Key    true
  Tag_Key            tags
  tls                On
  tls.verify         Off
  Suppress_Type_Name On
  cloud_id           elastic-obs-deployment:ZXVybxxxxxxxxxxxg==
  cloud_auth         elastic:2vxxxxxxxxYV
```

The index field is what you want to name the entry, if there’s already an entry by that name it will replace it.

#### 4. (Optional) Test the setup loacally

1\. Set up Elasticsearch with docker using the following command:

```
docker run -d --name es-test -p 9200:9200 \
  -e "discovery.type=single-node" \
  -e "xpack.security.enabled=false" \
  docker.elastic.co/elasticsearch/elasticsearch:8.11.1
```

2\. Set up your fluent-bit config with the first example in section 3, you can also use the [dummy](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-dummy-plugin) input plugin to send dummy logs if needed\
The Logstash\_Format field will make the index name different depending on whether you have it on or off.\
On = The logs will end up in an index with the current date in the name e.g. logstash-2026.02.10\
Off = The logs will end up in the index that you specified

3\. Restart fluent-bit

4\. Verify that the logs are forwarded to Elasticsearch with the following commands:

```
curl http://127.0.0.1:9200/_cat/indices?v
```

Example response:

```
health status index               uuid                     pri rep docs.count docs.deleted store.size pri.store.size dataset.size
yellow open   fluentbit-test      A7gQDMtnROCwWRVCYUyx5g    1   1    1441         0          650.8kb     650.8kb        650.8kb
yellow open   logstash-2026.02.10 FPVvLj8LSgC8fZR43rKZEA    1   1    428          0          85.8kb      85.8kb         85.8kb
```

```
curl http://127.0.0.1:9200/fluentbit-test/_search?pretty
```

Example response:

{% code overflow="wrap" %}
```
{
   "_index" : "fluentbit-test",
   "_id" : "3e6hR5wBaVTIXjoG6Ovb",
   "_score" : 1.0,
   "_source" : {
    "@timestamp" : "2026-02-10T12:58:39.121Z",
    "sourcetype" : "_json",
    "host" : "localhost",
    "severityString" : "info",
    "event" : {
      "_src_namespace" : "Fluent-bit",
      "exec" : "syslog.9.gz",
      "date" : "1770728291.192532",
      "timestamp" : "2026-02-10T12:58:12.243190348Z",
      "hostname" : "localhost",
      "_size" : "373",
      "message" : "{\"This log has been exported from Apica Ascent\",\"date\":1770728291.192532,\"exec\":\"syslog.9.gz\",\"namespace\":\"Fluent-bit\"}",
      "_src_application" : "Exec"
    },
    "time" : 1770728292243,
    "timestamp" : "2026-02-10T12:58:12Z",
    "namespace" : "Fluent-bit",
    "app_name" : "HTTP"
}
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

1\. Navigate to your instance where you want to forward your logs

2\. Navigate to logs

3\. You should see your logs if everything is set up correctly and the agent is able to connect

#### 8. Troubleshooting

[Fluent-bit Troubleshooting](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

If logs are not being sent verify that the port is open and that the server can receive data there.

Verify that the logs are in a format that the HTTP plugin can read such as json.

If logs are not arriving in your end destination verify that the host, ID, auth token etc. are correct

If you don’t see any logs in your end destination the following config settings may be required:

```
    Retry_Limit        False
    Replace_Dots       On
    Suppress_Type_Name On
```

You can send a dummy log manually with the following example:

{% code overflow="wrap" %}
```
curl -X POST "http://127.0.0.1:9200/fluentbit-test/_doc" -H 'Content-Type: application/json' -d '{"message":"test"}'
```
{% endcode %}

If you don’t see any logs please test it locally if possible, instructions are in section 4
