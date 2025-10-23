# Forwarding Data

#### Mapping one or more Applications via Pipelines (Batch) <a href="#mapping-an-application" id="mapping-an-application"></a>

The pipelines table allows a user to apply a forwarder mapping to all data flows under the pipeline. Individual flows can also be mapped/changed under a pipeline in the pipeline table

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-12 at 4.38.26 PM.png" alt=""><figcaption><p>Map Forwarder from Pipelines Table in Pipelines Tab for a batch of flows</p></figcaption></figure>

#### Mapping an Application via Pipelines (Single) <a href="#mapping-an-application" id="mapping-an-application"></a>

Under the pipeline view, expand to see the flows attached to the pipeline. Against each flow you can see a list of actions. Click on map forwarder icon to get the flow mapping created.

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-12 at 4.41.32 PM.png" alt=""><figcaption><p>Map Forwarder from Pipelines Table in Pipelines Tab for a single flow</p></figcaption></figure>

#### Mapping an Application via Explore page <a href="#mapping-an-application" id="mapping-an-application"></a>

Mapping allows one to map an Application or multiple Applications to the desired destination Forwarder such as Splunk, Elastic Search, etc...

To map an Application please follow the below instructions

* Create a Forwarder as described in the previous section
* Navigate to the Explore page
* Select an Application
* Hover on the Ellipsis icon next to the calendar
* Select Map Forwarder
* In the dialogue box select the Forwarder and click OK

The forwarder should now be successfully mapped. Navigate to the forwarder UI to check logs.

#### Deleting the Mapping <a href="#deleting-the-mapping" id="deleting-the-mapping"></a>

**1. Deleting the Mapping from Explore page**

To delete the mapped Application/s from the explore page, please follow the below instructions

* Navigate to the Explore page
* Find the Application which is mapped
* Select the Application
* Hover on the Ellipsis icon next to the calendar
* Select Delete Map Forwarder
* In the dialogue box click Yes to confirm

**2. Delete the Mapping from the Forwarders page**

To delete the Mapping from the Forwarders page, please follow the below instructions

* Navigate to the Forwarders page
* Select the Mapping tab
* Click on the Delete icon next to the Application name
