# Ascent 4.0.2

**Release Date:** November 19, 2026

This release adds TotalView network diagnostics to Vanguard check results, makes data ingestion more reliable and memory efficient, and includes security updates and bug fixes across Flow, Observe, Vanguard, and Fleet.

This release applies to both cloud and on‑prem deployments where this version is available.

### Release Highlights

#### TotalView Integration

Browser and URL v2 check results in Vanguard now link directly to PathSolutions TotalView. Diagnose buttons open a network path analysis for the check, making it faster to tell whether a slow or failed check is caused by the network.

#### More Reliable Data Ingestion

Ingestion is more resilient to crashes and object storage outages. Several fixes prevent ingested data from being lost, and memory usage is lower under heavy, sustained load.

### Flow

#### Improvements



* **Security Updates:** Updated third-party components to address known security vulnerabilities.

#### Bug Fixes

* Fixed a rare timing issue that could cause part of the daily lookup index for stored data to be lost, which could affect search results.
* Pipelines that combine forwarding rules with other rule types, such as filter, rewrite, or extract rules, can now be saved.
* Mapping a forwarder to a pipeline with no attached data flows now shows a warning instead of a misleading success message.
* Canceling unsaved pipeline changes no longer causes the pipeline preview to open automatically when returning to the Pipelines page.
* More than one role can now be selected when creating a user.
* Removing a policy from a role through the API no longer returns a server error.
* Creating a tag through the API no longer returns a server error.
* Deleting a tag through the API now returns a standard success response instead of the tag ID.

### Observe

#### Improvements

* **Query Performance:** Reduced CPU usage during searches, especially over long time ranges such as 30 days, by removing unnecessary work while query data is loading.

### Vanguard

#### New Features

* **TotalView Integration for Browser and URL v2 Checks:** The TotalView integration is turned on, and the TotalView server address set, under Settings > Admin Settings > Infrastructure. The address can be a domain, an IP address, or a URL that includes a path. When the integration is enabled, every check result shows Diagnose Internal and Diagnose External buttons for network path and external route analysis. Selenium and Playwright browser checks and URL v2 checks also show TotalView buttons next to each individual URL, opening a network path map between the agent and that URL's destination.

#### Bug Fixes

* Fixed an issue where SSO users could be duplicated during user synchronization, which prevented SSO login from applying the correct role mapping.
* Fixed an issue where check results returned by the v2 checks API could occasionally be missing or returned twice.
* DOM Interactive now reports correct values for every page in multi-page browser checks, instead of negative values for pages after the first.

### Fleet

#### Improvements

* Updated a third-party component to address a security vulnerability.

***

### Component Versions 4.0.2

| Component                              | Version                                        |
| -------------------------------------- | ---------------------------------------------- |
| Flash                                  | v4.1.2                                         |
| Coffee                                 | v4.1.2                                         |
| ASM                                    | 14.0.5                                         |
| NG Private Agent                       | 1.0.9                                          |
| Check Execution Container: Browser     | fpr-c-149-10.3.4-772-r-2026.10.30-0-base-2.0.0 |
| Check Execution Container: Zebratester | zt-7.5b-p1-r-2026.10.30-0-base-1.3.4           |
| Check Execution Container: Runbin      | runbin-2026.10.30-0-base-2.3.1                 |
| Check Execution Container: Postman     | postman-2026.10.30-0-base-1.4.2                |
| Check Execution Container: Playwright  | playwright-2026.10.30-0-base-0.1.1             |
| Bnet (Chrome Version)                  | 10.3.4 (Chrome 149)                            |
| Zebratester                            | 7.5B                                           |
| ALT                                    | 6.13.3.9888                                    |
| IronDB                                 | 1.5.1                                          |
