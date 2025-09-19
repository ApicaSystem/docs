# Ascent 2.10.4

We are pleased to announce the release of **Ascent v2.10.4**, which brings important performance optimizations, stability improvements, and functional enhancements across the platform.

***

### **Flow**

#### **Improvements**

**Ingestion Stability and Metric Accuracy**

* **Dedicated Ingest Routing**: All ingest endpoints are now routed exclusively to ingest nodes to reduce latency, eliminate conflicts, and improve path separation.
* **Shard Locking for Inserter**: Replaced global locks with shard-level locks in the ingestion layer to prevent deadlocks and improve concurrency safety.
* **Batch Size Metric Fix:** Corrected the calculation of JSON batch sizes in metric outputs — metrics now represent per-batch payload size instead of total stream size.
* **Rate Limiting Revamp**: Introduced a configurable leaky-bucket algorithm for ingest rate limiting with burst handling and fine-grained limiter options.
* Fixed an issue where log entries associated with `default_namespace` were not visible in log explorer views.

### **Vault & Configuration Variables**

#### **Improvements**

* Fixed a critical issue where Vault-stored variables failed to persist due to stale distributed cache states. The cache parameters have been tuned for distributed consistency.

#### **Regex Validation (RE2)**

* Regex validation improvements:
  * Server errors now shown in UI with contextual error messages.
  * Removed the 3-character minimum input constraint.
  * Added help link for RE2 syntax reference.

### **Bug Fixes**

* Fixed issue where help documentation for rule-based code blocks failed to load in the UI.
* Removed redundant duplicated Pipelines & Rules tabs in the pipeline page.

***

## **Ascent Synthetics**

### **Scenario Management**

**Improvements**

* Resolved visual duplication issue in Scenario Management when editing existing scenarios.

### **Checks & Monitoring**

#### **Bug Fixes**

* Resolved incorrect check behavior where frequency-based scheduled checks appeared as "manual" runs in the UI.

***

## **Observe**

### **Dashboards & Visualization**

#### **Bug Fixes**

* Fixed issue where some dashboards failed to import in preview mode due to serialization mismatches.
* Addressed failure of dashboard import from shared URL links.

***

### **Platform-Wide Improvements**

#### **License banner**

* Updated ADF license banner with correct Apica email address.

***

### **Component Versions - Ascent v2.10.4**

| **Component**                          | **Versions**                                    |
| -------------------------------------- | ----------------------------------------------- |
| Flash                                  | v3.15.5                                         |
| Coffee                                 | v3.16.7                                         |
| ASM                                    | 13.34.0                                         |
| NG Private Agent                       | 1.0.8                                           |
| Check Execution Container: Browser     | fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0 |
| Check Execution Container: Zebratester | zt-7.5a-p0-r-2025.04.02-0-base-1.2.0            |
| Check Execution Container: Runbin      | runbin-2025.04.17-0-base-2.2.1                  |
| Check Execution Container: Postman     | postman-2025.04.17-0-base-1.4.0                 |
| Bnet (Chrome Version)                  | 10.2.1 (Chrome 130)                             |
| Zebratester                            | 7.0B                                            |
| ALT                                    | 6.13.3.240                                      |
| IronDB                                 | 1.5.0                                           |
