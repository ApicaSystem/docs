# List of Indexer Instances

You can launch the proxy to forward data to a one or more indexer instances directly by providing a list of Indexer URI's. This will put the indexers in a load balanced group for forwarding. The limitations here are that you need to know the list of indexers ahead of time. The proxy configuration wizard will ask you to provide the configuration parameters below

* Index to send data to
* Comma separated list of Splunk Indexer URI's - Host:Port e.g. idx1:9997,idx2:9997
* Workers - To scale up forwarding you can launch with multiple workers
* Version - The version of the forwarder to use. Apica can release new versions of the forwarder over time with newer capabilities.
  * Latest version of plugin is **logiqai/hauler-splstos:v0.6**

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FIkojtoC9BSkEktQ2jIx1%252Fimage.png%3Falt%3Dmedia%26token%3D5fb8b960-7c53-4cef-b63a-697bc9280272&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=52715e10&#x26;sv=1" alt=""><figcaption></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FwJNoJlYc15vlphLd78fH%252FScreen%2520Shot%25202022-08-01%2520at%25209.21.30%2520PM.png%3Falt%3Dmedia%26token%3Dd0e2dbee-a943-48bc-ad25-9af8728e61bd&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=9e14e077&#x26;sv=1" alt=""><figcaption><p>Forwarder Proxy configuration to a list of indexer instances</p></figcaption></figure>
