# Indexer Cluster (Discovery)

You can launch the proxy to forward data to one or more indexer instances directly by using master/manager indexer discovery. This will auto-discover indexers that are managed by the indexer cluster manager periodically. The discovered indexers are put in a load-balanced group for forwarding. The proxy configuration wizard will ask you to provide the configuration parameters below

* Index to send data to
* Cluster manager API endpoint for indexer discovery - e.g. _https://mysplunk.clustermanager:8089_
* Workers - To scale up forwarding you can launch with multiple workers
* Version - The version of the forwarder to use. Apica can release new versions of the forwarder over time with newer capabilities.
  * Latest version of plugin is **logiqai/hauler-splstos:v0.6**

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252Fo0zwFRpkK1tBGHDAQMSF%252Fimage.png%3Falt%3Dmedia%26token%3D318fa3a3-92b7-4249-ad18-92c4125ce822&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=445e5843&#x26;sv=1" alt=""><figcaption></figcaption></figure>

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FkSxzVrUmbwqvgsHX4i9s%252FScreen%2520Shot%25202022-08-01%2520at%25209.21.05%2520PM.png%3Falt%3Dmedia%26token%3D888e10ef-c08b-4bb6-b01d-8fea9f268dd5&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=2843e6e&#x26;sv=1" alt=""><figcaption><p>Forwarder Proxy configuration via indexer discovery</p></figcaption></figure>
