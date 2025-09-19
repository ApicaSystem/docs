# Rebalance

API description: See "Rebalance" in the [Administration API](https://apidocs.apica.io/irondb/admin/index.html)

## Getting Topology Rebalance State

This API call is for viewing the current topology rebalance state.

Data will be returned as a JSON document. The fields in this document are described below.

### Output

* `current` : The current topology in which this node resides.
* `next` : The next topology for this node.
* `state` : Current rebalance state for this node. Value is one of:
  * `TOPO_REBALANCE_IDLE` (no rebalance activity)
  * `TOPO_REBALANCE_VOTE` (establishing agreement on next hash across the cluster)
  * `TOPO_REBALANCE_REHASH` (relocating data)
  * `TOPO_REBALANCE_REHASH_VOTE` (waiting for data relocation completion on all nodes)
  * `TOPO_REBALANCE_CLEANUP` (removing data from old topology)
  * `TOPO_REBALANCE_COMPLETE` (local operations complete, switching to next topology)
  * `TOPO_REBALANCE_COMPLETE_VOTE` (waiting for all other nodes to complete and switch to the next topology)

During a rebalance operation, each node will proceed through the above states in order, returning to `TOPO_REBALANCE_IDLE` when finished. The topology that was listed as "next" is now "current", and "next" is now "-", meaning no next topology.
