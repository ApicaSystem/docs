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

![](https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FCJXjrRF9xLCQJUZIxeSK%252FScreenshot%2520from%25202022-07-19%252022-33-13.png%3Falt%3Dmedia%26token%3D377b53a8-9f11-4abd-98b8-1f39130860d4\&width=768\&dpr=4\&quality=100\&sign=fe7163da\&sv=1)

* In the dialogue box select the Forwarder and click OK

![](https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FuaGBQ9TY8EizxPwXwoIg%252FScreenshot%2520from%25202022-07-19%252022-34-00.png%3Falt%3Dmedia%26token%3Dab96f577-3e24-4e39-a08f-d9f60b11b9e1\&width=768\&dpr=4\&quality=100\&sign=49a8adec\&sv=1)

![](https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FOVy2MJNdyrTeHVcKmedV%252FScreenshot%2520from%25202022-07-19%252022-34-13.png%3Falt%3Dmedia%26token%3D5cbecfbb-b15a-47bb-974e-47149a5fd831\&width=768\&dpr=4\&quality=100\&sign=597a3401\&sv=1)

Congratulations. You have successfully mapped a forwarder to an Application. Navigate to the forwarder UI to check your logs

#### Deleting the Mapping <a href="#deleting-the-mapping" id="deleting-the-mapping"></a>

**1. Deleting the Mapping from Explore page**

To delete the mapped Application/s from the explore page, please follow the below instructions

* Navigate to the Explore page
* Find the Application which is mapped
* Select the Application
* Hover on the Ellipsis icon next to the calendar
* Select Delete Map Forwarder

![](https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FdDqBx3CquW88MYjYT8lw%252FScreenshot%2520from%25202022-07-19%252022-34-54.png%3Falt%3Dmedia%26token%3D957ec76c-40bf-4d12-aa74-9adb51e32974\&width=768\&dpr=4\&quality=100\&sign=8812b602\&sv=1)

* In the dialogue box click Yes to confirm

![](https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FdlqQvdTLTB2Qzn9nOnPC%252FScreenshot%2520from%25202022-07-19%252022-35-04.png%3Falt%3Dmedia%26token%3D5af86cef-caee-42d1-9fcb-51d85019d6dd\&width=768\&dpr=4\&quality=100\&sign=5f4adeb5\&sv=1)

**2. Delete the Mapping from the Forwarders page**

To delete the Mapping from the Forwarders page, please follow the below instructions

* Navigate to the Forwarders page
* Select the Mapping tab
* Click on the Delete icon next to the Application name

![](https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FAM89kKikkILuoQnNMYIi%252FScreenshot%2520from%25202022-07-19%252022-35-42.png%3Falt%3Dmedia%26token%3D9891544e-a613-4bcf-87bc-7a5077f65a6c\&width=768\&dpr=4\&quality=100\&sign=5433d3f8\&sv=1)
