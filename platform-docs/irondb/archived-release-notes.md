# Archived Release Notes

For current releases, see [Release Notes](release-notes.md).

### Changes in 0.23.7

2023-06-15

* Cleaning rollup-suppressed metrics will now happen asynchronously in a jobq, preventing this operation from blocking the delete queue.
* Cleaning rollup-suppressed metrics will now auto-delete metrics that are old enough - not just metrics that are older than the shard being deleted.
* Reduce lock contention on lock `all_surrogates_lock` at crossroads of indexing and ingestion.
* Perform ordered interval list compactions off-heap, reducing memory usage.
* Perform surrogate compactions off-heap, reducing memory usage.
* Use memory map files to perform level index compactions, reducing memory usage.
* Fix issue where raw shard could be erroneously deleted.
* Fix bug where a set of metric indexes were regenerated during a full reconstitute.
* Avoid contention on all-surrogates lock inside indexes.
* Respect `X-Snowth-Advisory-Limit` field when proxying to other nodes during graphite-style metric find operations.
* Fix missing data when queried using level index when levels are partially in WAL.
* Fix find timeouts so they're respected and stop processing once they're reached.
* Allow providing a `node_blacklist` field when running live shard reconstitutes. This will allow the reconstitute process to skip specific nodes.
* Improve loading times of RocksDB-backed shards.
* Remove from surrogate indexes on-disk surrogates that are tombstoned in subsequent files.
* Add optional `//histogram//rollup//@retention` config to delete histogram rollup shards after a specified amount of time.
* Restore functionality of lua `reg_v2` (linear/exponential regression) extension.
* Migrate to using an external library package for RoaringBitmap.
* Optimize surrogate lookup for presence of tombstones.
* [libmtev 2.4.4](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#244)

### Changes in 0.23.6

2023-03-08

* Fix bug where old timestamps could cause inter-node replication to stall.
* Better handling of back pressure on journal replication.
* Make node selection during find calls latency aware so we choose to pull from nodes that are up to date if up to date nodes are available.
* Fix bad reference count on shard closure that could lead to use after free.
* Fix bug where graphite finds would not expand their proxy server set if the cluster is sided and one or more of the initial proxy nodes did not return successfully.
* Additional validations on metric timestamps on ingestion.
* Use HTTP connection pooling for graphite inter-node traffic.
* CAQL: Add `group_by:stddev/popvar/percentile/alwaysone`, `math:sgn` and inverse hyperbolic functions (`asanh`, `acosh`, `atanh`), `stats:alwaysone/count/var/popvar`, and `window/rolling:popvar`, `delta`, `changes`, `absent`, `resets`, `increase`, `last`, and `present`.
* Fix `stats.json` delay measurement value to reflect the node latency calculated in the gossip data.
* Update the `stats.json` delay measurement values at a more regular cadence to make sure that it reflects the current system state.
* Fix crash bug with empty histogram entries in `mvalue` and `inverse_quantile` extensions.
* Negative timestamp on metric could bypass validations and stall replication
* `graphite_translate` additions/fixes to better match graphite behavior:
  * `holtWintersConfidenceBands()` and `holtWintersForecast()` translation
  * `holtWintersAberration()` and `holtWintersConfidenceArea()` translation
  * `offsetToZero()`, `rangeOfSeries()`, `aggregateLine()` and `removeBetweenPercentile()` translation
  * `averageOutsidePercentile()`, `fallbackSeries()` and `integralByInterval()` translation
  * `interpolate()` and `linearRegression()` translation
  * Proper translation of `first` and `last` aggregation functions
* Change CAQL processing model to allow for larger datasets.
* Support using mdbx as an alternative storage backend.
* Add support for Rocksdb 7.8.3.
* [libmtev 2.4.1](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#241)

### Changes in 0.23.5

2023-01-16

* Fix bugs that could cause out-of-date data to be returned when fetching data on a sided cluster with one or more of the nodes being extremely far behind in replication.
* CAQL: Add functions `stats:clamp`, `math:sqrt`, `math:log2`
* [libmtev 2.4.0](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#240)

### Changes in 0.23.4

2023-01-03

**IMPORTANT: This release includes an update to the on-disk metric indexes. These will be rebuilt automatically when a node is restarted after updating to this version. This will result in the startup time for a node the first time after upgrading to be considerably longer. After the first boot, boot times should be consistently faster.**

* Add `fill:forward(limit=DUR)` function that will limit filling to the specified duration.
* Add `fill=forward:<ms>` as a `/fetch` param and tie into the optimizer.
* Add cluster-wide version tracking for `/fetch` to prevent CAQL over-optimization during upgrades.
* Fix handling of error returns when reading jlog interval.
* Discard incoming metrics that match the `//snowth//discard_data_filters/discard_data_filter` configured for the corresponding account, e.g., `<discard_data_filter account="1234" filter="and(__storage:false)"/>`
* New level index format that allows for faster loads and lowers memory usage. This requires regenerating the indexes on the first startup after upgrade.
* Reduce loading times for level indexes.
* Fix ingestion of multiple opentsdb records.
* [libmtev 2.3.9](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#239)

### Changes in 0.23.3

2022-10-17

* Update `irondb-eventer.conf` with default settings for new find jobqs.
* Default to no find limit for graphite find queries.
* Update old data logging utility to log old metrics received by the `/graphite`, `/raw`, and `/journal` endpoints, as well as the pickle listener.
* Write histogram journal data in batches instead of adding one entry to the jobq at a time.
* Update art indexing storage to use regular mutex instead of spin lock to avoid CPU peg.
* Avoid roaring bitmap copies in queries on level index to optimize performance.
* Audit ephemeral support and reduce overhead.
* Fix local assertion failure in fetch when remote node errors out.
* LIFO and FIFO Job Queue modes are now color coded.
* Fix deadlock in raw shard post-rollup deletion that can result in a node getting hung and not accepting new data
* Add `graphite_rewrite` module to allow optimizing certain graphite queries.
* Use the cheaper search AST construction APIs.
* Add hook for find jobq assignment suggestion to allow smarter jobq assignment.
* [libmtev 2.3.7](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#237)

### Changes in 0.23.2

2022-08-18

* CAQL `sort:min/max/mean` no longer errors on false inputs.
* Smarter CAQL fetch limitations when optimizations are used.
* Add additional error handling when decoding flatbuffer messages.
* Make assertion in fetch map collision non-fatal.
* Fix assertion failure assertion on `fdlc1_set_result`
* Fix issue that would cause nntbs shard to increase in size too frequently.
* Only optimize `fill`/`fill:forward` when it is suitable as a transform.
* Fix min/max statistics in CAQL for windows with missing values.
* Defer allocation in index manager to improve performance.
* Fix crash bug in `/fetch` `group_by` stats.
* Fix CAQL `fill` optimizations for histogram tranforms.
* Fix hex parsing bug in prometheus module.
* Proper maintenance deletes of histograms.
* Only run single raw deletion maintenance task at a time.
* Fix memory corruption and races in find.
* `/fetch` numeric transforms now support a `fill=<X|forward` kwarg.
* CAQL optimizations for numeric `find() | fill()` and `find | fill:foward()`
* Introduce a `/find` query classification and isolation system. Consolidate `/find` (related) endpoints to use three new classes of jobq called `find_{local,remote}`, `find_fast_{local,remote}`, and `find_slow_{local,remote}`. Add a performance profiling system to track and classify `/find` to place them automatically into each of these three new classes.
* Fix javascript error in snowth console web UI.
* Add jobq mode (LIFO/FIFO) to snwoth console web UI.
* Expand `/find` calls to pull from all nodes if the user specifies that they want the latest datapoints to be included.
* Compare cached last 2 numeric values when deduping results from find calls to make sure we're always using the latest data.
* Disallow adding `__activity`, `__check_uuid`, `__name`, and `__type` as stream tags.
* Add support for histogram shards in cluster rebalance.
* Implement `filter:whence()` and `filter:not:whence()` CAQL functions.
* `graphite_translate` additions/fixes to better match graphite behavior:
  * More Graphite functions implemented in translator - `stddevSeries()`, `stddev()` and `unique()`.
  * `time()` added as alias to `timeFunction()`
  * `timeSlice()` translation
* Add `filter:label:unique` and `stats:stddev` to CAQL
* Disallow adding `__activity`, `__check_uuid`, `__name`, and `__type` tags in check tags and ignore them if they are already there.
* Double `latest` values in `/find` calls will now round less and be more accurate.
* Add `min` mechanism arg to `top` reduction and add `bottom` reduction to `/fetch`
* Add `method="min"` to `top()` and `bottom()` CAQL functions.
* Implement `bottom()` CAQL function.
* More user-errors in CAQL are reported as 4xx HTTP status codes.
* [libmtev 2.3.4](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#234)

### Changes in 0.23.1

2022-07-12

* Fix bug where doubles were being mistakenly cast to integers when returning the last known raw datapoints in `find/tags` calls.
* Fix error where when writing a copy of the last raw data point in a shard into the next shard, we could write a bad data point if no additional data had been written to that shard since the previous rollup.
* Fix crash in `/fetch` groupby in uncommon scenario when replication is stuck and the cluster is unstable.
* Revert graphite SUM treatment as AVG and add a graphite module config to support the old behavior `<coerce_sum>avg</coerce_sum>`.
* Improve raw reconstitute performance by iterating and sending data from all column families in parallel.
* Nodes that are being reconstituted will no longer serve fetch requests.
* Improve default labels for CAQL `delay(...)`
* Tag queries now use less memory.
* Metric database compactions now use less memory.
* Find timeouts will now respect timeouts - either the default timeout, or ones set via the `X-Snowth-Timeout` header. Queries will stop evaluating once they detect that they are past the query deadline rather than running to completion.
* Change default find timeout from five minutes to one minute. Make the timeout value configurable via `find_optimization/@default_find_timeout` in the config file.
* Fix race conditions in fetches when encountering errors
* Fix find timeouts so nodes will break connections to remote nodes during proxy calls if the timeout is reached.
* Fix reconstitute bug where surrogate databases would get redownloaded even if they had already completed being reconstituted.
* Use separate jobqs for `tag_cats` and `tag_vals` find queries.
* Fix possible denial of service in reconstitute where the reconstituting node's requests could overwhelm the other nodes in the cluster.
* [libmtev 2.3.2](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#232)

### Changes in 0.23.0

2022-06-08

**IMPORTANT: Changes to the surrogate database reconstitute process make reconstitute incompatible with earlier versions. Once at least one node has been updated to version 0.23.0, reconstitute operations will not succeed until all nodes have been updated to version 0.23.0.**

* Improvements to the surrogate format for transmission during reconstitute and rebalance.
* Reduce memory footprint and improve performance for `tag_cats` and `tag_vals` find queries.
* Fix level index corruption when deleting keys from the surrogate database.
* Fix a double regression in `graphite:aliasbynode` where the name was incorrectly set.
* Fix issue where watchdog could occur when taking too long to set a check's metadata.
* Fixes for `DivideSeries` and `DivideSeriesLists` graphite-to-caql translation.
* Fix shard reporting issues in stats.json.

### Changes in 0.22.0

2022-05-18

**IMPORTANT: This release includes an update to rocksdb from version 5.8.8 to version 6.20.3. It is not possible to revert a node to a previous version once this version has been installed**

* Upgrade rocksdb from version `5.8.8` to version `6.20.3`
* Fix crash if pulling surrogate data during a reconstitute fails.
* Enable live single shard reconstitute for raw numeric and histogram shards.
* Fix deadlock when trying to delete a rolled up shard.
* `/extension/lua/caql_info` endpoint now accepts `query` in addition to `q`.
* `/extension/lua/caql_info` endpoint now returns post-optimized query.
* CAQL `forecasting:regression` now better supports streams with gaps.
* Fix bugs in side-aware finds where count only results would be incorrect and nodes always proxy to the opposite side instead of the local side.
* Implement `label:replace(...)` CAQL function for regex based label manipulation
* Added CAQL trigonometry functions (sin, cos, etc.)
* There now exists an option to configure the size of batches handled by `clean_rollup_suppressed_metrics` when rollup suppressed metrics are culled. It is `suppressed_rollup_delete_batch_size` in the `<raw_database>` config tag.
* Graphite find queries with `..` now correctly match nothing.
* `graphite_translate` additions/fixes to better match graphite behavior:
* Checking if too few arguments provided
* Add `/suggest/<accountid>/tags` auto-completion assistance endpoint.
* [libmtev 2.2.7](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#227)

### Changes in 0.21.3

2022-04-22

**IMPORTANT: This update changes the format of the metric name database. The database will automatically be converted to the new format the first time the software boots. This will result in the first node bootup after upgrading to take longer than normal**

* Update internal version of the search index database (`metric_name_db`), which will cause the first restart after updating to this version to take longer than normal while the database regenerates.
* Make a variety of find queries utilize a single side (preferring local) when running a sided topology and a sufficient number of nodes are up.
* The find mgr will complete before all nodes have responded if it knows the answer to be complete.
* Fix `graphite_translate` test for `asPercent()`
* Fix CAQL queries to explicitly disallow queries on a single time point
* Removed usage of legacy fetch api (snowth.get)
* Find optimizations:
  * flatten nested and(and())
  * push limit context predicates down through hints.
* CAQL `find() | group_by:merge()` is now a user-facing error with explanation.
* Optimize `__type` and `__activity` finds.
* User friendly time ranges now support omission of start and end times on the `__activity` tag when using the `[epoch] - [epoch]` format (colon format does not allow omission). Corrected an issue where singular epoch times were allowed but should be an error.
* Allow setting of journal batch size and timeout via console `configure set`
* Fix CAQL optimization that could artificially limit `find` results if the pattern matched streams of a different data type.
* Fix heap use after free when removing rocksdb based raw shards
* `graphite_translate` additions/fixes to better match graphite behavior:
  * Fix `asPercent()` translation
* Make best node selection side aware.
* Allow CAQL `find` and friends to support a single argument with a tag search expression.
* Executor metrics updated to be more metrics 2.0 style. They are now tagged with the thread ID as `thread-name`, `queue_<#>_num_jobs` is now `size` with `units: messages`, and `queue_<#>_wait_time_hist_ms` and `queue_<#>_run_time_hist_ms` are now simply `wait_time` and `run_time` with the additional information tagged as stated above, `units: seconds` and "hist" removed from the name entirely. Metrics 1.0 changes include simply grouping by thread name rather than the superfluous internal details in place before.
* Make tag index searching release memory as it executes queries.
* `graphite:{aliasbynode,removenode,tagbynode}` now all support negative indexes.
* Removed falsely reported corruption message from reconstitute caused by empty shard files
* Added `-s [<period>,]<floor>,<ceiling>` commandline option for offline single shard reconstitute.
* CAQL `graphite:removenode` removing duplicate arguments instead of error:
  * `*WithWildards()` functions graphite translation allow duplicated arguments
* `graphite_translate` additions/fixes to better match graphite behavior:
  * Fix `hitcount()` translation
* [libmtev 2.2.5](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#225)

### Changes in 0.21.2

2022-03-22

* Canonicalize inbound metrics without their measurement tags.
* Fix CAQL `graphite:aliasbynode` regression wherein label was unset.
* Add support for find hinting. This allows adding hints such as `and(hint(__check_uuid:<a uuid>,index:none))` that will make the search evaluate against an existing set rather than using the full metric index.
* Fix `egress_function` field updates in surrogate entries.
* Make `histogram:sum()` not normalize by default, `period=` behavior is unchanged. This is a change in the default.
* Make `find:sum()` not normalize by default and add a `period=` kwarg to support normalization.
* Add `op:div2` to CAQL strictly requiring two arguments. Make `/` use `op:div2`.
* Fix `/fetch` reductions of `sum` and `count` to return a stream of zeroes when zero metrics are requested.
* Change logic for finding best node to be smarter and find valid data more frequently.
* Shard status for hist-rollups now reporting to stats.json
* Add `math:ceil`, `math:round`, and `group_by:prod` to CAQL
* Allow operator to set jlog precommit buffer size on metadata feeds via `//metadata/@feed_precommit_size`.
* Add histogram merge pipeline reordering when trailing pipeline functions are commutative.
* Add CAQL `/fetch` optimization for `histogram:count()`, `histogram:count_above()`, `histogram:count_below()`, `histogram:rate_above()`, and `histogram:rate_below()`.
* Unoptimized `histogram:rate()` math fixed to match (correct) optimized version.
* Add `filter:sum:*` and `filter:not:sum:*` functions for graphite translation assistance.
* Shard status for raw and raw-hist now report to stats.json
* Add config setting `max_udp_payload_size_bytes` to set limit on gossip UDP packet sizes (default=1432).
* CAQL `stats:ratio()` now accepts `partition` or `partition_fmt` to calculate partition-relative ratios.
* CAQL `filter:latest:*` and `filter:not:latest:*` now have configurable lookback.
* Several `graphite_translate` additions/fixes to better match graphite behavior:
  * Fix translation issues with `asPercent()` and `divideSeriesLists()`
  * Add implementations for `minSeries()` and `grep()`
  * Added new functions - `currentAbove()`, `currentBelow()`, `filterSeries()` and `multiplySeriesWithWildcards()`
* Fixed a potential crash when manually triggering rollups.
* Reduce upper bound of default gossip interval from 2 seconds to 1.8 seconds. This avoids the occasional appearance of excess gossip latency in the Replication UI.
* Fix compatibility issues with CAQL function `graphite:aliassub`
* Improved check tag find search performance.
* Improved find search performance when using the `*:*` wildcard search.
* Add shard maintenance for raw numeric and raw/rollup histogram shards.
* When `/fetch` upgrades numerics to histograms, it now excludes NaNs.
* Graphite find endpoint will no longer return a 500 on a bad request, favoring the more accurate 400 error.
* Fix crash when attempting to fetch histogram shard data from the `/histogram_raw` endpoint when histogram shards are not enabled.
* Fix crash when enabling the monitor module using the legacy histogram database.
* Gossip messages modified to be larger and fewer in number. This is to fix an issue discovered where a large amount of UDP traffic was causing errors and spamming log files.
* DELETE on `/full/tags` now accepts the `X-Snowth-Advisory-Limit` header properly to limit the number of deletes that will occur in one operation. There is also a config-based maximum that may be set in `<snowth><rest><delete max_advisory_limit="" /></rest></snowth>` beyond which the limit set by `X-Snowth-Advisory-Limit` will not be respected. Additionally, this endpoint now returns the header `X-Snowth-Incomplete-Results: "true"` if the requested delete operation requires more deletes than allowed by `X-Snowth-Advisory-Limit` or the server-configured maximum. This helps ensure that very large deletes will not consume memory ad infinitum.
* [libmtev 2.2.2](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#222)

### Changes in 0.21.1

2022-02-07

* Add explicit `histogram:random:` functions for each supported CDF.
* Fix bug where jlog subscribers could hang around for too long, causing journal data that should have been removed to remain on disk until the next time the node restarts.
* Change user-facing CAQL errors to 400 (from 520) HTTP codes.
* Implement `each:coalesce(X)` in CAQL.
* NNTBS shard states are now being reported to stats.json
* `vector:pack()` now takes a `meta` option that passed tag/name stream metadata through. The default (1) is to pass through metadata. This changes the default naming of unpacked vectors.
* `vector:pack()` now takes a `sloppy` option that allows colliding streams by vector index. The default (0) will throw a run-time error when two streams map to the same vector index.
* Finding an unconfigured shard on disk during boot will no longer result in a FATAL exit.
* CAQL histogram:sum() now support a period kwarg defaulting to 1M
* `/fetch` sums now normalize to 1s ranges and support override with period kwarg
* Support `period=X` transform and reduce arguments for `histogram:rate` functions
* Add `rate_below` and `rate_above` transform operations for /fetch
* Add `each_rate_below` and `each_rate_above` reduce operations for /fetch
* Updated reporting of syntax errors in find tag queries to offer more in depth information to users
* Fix CAQL histogram:rate(period=X) where X is not 1s when optimization is on.
* Support smart quotes in CAQL for strings.
* CAQL is now strict for duration-typed arguments.
* Allow CAQL non-aggregate-safe CAQL functions to work on sub-minute periods.
* Fix table header on #internals web console.
* Prevent NNTBS timeshard manager from accidentally opening a shard in maintenance.
* Completely deprecate all system configuration via the `<pools>` stanza. New configuration will need to be done via the `<eventer>` stanza. Any existing `<pools>` values will be ignored and a warning message will print to the error log.
* Improve rollup efficiency by no longer rolling up raw numeric shards that fall entirely outside of all NNTBS retention windows.
* Make time shard resizes less frequent.
* Add `graphite:removenode` to CAQL.
* Modified the usage of `x-snowth-delete-rollups` to be accepted only on the `histogram_rollup` raw delete endpoint.
* Add a backlog table heading to the job queues admin interface.
* [libmtev 2.1.7](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#217)

### Changes in 0.21.0

2022-01-07

**IMPORTANT: This update changes the format of the metric name database. The database will automatically be converted to the new format the first time the software boots. Once this has been done, the software cannot be reverted to previous versions unless you wipe out the contents of the metric name database first. If you need to downgrade for any reason after updating to this version, please contact Circonus support.**

* Remove deprecated `nnt` field from `/state` output.
* Fix potential crash when bad data points are found during raw data rollups
* Fix `tag_cats` and `tag_vals` endpoints to respect the `X-Snowth-Advisory-Limit` header.
* Added ability to use relative time-based values for activity fields in `/find` queries. Previously, the `activity_start_secs` and `activity_end_secs` fields had to be provided in epoch seconds. The string `now` will be accepted as a field. It will use the current time. You may also use values like `+10s` to indicate "ten seconds from now' or `-10s` to indicate "ten seconds ago". For example: a query that reads `activity_start_secs=-1d&activity_end_secs=now` will pull records that have activity data in the last day. A full list of accepted formats for these new values can be found [here](https://circonus-labs.github.io/libmtev/config/time_durations.html)
* Improve metric database loading times.
* Improve CAQL error messages.
* Fix bug where find requests were not respecting the default limit if no limit was manually specified.
* `graphite_translate` additions/fixes to better match graphite behavior:
  * new functions - `add()`, `movingMin()`, `randomWalk()`, `stddevSeries()`, `pow()` and `powSeries()`
  * `pieMin()`, `pieAverage()` and `pieMax()` implemented as `min()`, `avg()` and `max()`
  * all sorting and pictire manipulation functions implemented as pass()
* Fix race condition on old shard removal that can cause corruption.
* Improve `find` query performance in some pathological cases.
* Fix possible crash when deleting a timeshard while it's also being resized.
* Fix graphite `irondb_tag_filter` search bug that prevented query proxying.
* Fix potential crash when invalid histogram journal data is received by a node.
* Reconstitute recovery from errors on the sending nodes has been partially automated. It now automatically skips shards on errors from the sending node after a configurable number of retries and will retry them once more after finishing all the well-behaving shards. Upon completion, a final list of shards that could not be successfully reconstituted will be recorded in the `errorlog`, allowing further diagnosis and actions to be taken by the operator as needed. Shards which are in maintenance will also be skipped and retried in a similar way.
* Fix `/find/X/active_count` to respect `query` querystring parameter and to force `activity_start_secs` and `activity_end_secs` into activity window alignment.
* Allow `graphite/find` to accept an optional `irondb_tag_filter` query string parameter. This parameter will take a circonus-style tag-query and filter the metrics down to only include matching metrics.
* Fix bug in rollup scheduler that could cause rollups to get scheduled to run multiple times.
* Improve reconstitute stability.
* Fix incorrectly formatted error message when receiving invalid graphite input.
* Fix potential crash on bad fetches from CAQL.
* Fix bug in reconstitute that caused unnecessary replaying of data, slowing down the recovery process after a node finishes reconstituting.
* Improved `/fetch` error handling in CAQL.
* Aligned fetch remote client-side timeout with expressed server-side timeout.
* Clip off the right number of leading branch names in graphite results when using prefixes with wildcards.
* Add `filter:not` CAQL namespace for `any`,`all`,`min`,`max`, and `mean` that inverts the stream selection outcome.
* GET requests to the `/rollup/<check_uuid>/<metric>` endpoint that request data for which no rollup exists now return a `400: Bad Request` error response.
* Remove unused `/find/<account_id>/all` endpoint.
* Expand CAQL durations to support all mtev duration units.
* [libmtev 2.1.5](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#215)

### Changes in 0.20.1

2021-09-23

* Fix potential crash on tags key/value pairs that are exactly 256 characters long.
* Fix assertion failure in timeshard transaction.
* Remove deprecated `/raw/<uuid>` and `/full/<uuid>` DELETE endpoints.
* Remove deprecated `/histogram_raw` check and metric DELETE endpoints.
* Remove unused `/admin` GET and PUT endpoints
* Remove deprecated `/raw/reconstitute` endpoint
* GET requests to the `/metafeed/check/set` endpoint that do not provide the required `checkpoint` and `subscriber` query parameters now returns a `400: Bad Request` error response.
* Add new logging utility, `debug/old_data`, that will log any metric coming into the system that are a configurable amount of time older than the current time. This time value is configurable via the `old_data_logging/@metric_age_threshold` value in the configuration file.
* Add helper tool to accelerate Whisper file scanning.
* Fixed bug with `caql_info` extension that would cause syntax errors on queries using `VIEW_PERIOD` or `VIEW_RANGE`.
* `graphite_translate` additions/fixes to better match graphite behavior
  * `averageBelow` added
  * `averageSeries` changed
  * `diffSeries` changed
  * `divideSeries` now supports `countSeries`, `aggregate`
  * `groupByNodes` now supports `countSeries`, `aggregate`
  * `hitcount` changed
  * `multiplySeries` changed
  * `nonNegativeDerivative` changed
  * `perSecond` changed
  * `scaleToSeconds` changed
  * `abs` added (as alias to `absolute`)
  * `aggregate` changed
  * `maxSeries` / `sumSeries` / `averageSeries` changed
  * `sumSeriesWithWildcards` changed
* Fix issue in `/fetch` where absent/null values could be returned as zeroes.
* Fixed CAQL `histogram:percentile(x,y,z)` to maintain the user-specified ordering.
* [libmtev 2.1.1](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#211)

### Changes in 0.20.0

2021-08-26

* Deprecate `<pools>` configuration. These resource controls are now done via libmtev eventer configuration. New installations will no longer contain the pools stanza. Upgraded nodes with pools configuration will see deprecation notices logged, indicating the corresponding job queue resource to configure. See [pools configuration](https://docs.circonus.com/irondb/getting-started/configuration#pools) for more information.
* Fix bug where raw rollups would occasionally start prematurely.
* Transform 'none' in `/fetch` will now show an error on numeric streams.
* [libmtev 2.1.0](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#210)

### Changes in 0.19.28

2021-08-11

* Fix bug causing occasional NNTBS data corruption on raw data rollups.
* Remove outlier reports.
* Improved coverage and bugfixes to in `extension/lua/graphite_translate`
* Consolidate DELETE endpoints around `/tag` versions. Deprecate unused delete endpoints.
* Remove NNT cache size license checks, as we no longer use the NNT file cache. Remove the display of the cache size from the GUI.
* Fix crash that can occur when closing raw databases at the end of a reconstitute

### Changes in 0.19.27

2021-07-27

* If corruption is detected in an NNTBS shard, offline it instead of exiting with a fatal error.
  *   Operators should be on the lookout for `errorlog` messages matching one of these patterns:

      ```
      Error committing txn: <return code> (error description)
      Error putting to lmdb cursor: <return code> (error description)
      ```

      If these logs appear, contact Circonus Support for help in remediating the issue.
* Fix crashes when trying to use graphite find on a node that is not participating in any topology.
* Fix memory leaks when fetching graphite data.
* Fix races that could lead to data corruption in rare cases.
* Allow databases to close down properly when a node is restarted.

### Changes in 0.19.26

2021-07-16

* Fix race condition in reconstitute that could potentially cause crashes.

### Changes in 0.19.25

2021-07-15

* Fixed memory leaks when performing `/find` calls.
* Add capability for the `/rollup` endpoint to accept types `derivative`, `derivative_stddev`, `derivative2`, and `derivative2_stddev`

### Changes in 0.19.24

2021-07-14

* The utility `snowth_lmdb_tool` now supports a new "dump" sieve that can dump an entire NNTBS shard as text with human-readable surrogate id and timestamp fields.
* Add Swagger documentation to be served directly out of IRONdb on `/api/index.html`
* Performance improvements to the reconstitute process - startup is now considerably faster.
* Clean up internal status files when a reconstitute completes.
* Make topology addresses clickable links in the UI
* Remove debug message that would spam the errorlog when running a reconstitute.
* During a rebalance, sending data for an NNTBS shard the destination node is not configured to handle no longer crashes the destination node
* [libmtev 2.0.4](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#204)

### Changes in 0.19.23

2021-07-08

* Remove `/hist_shard/reconstitute/surrogate` and `/hist_shard/reconstitute/metrics` endpoints
* Speed up NNTBS reconstitute/rebalance.
* Fix bug in rollups where data ingested after a shard has previously rolled up could get erroneously deleted.
* Implement `exclude:label(<re>)` in CAQL
* Implement `exclude(<tag search>)` in CAQL.
* Fix potential deadlock if surrogates fail to write by asserting/crashing.
* Implement `graphite:tagbynode("tag", p1, ...)` in CAQL.
* Snowth `tag_cats` and `tag_vals` work with `__check_uuid` and `__name` tags
* Requests with an `X-Snowth-Proxied` header values of `0` or `off` now act the same as if no header was set.
* Replication values greater than `10` in a snowth topology are rejected rather than coerced to a value of `10` automatically.
* Fix incorrect response codes on invalid query responses
* Allow trailing whitespace in JSON documents POSTed to lua extensions.
* Remove `sweep delete` API endpoints, since this function is made redundant by setting retention policies on data.
* Remove support for the `<rollups>` stanza. Rollups will be entirely determined by the `<nntbs>` stanza.
* If the `<rollups>` stanza is present but does not match the `<nntbs>` stanza, the node will not start.
* If the `<rollups>` stanza is present and matches the `<nntbs>`, a message will print to the logs that `<rollups>` is deprecated.
* Remove support for `parts` elements when inserting NNTBS data directly.
* Remove support for the NNT file-based backing store format.
* Add `connect_timeout`, `speed_timeout`, and `speed_limit` options to the check tag replicator with reasonable defaults.
* Add `normalize` CAQL function.
* Remove remnants of source and check name from graphite output.
* Update `/find/<account>/*` endpoints to be `/find/*` with `X-Snowth-Account-Id` header.
* Make `anomaly_detection` in CAQL apply to all slots.
* Fix crash on requests with a NULL topology.
* [libmtev 2.0.3](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#203)

### Changes in 0.19.22

2021-05-14

* Fix reconstitute issue where it was possible to try to write to a transaction after the transaction was committed, leading to potential data corruption.
* Allow for whitespace before `(...)` and `{...}` in CAQL function invocations.
* [libmtev 2.0.1](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#201)

### Changes in 0.19.21

2021-05-06

* Updated default configuration to set a larger size for Graphite find query cache. The attribute "query\_cache\_size" on the `<metric_name_database>` node is now set to 10000 for new installations.
* Allow forcing the reconstitute process to skip specific nodes.
* Add a graphite translate endpoint to assist graphite -> CAQL translation.
* Add accounting stats for `metrics_db` cache.
* Increase default rollup concurrency for raw numeric and histogram shards from 1 to 4 jobq threads.
* Add `op:mod`, `each:mod`, and `%` to CAQL.
* Do not coarsen fetches windows in `window:mean` or `window:sum` when `period` kwarg is provided.
* Fix various memory leaks.
* Add `find:sum(...)` to CAQL that will return `count * average`.
* Allow implicit type shifts in CAQL: `op:div(){pass(){1,2} | vector(), 2}`.
* Implement `derivative()` and `counter()` CAQL functions that perform per-second calculations.
* Implement `filter:values:{quantile,percentile}:<op>` and `filter:values:not:{quantile,percentile}:<op>` in CAQL to remove stream outliers.
* Fix deadlock on various histogram fetch errors.
* Add site-local extensions config include.
* Make rollup and delete timing behavior more accurate, especially after crash or restart.
* Web UI: Replication Latency tab bugfix: Each node's latency is still calculated even if its sub-list isn't expanded.
* [libmtev 2.0.0](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#200)

### Changes in 0.19.20

2021-03-24

* Update artmap file version from 1 to 2. Metric artmap files will regenerate upon updating to this version, increasing search accuracy. This will cause the first bootup after upgrading to this version slower than normal, as the files will need to be rebuilt.
* Fix potential crash when fetching metrics with very large names.
* Fix potential deadlock in raw database rollups.
* Improved web UI performance: the Replication Latency tab now won't update unless it's visible.
* Allow configuring the `SO_SNDBUF` buffer size for the gossip UDP socket via the `max_udp_socket_sndbuf_size_bytes` attribute on the `<gossip>` stanza.
* Allow configuring the range of time in which we will send gossip packets with `<gossip minimum_latency_ms=<lower bound> maximum_latency_ms=<upper_bound>`. If not provided, or invalid data is provided, we will default to a 200ms lower bound and 2000ms upper bound.
* Fixes to recovering after an incomplete NNTBS live reconstitute and added automatic backup that can be overridden using the optional (`backup=0`) parameter.
* [libmtev 1.12.18](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#11218)

### Changes in 0.19.19

2021-03-10

* The [topo-helper](https://docs.circonus.com/irondb/getting-started/manual-installation/#create-topology-layout) utility has been updated to support sided configuration, as well as auto-generated node UUIDs and using hostnames instead of IP addresses.
* Improved error checking and logging for jlog read/write errors.

### Changes in 0.19.18

2021-03-04

* Improve logging on data journaling errors and fix logic hole that could lead to infinite loops.
* Add requirement to single-shard NNTBS live reconstitute to specify if the shard should be replaced with data from other nodes (`merge=0`) or if data from other nodes should be merged into the preexisting shard data (`merge=1`).

### Changes in 0.19.17

2021-02-24

* Fix many races dealing with time shard manipulation
* Fix race condition when setting a single shard into maintenance mode
* Fix bug that could cause memory leaks on timeshards.
* Fix bug that could leak an LMDB transaction leading to database corruption
* Fix race conditions when handling time shards
* Fix bug where extremely old raw data could be inserted into the database via flatbuffer.
* Fix bug where attempting to roll up an NNTBS shard with a floor value of 0 would cause a crash.
* Allow configuring a minimum floor for NNTBS shards. The default floor is 1, which will prevent data that would write to an NNTBS shard with a floor of 0 from rolling up - it will simply be removed.
* Fix crash in graphite find with x-snowth-adivisory-limit header.
* `/fetch` histogram `sum`, `count_above`, `count_below` normalize per minute.
* Add `VIEW_{PERIOD,RANGE}_{MINUTES,SECONDS}` CAQL variables.
* Add CAQL `/fetch` optimizations for `graphite:find:*`.
* Allow histogram transforms to work in the reduce phase for `/fetch` using `each_` prefix.
* Fix `groupby_*` default label construction in fetch.
* Make `/fetch` append transaction pipelines to labels.
* Fix transaction pipeline appends to occur between the untagged metric name and any stream tags.
* Add collapsed `/fetch` optimizations for `group_by`in CAQL.
* Added a new fifo to streamline raw fetch, reducing latency and memory requirements.
* Fix CAQL optimizer and allow push-down of more chains into direct `/fetch` expressions.
* Implement `sort:label(reverse=0)` and `sort:{mean,min,max}(reverse=0)` CAQL functions.
* Implement `filter:limit(N)`, `filter:label(regex)`, and `filter:not:label(regex)` CAQL functions.
* Implement `filter:{mean,min,max}(X)` and `filter:not:{mean,min,max}(X)` CAQL functions.
* Implement `histogram:random()` to synthesize histograms for common density functions.
* Implement `randomwalk(max,min,change,seed=)` CAQL function for generating random data.

### Changes in 0.19.16

2021-01-29

* Added `graphite:aliassub` in CAQL to emulate Graphite's aliasSub function.
* Added `stats:ratio(of=1)` in CAQL to allow calculating each input stream over the sum of streams.
* Added optional verbose rollup/delete debug logging
* Fix race in raw data rollups where we could attempt to roll data up before opening the db.
* Fix bug in raw data rollups where if a full delete operation is performed on a metric and a raw shard that contained that metric still needs to roll up, the rollup could get stuck.
* Support vectorized operations across most CAQL functions (stats and ops)
* Add several Graphite-style functions to assist those migrating from Graphite
* Allow CAQL #pragmas to have values
* Allow CAQL #pragmas to be one-line (no trailing line feed required)
* Support `#min_period=Xs` as a grangular replacement for `hf:find()`
* Leverage `level_index` for tag searches on `__name` that are explicitly using the `[graphite]` matching engine (e.g. `and(__name:[graphite]*.prod.**.count)`)
* Update to new libnoit metric search APIs.
* Further improvements to activity tracking accucracy.
* [libmtev 1.12.17](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#11217)

### Changes in 0.19.15

2021-01-15

**IMPORTANT: If you are using irondb-relay, you must update the irondb cluster to at least version 0.19.15 before updating irondb-relay to version 0.0.45 or later to avoid a disruption in your data**

* Improvements to activity tracking accuracy.
* Added optional logging and increased error reporting for raw shard rollups and deletes.
* Improve accuracy when compacting metricsdb by accounting for out-of-order surrogates arriving.
* `histogram:count*` and `histogram:rate*` CAQL functions now work on sub-minute periods.
* `histogram:count*` CAQL functions now return raw counts instead of per-minute values.
* `histogram:rate*` CAQL functions now take an option named `period` to specify the denominator units (default: per second).
* `histogram:count_bucket` and `histogram:rate_bucket` have been renamed `histogram:count_bin` and `histogram:rate_bin`, respectively.
* Reconstitute process now pulls activity data from the surrogate db rather than relying on raw data to fill it in. This will prevent the possible loss of activity data.
* [libmtev 1.12.16](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#11216)

### Changes in 0.19.14 (unreleased)

2020-12-16

* Add -R flag to snowthsurrogatecontrol tool that will allow repairing corrupt surrogate databases.
* Better error reporting and handling for various find calls.
* The shard compactor script now checks the shard's status just prior to replacement, to make sure it is still offline.
* Support for live reconstitute of a single NNTBS shard via a POST command (`/nntbs_shard_reconstitute_live`)
* Support `metric_name`, `display_name`, and multiple tag values in v2 search conversion.
* Increased logging for LMDB errors and resize, detect resize failures, and improve LMDB and RocksDB retries.
* Improve `raw_only_delete` efficiency and memory usage, add `/raw_only_delete` REST API.
* Make sure to do index manipulation on metric deletion.
* Fix crash on ingestion of malformed or missing histogram in H1/H2 records.

### Changes in 0.19.13

2020-11-03

* Restrict batch size in raw-only delete, in case the find set is too large to fit in memory.
* Performance improvements to the `active_count` query.
* Use activity-based method of finding expired metrics to avoid issues with extremely large numbers of active raw-only metrics.
* Use `localstate` instead of `/var/tmp` for temporary proxy data used in inter-node communication.
* Add `tag:synth` CAQL function.
* Fix several file desciptor leaks related to improper handling of proxy buffers.

### Changes in 0.19.12

2020-10-22

* Fix race condition that led to a potential use after free.
* Fix various bugs in check tag search that could cause incomplete find results.
* Add `explain=1` option to `/find//tags` endpoint. Returns a header explaining the full query that was performed on each node.
* Add support for cumulative histogram ingestion.
* [libmtev 1.12.13](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#11213)

### Changes in 0.19.11

2020-09-29

* Fix memory leak when the eventer rejects raw journal data for having too many jobs on the backlog.
* Fix memory leak when compacting metric database.
* Restore eventer site config file.
* [libmtev 1.12.12](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#11212)

### Changes in 0.19.10[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01910) <a href="#changes-in-01910" id="changes-in-01910"></a>

2020-09-03

* Fix potential crash in graphite find.
* [libmtev 1.12.10](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#11210)

### Changes in 0.19.9[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0199) <a href="#changes-in-0199" id="changes-in-0199"></a>

2020-09-01

* Allow raw numeric reconstitute to go by shard instead of by metric. This will significantly increase the speed of the raw reconstitute process.

### Changes in 0.19.8[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0198) <a href="#changes-in-0198" id="changes-in-0198"></a>

2020-08-27

* Update default configuration template to include two additional listener attributes for the main 8112 listener. These improve performance, especially at higher ingestion rates.
  * `accept_thread=on` dedicates a thread to handling new connections.
  * `fanout=true` distributes new events from accepted connections across threads in the default eventer pool.
* Add a ranked system for determing which egress function to use when selecting results via graphite queries. This will use the value we determine to be the "best" using an internal algorithm rather than using the first result we saw, which was the previous behavior.
* Allow retrying on failures to write to NNTBS shards during reconstitute. Improve error messages related to the NNTBS reconstitute process.

### Changes in 0.19.7[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0197) <a href="#changes-in-0197" id="changes-in-0197"></a>

2020-08-03

* Fix race condition in search index management.
* Various use-after-free fixes.
* Various memory leak fixes.
* Default timeout for `latency_sensitive` event loop increased to 10 seconds.
* Move parsing of raw data into separate jobq to process asynchronously.
* Update CAQL `search:metric:...()` to up-convert to a tag search and leverage the `find:...()` processing unit.
* Alter both `search:metric:...()` and `find:...()` to support external (out-of-band) expansion replacement. Within IRONdb, default both to internal index-based expansion. When not in IRONdb (CAQL-broker) maintain the pre-existing default (search: external, find: internal). Allow config-based override of these extra-IRONdb defaults.
* Add the `impl` keyword arg to both `search:metric:...()` and `find:...()` to allow statement-based selection of internal or external search expansion.
* Implement vector:pack() and vector:unpack() in CAQL. These are experimental.
* [libmtev 1.12.8](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1128)

### Changes in 0.19.6[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0196) <a href="#changes-in-0196" id="changes-in-0196"></a>

2020-07-10

* Add field, `X-Snowth-Verify-Owner`, for all `find` calls that will verify that the node being queried owns the metric in question before reporting it. This will make counts more accurate on clusters where a rebalance has been performed and there are extraneous surrogate database entries on nodes.
* Several memory leak and stability fixes.
* [libmtev 1.12.4](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1124)

### Changes in 0.19.5[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0195) <a href="#changes-in-0195" id="changes-in-0195"></a>

2020-06-12

* Remove source and check name from graphite tree.
* Replace check name with explicitly configured aliases.
* Implement on-disk persisted ART maps for tag search, which improves boot-time index construction by up to 2x.
* Fix stuck set-crdt (metadata) replication to third-parties: automatic feed (jlog) repair when corruption is detected.
* Fix possible memcmp crash when surrogate keys are smaller than `uint64_t` in size.
* Load libmtev ptrace modules for better crash-reporting
* Change `/find//active_count` API to use the `count_only` methodology from find which is faster and more memory efficient, but yields estimates when nodes are down.
* Support `__type:(numeric|histogram|text)` in tag searching. Does not support pattern matching.
* Add `lmdb_flags` attribute to `nntbs` and `metadata` nodes in config to allow for better control. Change to drop `MDB_NOMEMINIT` by default as the performance implications aren't significant. Drop `MDB_NOSYNC` from the default `metadata` flags.
* Allow nntbs timeshards to recover when bad data is encountered and add `.db.nntbs.errors` (`errors|ST[db-type:nntbs,...]`) statistic.
* Move module initialization startup messages out of the error log and into the startup log.
* Fix bug where we would attempt to abort LMDB transaction after failed commits, which can cause double frees.
* [libmtev 1.12.0](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1120)

### Changes in 0.19.4[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0194) <a href="#changes-in-0194" id="changes-in-0194"></a>

2020-04-27

* Fix a bug in parsing FlatBuffers for raw data.
* Fix null pointer exception crash on absent metric locator during `/find`.
* Improved performance of metric search indices, reducing initial start-time and speeding up tag searches where the category has wildcards (e.g. `and(version-*:v1.*)`)
* Implement a variety of text-based `/fetch` transforms for counts and rates.
* lua: Fix a bug where partially-initialized lua extensions were kept around.
* CAQL: Add package `filter:*`.
* CAQL: Validate uuid passed to `metric:*` functions.
* [libmtev 1.10.3](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1103)

### Changes in 0.19.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0193) <a href="#changes-in-0193" id="changes-in-0193"></a>

2020-03-16

* Fix `/fetch` histogram transforms
* Implement rate transform on histograms in `/fetch` endpoint.
* Make existing `stddev` and `average` transforms work for histograms in `/fetch`
* Make existing `mean` transform work for numerics in /fetch
* Track metric count differently and provide per-account measurements.
* CAQL: Improve performance of all binary operators, by defaulting to approximate processing.
* CAQL: Improve `fill()` performance
* CAQL: Improve `window:sum()` performance
* CAQL: Add `coalesce()` function
* CAQL: Add `integrate:while()` function
* CAQL: Add `forecasting:auto()` method
* CAQL: Add broadcasting support to `forecasting:slope()`/`forecasting:regression()`
* [libmtev 1.10.0](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1100)

### Changes in 0.19.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0192) <a href="#changes-in-0192" id="changes-in-0192"></a>

2020-01-28

* Change NNTBS rebalance behavior to go by shard rather than by metric.
* Support [tag query filter](https://docs.circonus.com/irondb/getting-started/configuration/#raw_database-suppress_rollup_filter) for suppressing rollups from raw database.
* CAQL: `Add histogram:ratio_above()` / `histogram:ratio_below()` functions
* CAQL: Fix a bug where `fill()` would not fill-in missing data
* CAQL: Improve `window:merge` performance
* CAQL: Fix a bug where optimization rules were falsely applied
* CAQL: Fix a bug where long running caql-queries could trigger watchdog timeouts
* CAQL: Fix an issue where failed proxy attempts could cause `find` errors even when N-W+1 were successfully interrogated.
* [libmtev 1.9.10](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1910)

### Changes in 0.19.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0191) <a href="#changes-in-0191" id="changes-in-0191"></a>

2019-12-17

* Fix memory leaks in NNTBS and raw reconstitute paths.

### Changes in 0.19.0[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0190) <a href="#changes-in-0190" id="changes-in-0190"></a>

2019-12-10

* Change NNTBS reconstitute to iterate through entire shards rather than pulling individual metrics. THIS IS A BREAKING CHANGE - any reconstitute that is in progress when this deploys will need to be restarted from the beginning. All nodes will need to be brought up to the latest version as well.
* Change framing of raw reconstitute data to improve efficiency.
* CAQL: Add base parameter to the integrate() function.
* CAQL: Add histogram:subtract() function
* [libmtev 1.9.8](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#198)

### Changes in 0.18.8[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0188) <a href="#changes-in-0188" id="changes-in-0188"></a>

2019-11-21

* Fix infinite loop when `/fetch` exhausted its deadline and nodes are down.
* Make the `resize_cluster` script load the new topology on removed nodes.
* Fix bug in flatbuffer byte alignment where the code was inaccurately determining if we needed additional byte alignment.
* Support `count_only=1` for `find//tags`.
* Align and validate all surrogate flatbuffer data before attempting to use it. This will prevent using incorrect values and/or crashing on bad data.
* Fix bug with metric type changes using surrogate put REST API.

### Changes in 0.18.7[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0187) <a href="#changes-in-0187" id="changes-in-0187"></a>

2019-11-18

* Fix crash when fetching histograms with a period less than 1 second
* Always adjust Graphite step to best NNT rollup if no raw data found
* Add new log stream for Graphite step adjustments (`debug/graphite/step_adjust`)
* CAQL: Fix a bug with handling missing data in diff()
* CAQL: Improve performance of window:/rolling:/aggregate: functions in #strict mode
* CAQL: Add `aggregate:*` package for controlling data aggregation on graphs
* CAQL: Support grouping by multiple tags
* CAQL: Performance improvements to `diff()`/`integrate()`/`delay()`/`is_missing()`
* [libmtev 1.9.5](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#195)

### Changes in 0.18.6[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0186) <a href="#changes-in-0186" id="changes-in-0186"></a>

2019-11-08

* Fix potential null dereference/crash when iterating raw database during reconstitute
* Fix crash in reconstitute where attempting to defer rollups until after the reconstitute was finished was causing a race leading to a crash.
* CAQL: Add multiple input slots to the `delay()` function and improve its performance
* CAQL: Add deprecation warnings to `histogram:window` and `histogram:rolling`; `window:merge` and `rolling:merge` should be used instead.
* CAQL: Revise the time aggregation functions `window:*` and `rolling:*`
  * Improve performance by leveraging pre-aggregated data
  * By default the results of `window:*` functions no longer lag behind the incoming data when displayed on graphs. The old behavior can be restored by passing `align="end"` as a parameter.
  * Add support for multiple input streams
  * Align window boundaries consistently
  * Add `window:first()` function that selects the first sample in each window
  * Add `window:merge()` function to aggregate histograms over time
  * Add `skip` parameter to control the advancement of time windows
  * Add `period` parameter to control the granularity of input data
  * Add `align=start/end` parameter to control alignment of the output data
  * Add `offset` parameter to control window offset against UTC
* CAQL: Add #strict directive that forces serial data processing with period=1M
* CAQL: Improve speed and accuracy of the `integrate()` function.

### Changes in 0.18.5[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0185) <a href="#changes-in-0185" id="changes-in-0185"></a>

2019-10-29

* Fix surrogate/put `type` setting.
* Prefer `uuid` and `caetgory` as fields instead of `check_uuid` and `source` to match the /find output.
* Disable `nnt_cache` module in the default configuration for simplicity.
* Make use /fetch deadline handlers in lua/CAQL
* Support X-Snowth-Timeout and X-Snowth-Deadline headers to /fetch
* Allow activity=0 to /find//tags to suppress activity information.
* Support telnet-like console access via the administrative web UI.
* CAQL: Add deprecation warning to search:metric() and metriccluster() function. Search v2 and Metric-clusters have been deprecated for a while now. We plan to remove these deprecated function in 2020-01-31. This will affect caql checks as well as CAQL Datapoints on graphs. With this change, the UI will show users a warning, when one of those deprecated functions is used. Circonus offers the more-powerful tag-search feature, exposed as find() in CAQL.
* CAQL: Add default labels to `histogram:*` output
* CAQL: Restrict sorting of results to the find() function, so that, e.g. top-k output is not sorted by label
* CAQL: Add tag:remove() function
* CAQL: Set default/max limits for CAQL find() queries to 1000/3000 (configurable)
* CAQL: Speed-up data fetching with the metric(), and the deprecated search:metric() and metriccluster() functions, by leveraging the /fetch endpoint.
* CAQL: Fix bugs with limiting and sorting outputs. Introduced: 2019-10-22
* CAQL: Optimize a number of query patterns to leverage federated data processing:
  * find() | stats:{sum,mean}
  * find() | count()
  * find() | top()
  * find:histogram() | histogram:merge()
  * find:histogram() | histogram:sum() | stats:sum()
* CAQL: Fix count() function to not count NaN values
* [libmtev 1.9.2](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#192)

### Changes in 0.18.4[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0184) <a href="#changes-in-0184" id="changes-in-0184"></a>

2019-10-16

* Support trailing \*\* in graphite queries in a way that is leaf-only.
* Support a filter config option for the monitor module.
* Support histogram input for /fetch `groupby_stats`.
* Implement histogram /fetch transforms: `{inverse_,}{quantile,percentile}` and `count_{above,below}`.
* Bug: Fix crashes related to bad locking when adding/removing a metric locator from the surrogate cache.
* Bug: Fix potential integer overflow when using the `/fetch` endpoint that could cause occasional incorrect results.
* CAQL: Fix account\_id handling for histogram summary views.
* CAQL: Add sensible default labels to histogram:percentile() output.
* CAQL: Performance improvements to integrate() function.
* CAQL: Leverage /fetch endpoint for find() operations. This is a significant performance improvement that should make CAQL find() operations much faster.

### Changes in 0.18.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0183) <a href="#changes-in-0183" id="changes-in-0183"></a>

2019-10-07

* Support `__activity:start-end` inside search query nodes.
* Prefix accelerate ART-based tag searches with escaped special characters (`/^foo\.bar\.baz\.[^a]*cpu_*/` would previously prefix only `foo`, but will now prefix `foo.bar.baz.`)
* Performance improvements for raw data reconstitute.
* Bug: Fix potential stack smash when writing items to the surrogate cache.
* [libmtev 1.8.5](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#185)

### Changes in 0.18.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0182) <a href="#changes-in-0182" id="changes-in-0182"></a>

2019-10-01

* Performance improvements releated to opening raw timeshards.
* Disable filesystem read-ahead on NNTBS shards to improve performance.
* Various Performance improvements related to data fetching:
  * Less piecemeal work is performed, which means that long runs of fetches are performed in the same jobq and not fanned out as extensively.
  * epoch/apocalypse times for numeric fetches are accelerated using activity tracking.
  * The /rollup engine=dispatch endpoint now does a simple merge of nntbs and raw.
  * Legacy /rollup behaviour of a complex nntbs/raw/nntbs sandwich is available via engine=dispatch\_coarsen.
* Greatly improve performance when fetching rollup data for a stream that has no historic data before the starting time and for which there are many prior raw timeshards. This improves the fetch time from tens of seconds to tens of milliseconds.
* The graphite series fetch functions no longer move the `from` parameter forward to limit leading nulls in output.
* Bug: Fix memory leaks in raw data iterator and surrogate db loading
* Bug: Change the /fetch API endpoint to perform work in the snowth\_fetch\_remote and snowth\_fetch\_local jobqs. It was using an incorrect jobq before.
* Bug: Fix use-after-free that could cause crashes when using the /fetch API endpoint.
* Bug: Fix crash in graphite fetching when there are greater-than or equal-to the data replication value (W) nodes down.
* Bug: Fix ck\_fifo usage to prevent memory misuse that could lead to crashes when loading the surrogate DB or processing journal replication data.
* Bug: Fix various potential crashes in reconstitute/rebalance.
* Bug: Fix console web UI to prevent abusive loading of json data after a suspended connection is reestablished.
* Bug: Replace confusing graphite fetch error messages with more coherent ones.
* [libmtev 1.8.2](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#182)

### Changes in 0.18.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0181) <a href="#changes-in-0181" id="changes-in-0181"></a>

2019-09-24

* Change raw data reconstitute to use flatbuffers instead of M records. This will require all nodes in the cluster to be updated before reconstitute will work properly.
* Add `surrogate_database/@{latest_future_bound,implicit_latest}` and track the latest arriving value for metrics accordingly. Expose them via find according to a `latest` query string parameter.
* Add ability to enable/disable the NNT Cache module via a POST command (/module/nnt\_cache?active={0,1})
* Add ability to manually flush the NNT Cache via a POST command (/module/nnt\_cache/flush)
* Performance improvements in database iteration - should improve both insert and fetch operations.
* Support `**` wildcard expansion in Graphite find queries.
* Bug: Ensure that all NNTBS data is transferred correctly during certain reconstitute edge cases, such as when the NNTBS metric was the final metric in a shard or if there are long gaps where there is no data for a metric resulting in the data not being stored in contiguous shards.
* Bug: Ensure that surrogate db reconstitute is finished before inserting text and histogram records during reconstitute to avoid potential race conndition when updating the surrogate db.
* CAQL: Support for labeling multiple output streams with label() function.
* [libmtev 1.8.0](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#180)

### Changes in 0.18.0[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0180) <a href="#changes-in-0180" id="changes-in-0180"></a>

2019-08-27

* Remove outdated/broken `/activate` endpoint
* Add additional safety to the topology compilation progress - fail to compile a topology if the write\_copies value is higher than the number of nodes.
* During data fetch, if no raw data is present, Graphite rollup span now aligns to the best NNT rollup available.
* Improve performance, scale, and versatility of rebalance operations.
* Bug: Fix broken topology change rejournal code - was writing data to ourselves pointlessly and was occasionally writing data with a bad topology.
* Bug: Reject incoming data puts when node is ephemeral or not participating in current topology. Previously, this would cause crashes.
* CAQL: Make use of activity period tracking to avoid fetching empty metrics.
* [libmtev 1.7.0](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#170)

### Changes in 0.17.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0173) <a href="#changes-in-0173" id="changes-in-0173"></a>

2019-08-15

* Performance improvements to inter-node data journaling.
* Bug: Fix prometheus module label equality searches for values beginning with `/` or containing wildcard expansions `*` and `?`.
* Bug: Fix bug in reconstitute where the reconstituting node was not writing correct check name and account id data to the surrogate db
* Bug: Fix crash when fetching raw numeric data using metric names that cannot be canonicalized.
* [libmtev 1.6.26](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1626)

### Changes in 0.17.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0172) <a href="#changes-in-0172" id="changes-in-0172"></a>

2019-07-29

* Add ability to use hostnames in cluster topology files - previously, only IP addresses were allowed.
* Improve performace by not updating indexes on non-metadata surrogate DB writes.
* Bug: Fix Graphite sum egress function - the fetch was erroneously summing data that was already summed, resulting in reporting values that were larger than expected.
* CAQL: Fix a bug in find() where fully completed queries would be reported as truncated
* CAQL: Don't truncate find() queries that have been running for less than 4 seconds.
* [libmtev 1.6.24](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1624)

### Changes in 0.17.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0171) <a href="#changes-in-0171" id="changes-in-0171"></a>

2019-07-18

* Bug: Various memory leaks fixed in the /fetch endpoint.
* Allow snowth topologies to use names instead of just IPv4 addresses in the address attribute, they are resolved once at runtime compilation.
* Bug: Fix external metadata replication getting stuck in a loop due to improper checkpoint parsing.
* [libmtev 1.6.21](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1621)

### Changes in 0.17.0[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0170) <a href="#changes-in-0170" id="changes-in-0170"></a>

2019-07-16

* Prometheus and OpenTSDB integrations are now active by default for new installations. If you previously activated one or both of these modules in `/opt/circonus/etc/irondb-modules-site.conf`, you may remove those configurations at your convenience after upgrading, though it will not be an error for the module to be configured more than once.
* Dump out query text to error log on a parse error with tag query finds.
* Fix clustered reads in the prometheus module.
* Increase default concurrency in process\_journal and data\_read jobqs.
* Implement activity tracking for graphite queries.
* Improve surrogate database loading speed.
* Bug: Fix occassionaly crashes in pipelined replication journal receptions.
* Bug: Optimize surrogate replay and prevent/repair corruption via auto-repair.
* Bug: Fix condition where surrogate checkpoint would not complete if no surrogate activity has transpired since boot. This fixes many issues that were caused by this, such as deletes and raw data rollups getting stuck and not completing.
* Bug: Fix issue where we'd occasionally return null data when doing a proxy using the rollup endpoint.
* Bug: Fix memory leaks related to activity tracking.
* CAQL: Return an error on find calls if no account information is found.
* [libmtev 1.6.20](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1620)

### Changes in 0.16.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0163) <a href="#changes-in-0163" id="changes-in-0163"></a>

2019-06-26

* Add activity data to `tags/<id>/find` JSON responses.
* Bug: Address inconsistent activity windows on single stream batch loading.
* Bug: Fix consistency issue with in-memory indices of check/tag set-crdt data.
* Bug: Fix potential crashes related to not acquiring the read lock before cloning an oil (ordered interval list) object for activity tracking.
* Bug: Fix memory leaks that occur in the metrics database when using `find` to search for metrics.
* [libmtev 1.6.16](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1616)

### Changes in 0.16.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0162) <a href="#changes-in-0162" id="changes-in-0162"></a>

2019-06-19

* Change default text fetching to provide the prior value if the requested start offset is between recorded samples. Expose `lead=<true|false>` query string parameter, defaulting to true, to turn this feature on or off.
* Bug: Fix crash on error in full delete with long metric names and tags.
* Bug: Remove erroneous "missing activity cf" message in log on startup.
* Bug: Remove temporary files accidentally left in /var/tmp during reconstitute.
* Bug: Fix opentsdb parsing bug where we handled timestamps without decimal points incorrectly.
* CAQL: Update docs.
* [libmtev 1.6.14](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1614)

### Changes in 0.16.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0161) <a href="#changes-in-0161" id="changes-in-0161"></a>

2019-06-04

* Bug: Prevent null pointer exception in the data replication path when the check name is undefined.
* CAQL: Assert that start times are before or equal to end times in queries.

### Changes in 0.16.0[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0160) <a href="#changes-in-0160" id="changes-in-0160"></a>

2019-05-28

**WARNING: Downgrades will not be possible once this version is installed**

* Introduce a dedicated column family in the surrogate database to track activity. This results in reduced I/O workload.
* Change histogram quantile/sum/mean operations to return approximations that minimize the relative error.
* Non-histogram monitor metrics should be tracked as numeric or text, not histogram.
* Ensure `/find` endpoints emit valid JSON.
* Faster setmeta serialization for merge.
* Increase default `surrogate_writer` job queue concurrency to `6` (from `1`).
* Fix race in metrics db (search indexes) where some metrics might be omitted during index construction.
* Fix crash when `/rollup` rollup\_span == `0` (and require rollup\_span > `0`).
* Documentation: add [Monitoring](https://docs.circonus.com/irondb/administration/monitoring/) page describing how to obtain and optionally auto-store internal node statistics.
* Bug/CAQL: Fix histogam:count\_below() to also count samples in the current bucket, as the documentation states.
* Bug/CAQL: histogram:stddev() will now return nan ("not a number") for histograms with a single value instead of `0`.
* [libmtev 1.6.12](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1612)

### Changes in 0.15.8[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0158) <a href="#changes-in-0158" id="changes-in-0158"></a>

2019-05-09

* /rollup/ and CAQL fetching functions now correctly defer reads on replication delay.
* Incoming rest calls are now assigned task IDs based on either the X-Snowth-TaskId header or an an active zipkin trace id.
* Performance improvements when debugging is disabled.
* Allow graphite and opentsdb raw socket to accept tags with special characters.
* Add surrogate checkpoint latency stats.
* Added an optional header, "x-snowth-metadata-flush", to delete requests. If set to `0`, this will disable metadata flushing.
* [libmtev 1.6.10](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1610)

### Changes in 0.15.7[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0157) <a href="#changes-in-0157" id="changes-in-0157"></a>

2019-05-01

* CAQL: Fix regression introduced in version 0.15.6 that would cause some CAQL fetches to fail.

### Changes in 0.15.6[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0156) <a href="#changes-in-0156" id="changes-in-0156"></a>

2019-04-30

* Fix a performance regression introduced by 0.15.5 where CPU usage could spike.
* Performance improvements when looking up locations on the topology ring.
* Ensure all journal replication threads are supplied with work. Previously, if more than one replication thread existed and there was not sufficient load to utilize all of them, some journal segments were not removed after their data was replicated. This led to increased disk usage over time, and was exacerbated by a change to the default journal replication concurrency in 0.15.3.
* CAQL: Add type checking facilities to CAQL function arguments.
* CAQL: histogram:count\_\*() processing on higher periods, was off by a factor of VIEW\_PERIOD/60. This is corrected now.
* CAQL: Expand label() functionality.
* CAQL: Add tag() function.

### Changes in 0.15.5[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0155) <a href="#changes-in-0155" id="changes-in-0155"></a>

2019-04-23

* Fix max\_ingest\_age and max\_clock\_skew parameters in graphite handling. max\_clock\_skew will default to the raw db max\_clock\_skew or else one day. Records will be elided if they are earlier than now - max\_ingest\_age or later than now + max\_clock\_skew.
* Fix thread safety issues that could lead to occasional crashes.
* CAQL: Fix `find:histogram_cum()` functionality.
* CAQL: Performance Improvements.
* Documentation: Add docs on the [UI Internals tab](https://docs.circonus.com/irondb/administration/operations/#internals-tab), which contains a rich set of statistics for troubleshooting performance problems.
* [libmtev 1.6.9](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#169)

### Changes in 0.15.4[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0154) <a href="#changes-in-0154" id="changes-in-0154"></a>

2019-04-12

* Fix startup crash bug in maintaining retention windows.
* Fix reconstitute bug in cases of incomplete file reads.
* Fix bug where multiple time retention maintenance jobs could run concurrently.
* Performance improvements to inter-node gossip communications.
* Support FlatBuffers requests in /histogram read endpoint.
* Support backlog display and stats filtering in UI.
* OpenTSDB ingestion is now an optional module.
* CAQL: Increase the default histogram fetch limit to 3M.
* CAQL: Accelerate sum/sub/prod/div operations.
* CAQL: histogram:percentile and histogram:count\_\* operations now act on multiple input slots rather than just the first one.
* Documentation: put `gpgcheck=0` back into crash-reporting repo stanza for EL7. These packages are not produced by Circonus, we simply mirror them.
* [libmtev 1.6.8](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#168)

### Changes in 0.15.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0153) <a href="#changes-in-0153" id="changes-in-0153"></a>

2019-04-02

* Limit search results to 10,000 items by default. This can be overridden by setting a request header, `x-snowth-advisory-limit`, to a positive integer value. Setting it to -1 or "none" removes the limit.
* Change default [journal replication concurrency](https://docs.circonus.com/irondb/getting-started/configuration/#journal-replicate_concurrency) from 1 to 4.
* Memory leak and crash fixes.
* Alter search to include check\_tags if present.
* Add flag to allow nodes to rebalance in parallel rather than forcing nodes to rebalance one at a time.
* Various performance improvements.

### Changes in 0.15.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0152) <a href="#changes-in-0152" id="changes-in-0152"></a>

2019-03-27

* Improved the CAQL label function to support name and tag extraction
* Faster surrogate writes (adding new metrics and updating activity information)
* Improve NNTBS timeshard open/close performance by reducing unnecessary locking
* Support added for cumulative histograms at read time
* Make rebalance more robust
* Reduce graphite read workload on datasets with large timespans
* Add native prometheus read/write endpoints
* Fix crash under repetitive license violations

### Changes in 0.15.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0151) <a href="#changes-in-0151" id="changes-in-0151"></a>

2019-03-19

* Add module to monitor IRONdb statistics internally and feed them back into the DB.
* [libmtev 1.6.5](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#165)

### Changes in 0.15.0[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0150) <a href="#changes-in-0150" id="changes-in-0150"></a>

2019-03-18

* Add support for OpenTSDB data ingestion.
* Add eventer callback names for events. This will aid in debugging if zipkin spans are enabled and collected.
* Remove support for untagged surrogates and surrogate migration.
* Add support for pulling tagged stats by adding a "format=tagged" querystring to the stats.json API endpoint.
* Move error log "file already found" from snowthimport binary to the debug log.
* Fix typo in statistics: "hits\_meta" is now "hit\_meta".

### Changes in 0.14.18[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01418) <a href="#changes-in-01418" id="changes-in-01418"></a>

2019-03-12

* Support caching metric metadata in NNT cache.
* Fix potential crashes and deadlocks in NNTBS timeshard open/close code.
* Move graphite fetching code into a loadable module.
  * **If you are upgrading a node that was initially installed with a version prior to 0.13, ensure that you have the necessary config files included from `/opt/circonus/etc/irondb.conf`:**
    * Remove the `<eventer>` stanza near the top of the file.
    *   Add the following two lines just below the include of `licenses.conf`:

        ```
        <include file="irondb-modules.conf" snippet="true"/>
        <include file="irondb-eventer.conf" snippet="true"/>
        ```

### Changes in 0.14.17[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01417) <a href="#changes-in-01417" id="changes-in-01417"></a>

2019-03-11

* Make efficiency changes to internal locking mechanisms to improve CPU utilization.
* Fix bug where metadata deletions could break in-memory indexes.
* Add optional NNTBS data cache to improve performance and reduce database iterations.
* Installer: Create "metadata" directory and configuration setting. This directory is not currently used in standalone IRONdb installations.
* [libmtev 1.6.4](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#164)

### Changes in 0.14.16[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01416) <a href="#changes-in-01416" id="changes-in-01416"></a>

2019-02-25

* Fix bug in node proxy code that caused incorrect timeout values to be used.
* Fix various issues regarding using timeouts incorrectly during graphite data fetches.
* Fix memory leaks that could occur during graphite error cases.

### Changes in 0.14.15[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01415) <a href="#changes-in-01415" id="changes-in-01415"></a>

2019-02-20

* Add optional metric prefix parameter to /tag\_cats and /tag\_vals APIs.
* [libmtev 1.6.3](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#163)

### Changes in 0.14.14[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01414) <a href="#changes-in-01414" id="changes-in-01414"></a>

2019-02-15

* Node will now log error and exit when writes to rocksdb fail - previously, it would log the message and continue running, which could lead to data loss.
* Fix off-by-one area in internal metric data storage struct that could cause potential crashes.
* Added support for FlatBuffer requests to the `/graphite/tags/find` endpoint, which will greatly improve performance for users using Graphite 1.1.
* Fix license expiration date display bug on GUI.
* [libmtev 1.6.2](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#162)

### Changes in 0.14.13[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01413) <a href="#changes-in-01413" id="changes-in-01413"></a>

2019-02-07

* Fix stats and dashboard for NNTBS data
* Enhance snowthsurrogatecontrol to dump all fields, as well as reverse or deleted records.
* Fix various bugs that could result in crashes or deadlocks.
* Various performance improvements.
* Improvements to Graphite tag search - respect Graphite name hierarchy in search results.
* [libmtev 1.6.1](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#161)

### Changes in 0.14.12[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01412) <a href="#changes-in-01412" id="changes-in-01412"></a>

2019-01-17

* Fix proxy bug in the `/find` API where certain proxy calls were being truncated, leading to incomplete results.
* Added each:sub(x) and each:exp(x) operators to CAQL.
* Performance improvements to full metric delete.
* Deduplicate surrogate IDs from the database on startup.

### Changes in 0.14.11[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01411) <a href="#changes-in-01411" id="changes-in-01411"></a>

2019-01-08

* Fix bug where tagged metrics were not being loaded into the surrogate cache at startup correctly.
* Tune the surrogate asynch update journal settings to improve performance.

### Changes in 0.14.10[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01410) <a href="#changes-in-01410" id="changes-in-01410"></a>

2018-12-24

* Eliminate raw delete timeout.
* Fix bugs in surrogate DB serialization and add additional key validation on deserialization.

### Changes in 0.14.9[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0149) <a href="#changes-in-0149" id="changes-in-0149"></a>

2018-12-17

* Two related bug fixes in the surrogate DB that manifest with metrics whose total stream tag length is more than 127 characters. Metrics with such tag sets could appear to be missing from search results. Metrics that do not have any stream tags, or whose total tag set is less than 127 characters, are not affected.
* Performance improvements to full delete.
* Fix a bug that could cause crashes during reconstitute.

### Changes in 0.14.8[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0148) <a href="#changes-in-0148" id="changes-in-0148"></a>

2018-12-13

* Add optional metric delete debugging.
* Fix bug that causes hanging when trying to delete certain metrics.
* Fix occasional crash related to reading NNTBS data.

### Changes in 0.14.7[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0147) <a href="#changes-in-0147" id="changes-in-0147"></a>

2018-12-05

* Fix a bug where reconstitute process could get deadlocked and not make progress.
* Fix a potential crash that could occur when reconstituting surrogate data.
* Fix a bug where deleting a metric on a system would not remove the surrogate entry if the metric was not local to the node.

### Changes in 0.14.6[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0146) <a href="#changes-in-0146" id="changes-in-0146"></a>

2018-12-03

* Fix bug where text and histogram data transfer could get hung during reconstitute.
* [libmtev 1.5.28](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1528)

### Changes in 0.14.5[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0145) <a href="#changes-in-0145" id="changes-in-0145"></a>

2018-11-30

* Reclassify an error message as a debug message - message occurs in a situation that is not a malfunction and can fill the logs.

### Changes in 0.14.4[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0144) <a href="#changes-in-0144" id="changes-in-0144"></a>

2018-11-29

* Fix crash in metric serialization.

### Changes in 0.14.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0143) <a href="#changes-in-0143" id="changes-in-0143"></a>

2018-11-29

* Several memory leaks fixed.
* Fix reconstitute bug edge case where certain metric names would cause the reconstitute to spin/cease progress.
* Fix bug where certain HTTP requests could hang.
* Change default raw db conflict resolver to allow overriding old data with flatbuffer data from a higher generation.
* Documentation: Add configuration section describing the surrogate database and its options.
* Documentation: Mark `/read` numeric API as deprecated. The [rollup API](https://docs.circonus.com/irondb/api/data-retrieval/) should be used instead.
* [libmtev 1.5.26](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1526)

### Changes in 0.14.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0142) <a href="#changes-in-0142" id="changes-in-0142"></a>

2018-11-19

* Several memory leaks fixed.
* Improved memory utilization.
* Performance improvements.
* Increased speed of surrogate cache loading at startup.
* Add `snowthsurrogatecontrol` tool, which allows offline review and modification of the surrogate database.

### Changes in 0.14.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0141) <a href="#changes-in-0141" id="changes-in-0141"></a>

2018-11-09

* Improvements to raw-to-NNTBS rollup speeds.
* Fix error messages that were printing an uninitialized variable.
* Handle escaped Graphite expansions that are leaves.
* Performance improvements via smarter use of locking.
* More aggressive memory reclamation.
* [libmtev 1.5.23](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1523)

### Changes in 0.14.0[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0140) <a href="#changes-in-0140" id="changes-in-0140"></a>

2018-11-01

* Change some internal HTTP response codes to be more REST compliant/accurate.
* Improve error checking when opening NNTBS timeshards.
* Improve surrogate DB startup informational logging.
* Various memory usage optimizations to reduce the amount of memory needed for snowthd to operate.
* Remove global variables from Backtrace.io traces.
* Add ability to delete surrogates from the system that are no longer used.
* Remove temporary files used during reconstitute - there were a handful of files staying on disk and taking up space unnecessarily.
* Increase timeout for pulling raw data during reconstitutes.
* Move duplicate startup message to debug log - not actually an error, so should not be reported as one.
* Adopt multi-level hash strategy for graphite searches. The goal here is to be faster and more memory-efficient, with a focus on memory efficiency.
* Fix logging bug where long lines could end up running together.
* Fix crash bug in histogram fetching API.
* [libmtev 1.5.19](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1519)

### Changes in 0.13.9[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0139) <a href="#changes-in-0139" id="changes-in-0139"></a>

2018-10-16

* Installer and startup wrapper will update ownership of `/opt/circonus/etc` and `/opt/circonus/etc/irondb.conf` to allow for automatic updating of the topology configuration during rebalance operations.
* Performance improvements to parsing surrogate database at startup.
* Fix some potential crashes.
* Disable saving ptrace stdout output files in the default circonus-watchdog.conf file.

### Changes in 0.13.8[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0138) <a href="#changes-in-0138" id="changes-in-0138"></a>

2018-10-12

* Expose more jobq modification via console.
* Fix wildcard/regex queries inside tag categories.
* Fix issue where certian job queues could have concurrency of zero, causing deadlock.
* Add activity ranges to tag\_cats/vals.
* Add category param to tag\_vals.
* [libmtev 1.5.12](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1512)

### Changes in 0.13.7[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0137) <a href="#changes-in-0137" id="changes-in-0137"></a>

2018-10-11

* Documentation: fix missing rebalance state.
* Add log deduplication to avoid spamming errorlog with identical messages.
* Fix potential deadlock that could be triggered when forking off a process to be monitored by the watchdog.
* Fix some potential crashes/memory leaks.
* When loading a new topology, return 200 status instead of 500 if the topology is already loaded.
* Support tag removal.
* Performance/stability improvements for activity list operations.
* [libmtev 1.5.11](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#1511)

### Changes in 0.13.6[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0136) <a href="#changes-in-0136" id="changes-in-0136"></a>

2018-10-01

* Move Zipkin setup messages out of the error log and into the debug log.
* Skip unparseable metric\_locators during replication.
* Turn off sync writes in tagged surrogate writer.
* Fix potential crashes when check\_name is NULL.

### Changes in 0.13.5[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0135) <a href="#changes-in-0135" id="changes-in-0135"></a>

2018-09-25

* Disable asynch core dumps by default.
* Use the metric source for incoming metrics instead of hardcoding to RECONNOITER.
* Fix some potential use-after-free crashes.
* Fixed a crash where we would erroneously assume null termination.
* Performance and correctness fixes to internal locking mechanism.
* Fix some instances where we would potentially attempt to access a null metric name.

### Changes in 0.13.4[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0134) <a href="#changes-in-0134" id="changes-in-0134"></a>

2018-09-21

* Installer bug since 0.13.1 set incorrect ZFS properties on some datasets. New installs of 0.13.1 or later may need to run the following commands to restore the correct property values. Existing deployments that upgraded from version 0.13 or earlier were not affected.

```
zfs inherit -r quota <poolname>/irondb/data
zfs inherit -r quota <poolname>/irondb/nntbs
zfs inherit -r quota <poolname>/irondb/hist
zfs inherit -r quota <poolname>/irondb/localstate
zfs inherit -r quota <poolname>/irondb/logs
zfs inherit -r quota <poolname>/irondb/lua
zfs inherit -r quota <poolname>/irondb/metric_name_db
zfs inherit -r logbias <poolname>/irondb/redo
zfs inherit -r logbias <poolname>/irondb/text
```

* Fix memory leaks and invalid access errors that could potentially lead to crashes.
* [libmtev 1.5.7](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#157)

### Changes in 0.13.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0133) <a href="#changes-in-0133" id="changes-in-0133"></a>

2018-09-18

* Fix hashing function for the reverse surrogate cache.
* Fix loading of metrics db index when iterating surrogate entries on startup.
* Improve logging for surrogate db when there are ID collisions.
* Accept check name and source in /surrogate/put - do not allow duplicate surrogate ids in the cache.
* Performance improvements to inter-node gossip and NNTBS data writing.
* Allow purging metrics from in-memory cache.
* Fix some potential crashes on unexpected data.
* Allow using tag search to define retention period for metrics.

### Changes in 0.13.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0132) <a href="#changes-in-0132" id="changes-in-0132"></a>

2018-09-13

* Fixes for journal surrogate puts and activity rebuilds.
* Fix bug where software would loop forever if journal writes were in the future.

### Changes in 0.13.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0131) <a href="#changes-in-0131" id="changes-in-0131"></a>

2018-09-11

* Various performance improvements.
* Use progressive locks in surrogate DB.
* Documentation: fix incorrect header name for raw data submission with Flatbuffer.
* Allow deleting metrics by tag.
* Allow deleting all metrics in a check.
* Allowing deleting metrics based on a wildcard for NNT, text, or histogram data.
* Allow 4096 chars for metric name ingestion
* New CAQL function:
  * `group_by:*` package provides functions to aggregate metrics by tags
* [libmtev 1.5.5](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#155)

### Changes in 0.13[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-013) <a href="#changes-in-013" id="changes-in-013"></a>

2018-08-15

* **Service config change for EL7**: We now ship a native systemd service unit configuration, rather than a traditional init script. The unit name remains the same, but any configuration management or other scripting that used the `chkconfig` and `service` commands should be updated to use `systemctl`.
* Installer: better validation of user input.
* Config option to disable [Activity Tracking](https://docs.circonus.com/irondb/administration/activity-tracking) which can cause write latency spikes at higher ingest volumes. A fix for this behavior will be coming in a future release.
  * Add an attribute, `activity_tracking="false"` to the `<surrogate_database>` line in `irondb.conf` to disable tracking.
  * Note that certain search parameters that depend on activity tracking will not work while tracking is disabled, and may not be accurate if tracking is reenabled after some time. Any search query that uses `activity_start_secs` or `activity_end_secs` will not work when tracking is disabled.
* Memory leak fixes in Graphite result handling.
* New CAQL functions:
  * `each:*` package provides functions that operate on all input slots at once. [CAQL Reference: package each](https://docs.circonus.com/caql/reference/#package-each)
  * `TopK` global function returns the top `k` streams over the current `VIEW_RANGE` using either a `mean` or `max` comparator. [CAQL Reference: global functions](https://docs.circonus.com/caql/reference/#global-functions)
* [libmtev 1.4.5](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#145)

### Changes in 0.12.5[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0125) <a href="#changes-in-0125" id="changes-in-0125"></a>

2018-08-07

* Crash fix on unparseable metric names
* Journal fix in pre\_commit mmap space

### Changes in 0.12.4[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0124) <a href="#changes-in-0124" id="changes-in-0124"></a>

2018-08-02

* More memory leak fixes
* Fixes for graphite tag support
* Fix for greedy name matching in graphite queries
* Support blank tag values
* CAQL if statements and negation operators
* CAQL optimizations
* Support for building/rebuilding higher level rollups from lower level rollups
* Rebalance adds a new completion state to fix races when finishing rebalance ops

### Changes in 0.12.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0123) <a href="#changes-in-0123" id="changes-in-0123"></a>

2018-07-12

* More memory leak fixes in name searches
* Rebalance fixes
* Embed a default license if one isn't provided
* Support for [raw deletes](https://docs.circonus.com/irondb/api/data-deletion/#deleting-raw-data-for-a-metric-or-a-set-of-metrics)

Documentation changes:

* Add raw delete API

### Changes in 0.12.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0122) <a href="#changes-in-0122" id="changes-in-0122"></a>

2018-07-09

* Fix memory leak in name searches

### Changes in 0.12.1 (unreleased)[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0121-unreleased) <a href="#changes-in-0121-unreleased" id="changes-in-0121-unreleased"></a>

2018-07-09

* Enable heap profiling

### Changes in 0.12[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-012) <a href="#changes-in-012" id="changes-in-012"></a>

2018-07-05

This release brings several major new features and represents months of hard work by our Engineering and Operations teams.

* New feature: [Stream Tags](https://docs.circonus.com/irondb/metric-names-tags-queries/)
  * These are tags that affect the name of a metric stream. They are represented as `category:value` pairs, and are [searchable](https://docs.circonus.com/irondb/metric-names-tags-queries/#tag-queries).
  * Each unique combination of metric name and tag list counts as a new metric stream for licensing purposes.
* New feature: [Activity Tracking](https://docs.circonus.com/irondb/administration/activity-tracking)
  * Quickly determine time ranges when a given metric or group of metrics was being collected.
* New feature: Configurable [rollup retention](https://docs.circonus.com/irondb/getting-started/configuration/#nntbs) for numeric data.
  * Retention is per rollup period defined in configuration.
* Operations: There is a one-time operation on the first startup when upgrading to version `0.12`.
  * As part of Stream Tags support, the [metric\_name\_database](https://docs.circonus.com/irondb/getting-started/configuration/#metric_name_database) has been combined with another internal index and is no longer stored separately on disk.
  * The metric name database was always read into memory at startup. After the one-time conversion, its information will be extracted from the other index on subsequent startups. The time to complete the conversion includes the same amount of time to read the existing metric name database as well as to write out an updated index entry for each record encountered. Therefore, it is proportional to the number of unique metric streams stored on this node.
* Operations: The `raw_database` option [rollup\_strategy](https://docs.circonus.com/irondb/getting-started/configuration/#raw_database-rollup_strategy) now defaults to `raw_iterator` if not specified.
  * If upgrading with a config that does not specify a `rollup_strategy`, an active rollup operation will start over on the timeshard it was processing.
* Operations: Add the ability to [cancel a sweep delete](https://docs.circonus.com/irondb/api/data-deletion/#cancelling-a-sweep-delete) operation.
* Operations: Remove the reconstitute-reset option (`-E`) and replace with a more complete solution in the form of a script, `reset_reconstitute`, that will enable the operator to remove all local data and start a fresh rebuild.
* CAQL: add methods `time:epoch()` and `time:tz()`
* Installer: use default ZFS recordsize (128K) for NNT data. This has been shown experimentally to yield significantly better compression ratios. Existing installations will not see any change. To immediately effect these changes on an existing install, issue the following two commands:

```
zfs inherit -r recordsize <pool>/irondb/data
zfs inherit -r recordsize <pool>/irondb/nntbs
```

where `<pool>` is the zpool name. Users of versions < [0.11.1](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0111) can omit the second command (this dataset will not be present.) The recordsize change only affects new writes; existing data remains at the previous recordsize. If the full benefit of the change is desired, a [node rebuild](https://docs.circonus.com/irondb/administration/rebuilding-nodes) may be performed.

* Documentation: Raw Submission API documentation for already required X-Snowth-Datapoints header
* Documentation: Text and Histogram deletion APIs were out of date.
* Documentation: Update formatting on API pages, which were auto-converted from a previous format.
* Performance and stability fixes too numerous to list here, though there are some highlights:
  * Converted UUID handling from libuuid to libmtev's [faster implementation](http://circonus-labs.github.io/libmtev/apireference/c.html#u).
  * Optimized replication speed.

### Changes in 0.11.18[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01118) <a href="#changes-in-01118" id="changes-in-01118"></a>

2018-04-12

* Fix a bug causing unnecessary duplicated work during sweep deletes

### Changes in 0.11.17[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01117) <a href="#changes-in-01117" id="changes-in-01117"></a>

2018-04-10

* Fix for http header parsing edge case

### Changes in 0.11.16[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01116) <a href="#changes-in-01116" id="changes-in-01116"></a>

2018-04-09

* Allow control over max ingest age for graphite data via config
* Optionally provide graphite find and series queries as flatbuffer data
* Fix epoch metadata fetch for NNTBS data
* Reconstitute state saving bug fixes
* Fix cleanup of journal data post replication

Documentation changes:

* Add hardware selection advice and system profiles
* Correct color rules for latency summaries
* Various small doc fixes

### Changes in 0.11.15[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01115) <a href="#changes-in-01115" id="changes-in-01115"></a>

2018-03-23

* Fix potential use-after-free in raw numeric fetch path.
* Various fixes to NNTBS batch conversion.
* Crash fixes when dealing with NNTBS shards.
* UI changes for Replication Latency display:
  * Initially all remote node latencies are hidden, with just the heading displayed. Click on a heading to expand the remote node listing.
  * A node's average replication latency is now displayed at the right end of the heading, and color-coded.
* Disable Lua modules when in reconstitute mode.
* Don't hold on to NNT filehandles after converting them to NNTBS.

Documentation changes:

* Include files and Lua modules.
* New UI replication tab display.

### Changes in 0.11.14[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01114) <a href="#changes-in-01114" id="changes-in-01114"></a>

2018-03-13

* Fix bug in NNT reconstitution

### Changes in 0.11.13 (unreleased)[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01113-unreleased) <a href="#changes-in-01113-unreleased" id="changes-in-01113-unreleased"></a>

2018-03-12

* Fix for throttling during reconstitute operations
* Several small fixes and cleanups

### Changes in 0.11.12[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01112) <a href="#changes-in-01112" id="changes-in-01112"></a>

2018-03-08

* Add an offline NNT to NNTBS conversion mode.
  * Default conversion is "lazy", as NNT metrics are read.
  * For read-heavy environments this may produce too much load, so the offline option can be used to take one node at a time out of the cluster and batch-convert all its NNT files to NNTBS block storage.
* Performance improvements to gossip replication, avoids watchdog timeout in some configurations.
* Fix several crash bugs in reconstitute, NNTBS, and journaling.
* Silence noisy error printing during NNTBS conversion.
* Formatting fix to a gossip error message (missing newline).

Documentation changes:

* Add NNTBS dataset to reconstitute procedure.
* New NNTBS conversion-only operations mode (`-N`).
* Clarify that in sided clusters, write copies are distributed as evenly as possible across both sides.
* Show the gossip age values that lead to green/yellow/red display in the Replication Latency UI tab.

### Changes in 0.11.11[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01111) <a href="#changes-in-01111" id="changes-in-01111"></a>

2018-02-23

* Final deadlock fixes for timeshard management
* Protect against unparseable json coming back from proxy calls

### Changes in 0.11.10[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01110) <a href="#changes-in-01110" id="changes-in-01110"></a>

2018-02-22

* More deadlock fixes for timeshard management

Documentation changes:

* Note the lazy migration strategy for NNT to NNTBS conversion.

### Changes in 0.11.9[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0119) <a href="#changes-in-0119" id="changes-in-0119"></a>

2018-02-20

* Fix deadlock that can be hit when attempting to delete a shard during heavy read activity.
* Use new libmtev `max_backlog` API to shed load under extreme conditions.
* Internal RocksDB tuning to reduce memory footprint, reduce file reads and improve performance.
* Add a tool to repair the raw DB if it gets corrupted, as with an unexpected system shutdown.

Configuration changes:

* Add a "startup" log to shift certain initialization logs out of the errorlog.
  * Reduces clutter and makes it easier to see when your instance is up and running.
  * New installs will have this log enabled by default, written to `/irondb/logs/startuplog` and rotated on the same policy as `errorlog`.
  * To enable on an existing installation, add this line to `/opt/circonus/etc/irondb.conf`, in the `<logs>` stanza (on a single line):

```
<log name="notice/startup" type="file" path="/irondb/logs/startuplog"
timestamps="on" rotate_seconds="86400" retain_seconds="604800"/>
```

Documentation changes:

* Appendix with cluster sizing recommendations.
* GET method for `sweep_delete` status.

### Changes in 0.11.8[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0118) <a href="#changes-in-0118" id="changes-in-0118"></a>

2018-02-09

* Minor fix to reduce error logging

### Changes in 0.11.7[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0117) <a href="#changes-in-0117" id="changes-in-0117"></a>

2018-02-08

* Minor fixes for histogram database migration

Documentation changes:

* Add new section on `nntbs` configuration

### Changes in 0.11.6[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0116) <a href="#changes-in-0116" id="changes-in-0116"></a>

2018-02-08

* NNTBS timesharded implementation
* Changes for supporting very large reconstitution
* Do raw database reconstitution in parallel for speed

Documentation changes:

* Add new section on the `sweep_delete` API, useful for implementing retention policies
* Add new section on migrating to a new cluster from an existing one.
* Add page documenting `snowthd` command-line options.

### Changes in 0.11.5[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0115) <a href="#changes-in-0115" id="changes-in-0115"></a>

2018-01-23

* Yield during reconstitute/rebalance inside NNTBS to prevent starvation of other ops

### Changes in 0.11.4[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0114) <a href="#changes-in-0114" id="changes-in-0114"></a>

2018-01-22

* Fix for iterator re-use in error edge case

### Changes in 0.11.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0113) <a href="#changes-in-0113" id="changes-in-0113"></a>

2018-01-22

* Safety fix for rollup code
* Corruption fix on hard shutdown or power loss

### Changes in 0.11.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0112) <a href="#changes-in-0112" id="changes-in-0112"></a>

2018-01-18

* Crash fix for rollup code
* Lock fix for conversion code
* **Changes for new installations** - new installations will have different defaults for `<raw_database>` settings:
  * `granularity` goes from 1 day to 1 week.
  * `min_delete_age` goes from 3 days to 4 weeks.
  * `delete_after_quiescent_age` goes from 12 hours to 2 hours.
  * `rollup_strategy` was added. It is fine to mix new nodes installed with these settings with older nodes who have the older settings. It is _not_ fine to change these settings on an existing installation.

Documentation changes:

* Describe `rollup_strategy` in the `<raw_database>` config

### Changes in 0.11.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0111) <a href="#changes-in-0111" id="changes-in-0111"></a>

2018-01-18

* Fixes for NNTBS
* Add NNTBS stats to admin UI
* Various smaller fixes

### Changes in 0.11[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-011) <a href="#changes-in-011" id="changes-in-011"></a>

2018-01-12

* Store rollup data in a new format yielding better performance on insert and rollup (NNTBS)
* Performance improvements for lua extensions
* Reduce logging to error sink
* Many smaller fixes and improvements
* Dropped support for OmniOS (RIP)

### Changes in 0.10.19[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01019) <a href="#changes-in-01019" id="changes-in-01019"></a>

2017-12-18

* Improve rollup speed by iterating in a more natural DB order, with additional parallelization.
* The `setup-irondb` script will now log its output, in addition to stdout. It will log to `/var/log/irondb-setup.log` and if run multiple times will keep up to five (5) previous logs.
* The [snowthimport](https://docs.circonus.com/irondb/getting-started/manual-installation/#import-topology) tool will now fail with an error if the topology input file contains any node IDs with uppercase letters.

Documentation changes:

* Note that all supplied UUIDs during initial setup and cluster configuration should be lowercase. If uppercase UUIDs are supplied, they will be lowercased and a warning logged by setup.

### Changes in 0.10.18[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01018) <a href="#changes-in-01018" id="changes-in-01018"></a>

2017-12-06

* Fix crash in fair queueing
* Finish moving rollups to their own jobq

### Changes in 0.10.17[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01017) <a href="#changes-in-01017" id="changes-in-01017"></a>

2017-12-05

* Restore fdatasync behavior from rocksdb 4.5.1 release
* Move rollups to their own jobq so as to not interfere with normal reads
* Implement fair job queueing for reads so large read jobs cannot starve out other smaller reads

### Changes in 0.10.16[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01016) <a href="#changes-in-01016" id="changes-in-01016"></a>

2017-11-27

* New rocksdb library version 5.8.6

### Changes in 0.10.15[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01015) <a href="#changes-in-01015" id="changes-in-01015"></a>

2017-11-21

* More aggressively load shed by forcing local data fetch jobs to obey timeouts

### Changes in 0.10.14[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01014) <a href="#changes-in-01014" id="changes-in-01014"></a>

2017-11-20

* Allow config driven control over the concurrency of the data\_read\_jobq
* Short circuit local data read jobs if the timeout has elapsed
* Add all hidden stats to internal UI tab

### Changes in 0.10.13[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01013) <a href="#changes-in-01013" id="changes-in-01013"></a>

2017-11-17

* Fix potential double free crash upon query cache expiry

### Changes in 0.10.12[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01012) <a href="#changes-in-01012" id="changes-in-01012"></a>

2017-11-15

* Lock free cache for topology hashes
* Fix graphite response when we have no data for a known metric name

### Changes in 0.10.11[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01011) <a href="#changes-in-01011" id="changes-in-01011"></a>

2017-11-13

* Disable cache for topology hashes due to live lock

### Changes in 0.10.10[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01010) <a href="#changes-in-01010" id="changes-in-01010"></a>

2017-11-13

* Validate incoming /metrics/find queries are well formed
* Move query cache to an LFU

### Changes in 0.10.9[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0109) <a href="#changes-in-0109" id="changes-in-0109"></a>

2017-11-10

* Fix for crash on extremely long /metrics/find queries

### Changes in 0.10.8[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0108) <a href="#changes-in-0108" id="changes-in-0108"></a>

2017-11-09

* IRONdb now supports listening via the [Pickle protocol](https://docs.circonus.com/irondb/getting-started/configuration/#pickle-listener).

Multiple `whisper2nnt` changes:

* Add `--writecount` argument for limiting the number of data points submitted per request
* Submit to the primary owning node for a given metric
* Disable HTTP keepalive
* Add `--find_closest_name` parameter. This is needed for sites that do name manipulation via modules in the metric\_name\_db and submit metrics with one name but search on them with another name. For example, a metric would get submitted that resembles `foo.bar_avg` and returned from the metric\_name\_db as `foo.bar`. Ingestion of whisper data has to use the `foo.bar_avg` name but whisper files on disk do not follow this format. To combat this a new switch which uses the `/graphite/metrics/find` url to lookup an already ingested name based on the whisper name as a prefix and uses that name for metric submission under NNT.

### Changes in 0.10.7[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0107) <a href="#changes-in-0107" id="changes-in-0107"></a>

2017-11-03

* Prevent OOM conditions when there are large chunks of new metric\_name\_db values
* Pre-populate the metric\_name\_db cache on startup
* Replace usage of fnmatch with PCRE, fixing some cases where fnmatch fails
* Allow proxied metrics/find queries to utilize the cache

### Changes in 0.10.6[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0106) <a href="#changes-in-0106" id="changes-in-0106"></a>

2017-10-31

* Increased parallelism in metric\_name\_db maintenance
* whisper2nnt: include in submission those archives with a period coarser than the minimum
* whisper2nnt: re-raise exception after two consecutive submission failures
* Better error handling for topology loading failures
* Several memory-related bug fixes

Documentation changes:

* The IRONdb Relay installer no longer insists on ZFS, and creates directories instead.
* Explicitly document that cluster resize/rebalance does not support changes to "sidedness". A new cluster and full reconstitute is required for changing to/from a sided cluster.

### Changes in 0.10.5[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0105) <a href="#changes-in-0105" id="changes-in-0105"></a>

2017-10-24

* Eliminate lock contention on a hot path when debugging is not enabled.
* Correct a logic error in choosing the most up-to-date node when proxying.
* Fix escaped wildcard queries when proxy-querying leaf nodes.
* Log-and-skip rather than crash on flatbuffer read errors.
* Crash fix for stack underflow.
* Several whisper2nnt fixes:
  * Retry submissions when a connection to IRONdb is reset.
  * Sort output before submitting to IRONdb, avoids rewinding epoch on numeric data files.
  * New arguments to help with debugging: `--debug`, `--noop`
* Includes [libmtev fix](https://github.com/circonus-labs/libmtev/pull/328) for a startup issue with file permissions.

### Changes in 0.10.4[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0104) <a href="#changes-in-0104" id="changes-in-0104"></a>

2017-10-12

* Fixes for reconstitute status handling.
* Fix use-after-free in graphite GET path.

Documentation changes:

* Add documentation for [irondb-relay](https://docs.circonus.com/irondb/tools/irondb-relay/), a cluster-aware carbon-relay/carbon-c-relay replacement.
* Merge content for deleting numeric metrics and entire checks.

### Changes in 0.10.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0103) <a href="#changes-in-0103" id="changes-in-0103"></a>

2017-10-06

* Ensure metrics injected via whisper2nnt tool are visible.

### Changes in 0.10.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0102) <a href="#changes-in-0102" id="changes-in-0102"></a>

2017-10-05

* Another late-breaking fix to speed up writes to the metric\_name\_db.

### Changes in 0.10.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0101) <a href="#changes-in-0101" id="changes-in-0101"></a>

2017-10-05

* Late-breaking optimization to avoid sending /metrics/find requests to down nodes.

### Changes in 0.10.0[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0100) <a href="#changes-in-0100" id="changes-in-0100"></a>

2017-10-04

* New replication protocol format, utilizing Google FlatBuffers. **This is a backward-incompatible change.** A typical rolling upgrade should be performed, but nodes will not send replication data until they detect FlatBuffer support on the other end. As a result, there may be increased replication latency until all nodes are upgraded.
* Improved error handling during reconstitute.

Documentation changes:

* New page documenting [cluster resizing](https://docs.circonus.com/irondb/administration/resizing-clusters/) procedures.
* Add system tuning suggestions to the [Installation page](https://docs.circonus.com/irondb/getting-started/manual-installation/#system-tuning).

### Changes in 0.9.11[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0911) <a href="#changes-in-0911" id="changes-in-0911"></a>

2017-09-22

* Reconstitute fixes.
* Fix a bug that prevents a graphite listener from running properly with SSL/TLS on.

### Changes in 0.9.10[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0910) <a href="#changes-in-0910" id="changes-in-0910"></a>

2017-09-15

* Fix bugs in proxying graphite requests where unnecessary work was being triggered.
* Generated JSON was badly formatted when mixing remote and local results.
* Add internal timeout support for graphite fetches.
* Optimize JSON construction for proxy requests.
* Enable gzip compression on reconstitute requests.

Documentation changes:

* New page documenting the [configuration files](https://docs.circonus.com/irondb/getting-started/configuration/).

### Changes in 0.9.9[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-099) <a href="#changes-in-099" id="changes-in-099"></a>

2017-09-13

* Split graphite metric fetches into separate threads for node-local vs. remote to improve read latency
* Provide a configuration option for toggling LZ4 compression on journal sends (WAL replay to other cluster nodes). The default is on (use compression) and is best for most users.
  * To disable compression on journal sends, set an attribute `send_compressed="false"` on the `<journal>` node in `irondb.conf`.

Documentation changes:

* Added instructions for [rebuilding failed or damaged nodes](https://docs.circonus.com/irondb/administration/rebuilding-nodes/)

### Changes in 0.9.8[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-098) <a href="#changes-in-098" id="changes-in-098"></a>

2017-09-11

* Optimize JSON processing on metrics\_find responses.
* Additional fixes to timeouts to prevent cascading congestion on metrics\_find queries.

### Changes in 0.9.7[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-097) <a href="#changes-in-097" id="changes-in-097"></a>

2017-09-08

* Fix for potential thundering herd on metrics\_find queries

### Changes in 0.9.6[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-096) <a href="#changes-in-096" id="changes-in-096"></a>

2017-09-07

* Fix a performance regression from 0.9.5 in topology placement calculations
* Various minor fixes

### Changes in 0.9.5[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-095) <a href="#changes-in-095" id="changes-in-095"></a>

2017-09-05

* Fix lookup key for topology in flatbuffer-based ingestion. Flatbuffer ingestion format is currently only used by the experimental irondb-relay.
* Update to new libmtev config API

### Changes in 0.9.4[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-094) <a href="#changes-in-094" id="changes-in-094"></a>

2017-08-18

* Various fixes

### Changes in 0.9.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-093) <a href="#changes-in-093" id="changes-in-093"></a>

2017-08-16

* Fix race condition on Linux with dlopen() of libzfs
* Crash fix: skip blank metric names during rollup
* Return the first level of metrics\_db properly on certain wildcard queries
* More efficient Graphite metric parsing

### Changes in 0.9.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-092) <a href="#changes-in-092" id="changes-in-092"></a>

2017-08-04

* Improve query read speed when synthesizing rollups from raw data
* Fix double-free crash in handling of series\_multi requests

### Changes in 0.9.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-091) <a href="#changes-in-091" id="changes-in-091"></a>

2017-08-01

* Fix crash in topology handling for clusters of more than 10 nodes
* Check topology configuration more carefully on initial import
* Various stability fixes
* Document network ports and protocols required for operation

### Changes in 0.9.0[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-090) <a href="#changes-in-090" id="changes-in-090"></a>

2017-07-13

*   Support for parallelizing rollups, which can be activated by adding a "rollup" element to the `<pools>` section of `irondb.conf`, with a "concurrency" attribute:

    ```
    <pools>
      ...
      <rollup concurrency="N"/>
    </pools>
    ```

    where `N` is an integer in the range from 1 up to the value of `nnt_put` concurrency but not greater than 16. If not specified, rollups will remain serialized (concurrency of 1). A value of 4 has been shown to provide the most improvement over serialized rollups.
* Fix for watchdog-panic when fetching large volumes of data via graphite endpoints.
* Stop stripping NULLs from beginning and end of graphite responses.
* Do not return graphite metric data from before the start of collection for that metric.
* Optimization for graphite fetches through the storage finder plugin.
* Changes to support data ingestion from new irondb-relay.

### Changes in 0.8.35[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0835) <a href="#changes-in-0835" id="changes-in-0835"></a>

2017-06-27

* Add an option to not use database rollup logic when responding to graphite queries

### Changes in 0.8.34[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0834) <a href="#changes-in-0834" id="changes-in-0834"></a>

2017-06-26

* Throughput optimizations

### Changes in 0.8.33[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0833) <a href="#changes-in-0833" id="changes-in-0833"></a>

2017-06-26

* Fix a bug in database comparator introduced in 0.8.30

### Changes in 0.8.32[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0832) <a href="#changes-in-0832" id="changes-in-0832"></a>

2017-06-22

* Fix a bug with ZFS on Linux integration in the admin UI that caused a segfault on startup.

### Changes in 0.8.31[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0831) <a href="#changes-in-0831" id="changes-in-0831"></a>

unreleased

### Changes in 0.8.30[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0830) <a href="#changes-in-0830" id="changes-in-0830"></a>

2017-06-21

* Optimizations for raw data ingestion.
* Better internal defaults for raw metrics database, to reduce compaction stalls, improving throughput.
* Cache SHA256 hashes in topology-handling code to reduce CPU consumption.
* Fix memory-usage errors in LRU cache for Graphite queries.
* Fix memory leaks relating to replication journals.
* Fix for failed deletes due to filename-too-long errors.

### Changes in 0.8.29[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0829) <a href="#changes-in-0829" id="changes-in-0829"></a>

unreleased

### Changes in 0.8.28[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0828) <a href="#changes-in-0828" id="changes-in-0828"></a>

unreleased

### Changes in 0.8.27[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0827) <a href="#changes-in-0827" id="changes-in-0827"></a>

2017-06-12

* Fix a bug that caused contention between reads and writes during rollup.
* Reduce contention in the raw database write path.

### Changes in 0.8.26[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0826) <a href="#changes-in-0826" id="changes-in-0826"></a>

2017-06-02

* Fix LRU-cache bug for metric queries.

### Changes in 0.8.25[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0825) <a href="#changes-in-0825" id="changes-in-0825"></a>

2017-05-31

* Graphite request proxying preserves original start/end timestamps.
* Increase replication performance by bulk-reading from the write-ahead log.
* Improve reconstitute performance.
* Fix several memory leaks.
* Note: 0.8.24 was an unreleased internal version. Its changes are included here.

### Changes in 0.8.23[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0823) <a href="#changes-in-0823" id="changes-in-0823"></a>

2017-05-18

* Cache /metrics/find queries.
* Improved journaling performance.
* Additional bug fixes.

### Changes in 0.8.22[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0822) <a href="#changes-in-0822" id="changes-in-0822"></a>

2017-05-16

* Efficiency improvement in Graphite queries; we now strip NULLs from both ends of the returned response.
* Fix a bug in Graphite query that would return a closely related metric instead of the requested one.
* Fix a bug that caused us to request millisecond resolution when zoomed out too far, and 1-day would be better.
* First draft of a progress UI for reconstitute.

### Changes in 0.8.21[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0821) <a href="#changes-in-0821" id="changes-in-0821"></a>

2017-05-15

* Inspect and repair write-ahead journal on open.
* Add a statistic for `total_put_tuples`, covering all metric types.
* (libmtev) Use locks to protect against cross-thread releases.

### Changes in 0.8.20[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0820) <a href="#changes-in-0820" id="changes-in-0820"></a>

2017-05-10

* Fix for brace expansion in Graphite metric name queries.
* Resume in-progress rollups after application restart.
* Improved reconstitute handling.
* Minor UI fix for displaying sub-minute rollups.
* Crash and memory leak fixes.

### Changes in 0.8.19[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0819) <a href="#changes-in-0819" id="changes-in-0819"></a>

2017-05-03

* Lower default batch size for replication log processing from 500K to 50K messages. Can still be tuned higher if necessary.
* Improve ingestion performance in the Graphite listener.

### Changes in 0.8.18[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0818) <a href="#changes-in-0818" id="changes-in-0818"></a>

2017-04-28

* Fix potential races in replication.
* Speed up metric querying.

### Changes in 0.8.17[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0817) <a href="#changes-in-0817" id="changes-in-0817"></a>

2017-04-27

* (libmtev) Crash fix in HTTP request handling.
* Disable watchdog timer during long-running operations at startup.
* Limit writing metrics forward into new time shards.
* Add multi-threaded replication.

### Changes in 0.8.16[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0816) <a href="#changes-in-0816" id="changes-in-0816"></a>

2017-04-24

* Support brace expansion and escaped queries for Graphite requests.
* Faster reconstituting of raw data.
* Fix metric name handling during reconstitute.

### Changes in 0.8.15[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0815) <a href="#changes-in-0815" id="changes-in-0815"></a>

2017-04-20

* Move Graphite listener connection processing off the main thread to avoid blocking.

### Changes in 0.8.14[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0814) <a href="#changes-in-0814" id="changes-in-0814"></a>

2017-04-19

* Improve replicate\_journal message handling.
* Speed up journal processing.
* Increase write buffer and block size in raw database to reduce write stalls.

### Changes in 0.8.13[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0813) <a href="#changes-in-0813" id="changes-in-0813"></a>

2017-04-14

* Reduce CPU usage on journal\_reader threads.
* Fix crash during rollup when rewinding the epoch of a data file.
* Increase default read buffer size for Graphite listener.
* Use proper libcurl error defines in replication code.

### Changes in 0.8.12[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0812) <a href="#changes-in-0812" id="changes-in-0812"></a>

2017-04-12

* Remove problematic usage of alloca().
* Add lz4f support to reconstitute.

### Changes in 0.8.11[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0811) <a href="#changes-in-0811" id="changes-in-0811"></a>

2017-04-05

* Speed up reconstitute through parallel processing.

### Changes in 0.8.10[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-0810) <a href="#changes-in-0810" id="changes-in-0810"></a>

2017-04-04

* Improve throughput via socket and send-buffer tuning fixes.
* Fix watchdog timeouts when reloading large metric databases.

### Changes in 0.8.9[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-089) <a href="#changes-in-089" id="changes-in-089"></a>

2017-04-03

* Preserve null termination in metric names for proper duplicate detection.

### Changes in 0.8.8[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-088) <a href="#changes-in-088" id="changes-in-088"></a>

2017-03-31

* Turn off gzip in reconstitute, as testing shows throughput is better without it.
* Avoid performing rollups or deletions on a reconstituting node.
* Memory leak fixes.

### Changes in 0.8.7[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-087) <a href="#changes-in-087" id="changes-in-087"></a>

2017-03-24

* Performance fixes for reconstitute.
* Memory leak fixes.

### Changes in 0.8.6[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-086) <a href="#changes-in-086" id="changes-in-086"></a>

2017-03-21

* Fix internal wildcard queries, and limit Graphite metric names to 256 levels.

### Changes in 0.8.5[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-085) <a href="#changes-in-085" id="changes-in-085"></a>

2017-03-17

* Build Graphite responses using `mtev_json` instead of custom strings.

### Changes in 0.8.4[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-084) <a href="#changes-in-084" id="changes-in-084"></a>

2017-03-14

* Set a maximum metric name length on ingestion.

### Changes in 0.8.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-083) <a href="#changes-in-083" id="changes-in-083"></a>

2017-03-10

* Various replication fixes.
* Fixes for parsing errors and startup crashes.

### Changes in 0.8.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-082) <a href="#changes-in-082" id="changes-in-082"></a>

2017-03-01

* Reject Graphite metrics with an encoded length greater than 255.

### Changes in 0.8.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-081) <a href="#changes-in-081" id="changes-in-081"></a>

2017-02-27

* Internal testing fixes.

### Changes in 0.8[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-08) <a href="#changes-in-08" id="changes-in-08"></a>

2017-02-27

* De-duplicate proxied requests.
* Deal with unparseably large number strings.

### Changes in 0.7[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-07) <a href="#changes-in-07" id="changes-in-07"></a>

2017-02-23

* Add raw ingestion.
* Stricter Graphite record parsing.
* Memory leak and header-parsing fixes.

### Changes in 0.6[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-06) <a href="#changes-in-06" id="changes-in-06"></a>

2017-02-15

* Better handling of JSON parse errors during reconstitute.
* Enable `Accept-Encoding: gzip`, compress outgoing replication POSTs with lz4f.
* Optimize UUID comparison to speed up reconstitute.

### Changes in 0.5[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-05) <a href="#changes-in-05" id="changes-in-05"></a>

2017-01-31

* Fix crash from Graphite listener connection handling.
* Refactor text metric processing in preparation for raw database.

### Changes in 0.4[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-04) <a href="#changes-in-04" id="changes-in-04"></a>

2017-01-16

* Fix rollup span calculation for Graphite fetches.
* Support getting the topology configuration from an included config file.

### Changes in 0.3[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-03) <a href="#changes-in-03" id="changes-in-03"></a>

2016-12-29

* Allow reconstituting of individual data types.
* UI fixes for displaying licenses.
* Memory leak, crash and hang fixes.

### Changes in 0.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-02) <a href="#changes-in-02" id="changes-in-02"></a>

2016-11-29

* Don't recaclulate `counter_stddev` when counter in `NaN`.

### Changes in 0.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-01) <a href="#changes-in-01" id="changes-in-01"></a>

2016-11-29

* Add Graphite support.

### Changes in 0.0.2[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-002) <a href="#changes-in-002" id="changes-in-002"></a>

2016-11-21

* Fix issues with various inputs being `NaN`.

### Changes in 0.0.1[​](https://docs.circonus.com/irondb/release-notes-archive#changes-in-001) <a href="#changes-in-001" id="changes-in-001"></a>

2016-11-17

* Initial version. Start of "IRONdb" branding of Circonus's internal TSDB implementation.
