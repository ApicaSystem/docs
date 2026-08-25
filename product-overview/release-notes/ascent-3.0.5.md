# Ascent 3.0.5

**Release Date:** August 27, 2026

This release delivers reliability and accuracy fixes across pipeline rules, log ingestion, and the Datadog forwarder, along with a set of smaller bug fixes across Flow, Observe, Vanguard, and Fleet.

### Flow

#### Improvements

* **Datadog forwarder payload cleanup:** Duplicate severity fields carried over from log ingestion are no longer sent in the outbound Datadog payload, reducing payload noise. These fields remain stored and searchable within Ascent.
* **Splunk metrics source extension update:** The Splunk metrics source extension has been updated to a new version with revised configuration options.
* **Log processing performance:** Improved the efficiency of log parsing, reducing processing overhead under high load.

#### Bug Fixes

* Fixed an issue where the AI assistant could not draft pipeline rules.
* Fixed an issue where the AI assistant was unable to generate extract rules.
* Fixed an issue introduced in a prior release where log and metric source extensions with a configured namespace and application were incorrectly routed into the default namespace instead of their own data flow.
* Fixed an issue where a non-default forwarder did not appear in the pipeline graph view.
* Fixed a display issue in the pipeline rule preview where code rules incorrectly appended index markers to log keys. This was a visual issue only and did not affect the underlying log data.
* Fixed an issue where the regex pattern in an extract rule could not be edited after creation.
* Fixed an issue where log timestamps from OTLP sources were truncated to whole seconds, and resolved inconsistent handling when a log carried more than one timestamp field. Timestamp precision is now preserved, with a consistent, documented order for which timestamp field takes precedence.
* Fixed an issue where following a direct link while logged out returned the user to the homepage after login instead of the originally requested page.

### Observe

#### Bug Fixes

* Fixed an issue where the AI assistant created a saved query without prompting for review. A review step is now always presented before a query is saved.

### Vanguard

#### Bug Fixes

* Fixed an issue where creating a metric from a log through a SIEM rule failed or returned no result.

### Fleet

#### Bug Fixes

* Fixed an issue that prevented creating API keys.

***

### Component Version 3.0.5

| Component                              | Version                                         |
| -------------------------------------- | ----------------------------------------------- |
| Flash                                  | v4.0.5                                          |
| Coffee                                 | v4.0.3                                          |
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
