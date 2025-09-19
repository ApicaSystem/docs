# Standalone Instance

You can launch the proxy to forward data to a Splunk standalone instance. The proxy configuration wizard will ask you to provide the configuration parameters below

* Index to send data to
* Standalone Splunk instance URI - `Host:Port` e.g. `mysplunk.instance:9997`
* Workers - To scale up forwarding you can launch with multiple workers
* Version - The version of the forwarder to use. Apica can release new versions of the forwarder over time with newer capabilities.
  * Latest version of plugin is **logiqai/hauler-splstos:v0.6**

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FiZJHeMG2AYSABRbF56vY%252Fimage.png%3Falt%3Dmedia%26token%3Db06400cb-804f-42ec-aced-698cc8cbd2cf&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=d7d9b77&#x26;sv=1" alt=""><figcaption></figcaption></figure>



<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252F8ByJHZEvIJoWt9K2bRrH%252FScreen%2520Shot%25202022-08-01%2520at%25209.21.52%2520PM.png%3Falt%3Dmedia%26token%3Df0cea1c7-457a-440c-a390-e1554c001ea2&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=973364b4&#x26;sv=1" alt=""><figcaption><p>Scale out Forwarding cluster for Standlone Splunk setup</p></figcaption></figure>
