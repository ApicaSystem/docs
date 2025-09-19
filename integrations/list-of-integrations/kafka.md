# Kafka

Apica Ascent can run streaming analytics from one or more Kafka topics. Both push and pull modes are supported. The data in Kafka can be pushed to Apica Ascent if the Kafka servers are running inside the customer network. If the Kafka endpoint is accessible to the Apica Ascent network Apica Ascent can pull the data directly from Kafka.

## PUSH Method: Pushing data using logstash

![Push data to Kafka](../../.gitbook/assets/kafka_push.png)

Logstash instances deployed in the customer network can read data from Kafka and push it to Apica Ascent. Use the below configuration to read from Kafka.

### Input Logstash configuration

```
input {
    kafka {
            bootstrap_servers => "localhost:9092"
            topics => "test_topic"
    }
}
```

### Output Logstash Configuration

```
output {
   http {
        url => "https://logiq-dns-or-ip/v1/json_batch"
        headers => { "Authorization" => "Bearer <Auth token>" }
        http_method => "post"
        format => "json_batch"
        content_type => "json_batch"
        pool_max => 300
        pool_max_per_route => 100
        socket_timeout => 60
       }
}
```

You can additionally control the data organization by specifying additional fields

```
filter {
  mutate {
    add_field => { "cluster_id" => "demo-http-test" }
    add_field => { "namespace" => "namespace_name" }
    add_field => { "app_name" => "application_name" }
  }
}
```

## PULL Method : Pulling Data from Kafka topics

Apica Ascent can pull data using Kafka Input Plugins. This method requires the Kafka endpoint to be reachable from Apica Ascent network.

Kafka endpoint, Topic name, namespace, and application name are needed to configure the Kafka input plugin. Namespace and Application define how the data is partitioned in Apica Ascent, see [here for more information](../../observe/log-management-overview/logs-terminology.md).

![Kafka Input App Extension](../../.gitbook/assets/kafka_pull.png)

{% hint style="info" %}
Multiple Pull extensions can be created and running simultaneously
{% endhint %}

Creating a Kafka pull application can be done from the "_Explore_" -> "_App Extensions_"

<figure><img src="../../.gitbook/assets/Screen Shot 2023-01-02 at 5.18.11 PM.png" alt=""><figcaption><p>Kafka/Confluent App Extension</p></figcaption></figure>

The plugin configuration page provides the various options to pick a Kafka topic, consumer group etc.

<figure><img src="../../.gitbook/assets/Screen Shot 2023-01-02 at 5.18.40 PM.png" alt=""><figcaption></figcaption></figure>
