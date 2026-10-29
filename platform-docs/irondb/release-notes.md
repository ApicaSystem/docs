# IRONdb

## Changes in 1.5.3

2026-10-28

* Fixed reads of metric activity from the surrogate database using stale
  activity from an older activity file after a restart or an activity file
  compaction. Recently active metrics looked inactive in the most recent
  periods. This made `/find/<account>/active_count` undercount, and when
  `suppress_rollup_filter` is configured, `clean_rollup_suppressed_metrics`
  could delete matching metrics that were still active.
* The `/list_nntbs_shards` endpoint no longer returns the flatbuffer format and
  now always responds with `application/json`. The flatbuffer schema and its
  generated code have been removed. **Reconstitute is affected, so upgrade
  order matters:** a node running this release can reconstitute from a node
  running an older release, because older nodes honour an `Accept:
  application/json` request. The reverse does not work — a node running an
  older release cannot reconstitute from a node running this release, because
  it will receive JSON where it expects a flatbuffer and will fail. **Plan
  upgrades so that no node on an older release needs to reconstitute from an
  upgraded node, and avoid leaving a cluster in a mixed-version state across
  this release any longer than necessary.**

## Changes in 1.5.2

2026-09-04

* Fixed a bug where tombstones for deleted metrics were not always immediately recognized, causing new writes for the deleted metric to go to the old surrogate instead of creating a new surrogate. The deleted metric would remain visible until a surrogate compaction or node restart, at which point a new surrogate would be created and any data written in the interim for that metric would be lost.
* Fixed bug where unlimited licenses were not displaying properly on the UI.
* Missing license fields now display `N/A` in the UI rather than being blank.
* Fixed issue with potential short file writes in histogram rebalance.
* Improved histogram rebalance performance.
* Fixed bug in histogram rebalance where it would get stuck trying to send cumulative histograms.
* Added API endpoint, `/surrogate/cleanup`, that iterates the surrogate database and removes any entries that are not supposed to exist on the current active topology. This is typically done after a rebalance to remove any surrogates that used to live on a node, but no longer should because the node is now part of a different topology.
* The reconstitute UI now lists nodes in topology order and displays their addresses.
* The `/state`, `/locate`, `/topology`, and `/toporing` GET endpoint are now accessible during reconstitute operations.
* Enhanced `snowthd` command-line argument parsing by adding support for more descriptive command line options. These options are described in snowthd's help menu.
* Removed obsolete NNT-related data from `stats.json` output.

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

## Older Releases

For older release notes, see [Archived Release Notes](archived-release-notes.md).
