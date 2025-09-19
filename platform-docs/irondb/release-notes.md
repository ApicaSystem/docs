# Release Notes

## Changes in 1.5.1

2025-06-17

* Add `message` field to `/find/tags` estimates for enhanced clarity.
* Improve reconstitute performance.
* Fix a bug where the first data point for an NNTBS metric for a rollup could\
  be written with the wrong timestamp during a reconstitute.
* Add new iterate style, `seek`, for sending data during reconstitute. This\
  mode seeks to specific metrics rather than iterating the whole shard during\
  the sending phase. This can be set via the`reconstitute/nntbs@iterate_surrogates_for_send_style` field - `iterate` is\
  the old style and `seek` is the new style. The default value is `iterate`.
* Remove the `jindexer` subscriber when the `use_indexer` field is disabled\
  for journals, which will prevent unnecessary journal data retention.
* Improve handling when mmap operations fail loading surrogate database or\
  indexing files.
* On delete responses, the `X-Snowth-Incomplete-Results` header is now always\
  returned, and set to `false` when results are complete.
* Remove unneeded checks for flatbuffer availability in journaling.

## Changes in 1.5.0

2025-05-08

* Avoid excess CPU usage during replication when a node is in journal-only\
  mode.
* Fix issue with stalling in journal-only mode due to check tag replication.
* Remove unneeded checks for flatbuffer availability in journaling.\
  Non-flatbuffer journals were removed long ago.
* Fix journal-only mode so that it exits when the replication journals are\
  fully drained.
* Disable the graphite, prometheus, opentsdb, check tag replication, and\
  monitor modules when running in reconstitute or journal-only modes.
* Remove Pickle support from Graphite module.
* Reduce error log volume on text reconstitute errors.
* Fix issue where the opentsdb and prometheus modules were incorrectly\
  reporting that the toplogy was wrong when attempting to load data onto a node\
  that is reconstituting. Nodes will now report that the service is\
  unavailable.
* Improve libsnowth listener error to include the IP address of the remote side\
  of the socket.
* Accelerate NNTBS reconstitute by avoiding memory copies.
* Reduce unnecessary NNTBS data copies during reconstitute to improve speed.
* Write NNTBS data out in parallel during reconstitute to improve speed.
* Add parameter to text reconstitute data fetching to allow excluding data\
  older than the provided time.
* Improve text reconstitute performance by doing fewer surrogate id lookups.
* Deprecate configuration parameters `reconstitute/nntbs@batchsize` and`reconstitute/nnt@batchsize`. Use `reconstitute/nntbs@lmdb_commit_batch_size`\
  instead.
* Add new flag, `reject_data_older_than`, to the `<text>` config stanza that\
  will disallow text data older than the provided time from being ingested,\
  whether by standard ingestion or reconstitute.
* Improve NNTBS and histogram rollup reconstitute performance by no longer\
  fetching shards that fall outside of any configured retention window.
* Inhibit retention-related deletion of NNTBS and histogram rollup shards while\
  a reconstitute is in progress.
* Add error handling of invalid flatbuffer records found while replaying metric\
  index journals. Optionally these invalid records can be saved to files. The\
  number of replay errors is now tracked in the `/state` API.
* Treat `MDB_NOTFOUND` errors returned from LMDB transaction puts as\
  corruption.
* Only flush column families in the raw database that finish rolling up.\
  Previously all column families were flushed unconditionally, including those\
  that had not finished rolling up or had long since finished.
* Fix `snowthsurrogatecontrol` use-after-free error.

## Changes in 1.4.0

2024-11-05

