# Ascent 2.13.0

### Note <a href="#note" id="note"></a>

**Internal backend and infrastructure optimizations have been completed to improve performance and reliability. No user-facing changes in this release.**

***

### Ascent Synthetics <a href="#ascent-synthetics" id="ascent-synthetics"></a>

### Backend Improvements

* Improved backend data routing with per-tenant message isolation for greater reliability and scalability in CRS.
* Refactored Kafka client to enhance performance and reliability.
* Enhanced partitioning logic to improve data isolation and reliability in single-tenant deployments.
* Improved integration authentication for Kafka brokers.

### Other Technical Enhancements

* All relevant backend services flows transitioned to new single tenant architecture, enabling future scalability and reliability improvements.
