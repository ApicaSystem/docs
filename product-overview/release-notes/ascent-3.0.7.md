# Ascent 3.0.7

**Release Date:** 29 September 2026

This patch release makes log ingestion in Flow more reliable, with fixes for stalled connections , Datadog agent checks, large payload handling, duplicate logs and search results during Redis disruption.

### Flow

#### Improvements

* **More resilient ingestion when redis is slow or unavailable:** Redis operations now have time limits, so a slow or unresponsive Redis can no longer stall ingestion. One slow Redis call no longer holds up other incoming log traffic, and Flash reconnects automatically after a Redis connection drops.

#### Bug Fixes

* Fixed an issue where HTTP log ingestion (JSON batch, Datadog, and OTLP) could stop accepting new requests under sustained load. When a sender gives up on a request while Flash is busy, Flash now releases that request right away instead of holding it, so other senders are no longer rejected with "too many requests" responses.
* The Datadog log intake now accepts the empty test payload that Datadog agents send when they first connect, so agents no longer report a failed connection check.
* When oversized payload rejection is enabled, payloads larger than the ingest limit now get a "payload too large" (413) response instead of "try again later" (429), so senders stop resending data that will never be accepted.
* Fixed an issue where searches could return partial results, reported as complete, while Redis was unreachable. A brief Redis outage also no longer causes Flash nodes to exit.
* Fixed an issue that could cause duplicate logs when an HTTP ingestion request failed or was cancelled and the sender retried the same data.

***

### Component Version 3.0.7

| Component                              | Version                                         |
| -------------------------------------- | ----------------------------------------------- |
| Flash                                  | v4.0.7                                          |
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