**NOTE: This release deprecates legacy histograms.** [**Histogram shards**](https://docs.circonus.com/irondb/getting-started/configuration/#histogram_ingest) **must be configured before upgrading to this release. If this is not done, nodes may not start up after the upgrade.**

* Fix use after free bug that could occasionally happen due to a race when fetching raw data.
* Fix potential memory leak on certain oil/activity data operations.
* Fix fetch bug where C-style `calloc` allocations were being mixed with C++-style `delete`s.
* Add new paramter to whisper config, `end_epoch_time`, that takes an epoch timestamp and directs the code to not look in whisper files if the fetch window starts after this time.
* Fix bug where histogram ingestion data was not being sent properly during rebalance operations.
* Fix bug where histogram rollup data was not being reconstituted during reconstitute operations.
* Add `get_engine` parameter to histogram data retrieval to allow pulling from either rollups or ingestion data.
* No longer open new LMDB transactions when reading data for merging NNTBS blocks together.
* Remove all support for legacy, non-sharded histograms.
* Fix bug where if a raw shard rollup was aborted after being scheduled but before actually starting, multiple rollups could end up triggering at once.
* Fix rename bug where type was not getting set when failing to send NNTBS data.
* Add header to the `/rename` endpoint to `X-Snowth-Activity-Data-Mode`, which can accept either `use_existing` or `create_new` as values.
* Treat `MDB_CORRUPTED`, `MDB_PAGE_FULL`, `MDB_TXN_FULL`, `MDB_BAD_TXN`, and `ENOMEM` as LMDB corruption consistently when checking for errors.
* When using the `/merge/nntbs` endpoint to send data to a node, allow either updating the receiving node's activity data using the incoming NNTBS data or leaving it as is and not updating it.
* Fix bug where activity data was not being updated correctly when inserting NNTBS data.
* Fix bug where rollups were marked clean after a rollup had been kicked off asynchronously, resulting in a race that could lead to shards being incorrectly considered dirty.
* Deprecate support for rebalancing data into a cluster with fewer NNTBS periods.
* The `/rename` endpoint will now detect when it gets a 500 error from the `/merge/nntbs` endpoint and will return an error instead of spinning forever.
* The `/merge/nntbs` endpoint will no longer crash on detecting corrupt shards; it will offline the shards and return errors.
* Various small fixes to reduce memory consumption, improve performance, and prevent possible crashes or memory corruption.

## Changes in 1.3.0

2024-07-17

* Fix bug in `build_level_index` where we were invoking a hook that called `pcre_exec` with an uninitialized metric length.
* Reduce spam in error log when trying to fetch raw data for a metric and there isn't any for the requested range.
* Add new API endpoint, `/rename`, to allow renaming a metric. This calculates where the new metric will live, sends the data for the metric to the new location, then deletes the old metric. This only works for numeric metrics.
* Add new API endpoint, `/full/canonical/<check uuid>/<canonical metric name>` that will allow deleting an exact metric from the system without using tag search.
* Add ability to skip data after a given time when using the `copy` sieve in `snowth_lmdb_tool`.

## Changes in 1.2.1

2024-06-04

* Avoid metric index corruption by using `pread(2)` in jlog instead of `mmap(2)`.
* Deprecate `max_ingest_age` from the graphite module. Require the `validation` fields instead.
* Change Prometheus module to convert `nan` and `inf` records to `null`.
* Add logging when when the `snowth_lmdb_tool` copy operation successfully completes.
* Fix bug where a node could crash if we closed a raw shard for delete, then tried to roll up another shard before the delete ran.
* Fix bug where setting raw shard granularity values above `3w` could cause data to get written with incorrect timestamps during rollups.
* Improve various listener error messages.
* Add checks for timeouts in the data journal path where they were missing.
* Improve graphite PUT error messages.
* Fix NNTBS rollup fetch bug where we could return no value when there was valid data to return.
* Fix bug where histogram rollup shards were sometimes not being deleted even though they were past the retention window.

## Changes in 1.2.0

2024-03-27

**NOTE: This release bumps the metric index version from 4 to 5. Upon restart, new indexes will be built and the old ones will be deleted. This process will use a significant amount of memory while the indexes are being rebuilt. It will also cause the first post-update boot to take longer than usual.**

* Update index version from 4 to 5.
* Automatically clean up old index versions on startup to make sure outdated indexes don't clog the disk.
* Fix Ubuntu 20.04 specific bug where nodes could crash when trying to clean up status files when rolling up raw shards.
* Fix issue with level indexes where data was being lost when deleting metrics on levels where the metric has multiple tags.
* Fix issue where level indexes were incorrectly reporting that levels existed when all underlying metrics had been removed.
* Add new API endpoints, `/compact_indexes` and `/invalidate_index_cache`, that allow forcing compaction and cache invalidation for specific accounts, respectively.
* Fix rollup bug where raw shards could be prematurely deleted if a rollup was aborted due to corruption.
* Fix various potential memory corruption issues.
* Fix issue where jlog journal data could get corrupted.
* [libmtev 2.7.1](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#271)

## Changes in 1.1.0

2024-01-02

* Add preliminary support for operating IRONdb clusters with SSL/TLS. This allows securing ingestion, querying, and intra-cluster replication. See [TLS Configuration](https://docs.circonus.com/irondb/getting-started/configuration#tls-configuration) for details. **This feature should be considered alpha**.
* Fix bug where rollups were being flagged "not in progress" and "not dirty" when attempting to schedule a rollup and the rollup is already running.
* Use activity ranges as part of query cache key. Previously, cached results from queries with a time range could be used to answer queries that had no time range, leading to incorrect results.
* Fix logic bug where rollups were sometimes flagged as still being in progress after they were completed.
* Account index WAL can keep growing without bounds due to a local variable value being squashed early.
* Fix bug where the `reconst_in_progress` file was not being cleaned up after reconstitute operations, which could block rollups and deletes from running.
* The `raw/rollup` and `histogram_raw/rollup` API endpoints will no longer block if there is a rollup already running. They will also return sensible error messages.
* Raw shard rollups will not be allowed to run unless all previous rollups have run at least once.
* Fix bug where deferred rollups could cause the rollup process to lock up until the node is restarted.
* Add REST endpoint POST/PUT `/histogram/<period>/<check_uuid>/<metric_name>?num_records=<x>` which can be used with a json payload to directly insert histogram shard metric data for repair purposes.
* Added configuration file field, `//reconstitute/@max_simultaneous_nodes`, that will cause the reconstituting node to only hit a predetermined number of peer nodes at once. The default if not specified is "all peers". This setting can be used if a reconstitute places too much load on the rest of the cluster, causing degradation of service.
* Disallow starting single-shard reconstitutes with merge enabled if the shard exists and is flagged corrupt.
* Improve NNTBS error messages if unable to open a shard.
* PromQL - improve error messages on invalid or unsupported range queries.
* PromQL - fix range nested inside one or more instant functions.
* Include maintenance mode when pulling lists of raw, histogram, or histogram rollup shards.
* Use read-copy-update (RCU) for Graphite level indexes and the surrogate database. It allows more queries to run concurrently without affecting ingestion, and vice versa.
* Defer rollups of raw shards if there is a rollup shard in maintenance that the raw shard would write to.
* Reject live shard reconstitute requests on NNTBS or histogram rollup shards if there is a raw shard rollup in progress that would feed into them.
* Fix bug where the system would report that a live reconstitute was not in progress, even when one was running.
* Allow running single-shard or single-metric reconstitute on non-raw shards, even if the shard extends beyond the current time.
* The reconstitute GUI no longer apppears when doing online reconstitutes.
* Fix iteration bug when reconstituting NNTBS shards.
* Added the `merge_all_nodes` flag to live reconstitute which causes all available and non-blacklisted write copies to send metric data instead of only the "primary" available node.
* Added the ability to repair a local database by reconstituting a single metric stream.
* Fix bug where `/fetch` would not proxy if the data for a time period was all in the raw database, but the relevant raw shards were offline.

## Changes in 1.0.1

2023-09-06

**NOTE: This version updates RocksDB (raw database, histogram shards) from version 6 to 7. It is not possible to revert a node to a previous version once this version has been installed.**

* Add a new configuration parameter, `//rest/@default_connect_timeout`, that allows configuring the connect timeout for inter-node communication. This was previously hardcoded to 3 seconds.
* Graphite `series` and `series_multi` fetches now return 500 when there are no results and at least one node had an issue returning data.
* Graphite `series` and `series_multi` fetches now return 200 with an empty results set on no data rather than a 404.
* Fix bug on `/find` proxy calls where activity ranges were being set incorrectly.
* Add ability to filter using multiple account IDs in the `snowthsurrogatecontrol` tool by providing the `-a` flag multiple times.
* Reduce usage of rollup debug log to avoid log spam.
* Upgrade RocksDB from version 6.20.3 to version 7.9.2.
* [libmtev 2.5.3](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#253)

## Changes in 1.0.0

2023-07-28

**IMPORTANT NOTE: Any node running 0.23.7 or earlier MUST do a** [**surrogate3 migration**](https://docs.circonus.com/irondb/getting-started/configuration#surrogate_database) **PRIOR to upgrading to 1.0.0. This is due to removal of support for the previous surrogate database format.**

* Prevent ingestion stalls by setting a better eventer mask on socket read errors.
* Fix bug where surrogate deletes running at the same time as level index compactions can cause crashes.
* Improve scalability of lock protecting `all_surrogates` in indexes.
* Fix logging of old-data ingestion.
* Don't stop a rollup in progress if new data is received; finish and reroll later.
* Add ability to filter by account ID in the `snowthsurrogatecontrol` utility by using the `-a` flag.
* Fix full-delete crash on malformed tag query.
* Rewrite Graphite level-index query cache to remove race on lookup.
* Remove surrogate2.
* Some data was hidden post arts compaction, make sure it stays visible.
* Fix bug where if a fetch to the `/raw` endpoint exceeded the raw streaming limit (10,000 by default), the fetch would hang.
* Reduce memory usage during extremely large `/raw` fetches.
* Fix bug where extremely large double values generated invalid JSON on `/raw` data fetches.
* Handle surrogate duplicates on migration from `s2` to `s3`.
* Require all nodes for `active_count` queries.
* Add back-pressure to raw puts, allows the database to shed load by returning HTTP 503.
* [libmtev 2.5.2](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#252)

## Older Releases

For older release notes, see [Archived Release Notes](archived-release-notes.md).
