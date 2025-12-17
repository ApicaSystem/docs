# Upload Confs

The Splunk Forwarder Proxy Source Extension allows users to upload their own custom Splunk configuration files to forward data. The wizard accepts  `outputs.conf` and `server.conf` files. With this, users can have a granular configuration for the Forwarder Proxy, for example, setting up the indexer acknowledgement.  The proxy configuration wizard will ask you to provide the configuration parameters below

* Either upload or paste the outputs.conf and server.conf
* Workers - To scale up forwarding, you can launch with multiple workers
* Version - The version of the forwarder to use. Apica can release new versions of the forwarder over time with newer capabilities.
  * Latest version of plugin is **logiqai/hauler-splstos:v1.5**
