# State and Topology

API description: See "Internal Observability" in the [Administration API](https://apidocs.apica.io/irondb/admin/index.html)

## Getting Node State

This API call is for viewing the system state of the current node.

Data will be returned as a JSON document. The fields in this document are described below.

### State Output

* `identity` : The UUID that identifies this node.
* `current` : The current topology in which this node resides.
* `next` : The next topology for this node. A value of "-" indicates there is no next topology.
* `base_rollup` : The smallest period that is used for rolling up numeric data.
* `rollups` : An array containing a list of all data periods stored on this node.
* `nntbs` : An object with information about numeric data storage.
  * `rollups` : An array containing a list of all numeric data rollup periods stored on this node.
  * `rollup_<period>` : Data for each configured rollup. There will be one of these entries per rollup period.
    * `fs` : Information about file system storage for this rollup.
      * `id` : The ID for this file system.
      * `totalMb` : Megabytes of data used for this file system.
      * `freeMb` : Megabytes of data available for this file system.
  * `aggregate` : Call counts for all NNTBS data.
    * `get.calls` : The number of GET calls (reads)
    * `put.calls` : The number of PUT calls (writes)
* `text` : An object with information about text data storage.
  * `fs` : Information about file system storage for text data.
    * `id` : The ID for this file system.
    * `totalMb` : Megabytes of data used for this file system.
    * `freeMb` : Megabytes of data available for this file system.
  * `get` : An object with information about text GET calls.
    * `proxy_calls` : The number of text GET proxy calls.
    * `err` : The number of text GET errors.
    * `calls` : The number of text GET calls.
    * `tuples` : The number of text GET tuples.
    * `elapsed_us` : The number of microseconds spent getting text data.
  * `put` : An object with information about text PUT calls.
    * `err` : The number of text PUT errors.
    * `calls` : The number of text PUT calls.
    * `tuples` : The number of text PUT tuples.
    * `elapsed_us` : The number of microseconds spent putting text data.
* `histogram` : An object with information about histogram data storage.
  * `latest_rollup_timestamp` : A Unix epoch timestamp, with milliseconds, representing the most recent point within raw histogram data that has been rolled up.
  * `rollups` : An array containing a list of all histogram data periods stored on this node.
  * `rollup_<period>` : This describes data for each particular rollup. There will be one of these entries per rollup period.
    * `fs` : Information about file system storage for this rollup.
      * `id` : The ID for this file system.
      * `totalMB` : Megabytes of data used for this file system.
      * `freeMB` : Megabytes of data available for this file system.
    * `put.calls` : The number of PUT calls for this histogram period.
    * `put.elapsed_us` : The number of microseconds spent putting data for this histogram period.
    * `get.calls` : The number of GET calls for this histogram period.
    * `get.proxy_calls` : The number of proxy GET calls for this histogram period.
    * `get.count` : The number of metrics retrieved for this histogram period.
    * `get.elapsed_us` : The number of microseconds spent getting data for this histogram period.
  * `aggregate` : The aggregated data from all histogram calls. The fields displayed are the same as those listed for each individual rollup.
* `rusage.utime` : Resource Usage: User CPU time used
* `rusage.stime` : Resource Usage: System CPU time used
* `rusage.maxrss` : Resource Usage: Maximum resident set size
* `rusage.idrss` : Resource Usage: Integral shared memory size
* `rusage.minflt` : Resource Usage: Page reclaims (soft page faults)
* `rusage.majflt` : Resource Usage: Page faults (hard page faults)
* `rusage.nswap` : Resource Usage: Swaps
* `rusage.inblock` : Resource Usage: Block input operations
* `rusage.oublock` : Resource Usage: Block output operations
* `rusage.msgsnd` : Resource Usage: IPC messages sent
* `rusage.msgrcv` : Resource Usage: IPC messages received
* `rusage.nsignals` : Resource Usage: Signals received
* `rusage.nvcsw` : Resource Usage: Voluntary context switches
* `rusage.nivcsw` : Resource Usage: Involuntary context switches
* `max_peer_lag` : The maximum amount, in seconds, by which the data on this node is behind any of the other IRONdb nodes.
* `avg_peer_lag` : The average amount, in seconds, by which the data on this node is behind any of the other IRONdb nodes.
* `indexes` : An object with information about search indexes.
  * `jlog_replay_errors` : The number of errors encountered while replaying outstanding index mutations from an on-disk queue.
* `features` : The licensed features that are enabled on this node.
  * `tags:check` : Appears if check-level tags are enabled on this node.
  * `text:store` : Appears if text data storage is enabled on this node.
  * `histogram:store` : Appears if histogram data storage is enabled on this node.
  * `histogram:dynamic_rollups` : Appears if dynamic histogram rollups are enabled on this node.
  * `nnt:store` : Appears if numeric data storage is enabled on this node.
  * `nnt:second_order` : Appears if second order derivatives for numeric data is enabled on this node.
  * `features` : Appears if feature flagging is enabled on this node.
* `version` : The version of the IRONdb software running on this node.
* `application` : The name of this application.

## Retrieving Gossip JSON Data

This API call retrieves gossip information from a IRONdb node. Gossip data is information on how the nodes are communicating with each other and if any nodes are behind other nodes with regards to data replication.

Data will be returned as an array of JSON objects. The format of these objects is described below.

API description: See "Internal Observability" in the [Administration API](https://apidocs.apica.io/irondb/admin/index.html)

### Gossip JSON Output

Each object in the array has the following form:

* `id` : The UUID of the node whose gossip information follows.
* `gossip_time` : The last time, in seconds, that this node received a gossip message.
* `gossip_age` : The difference, in seconds, between the last time this node received a gossip message and the current time.
* `topo_current` : The topology that is currently in use.
* `topo_next` : The "next" topology to use. A value of "-" indicates there is no next topology.
* `topo_state` : The state of the current topology. This will indicate the current rebalance state, or `n/a` if no rebalance is in progress.
* `latency` : An object that contains information on how far this node is lagging behind the other nodes. The entries will include the following:
  * `<uuid>` : The UUID of the node to which the current node is being compared.
  * `<latency_seconds>` : The number of seconds that the current node is behind the specified node.

## Retrieving Gossip XML Data

This API call retrieves gossip information from a Snowth node. Gossip data is information on how the nodes are communicating with each other and if any nodes are behind other nodes with regards to data replication.

Data will be returned an XML object. The format of this object is described below.

API description: See "Internal Observability" in the [Administration API](https://apidocs.apica.io/irondb/admin/index.html)

### Gossip XML Output

* `<nodes>` : The top-level element for the topology.
  * `<node>` : The container for all the information for a single node in the cluster. There will x of these elements, where "x" is the number of nodes in the cluster.
    * Attributes:
      * `id` : The UUID of the node whose gossip information follows.
      * `gossip_time` : The last time, in seconds, that this node received a gossip message.
      * `gossip_age` : The difference, in seconds, between the last time this node received a gossip message and the current time.
      * `topo_current` : The topology that is currently in use.
      * `topo_next` : The "next" topology to use.
      * `topo_state` : The state of the current topology.
    * `<latency>` : The element containing latency information for all non-local nodes.
      * `<node>` : The element containing latency information for a non-local node.
        * Attributes:
          * `id` : The UUID of the node to which the current node is being compared.
          * `diff` : The number of seconds that the current node is behind the specified node.
