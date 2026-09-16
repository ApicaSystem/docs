# Ascent 3.0.6

**Release Date:** September 16, 2026

This release adds direct Datadog Agent ingestion and encrypted connections for Redis and Postgres, improves chart legends and Datadog forwarding compatibility, and fixes issues in pipeline rule creation, savings reporting, and permissions.

### Flow

#### New Features

* **Direct Ingestion from Datadog Agents:** Data can now be ingested directly from Datadog Agents through a dedicated ingestion endpoint, in addition to existing forwarder-based paths.
* **Secure Connections for Redis and Postgres:** Connections to external Redis and Postgres data sources now support TLS encryption with certificate-based authentication, making it possible to connect securely to managed database services and meet security requirements in regulated environments.

#### Improvements

* **Datadog Forwarder Compatibility:** Logs forwarded to Datadog Cloud now preserve standard fields such as status, timestamp, hostname, and service at the top level, matching the format used when a Datadog agent sends data directly. Internal-only fields that were never actually forwarded have also been removed from the forwarder's attribute list.
* **Kafka and Datadog Forwarder Updates:** General reliability and compatibility updates to the Kafka and Datadog forwarders.
* **Pipeline Forwarding Performance:** Reduced CPU and memory usage across pipeline data processing and forwarding, improving efficiency for high-throughput pipelines.

#### Bug Fixes

* Fixed an issue where the Kafka forwarder's nested-option setting placed all fields under a single "event" key instead of preserving the original payload structure, which could break downstream processing expecting fields at the top level.
* Fixed an issue where numeric Unix-epoch timestamps in ingested event payloads were silently discarded, causing events to be stamped with their collection time instead of their actual event time.
* Fixed an issue where using the AI assistant to create pipelines with event suppression could generate duplicate or excessive pipeline rules instead of a concise, optimized rule set.
* Corrected pipeline data-savings calculations that were undercounting actual savings, so reported cost and volume reduction now reflect the correct numbers.

### Observe

#### Improvements

* **Chart Legend Layout and Placement:** Improved the layout of chart legends for charts with many series, and added the ability to choose the legend's position (such as bottom or right) to make charts easier to read.

#### Bug Fixes

* Fixed inconsistent padding between the graph and table in the Severity Metrics view of Data Explorer.
* Fixed an issue where the AI assistant used to create SLOs did not consistently prompt for a review before saving.

***

### Component Version 3.0.6

| Component                              | Version                                         |
| -------------------------------------- | ----------------------------------------------- |
| Flash                                  | v4.0.6                                          |
| Coffee                                 | v4.0.4                                          |
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
