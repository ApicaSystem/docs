# Ascent 2.2.0

Discover the latest advancements and improvements of the Apica Ascent platform. This is your go-to destination for updates on platform enhancements and new features. Explore what's new to optimize your observability and data management strategies.



### **Synthetic Monitoring (ASM 13.25.0) - SaaS**

* Features
  * We have added bulk GET support for the API endpoint /checks/config. Users can now request multiple check configurations in one go, preventing issues caused by rate limiting. This is especially beneficial for those automating the synchronization of their own versions of check configurations with the Ascent platform through the ASM API.
  * A user must be able to see the response body from a failed URL call in a ZebraTester checks, if available, to enable the identification of what error messages or content might be returned.
* Bugs Fixes:
  * We have eliminated the inconsistencies (spikes) in NG check result metrics previously impacted by infrastructure resource constraints. This has now been rolled out to all public and dedicated check locations available.
  * We have fixed the bug where the location API endpoint for Zebratester checks GET /checks/proxysniffer/locations was not returning all NG locations.
  * Expanding urls in check results for URLv2 check will display readable response content.

### **Synthetic Monitoring (ASM) - On-Prem**

* Features:
  * Display response body for failed URL calls in a ZebraTester checks result.
* Bug Fixes:
  * We have fixed a bug that prevented new Browser check scenarios from syncing with the controlling agents effectively making them unavailable at time of check execution.

### **Loadtest (ALT)**

* Bug Fixes:
  * Not all transaction names are available in ‘Edit Non-Functional Requirements (NFR)’.

### **ADF v3.7.7**

* Features
  * We have added an OTel forwarder to be used in ADF/FLOW to send OTel data untouched downstream to external OTel collector.
* Bug Fixes:
  * ASM+ Pagination bug on Check Analytics
  * Email delivery bug
  * ASM+ check data ingest stability improvements
