# Ascent 2.16.4

### Flow

#### New Features

* Field-based event deduplication reduces duplicate data processing and improves data accuracy.

#### Improvements

**Destination Integration - Kafka**

* Kafka forwarder support was expanded with backend services, UI integration, and connection validation, improving reliability and ease of setup for data forwarding.
* Redpanda source integration was added to support new ingestion pipelines and expand data source coverage.
* Pipeline integration improvements streamline how flows connect and process data across systems.
* Internal performance optimizations reduce unnecessary data processing when messages are dropped, improving efficiency.
* Query and caching behavior improvements reduce system resource usage and prevent instability in high-load scenarios.

#### Bug Fixes

* Fixed an issue where ingress volume metrics did not track certain data flows correctly, improving monitoring accuracy.
* Resolved a problem where pipeline preview diff did not work for forward rules, restoring expected configuration visibility.
* Fixed a crash issue in database operations during log file cleanup, improving system stability.

***

### Observe

#### Improvements

* Redpanda source integration extends ingestion capabilities for observability data pipelines.

#### Bug Fixes

* Fixed concurrency issues that caused query service crashes under load, improving system stability.
* Improved cache handling to prevent disk space exhaustion and system crashes in query processing components.

***

### Vanguard

#### New Features

* Added SLA fields to additional check types — SLA fields are now available for URLv2, Zebratester, Ping, Port, Compound, Traceroute, and Mobile App check types.

#### Bug Fixes

* Fixed "Hide Empty Groups" not working in Manage Checks — The "Hide Empty Groups" checkbox now correctly hides groups that contain no checks.
* Fixed check result graph compression — Resolved an intermittent issue where the check result graph would render compressed on the left side of the page instead of displaying at full width.
* Fixed sorting cancellation in Manage Scenarios — Cancelling a sort in the Manage Scenarios tab now correctly reverts the view to its original order.
* Fixed report name showing incorrect month — Resolved a bug where generated report names displayed the previous month instead of the selected month.
* Fixed severity mismatch in alert detail view where the severity shown in the alert detail view did not match the severity displayed in the alert dashboard.
* Fixed date selector accuracy in Audit Trail. The date and time filters in Audit Trail now return results matching the selected time range accurately, resolving issues with timezone offsets and incorrect day filtering.

***
