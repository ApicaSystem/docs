# Upload Confs

The Splunk Forwarder Proxy Source Extension allows users to upload their own custom Splunk configuration files to forward data. The wizard accepts  `outputs.conf` and `server.conf` files. With this, users can have a granular configuration for the Forwarder Proxy, for example, setting up the indexer acknowledgement.  The proxy configuration wizard will ask you to provide the configuration parameters below

* Either upload or paste the outputs.conf and server.conf
* Workers - To scale up forwarding, you can launch with multiple workers
* Version - The version of the forwarder to use. Apica can release new versions of the forwarder over time with newer capabilities.
  * Latest version of plugin is **logiqai/hauler-splstos:v1.5**

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FiZJHeMG2AYSABRbF56vY%252Fimage.png%3Falt%3Dmedia%26token%3Db06400cb-804f-42ec-aced-698cc8cbd2cf&#x26;width=768&#x26;dpr=4&#x26;quality=100&#x26;sign=d7d9b77&#x26;sv=1" alt=""><figcaption></figcaption></figure>
