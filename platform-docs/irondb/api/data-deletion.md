# Data Deletion

## Deleting All Data for a Metric or a Set of Metrics

This API call is for deleting all of the data from an IRONdb node for a specific metric or for a set of metrics (when a tag query is specified). It will remove data for the matching metric(s) throughout all timestamps and all rollups that have been provided by the user, no matter what the data type. In addition, it will remove all record of the metric name(s) with their tags and metadata. This call is intended for removing misnamed/experimental metrics or old metrics which are obsolete and can be safely removed.

When used for deletion of a single metric, this call will return a JSON object that reports if the request succeeded or not.

When used with wildcards or a tag query, this call always returns a JSON object which describes the matching metrics and the actions taken or errors received on the deletion. A list of the possible result statuses for each metric and what they mean can be found [here](data-deletion.md#wildcard-tag-query-and-check-delete-result-statuses). For safety, explicit confirmation is required in the headers to actually force the data deletion.

**It is highly recommended to perform the deletion API call without confirmation as a first step, in order to review what would actually be deleted (and hopefully avoid accidentally deleting more data than intended).**

Deletion is currently only supported on a single node per API call. To delete data from the entire cluster, issue the same API call to each node.

API description: See "Data Deletion" in the [Developer API](https://apidocs.apica.io/irondb/dev/index.html)

### Single Metric Example

```
curl -X DELETE \
     -H 'x-snowth-account-id: 1234' \
     http://127.0.0.1:8112/full/canonical/6f6bdc73-2352-4bdc-ab0e-72f66d0dee12/example
```

In this example:

* `full` : This tells the system that full data and metadata will be removed for the specified metric.
* `canonical` : This tells the system to delete a single metric that matches the given UUID and metric name.
* `1234` : Delete data only for the given account id
* `6f6bdc73-2352-4bdc-ab0e-72f66d0dee12` : Check UUID
* `example` : Metric name

**Sample Output for Single Metric Example**

```
{ "status": "succeeded" }
```

### Query Example

```
curl -X DELETE \
     -H 'x-snowth-account-id: 1234' \
     -H 'x-snowth-confirm-delete: 1' \
     http://127.0.0.1:8112/full/tags?query=and(__check_uuid:6f6bdc73-2352-4bdc-ab0e-72f66d0dee12,__name:multiple_example*)
```

In this example:

* `full` : This tells the system that all data and metadata for the matching metrics will be removed.
* `tags` : This tells the system that this is a tag query.
* `1234` : Delete data only for the given account id
* `1` : Confirm to actually commit to the deletion (we highly recommend omitting this header at first, to examine what will be deleted)
* `query` : See [Tag Queries](../metric-names-and-tags.md#tag-queries) for more info on tag queries.
* `6f6bdc73-2352-4bdc-ab0e-72f66d0dee12`: The UUID to match.
* `multiple_example*`: The metric name to match, with `*` denoting a wildcard.

**Sample Output for Query Example**

```
[ {"metric_name":"multiple_example_cpuutil_server1","delete_result":"not local","payload":""},
  {"metric_name":"multiple_example_cpuutil_server2","delete_result":"ok","payload":""},
  ...
]
```

## Wildcard, Tag Query and Check Delete Result Statuses

When doing a delete which could affect multiple metrics, the returned JSON response will indicate the final status for each metric which matched the request. A list of these statuses and a description is given below. Note that, in many cases, the "payload' field will contain further details.

* `Bad request` : The URI did not conform to expected syntax or inputs for the API
* `Deleted` : Data was found and the deletion completed successfully
* `Found` : Data was found that can be deleted if request is submitted again with delete confirmation
* `Invalid range` : An argument is not within the proper range of allowable values
* `No content` : No data to be deleted was found (prior to the end time if not full delete)
* `Not found` : The metric name was not found
* `Not implemented` : The supplied request is not currently implemented
* `Not local` : The metric's data is not stored or replicated on this node of the cluster
* `Redirected` : The request for deletion was forwarded to another node(s)
* `Server error` : An error occurred while performing the deletion
* `Unable busy` : The deletion request cannot be performed currently, please try later
* `Undefined` : The result code is unknown and not valid
