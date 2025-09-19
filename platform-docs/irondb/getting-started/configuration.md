---
description: Configuration files and options.
---

# Configuration

IRONdb is implemented using [libmtev](https://github.com/circonus-labs/libmtev/), a framework for building high-performance C applications. You may wish to review the libmtev [configuration documentation](http://circonus-labs.github.io/libmtev/config/) for an overview of how libmtev applications are configured generally.

This document deals with options that are specific to IRONdb, but links to relevant libmtev documentation where appropriate.

Default values are those that are present in the default configuration produced during initial installation.

Time periods are specified as second-resolution [libmtev time durations](https://circonus-labs.github.io/libmtev/config/time_durations.html).

## irondb.conf

This is the primary configuration file that IRONdb reads at start. It includes additional configuration files which are discussed later.

### snowth

```
<snowth lockfile="/irondb/logs/snowth.lock" text_size_limit="512">
```

IRONdb's libmtev application name. This is a required node and **must not** be changed.

**snowth lockfile**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#snowth-lockfile)

Path to a file that prevents multiple instances of the application from running concurrently. You should not need to change this.

Default: `/irondb/logs/snowth.lock`

**snowth text\_size\_limit**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#snowth-text_size_limit)

The maximum length of a text-type metric value. Text metric values longer than this limit will be truncated.

Default: 512

> Text-type metrics are supported in IRONdb but Graphite currently has no way to render these when using a Storage Finder plugin.

### cache

```
<cache cpubuckets="128" size="0"/>
```

An LRU cache of open filehandles for numeric metric rollups. This can improve rollup read latency by keeping the on-disk files for frequently-accessed streams open.

**cache cpubuckets**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#cache-cpubuckets)

The cache is divided up into the specified number of "buckets" to facilitate concurrent access by multiple threads. This parameter rarely requires tuning.

Default: 128

### logs

Libmtev logging configuration. See the [libmtev logging documentation](http://circonus-labs.github.io/libmtev/config/logging.html).

By default, the following log files are written and automatically rotated, with the current file having the base name and rotated files having an epoch-timestamp suffix denoting when they were created:

* `/irondb/logs/errorlog`: Output from the daemon process, including not just errors but also operational warnings and other information that may be useful to Apica Support.
  * Rotated: 24 hours
  * Retained: 1 week
* `/irondb/logs/startuplog`: Additional non-error initialization output.
  * Rotated: 24 hours
  * Retained: 1 week
* `/irondb/logs/accesslog`: Logs from the REST API, including metric writes and reads as well as inter-node communication.
  * Rotated: 1 hour
  * Retained: 1 week

**Logging old data submission**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#logging-old-data-submission)

Sometimes it may be desirable to log data submissions that are older than some threshold, in order to identify the source. Submitting "old" data can cause issues with rollups being interrupted, as well as introducing unwanted changes to historical data. IRONdb has a debug-level logging facility for recording such submissions.

Since version 0.20.2 a configuration to log such submissions has been available. It is not active by default, but can be activated by setting `disabled="false"` on the `debug/old_data` log:

```
<log name="debug/old_data" disabled="false"/>
```

The threshold for what is considered "old" is controlled by `metric_age_threshold`. The value is a [libmtev time duration](https://circonus-labs.github.io/libmtev/config/time_durations.html) string representing an offset into the past from "now". The default is 7 days. Any data submitted with a timestamp that is further in the past will be logged.

```
<old_data_logging metric_age_threshold="7d"/>
```

### listeners

Libmtev network listener configuration. See the [libmtev listener documentation](http://circonus-labs.github.io/libmtev/config/listeners.html).

Each listener below is configured within a `<listener>` node. Additional listeners may be configured if desired, or the specific address and/or port may be modified to suit your environment.

**Main listener**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#main-listener)

```
<listener address="*" port="8112" backlog="100" type="http_rest_api" accept_thread="on" fanout="true" ssl="off">
  <config>
    <document_root>/opt/circonus/share/snowth-web</document_root>
  </config>
</listener>
```

The main listener serves multiple functions:

* [HTTP REST API](../api/)
* [Cluster replication](../administration/operations.md#replication) (TCP) and gossip (UDP)
* [Operations Dashboard](../administration/operations.md#operations-dashboard)
* JSON-formatted node statistics (`http://thisnode:thisport/stats.json`)

**Main listener address**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#main-listener-address)

The IP address on which to listen, or the special `*` to listen on any local IP address.

Default: `*`

**Main listener port**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#main-listener-port)

The port number to listen on. For the main listener this will utilize both TCP and UDP.

Default: 8112

**Main listener backlog**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#main-listener-backlog)

The size of the queue of pending connections. This is used as an argument to the standard `listen(2)` system call. If a new connection arrives when this queue is full, the client may receive an error such as ECONNREFUSED.

Default: 100

**Main listener type**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#main-listener-type)

The type of libmtev listener this is. The main listener is configured to be only a REST API listener. This value should not be changed.

Default: http\_rest\_api

**Main listener accept\_thread**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#main-listener-accept_thread)

If set to `on`, IRONdb will dedicate an eventer thread to handling incoming connections. This improves performance by ensuring that a new connection will be fully processed in blocking fashion, without preemption.

Default: off

**Main listener fanout**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#main-listener-fanout)

If set to `true`, new events from accepted connections will be fanned out across all threads in the event pool owning the listening socket (usually the default event pool).

Default: false

**Main listener ssl**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#main-listener-ssl)

When set to `on`, the listener will expect incoming connections to use Transport Layer Security (TLS), also known as "SSL". **Additional TLS configuration is required.** See [TLS Configuration](configuration.md#tls-configuration).

Default: off

**Graphite listener**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#graphite-listener)

```
<listener address="*" port="2003" type="graphite">
  <config>
    <check_uuid>3c253dac-7238-41a1-87d7-2e546f3b4318</check_uuid>
    <account_id>1</account_id>
  </config>
</listener>
```

The Graphite listener operates a Carbon-compatible submission pathway using the [plaintext format](http://graphite.readthedocs.io/en/latest/feeding-carbon.html#the-plaintext-protocol).

Multiple Graphite listeners may be configured on unique ports and associated with different check UUIDs. See the section on [Graphite ingestion](../integrations/graphite.md) for details.

**Graphite listener address**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#graphite-listener-address)

The IP address on which to listen, or the special `*` to listen on any local IP address.

Default: `*`

**Graphite listener port**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#graphite-listener-port)

The TCP port number to listen on.

Default: 2003

**Graphite listener type**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#graphite-listener-type)

The type of listener. IRONdb implements a Graphite-compatible handler in libmtev, using the custom type "graphite".

Default: graphite

**Graphite listener config**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#graphite-listener-config)

These configuration items control which check UUID, name, and account ID are associated with this listener. The first Graphite listener is configured during [initial installation](installation.md).

* `check_uuid` is a [well-formed, non-nil](https://en.wikipedia.org/wiki/Universally_unique_identifier) UUID the will be associated with all metrics ingested via this listener.
* `account_id` is also part of namespacing, for disambiguation.

**Pickle listener**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#pickle-listener)

The Pickle listener operates a Carbon-compatible submission pathway using the [pickle format](http://graphite.readthedocs.io/en/latest/feeding-carbon.html#the-pickle-protocol).

Its configuration is identical to the plaintext listener, except the type is `graphite_pickle`.

**CLI listener**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#cli-listener)

```
<listener address="127.0.0.1" port="32322" type="mtev_console">
  <config>
    <line_protocol>telnet</line_protocol>
  </config>
</listener>
```

The CLI listener provides a local [telnet console](http://circonus-labs.github.io/libmtev/operations/telnet_console.html) for interacting with libmtev subsystems, including modifying configuration. As there is no authentication mechanism available for this listener, it is recommended that it only be operated on the localhost interface.

**CLI listener address**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#cli-listener-address)

The IP address on which to listen, or the special `*` to listen on any local IP address.

Default: 127.0.0.1

**CLI listener port**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#cli-listener-port)

The TCP port number to listen on.

Default: 32322

**CLI listener type**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#cli-listener-type)

The CLI listener uses the built-in libmtev type "mtev\_console" to allow access to the telnet console.

Default: mtev\_console

### pools

> NOTE: As of version 0.20.0, resource configuration from this stanza is deprecated. Fresh installations will no longer contain this stanza.
>
> Values from these attributes will still be respected until a future release. Deprecation messages will be logged for each pools attribute encountered in the configuration, and will include the name of the jobq that corresponds to that attribute.

The value of the "concurrency" attribute is the first value in jobq configuration. See [Job Queue Configuration](configuration.md#irondb-eventerconf) for details.

```
<pools>
  <rollup concurrency="1"/>
  <nnt_put concurrency="16"/>
  <raw_writer concurrency="4"/>
  <raw_reader concurrency="16"/>
  <rest_graphite_numeric_get concurrency="4"/>
  <rest_graphite_find_metrics concurrency="4"/>
  <rest_graphite_fetch_metrics concurrency="10"/>
</pools>
```

Resource pools within IRONdb are used for various functions, such as reading and writing metric data. Some aspects of pool behavior are configurable, typically to adjust the number of worker threads to spawn.

The defaults presented are widely applicable to most workloads, but may be adjusted to improve throughput. Use caution when raising these values too high, as it could produce thrashing and _decrease_ performance.

If in doubt, [contact support](mailto:support@apica.io).

**pools rollup concurrency**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#pools-rollup-concurrency)

**Deprecated**

Use `jobq_rollup_raw` to preserve customizations.

The number of unique metric names (UUID + metric name) to process in parallel when performing rollups. A higher number generally causes the rollup operation to finish more quickly, but has the potential to overwhelm the storage subsystem if set too high.

Default: 1

> These tasks compete with other readers of the `raw_database`, so if `rollup` concurrency is set higher than 4x `raw_writer` concurrency, it cannot be reached.

**pools nnt\_put concurrency**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#pools-nnt_put-concurrency)

**Deprecated**

This attribute is obsolete and may be removed from configuration files.

The number of threads used for writing to numeric rollup files. Writes to a given rollup file will always occur in the same queue.

Default: the number of physical CPU cores present during installation

**pools raw\_writer concurrency**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#pools-raw_writer-concurrency)

**Deprecated**

Use `jobq_data_write` to preserve customizations.

The number of threads used for writing to the raw metrics database. Additionally, by default, IRONdb will use 4x this number of threads for reading from the raw metrics database.

Default: 4

**pools raw\_reader concurrency**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#pools-raw_reader-concurrency)

**Deprecated**

Use `jobq_data_read` to preserve customizations.

The number of threads used for reading from the raw metrics database.

Default: (raw\_writer concurrency \* 4)

**pools rest\_graphite\_numeric\_get concurrency**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#pools-rest_graphite_numeric_get-concurrency)

**Deprecated**

Use `jobq_snowth_graphite_numeric_get` to preserve customizations.

The number of threads used for handling Graphite fetches. This is a general queue for all fetch operations, and there are two other thread pools for specific tasks within a fetch operation (see below.)

Default: 4

**pools rest\_graphite\_find\_metrics concurrency**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#pools-rest_graphite_find_metrics-concurrency)

**Deprecated**

Use `jobq_snowth_graphite_find_metrics_local` and `jobq_snowth_graphite_find_metrics_remote` to preserve customizations. The value for this pools attribute was interpreted as the remote concurrency, which was divided by 4 to get the local concurrency (minimum 1).

The number of threads used for resolving metric names prior to fetch.

Default: 4

**pools rest\_graphite\_fetch\_metrics concurrency**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#pools-rest_graphite_fetch_metrics-concurrency)

**Deprecated**

Use `jobq_snowth_graphite_fetch_metrics_local` and `jobq_snowth_graphite_fetch_metrics_remote` to preserve customizations. The value for this pools attribute was interpreted as the remote concurrency, which was divided by 4 to get the local concurrency (minimum 1).

The number of threads used for actually fetching Graphite metrics, including those local to the node and those residing on remote nodes.

Default: 10

### REST Configuration

This is the node under which REST API configuration items are organized.

```
<rest>
  <acl>
    <rule type="allow" />
  </acl>
  <delete max_advisory_limit="10000" />
</rest>
```

**DELETE Configuration**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#delete-configuration)

This is the node used to configure `DELETE` endpoint behavior.

```
<rest>
  <delete max_advisory_limit="<val>"/>
</rest>
```

`max_advisory_limit="<val>"` attribute is used to configure how many deletes may be attempted by this operation where `<val>` may not be exceeded via `X-Snowth-Advisory-Limit`. Currently, this only affects the `/full/tags` endpoint.

### raw\_database

```
<raw_database location="/irondb/raw_db/{node}"
              data_db="nomdb"
              granularity="1w"
              recordsize="1h"
              min_delete_age="4w"
              delete_after_quiescent_age="1d"
              rollup_after_quiescent_age="8h"
              startup_rollup_delay="30m"
              max_clock_skew="1w"
              conflict_resolver="abs_biggest"
              rollup_strategy="raw_iterator"
              sync_after_full_rollup_finishes="false"
              sync_after_column_family_rollup_finishes="false"
              suppress_rollup_filter="and(__rollup:false)"
/>
```

Raw numeric metrics database. This stores all ingested numeric metrics at full resolution for a configurable period of time, after which the values are rolled up and stored in one or more [period-specific files](configuration.md#nntbs).

The `location` and `data_db` attributes should not be modified.

**raw\_database granularity**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#raw_database-granularity)

Granularity controls the sharding of the raw numeric database. A shard is the unit of data that will be rolled up and removed after a configurable age and period of quiescence (no new writes coming in for that shard.)

> Do not change granularity after starting to collect data, as this will result in data loss.

Default: 1 week

**raw\_database recordsize**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#raw_database-recordsize)

Recordsize controls the amount of data stored in an individual raw record.

> Do not change recordsize after starting to collect data, as this will result in data loss.

Default: 1 hour

**raw\_database min\_delete\_age**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#raw_database-min_delete_age)

The minimum age that a shard must be before it is considered for deletion.

Default: 4 weeks

**raw\_database delete\_after\_quiescent\_age**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#raw_database-delete_after_quiescent_age)

The period after which a shard, if it has been rolled up and not subsequenty written to, may be deleted.

Default: 1 day

**raw\_database rollup\_after\_quiescent\_age**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#raw_database-rollup_after_quiescent_age)

The period the system will delay after the last write to a raw shard before attempting to roll it up. New writes to the time period/shard will interrupt the rollup process and reset the quiescent timer which must again reach the `rollup_after_quiescent_age` before a re-roll will be attempted.

Default: 8 hours

**raw\_database startup\_rollup\_delay**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#raw_database-startup_rollup_delay)

If an irondb instance restarted while it was doing a rollup, it will restart that rollup after it finishes booting, however it will wait `startup_rollup_delay` before doing so. This gives the node time to catch-up on ingestion, populate caches, and other operations it may need to do after a restart.

Default: 30 minutes

**raw\_database max\_clock\_skew**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#raw_database-max_clock_skew)

Allow the submission of metrics timestamped up to this amount of time in the future, to accommodate clients with incorrect clocks.

Default: 1 week

**raw\_database conflict\_resolver**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#raw_database-conflict_resolver)

When a metric gets written more than one time at the exact millisecond offset you have a conflict we have to resolve. All operations in IRONdb are commutative and this lets us avoid complicated consensus algorithms for data. Conflicts, therefore, need to choose a winner and this choice needs to be consistent across the cluster. IRONdb gives you the following choices for conflict resolution should a datapoint appear more than once at the same millisecond.

* `abs_biggest` - save the largest by absolute value.
* `last_abs_biggest` - if used with the [IRONdb-relay](../tools/irondb-relay.md) aggregation capabilities the datapoints can track a generation counter. This resolver considers the generation of the datapoint and then uses the largest by absolute value if the generations collide. If you are not using the relay, this will fall back to the same behavior as `abs_biggest`.
* `abs_smallest` - save the smallest by absolute value.
* `last_abs_smallest` - same as `last_abs_biggest` but smallest instead.
* `last_biggest` - same as `last_abs_biggest` but uses the largest without absolute value.
* `last_smallest` - same as last but smallest.
* `biggest` - the larger value without absolute.
* `smallest` - the smaller value without absolute.

This setting should be the same on all nodes of the IRONdb cluster.

> This value should never be changed when data is "in flight", that is, while a cluster is actively ingesting data, or there are nodes down, or nodes are suffering replication latency.

If you wish to change this setting after beginning to collect data, the following conditions must be met:

* All nodes must be running and available.
* All ingestion must be stopped.
* All [journals](configuration.md#journal) from all nodes must be completely drained and applied on the destination node.

Once these conditions are met:

1. Bring down all nodes.
2. Change the value of this option in the configuration file for each node.
3. Restart all nodes.

Default: "abs\_biggest"

**raw\_database rollup\_strategy**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#raw_database-rollup_strategy)

Control how rollups are performed. By default, all levels of rollup data are calculated from the raw database as it is iterated.

Prior to version `0.12` the default if not specified was that the lowest level of rollup was computed and then IRONdb would read this lowest level data and compute higher level rollups. This rollup strategy has been removed.

Default: "raw\_iterator"

**raw\_database sync\_after\_full\_rollup\_finishes**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#raw_database-sync_after_full_rollup_finishes)

Enables an LMDB sync to disk after each raw shard finishes rolling up. Each shard that the raw shard rolls up into will be synced.

Default: "false"

**raw\_database sync\_after\_column\_family\_rollup\_finishes**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#raw_database-sync_after_column_family_rollup_finishes)

Enables an LMDB sync to disk after each column family within a raw shard finishes rolling up. Each shard that the raw shard rolls up into will be synced.

Default: "false"

**raw\_database suppress\_rollup\_filter**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#raw_database-suppress_rollup_filter)

Metrics that match this [tag query](../metric-names-and-tags.md#tag-queries) are never rolled up and only exist in the raw database. Raw only metrics are supported for both numeric and histogram metric types. When raw shards are deleted, a verify step is done on any metric that matches the filter to determine if there is any remaining data for that metric. If there is no remaining data, the metric will be completely deleted from the [surrogate database](configuration.md#surrogate_database).

Default: `and(__rollup:false)`

> Introduced in IRONdb version 0.19.2

### nntbs

```
<nntbs path="/irondb/nntbs/{node}">
  <shard period="60" size="1d" retention="52w" />
  <shard period="300" size="5d" retention="104w" />
  <shard period="1800" size="30d" retention="104w" />
  <shard period="10800" size="180d" retention="520w" />
</nntbs>
```

NNTBS is the rollup storage engine for data once it proceeds past the [raw database](configuration.md#raw_database).

Each `shard` specifies a rollup using a given granularity in seconds (`period`).

Shard `size` is the [time span](https://circonus-labs.github.io/libmtev/config/time_durations.html) included in one shard. The minimum size for a shard is `127 * period`; for a 60-second period, this would be 7620 seconds. Whatever time span you provide here will be rounded up to that multiple. For example, if you provided `1d` for the `period=60` shard as in the defaults above, you would actually get 91440 seconds per shard instead of 86400.

> NOTE: for installations with a high cardinality of metric names you will want to reduce the `size` parameters to keep the shards small to ensure performance remains consistent.

The `retention` setting for each shard determines how long to keep this data on disk before deleting it permanently. `retention` is optional and if you don't provide it, IRONdb will keep the data forever. When a timeshard is completely past the `retention` limit based on the current time, the entire shard is removed from disk. In the above example, 60-second rollups are retained for 52 weeks (1 year), 5- and 30-minute rollups are retained for 104 weeks (2 years), and 3-hour rollups are retained for 520 weeks (10 years). Retention uses the same time duration specifications as `size` above.

Whatever settings are chosen here cannot be changed after the database starts writing data into NNTBS (except for `retention`). If you change your mind about sizing you will have to wipe and reconstitute each node in order to apply new settings.

### histogram\_ingest

```
<histogram_ingest location="/irondb/hist_ingest/{node}"
              data_db="nomdb"
              granularity="7d"
              min_delete_age="4w"
              delete_after_quiescent_age="1d"
              rollup_after_quiescent_age="8h"
              max_clock_skew="1w"
/>
```

Raw histogram metrics database. This stores all ingested histogram metrics at full resolution for a configurable period of time, after which the values are rolled up and stored in one or more [period-specific files](configuration.md#histogram).

The `location` and `data_db` attributes should not be modified.

**histogram\_ingest granularity**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#histogram_ingest-granularity)

Granularity controls the sharding of the raw histogram database. A shard is the unit of data that will be rolled up and removed after a configurable age and period of quiescence (no new writes coming in for that shard.)

> Do not change granularity after starting to collect data, as this will result in data loss.

Default: 1 week

**histogram\_ingest min\_delete\_age**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#histogram_ingest-min_delete_age)

The minimum age that a shard must be before it is considered for deletion.

Default: 4 weeks

**histogram\_ingest delete\_after\_quiescent\_age**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#histogram_ingest-delete_after_quiescent_age)

The period after which a shard, if it has been rolled up and not subsequenty written to, may be deleted.

Default: 1 day

**histogram\_ingest rollup\_after\_quiescent\_age**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#histogram_ingest-rollup_after_quiescent_age)

The period the system will delay after the last write to a shard before attempting to roll it up. New writes to the time period/shard will interrupt the rollup process and reset the quiescent timer which must again reach the `rollup_after_quiescent_age` before a re-roll will be attempted.

Default: 8 hours

**histogram\_ingest max\_clock\_skew**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#histogram_ingest-max_clock_skew)

Allow the submission of metrics timestamped up to this amount of time in the future, to accommodate clients with incorrect clocks.

Default: 1 week

### histogram

```
<histogram location="/irondb/hist_rollup/{node}">
  <rollup period="60" granularity="7d"/>
  <rollup period="300" granularity="30d"/>
  <rollup period="1800" granularity="12w"/>
  <rollup period="10800" granularity="52w"/>
  <rollup period="86400" granularity="260w"/>
</histogram>
```

The histogram rollup database for data once it proceeds past the [raw histogram database](configuration.md#histogram_ingest). Rollups must be individually configured with a `period`, `granularity`, and optional `retention` period.

Whatever settings are chosen here cannot be changed after the database starts writing data (except for `retention`). If you change your mind about sizing you will have to wipe and reconstitute each node in order to apply new settings.

**histogram rollup period**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#histogram-rollup-period)

The `period` defines the time interval, in seconds, for which histogram metrics will be aggregated into the rollup.

**histogram rollup granularity**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#histogram-rollup-granularity)

Shard `granularity` is the [time span](https://circonus-labs.github.io/libmtev/config/time_durations.html) included in one shard. The `granularity` must be divisible by the `period` and will be rounded up if not compatible.

> NOTE: for installations with a high cardinality of metric names you will want to reduce the `granularity` parameters to keep the shards small to ensure performance remains consistent.

**histogram rollup retention**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#histogram-rollup-retention)

Shard `retention` is the [time span](https://circonus-labs.github.io/libmtev/config/time_durations.html) that determines how long to keep this rollup data on disk before deleting it permanently.

`retention` is optional and the default behavior is to keep the rollup data forever.

When a rollup timeshard is completely past the `retention` limit based on the current time, the entire shard is removed from disk.

> Introduced in IRONdb version 0.23.7

### surrogate\_database

The surrogate database contains bidirectional mappings between full metric names (including tags) and integer-based keys which are used internally to refer to metrics. It also records [collection activity periods](../administration/activity-tracking.md) on each metric.

Data files are stored on disk and memory-mapped on demand when metrics are referenced by queries (read) or ingestion (write).

```
<surrogate_database location="/irondb/surrogate_db/{node}"/>
```

**surrogate\_database location**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#surrogate_database-latest_future_bound)

This is the location of the surrogate database on disk.

This field is required; there is no default location if left unspecified.

**surrogate\_database implicit\_latest**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#surrogate_database-implicit_latest)

Toggle for maintaining an in-memory copy of the latest values for all newly seen metrics values during ingestion. If set to false, it will only maintain latest values for metrics that have been specifically "asked for" via a [tag search](../metric-names-and-tags.md#tag-queries).

Default: false

**surrogate\_database latest\_future\_bound**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#surrogate_database-latest_future_bound)

This is the upper bound on whether a metric will be considered as a "latest value" candidate. By default if a metric timestamp is more than 4 hours in the future, it will be ignored for consideration as a replacement for the latest value. These values are only updated at ingestion time.

This value can be from 0s (ignore any future timestamps) to 4h (maximum).

Default: 4h

**surrogate\_database runtime\_concurrency**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#surrogate_database-latest_future_bound)

This value allows users to set the number of concurrent surrogate database reader threads available.

Default: IRONdb will retrieve a hint about the number of available hardware threads and use this value.

**surrogate\_database max\_page\_size**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#surrogate_database-latest_future_bound)

When performing surrogate lookups in batches, IRONdb uses individual "pages" of results to prevent the system from getting overloaded. This setting specifies the maximum number of results that can be returned in a single page.

Default: 50,000

**surrogate\_database capacity\_per\_reader\_shard**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#surrogate_database-latest_future_bound)

When looking up surrogates, readers will store the results in both a id-to-metric-name and a metric-name-to-id lookup tables on each lookup thread so that future lookups will be much faster. These tables will pre-allocate space for these so that new space does not need to be allocated on the fly when new entries are added, improving lookup time. This field sets what the amount of space to pre-allocate in a reader is. Once this limit has been reached, future results will be allocated manually and may require internal rehashes, slowing the system down.

Default: 96,000,000 divided by the number of threads specified in **runtime\_concurrency**.

**surrogate\_database compaction**

**compaction** is a sub-field of **surrogate\_database**. Within it, you can define compaction **levels**. There are two levels that can be configured: **metadata** (for basic metric information and mapping) and **activity** (for collection activity data). Each of these may only be defined once, and any other **type** value is invalid. A sample configuration might look like this:

```
<surrogate_database location="/irondb/surrogate_db/{node}">
  <compaction>
    <levels type="metadata">
      <level
        level_name="level1"
        min_file_size="1B"
        max_file_size="512MiB"
        min_number_file_budget="2"
        max_number_file_budget="8"
        selection_phase_scan_budget="200000"
        compaction_phase_scan_budget="100000"
        selection_phase_scan_skip="50"
      />
      <level
        level_name="level2"
        min_file_size="10B"
        max_file_size="5120MiB"
        min_number_file_budget="2"
        max_number_file_budget="8"
        selection_phase_scan_budget="200000"
        compaction_phase_scan_budget="100000"
        selection_phase_scan_skip="100"
      />
    </levels>
    <levels type="activity">
      <level
        level_name="oil_micro"
        min_file_size="1B"
        max_file_size="32MiB"
        min_number_file_budget="2"
        max_number_file_budget="64"
        selection_phase_scan_budget="1000"
        compaction_phase_scan_budget="10000"
        selection_phase_scan_skip="0"/>
      <level
        level_name="oil_micro_l2"
        min_file_size="1B"
        max_file_size="64MiB"
        min_number_file_budget="2"
        max_number_file_budget="64"
        selection_phase_scan_budget="10000"
        compaction_phase_scan_budget="10000"
        selection_phase_scan_skip="64"/>
      <level
        level_name="oil_mini"
        min_file_size="64MiB"
        max_file_size="512MiB"
        min_number_file_budget="2"
        max_number_file_budget="8"
        selection_phase_scan_budget="1000"
        compaction_phase_scan_budget="100"
        selection_phase_scan_skip="128"/>
      <level
        level_name="oil_regular"
        min_file_size="512MiB"
        max_file_size="2GiB"
        min_number_file_budget="2"
        max_number_file_budget="4"
        selection_phase_scan_budget="1000"
        compaction_phase_scan_budget="100"
        selection_phase_scan_skip="128"/>
    </levels>
  </compaction>
</surrogate_database>
```

Each level for a type consists of a set of restrictions that determine when the individual files that make up the surrogate database are compacted; this allows, for example, small files to always compact with other small files, large files to only compact with large files, and so on. This reduces the strain on the system that could be caused by doing too frequent compactions or compacting files that do not need to be compacted.

If a **level** is defined, all fields within it are required. An arbitrary number of **level** elements can be defined under **levels**. IRONdb has a sane set of default configurations that are used if no level data is provided; generally speaking, it is not recommended to define or adjust these fields unless you know exactly what you're doing and know why you're adjusting them.

The fields within each level are as follows:

**level level\_name**&#x20;

The name of the level. This is used internally for debug logging.

**level min\_file\_size**&#x20;

The minimum size of a single file to consider for compaction. Files smaller than this will not be considered for compaction at this level.

**level max\_file\_size**&#x20;

The maximum size of a single file to consider for compaction. Files larger than this will not be considered for compaction at this level.

**level min\_number\_file\_budget**&#x20;

The minimum number of files to compact at a time for the level. If there are fewer files than this that match the criteria, a compaction will not run at this level.

**level max\_number\_file\_budget**&#x20;

The maximum number of files to compact at a time. If there are more files than this, then multiple compactions will run.

**level selection\_phase\_scan\_budget**&#x20;

The maximum number of files to scan in a single pass through the database.

**level compaction\_phase\_scan\_budget**&#x20;

The maximum number of surrogates to scan in a single pass through the database.

**level selection\_phase\_scan\_skip**&#x20;

The number of files to skip before starting the selection phase.

### metric\_name\_database

This database stanza controls where IRONdb keeps certain aspects of its indexes.

```
<metric_name_database location="/irondb/metric_name_db/{node}"
              enable_level_indexing="true"
              materialize_after="100000"
              query_cache_size="1000"
              query_cache_timeout="900"
              enable_saving_bad_level_index_jlog_messages="false"
/>
```

The database of stored metric names. This database is used to satisfy graphite /metrics/find queries. By default, this database will cache 1000 queries for 900 seconds. Any newly arriving metric names will invalidate the cache so subsequent queries are correct.

**metric\_name\_database enable\_level\_indexing**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#metric_name_database-enable_level_indexing)

Level indexing is used for graphite-style query acceleration. For large clusters that do not user graphite-style metrics, it may improve memory/CPU utilization to disable this index.

Default: true

**metric\_name\_database materialize\_after**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#metric_name_database-materialize_after)

The number of mutations that must occur before the system will flush to disk and trigger a compaction to occur, draining the `jlog` of queued updates.

Default: 100,000

**metric\_name\_database location**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#metric_name_database-location)

The location on disk where the database files reside.

**metric\_name\_database query\_cache\_size**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#metric_name_database-query_cache_size)

The number of incoming graphite/find queries to cache the results for.

Default: 1000

**metric\_name\_database query\_cache\_timeout**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#metric_name_database-query_cache_timeout)

The number of seconds that cached queries should remain in the cache before being expired.

Default: 900

**metric\_name\_database enable\_saving\_bad\_level\_index\_jlog\_messages**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#metric_name_database-enable_saving_bad_level_index_jlog_messages)

Enables saving of invalid jlog messages found when attempting to replay the `jlog` in the metric name database to build the indexes. The messages will be saved within the metric name database location for the account on which the error occurred in a folder called `bad_flatbuffer_messages`.

Default: "false"

### journal

```
<journal concurrency="4"
         replicate_concurrency="4"
         max_bundled_messages="50000"
         max_total_timeout_ms="10000"
         pre_commit_size="131072"
         send_compressed="true"
         use_indexer="false"
/>
```

Journals are write-ahead logs for replicating metric data to other nodes. Each node has one journal for each of its cluster peers.

**journal concurrency**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#journal-concurrency)

Establishes this number of concurrent threads for writing to each peer journal, improving ingestion throughput.

Default: 4

> A concurrency of 4 is enough to provide up to 700K measurements/second throughput, and is not likely to require adjustment except in the most extreme cases.

**journal replicate\_concurrency**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#journal-replicate_concurrency)

Attempt to maintain this number of in-flight HTTP transactions, per peer journal, for posting replication data to peers. Higher concurrency helps keep up with ingestion at scale.

Each thread reads a portion of the journal log and is responsible for sending that portion to the peer. When it finishes its portion, and there are fewer than `replicate_concurrency` other jobs in flight for that peer, it skips ahead to the next "unclaimed" portion of the log and resumes sending.

Default: 4

> Prior to version 0.15.3, the default was 1.

**journal max\_bundled\_messages**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#journal-max_bundled_messages)

Outbound journal messages will be sent in batches of up to this number, improving replication speed.

Default: 50000

**journal max\_total\_timeout\_ms**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#journal-max_total_timeout_ms)

A node sending replication journals to its peers will allow up to this amount of time, in milliseconds, for the remote node to receive and process a batch. If nodes are timing out while processing incoming journal batches, increasing this timeout may give them enough time, avoiding repeatedly sending the same batch.

Default: 10000 (10 seconds)

**journal pre\_commit\_size**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#journal-pre_commit_size)

An in-memory buffer of this number of bytes will be used to hold new journal writes, which will be flushed to the journal when full. This can improve ingestion throughput, at the risk of losing up to this amount of data if the system should fail before commit. To disable the pre-commit buffer, set this attribute to 0.

Default: 131072 (128 KB)

**journal send\_compressed**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#journal-send_compressed)

When sending journal messages to a peer, compress the messages before sending to save bandwidth, at the cost of sligtly more CPU usage. The bandwidth savings usually outweigh the cost of compression.

Default: true

**journal use\_indexer**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#journal-use_indexer)

Spawn a dedicated read-ahead thread to build [JLog](https://github.com/omniti-labs/jlog) indexes of upcoming segments in the write-ahead log for each remote node. This is only needed in the most extreme cases where the highest replication throughput is required. Almost all other installations will not notice any slowdown from indexing "on demand", as new segments are encountered.

Note that this will spawn one extra thread per journal (there is one journal for every remote node in the cluster.) For example, activating this feature will spawn 15 additional threads on each node in a 16-node cluster.

Default: false

### topology

```
<topology path="/opt/circonus/etc/irondb-topo"
          active="(hash value)"
          next=""
          redo="/irondb/redo/{node}"
/>
```

The topology node instructs IRONdb where to find its current cluster configuration. The `path` is the directory where the imported topology config lives, which was created during setup. `active` indicates the hash of the currently-active topology. `next` is currently unused. The `redo` path is where [journals](configuration.md#journal) are located for this topology.

No manual configuration of these settings is necessary.

## Module Config

The [integration modules](../integrations/) that provide support for ingesting Graphite and/or OpenTSDB data have optional configuration, described below. These settings are placed in the main `irondb.conf` file, as children of the `<snowth>` node (i.e., peers of `<logs>`, `<topology>`, etc.) If omitted, the defaults shown below will be used.

### Graphite Config

```
<graphite min_rollup_span_ms="60000" max_ingest_age="365d">
  <whisper directory="/opt/graphite/storage/whisper"
           check_uuid="3c253dac-7238-41a1-87d7-2e546f3b4318"
           account_id="1"
           end_epoch_time="1780000000"
  />
</graphite>
```

**graphite max\_ingest\_age**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#graphite-max_ingest_age)

The maximum offset into the past from "now" that will be accepted. Value may be any valid [libmtev time duration](https://circonus-labs.github.io/libmtev/config/time_durations.html). If importing older data, it may be necessary to increase this value.

Default: 1 year

**graphite min\_rollup\_span\_ms**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#graphite-min_rollup_span_ms)

The smallest rollup period that is being collected. This prevents gaps when requesting data at shorter intervals.

Default: 1 minute

**graphite whisper**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#graphite-whisper)

The `whisper` entity configures [read access to Whisper database files](../integrations/graphite.md#native-whisper-read-support). Each entity refers to the top of a directory hierarchy containing Whisper database files. This directory may exist on a local filesystem, or on a shared network-filesystem mountpoint. Any Whisper databases discovered in scanning this directory hierarchy with the `whisper_loader` tool (see link above) will be indexed for searching and querying.

> Note that regardless of filesystem choice, it is highly desirable to mount it read-only on each cluster node. This becomes a requirement if using a shared storage volume in the cloud.

Multiple `whisper` entitites may be configured, each representing a logically distinct Graphite installation. Using different values for `check_uuid` and (potentially) `account_id` will segregate these metrics from others.

**graphite whisper directory**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#graphite-whisper-directory)

The `directory` attribute is required, and indicates the start of a hierarchy of directories containing Whisper database files. This path may exist on the local filesystem, or on a network-mounted filesystem.

For example, to locate a Whisper database stored at `/opt/graphite/storage/whisper/foo/bar.wsp`, set the `directory` attribute to `"/opt/graphite/storage/whisper"`. The metric will be indexed as `foo.bar`.

Each `whisper` entity must have a unique, non-overlapping `directory` value. For example, it is an error to configure one with `/foo` and another with `/foo/bar`.

**graphite whisper check\_uuid**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#graphite-whisper-check_uuid)

The `check_uuid` attribute is required, and [namespaces](../integrations/graphite.md#namespacing) the contained metrics within IRONdb. This UUID may be arbitrarily chosen, but if the metrics in this collection are the same as those being currently ingested directly into IRONdb, it may be desirable to use the same `check_uuid` value as the corresponding [listener](configuration.md#graphite-config).

**graphite whisper account\_id**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#graphite-whisper-account_id)

The `account_id` attribute is required, and [namespaces](../integrations/graphite.md#namespacing) the contained metrics within IRONdb. This ID may be arbitrarily chosen, but if the metrics in this collection are the same as those being currently ingested directly into IRONdb, it may be desirable to use the same `account_id` value as the corresponding [listener](configuration.md#graphite-config).

**graphite whisper end\_epoch\_time**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#graphite-whisper-end_epoch_time)

The `end_epoch_time` is optional and represents the last timestamp for which there is whisper data. The timestamp is provided as an epoch timestamp, in seconds. If a fetch has a start time after the provided time, the node will not look in the whisper file in order to be more efficient. If this field is not provided, the whisper files will be checked regardless of the start time of the fetch.

### OpenTSDB Config

```
<opentsdb max_ingest_age="365d"/>
```

**opentsdb max\_ingest\_age**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#opentsdb-max_ingest_age)

The maximum offset into the past from "now" that will be accepted. Value may be any valid [libmtev time duration](https://circonus-labs.github.io/libmtev/config/time_durations.html). If importing older data, it may be necessary to increase this value.

Default: 1 year

## TLS Configuration

As of version 1.1.0, IRONdb supports TLS for both client and intra-cluster communications. **This is currently an alpha feature, for testing only.**

Due to certificate verification requirements, two sets of cryptographic keys and associated certificates are required:

1. Intra-cluster communication: cluster nodes exchange information and replicate metric data using port 8112, and they use the node UUID as the hostname for all requests. When TLS is used, the certificates for this listener must use the node UUID as the certificate CommonName (CN).
2. External client connections: since it would be awkward for external clients to verify a CN that is just a UUID, a second listener is added, using port 8443 and having its certificate CN set to the host's FQDN. This matches the expectation of clients connecting to the node to submit metrics or run queries.

The [installer script](installation.md#setup-process) will automatically configure TLS listeners on a fresh installation when the `-t` option or the `IRONDB_TLS` environment variable is set to `on`.

The following files must be present on each node in order for the service to\
work properly with TLS. Place them in `/opt/circonus/etc/ssl`:

* **cluster.key** - An RSA key for the intra-cluster listener.
* **cluster.crt** - A certificate issued for the intra-cluster listener. Its commonName (CN) must be the node's UUID.
* **cluster-ca.crt** - The Certificate Authority's public certificate, sometimes referred to as an intermediate or chain cert, that issued `cluster.crt`.
* **client.key** - An RSA key for the external client listener.
* **client.crt** - A certificate issued for the external client listener. Its commonName (CN) should match the hostname used to connect to the node, typically its FQDN.
* **client-ca.crt** - The Certificate Authority's public certificate, sometimes referred to as an intermediate or chain cert, that issued `client.crt`.

### Converting To TLS

To update an existing cluster to use TLS, several things need to change.

1. A modified topology configuration that indicates TLS should be used for intra-cluster communication.
2. Changes to listener configuration to specify locations for key, certificate, and CA chain certificate, add a new listener port for external clients, and to activate TLS.
3. Changes to metric submission pipelines and any visualization tools to use the new, externally-verifiable listener. This could include tools such as graphite-web or Grafana, as well as [IRONdb Relay](../tools/irondb-relay.md).

The first two items will be done on all IRONdb nodes. The third item will vary depending on the specifics of the metric submission pipeline(s) and visualization platforms.

**NOTE: because of the nature of this change, there will be disruption to cluster availability as the new configuration is rolled out. Nodes with TLS active will not be able to communicate with nodes that do not have TLS active, and vice versa.**

**Update Topology**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#update-topology)

The active topology for a cluster will be located in the`/opt/circonus/etc/irondb-topo` directory, as a file whose name matches the\
topology hash. This hash is recorded in `/opt/circonus/etc/irondb.conf` as the\
value for the `active` attribute within the `<topology>` stanza, e.g.

```
  <!-- Cluster definition -->
  <topology path="/opt/circonus/etc/irondb-topo"
            active="98e4683192dca2a2c22b9a87c7eb6acecd09ece89f46ce91fd5eb6ba19de50fb"
            next=""
            redo="/irondb/redo/{node}"
  />
```

Edit the `/opt/circonus/etc/irondb-topo/<hash>` file and add the `use_tls="true"` attribute to the `nodes` line:

```
-<nodes write_copies="2">
+<nodes write_copies="2" use_tls="true">
```

Distribute the updated file to all nodes in the cluster.

**Update Listeners**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#update-listeners)

In `/opt/circonus/etc/irondb.conf`, locate the `<listeners>` stanza. The listeners that will be changing are the ones for port 8112 and, if used, the Graphite listener on port 2003.

In a default configuration, the non-TLS listeners look like this:

```
    <listener address="*" port="8112" backlog="100" type="http_rest_api" accept_thread="on" fanout="true">
      <config>
        <document_root>/opt/circonus/share/snowth-web</document_root>
      </config>
    </listener>

   <listener address="*" port="2003" type="graphite">
      <config>
        <check_uuid>6a07fd71-e94d-4b67-a9bc-29ac4c1739e9</check_uuid>
        <account_id>1</account_id>
      </config>
    </listener>
```

The Graphite `check_uuid` and `account_id` may differ from the above. Preserve those values in the new listener config.

Replace the above listener configs with this, ensuring that it is within the opening and closing `listeners` tags, and substituting your Graphite check UUID and account ID from the original config:

```
    <!--
      Intra-cluster listener. Used for gossip and replication.
    -->
    <cluster>
      <sslconfig>
        <!-- Certificate CNs MUST match node UUIDs assigned in the current topology. -->
        <certificate_file>/opt/circonus/etc/ssl/cluster.crt</certificate_file>
        <key_file>/opt/circonus/etc/ssl/cluster.key</key_file>
        <ca_chain>/opt/circonus/etc/ssl/cluster-ca.crt</ca_chain>
        <layer_openssl_10>tlsv1.2</layer_openssl_10>
        <layer_openssl_11>tlsv1:all,>=tlsv1.2,cipher_server_preference</layer_openssl_11>
        <ciphers>ECDHE+AES128+AESGCM:ECDHE+AES256+AESGCM:DHE+AES128+AESGCM:DHE+AES256+AESGCM:!DSS</ciphers>
      </sslconfig>
      <listener address="*" port="8112" backlog="100" type="http_rest_api" accept_thread="on" fanout="true" ssl="on">
        <config>
          <document_root>/opt/circonus/share/snowth-web</document_root>
        </config>
      </listener>
    </cluster>

    <!-- Client-facing listeners. -->
    <clients>
      <sslconfig>
        <!-- Certificate CNs should be the FQDN of the node. -->
        <certificate_file>/opt/circonus/etc/ssl/client.crt</certificate_file>
        <key_file>/opt/circonus/etc/ssl/client.key</key_file>
        <ca_chain>/opt/circonus/etc/ssl/client-ca.crt</ca_chain>
        <layer_openssl_10>tlsv1.2</layer_openssl_10>
        <layer_openssl_11>tlsv1:all,>=tlsv1.2,cipher_server_preference</layer_openssl_11>
        <ciphers>ECDHE+AES128+AESGCM:ECDHE+AES256+AESGCM:DHE+AES128+AESGCM:DHE+AES256+AESGCM:!DSS</ciphers>
      </sslconfig>

      <!-- Used for HTTP metric submission, admin UI. -->
      <listener address="*" port="8443" backlog="100" type="http_rest_api" accept_thread="on" fanout="true" ssl="on">
        <config>
          <document_root>/opt/circonus/share/snowth-web</document_root>
        </config>
      </listener>

      <!--
        Graphite listener
          This installs a network socket graphite listener under the account
          specified by <account_id>.
      -->
      <listener address="*" port="2003" type="graphite" ssl="on">
        <config>
          <check_uuid>GRAPHITE_CHECK_UUID</check_uuid>
          <account_id>ACCOUNT_ID</account_id>
        </config>
      </listener>
    </clients>
```

Generate and/or obtain the above key and certificate files, ensuring they are placed in the correct location as set in the listener `sslconfig` configuration.

## Included Files

### circonus-watchdog.conf

**watchdog**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#watchdog)

```
<watchdog glider="/opt/circonus/bin/backwash" tracedir="/opt/circonus/traces"/>
```

The watchdog configuration specifies a handler, known as a "glider", that is to be invoked when a child process crashes or hangs. See the [libmtev watchdog documentation](http://circonus-labs.github.io/libmtev/config/watchdog.html).

If [crash handling](../administration/operations.md#crash-handling) is turned on, the `glider` is what invokes the tracing, producing one or more files in the `tracedir`. Otherwise, it just reports the error and exits.

### irondb-eventer.conf

The eventer configuration contains [libmtev eventer configuration](https://circonus-labs.github.io/libmtev/config/eventer.html).

This file contains default settings for event loops and job queues. Overrides should be placed in `irondb-eventer-site.conf`.

**Event Loop Configuration**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#event-loop-configuration)

Settings in here should generally not be changed unless directed by Apica Support.

**Job Queue Configuration**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#job-queue-configuration)

Many parts of IRONdb's functionality are handled within pools of threads that form "job queues" (abbreviated as `jobq`). Any actions that may block for some period of time, such as querying for data, performing rollups, etc. are handled asynchronously via these queues.

The value of each `jobq_NAME` is one or more comma-separated values:

```
concurrency[,min[,max[,memory_safety[,backlog]]]]
```

Concurrency is required; all others are optional, but position is significant. For example, overriding the `backlog` value will require `min`, `max`, and `memory_safety` to be filled in as well.

As with event loop settings, the job queue defaults are suitable for a wide range of workloads, so changes should be carefully tested to ensure they do not reduce performance or cause instability.

To override a jobq named `foo`, which might be defined by default as:

```
<jobq_foo>4,1,24</jobq_foo>
```

Place a line in the site configuration file with one or more different values, preserving the others:

```
<jobq_foo>8,1,24</jobq_foo>
```

The above would increase the desired concurrency from 4 to 8, keeping the minimum of 1 and maximum of 24.

### irondb-eventer-site.conf

See the comment at the top of the file for how to override eventer settings. This file is included from `irondb-eventer.conf`.

This file's contents will be preserved across package updates.

### irondb-modules.conf

Contains options for vendor-supplied [libmtev dynamically-loadable modules](https://circonus-labs.github.io/libmtev/config/modules.html).

Settings in this file should not be changed.

### irondb-modules-site.conf

See the comment at the top of the file for how to configure optional modules. This file is included from `irondb-modules.conf`.

This file's contents will be preserved across package updates.

### irondb-extensions-site.conf

See the comment at the top of the file for how to add or override extension configuration. This file is included from `irondb-modules.conf`.

This file's contents will be preserved across package updates.

### licenses.conf

This file holds any and all licenses that apply to this IRONdb node. Refer to the [installation steps](installation.md#add-license) for details on obtaining and installing licenses.

In a cluster, the license configuration must be the same on all cluster nodes.

If no license is configured, an embedded license is used, which enables all features described below with a limit of 25,000 active streams (`max_streams`).

**Licensed Features**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#licensed-features)

The IRONdb license governs the following functionality:

**License Term**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#license-term)

Name: `<expiry>`

After this unix timestamp the license is invalid and will no longer work for any of the below.

**Ingest Cardinality**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#ingest-cardinality)

Name: `<max_streams>`

How many unique time series (uniquely named streams of data) this installation can ingest in the most recent 5-minute period.

This number applies to all nodes in the cluster although each node applies this restriction individually. The math for unique streams is an estimate in the past 5 minutes and you are given a 15% overage before ingestion is affected.

If this license is violated, ingestion will stop for the remainder of the 5-minute period that the violation was detected. After the 5-minute period ends, the counter will reset to test the new 5-minute period.

**Enablement of Lua Extensions**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#enablement-of-lua-extensions)

Name: `<lua_extension>`

Whether or not Lua extensions will operate.

**Stream Tags Support**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#stream-tags-support)

Name: `<stream_tags>`

Whether or not stream tag related API calls and stream tag ingestion will work. If you do not have this license and stream tagged data arrives it will be silently discarded.

**Histogram Support**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#histogram-support)

Name: `<histograms>`

Whether or not histograms can be ingested. If you do not have this license and attempt to ingest histogram data it will be silently discarded.

**Text Metric Support**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#text-metric-support)

Name: `<text>`

Whether or not text metrics can be ingested. If you do not have this license and attempt to ingest text data it will be silently discarded.

**Obtain A License**[**​**](https://docs.circonus.com/irondb/getting-started/configuration#obtain-a-license)

If you are interested in any of the above functionality and do not currently have a license please contact [sales@apica.io](mailto:sales@apica.io) to upgrade your license.
