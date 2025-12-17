# Indexer Cluster (Discovery)

You can launch the proxy to forward data to one or more indexer instances directly by using master/manager indexer discovery. This will auto-discover indexers that are managed by the indexer cluster manager periodically. The discovered indexers are put in a load-balanced group for forwarding. The proxy configuration wizard will ask you to provide the configuration parameters below

* Index to send data to
* Cluster manager API endpoint for indexer discovery - e.g. _https://mysplunk.clustermanager:8089_
* Workers - To scale up forwarding you can launch with multiple workers
* Version - The version of the forwarder to use. Apica can release new versions of the forwarder over time with newer capabilities.
  * Latest version of plugin is **logiqai/hauler-splstos:v1.5**
