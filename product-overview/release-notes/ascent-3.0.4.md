# Ascent 3.0.4

**Release Date:** August 13, 2026

This patch release delivers stability and reliability fixes across log forwarding, dashboarding, and monitoring, along with performance improvements to the pipeline processing engine.

This release applies to both cloud and on‑prem deployments where this version is available.

### Flow

#### Improvements

* Improved the quality of AI-suggested rules offered when creating a new pipeline.
* Improved syslog timestamp parsing for greater accuracy when ingesting syslog data.
* Improved memory handling when ingesting small messages, reducing resource usage.
* Improved processing performance and reduced resource usage throughout the log forwarding and pipeline evaluation engine, including faster buffer handling, reduced CPU usage, and the ability for supported forwarders to write data out in parallel.
* Applied routine library and dependency updates to improve overall stability and security.

#### Bug Fixes

* Fixed several issues in the AI assistant used for pipeline creation, including it stopping mid-response when switching chats and generating multiple rewrite rules instead of a single filter rule.
* Fixed several data-forwarding issues, including the Datadog forwarder unintentionally enabling "include original message," a JavaScript forwarder disrupting environment variables used for data ingestion and checks, and integer values being forwarded as strings instead of their original type.
* Fixed an issue where log ingestion dropped attributes that were not string values, and one where nested objects could not be sent through a code rule.
* Fixed issues affecting data completeness and reporting, including missing metadata at the end-of-hour boundary, unsearchable backfilled data for hours with sparse ingestion, pipeline statistics incorrectly resetting to zero after deployment, and some widgets in Data Explorer failing to load data.

### Observe

#### Improvements

* Improved the AI dashboard-building assistant so that adding suggested rules to an existing pipeline now merges into that pipeline and opens it for editing, rather than creating a new pipeline.

#### Bug Fixes

* Fixed several issues affecting dashboard creation, including the AI dashboard-building assistant defaulting to the wrong data source, creating the wrong tab or widget type, or generating inconsistent queries when building on check or log data sources; a "Stat" widget's displayed value not matching its graph; and an error that could occur when building a dashboard on log data.
* Fixed issues affecting Real User Monitoring (RUM), including missing network and authentication metrics and some metrics or values not being visible.
* Fixed an issue where search results could be silently dropped in proportion to a reduction in ingest scale, and a crash affecting log processing and synchronization.

### Vanguard

#### Improvements

* Reduced the amount of raw trace data stored for synthetic check results, improving performance without changing check results.

###

***

### Component Version 3.0.4

| Component                              | Version                                         |
| -------------------------------------- | ----------------------------------------------- |
| Flash                                  | v4.0.4                                          |
| Coffee                                 | v4.0.2                                          |
| ASM                                    | 13.40.3                                         |
| NG Private Agent                       | 1.0.9                                           |
| Check Execution Container: Browser     | fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0 |
| Check Execution Container: Zebratester | zt-7.5a-p0-r-2025.04.02-0-base-1.2.0            |
| Check Execution Container: Runbin      | runbin-2025.04.17-0-base-2.2.1                  |
| Check Execution Container: Postman     | postman-2025.04.17-0-base-1.4.1                 |
| Bnet (Chrome Version)                  | 10.2.2 (Chrome 130)                             |
| Zebratester                            | 7.5A                                            |
| ALT                                    | 6.13.3.240                                      |
| IronDB                                 | 1.5.1                                           |

