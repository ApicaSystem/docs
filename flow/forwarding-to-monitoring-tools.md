# Forwarding to Target Destinations

From Ascent, data can be filtered and forwarded to many different monitoring tools, resource management tools, and custom endpoints.&#x20;

Here is a [list of available forwarders](list-of-forwarders.md).

#### Configuring a Forwarder <a href="#configuring-a-forwarder" id="configuring-a-forwarder"></a>

The process of configuring a forwarder is simple. To configure a Forwarder, navigate to the Forwarder page first and select your preferred forwarder.

Below, an example of configuring a Splunk HTTP Event Collector:

1. **Creating an HTTP Event Collector Data Input key from Splunk**
   * Navigate to your Splunk Environment
   * Locate the Settings menu
   * Locate the Data Inputs sub-menu
   * Click on the New Token option, which is located on the top banner
   * Enter a Token name, and skip to the last pag,e and click Done
   * Use the generated **HTTP Event Collector** key in Ascent
2. **Creating a Splunk HTTP Event Collector on Apica**
   * Navigate to the Create Forwarders page
   * Click on Forwarders
   * Click on the Splunk HTTP Event Collector

<figure><img src="../.gitbook/assets/image (659).png" alt=""><figcaption><p>Create an Splunk Forwarder</p></figcaption></figure>

* Fill out all the below fields and click Create
  * **buffer\_size**: The Buffer size for logs
  * **host**: Splunk Endpoint
  * **password**: Data Input Key created in step 1
  * **port**: Splunk server receiving port (default 8088)
  * **type:** log format (_default_ \__json, or set to \_metric to send to a metric index_)
  * **user:** UI username of Splunk Endpoint
  * **name**: Name of the forwarder

That's it. You've successfully created the Splunk HTTP Event Collector forwarder. Now navigate to the Explore page and start doing Mapping or Replay operations.
