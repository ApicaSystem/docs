# Azure Event Hubs

Azure Events Hubs is a big data streaming platform and event ingestion service capable of receiving and processing millions of events per second. You can integrate your Apica Ascent instance into your event hubs to transform, analyze, and store data received by them.

Setting up data ingestion from your Azure Event Hubs into Apica Ascent involves the following steps.

* Creating an Azure storage account.
* Creating an Event Hubs namespace and event hub
* Configuring Logstash to forward logs to your Apica Ascent instance

### Creating an Azure storage account

To create an Azure storage account, do the following.

1. Log into your Azure portal and select **Storage accounts**.
2. On the **Storage accounts** page, click **Create**.
3. Under **Project details** on the **Basics** tab, select the **Subscription** and **Resource group** for this new storage account.
4. Under **Instance details**, set a unique **Storage account name** and an appropriate **Region**.
5. Click **Review + create**.
6. Once the storage account is created, navigate to the **Access Keys** section.
7. Click **Show keys**.
8. Note down the **Key** and **Connection string** under **key1**.

### Creating an Event Hubs namespace and event hub

An Event Hubs namespace provides a unique scoping container within which you can create one or more event hubs. To create an Event Hubs namespace and an event hub within it, do the following.

1. On your Azure portal, click **Create a resource** > **All services** > **Event Hubs** > **Add**.
2. Under the **Project Details** on the **Basics** tab of the **Create Namespace** page, select the **Subscription** and **Resource group** for this new Event Hubs namespace.
3. Under **Instance details**, provide a **Namespace name**, select a **Location** and set the **Pricing tier** to **Standard**.
4. Click **Review + create**.
5. Review the configuration, click **Create** and wait for the namespace to be created.
6. After the namespace is created, click **Go to resource**.
7. Select **Event Hubs** in the left menu on the namespace page and then click **+ Event Hub**.
8. Provide a **Name** for the event hub.
9. Set **Partition Count** and **Message Retention** to **1**.
10. Set **Capture** to **On**.
11. Set **Time window (minutes)** to **5**.
12. Set **Size window (MB)** to **300**.
13. Under **Capture Provider**, select **Azure Storage Account**.
14. Click **Select Container** and select the storage account you created in the previous step.
15. Click **Create**.
16. After the Event Hub is created, navigate to **Shared Access Policies**.
17. Select your shared access policy and note down the **Primary key** and **Connection string**.

### Configuring Logstash to forward logs

The final step is configuring Logstash to forward event logs from your Azure Event Hub to Apica Ascent. Download and store the following`flattenJSON.rb` file. We will use this file while configuring Logstash.

{% file src="../../../.gitbook/assets/flattenJSON (1).rb" %}

Copy the following Logstash configuration and edit the fields listed in the table below the code.

```
input {
  azure_event_hubs {
    event_hub_connections => ["<Event hub connection string"]
    threads => 5
    decorate_events => true
    storage_connection => "<Storage connector configuration>"
    initial_position => "look_back"
    initial_position_look_back => 72000
  }
}

output { stdout { codec => rubydebug } }
 
filter {
  json {
    source => "message"
    remove_field => "message"
  }
  split { field => "records" }
  date {
    match => ["[records][time]", "ISO8601"]
    target => "@timestamp"
  }
  ruby {
    path => "<Path_to_flattenJSON.rb>"
    script_params => { "field" => "records" }
  }
  mutate {
    split => { "records.RoleLocation" => " " }
    join => { "records.RoleLocation" => "-" }
    add_field => { "namespace" => "events" }
    add_field => { "proc_id" => "%{[records.category]}" }
    add_field => { "cluster_id" => "azure" }
    add_field => { "app_name" => "activity-logs" }
    add_field => { "message" => "%{[records.operationName]}" }
    remove_field => [ "records.message", "records.time" ]
  }
}
output {
  http {
    url => "http://<LOGIQ_endpoint>/v1/json_batch"
    headers => { "Authorization" => "Bearer <LOGIQ_ingest_token> " }
    http_method => "post"
    format => "json_batch"
    content_type => "json_batch"
    pool_max => 2000
    pool_max_per_route => 100
    socket_timeout => 300
  }
}
```

| Field                      | Description                                                               |
| -------------------------- | ------------------------------------------------------------------------- |
| `<Path_to_flattenJSON.rb>` | Local file path where you saved the `flattenJSON.rb` file you downloaded. |
| `<APICA_endpoint>`         | Your Apica Ascent instance endpoint                                       |
| `<APICA_ingest_token>`     | Your Apica Ascent ingest token                                            |
