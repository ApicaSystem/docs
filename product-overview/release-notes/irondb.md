# IRONdb

## Release Version 1.2.0

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

