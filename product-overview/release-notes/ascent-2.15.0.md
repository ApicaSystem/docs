# Ascent 2.15.0

### Flow

#### New Features & Improvements

* Live Data Capture is available for pipeline preview, including updates to the Live Tail UI, a new Data Capture section in pipeline configuration, and enhancements to the tail endpoint so you can safely preview live log data in pipelines.
* The pipeline preview API now supports previewing data from lookup files, enabling more realistic testing of lookup-based transformations.
* Queue persistence can now be turned on or off via configuration, giving more control over durability and performance.

#### General Changes

* In LOG\_FLOW\_ONLY mode, Flow is decoupled from Lake so logs are not stored while application metadata continues to be updated, and related graph and navigation behaviors are aligned with this mode.
* Journals and alert logs can be ingested and uploaded to S3 in LOG\_FLOW\_ONLY environments, aligning logging behavior with decoupled storage.
* GRPC propagation of tracing contexts is enabled so distributed traces flow through Flow services for better observability.

#### Bug Fixes & Reliability

* Forwarder buffer logic and persistence queues have been improved to handle full buffers more gracefully, prevent ingestion stalls, and track persistent byte sizes accurately.
* Pipeline rule edges and node positions in the graph view have been refined so nodes render and connect correctly.
* S3 configuration and partition creation behavior in LOG\_FLOW\_ONLY mode have been simplified to avoid unnecessary configuration and resources.
* Performance testing and behavior in LOG\_FLOW\_ONLY mode have been improved to ensure reliable operation under load.

***

### Fleet

#### General Changes

* Audit trail UX across Fleet, Flow, Observe, Lake, and Synthetics has been enhanced with UI refinements, updated tag colors, and clearer highlights to make it easier to inspect changes and events.

***

### Ascent Synthetics

#### New Features & Improvements

* Synthetics storage has been restructured so checks are segregated into their own buckets by check ID, improving scalability and query performance.
* Query compatibility across legacy and per-check buckets ensures existing queries continue to work with the new bucket layout.
* Ingest configuration has been simplified by removing configurable bucket size and relying on optimized defaults.
* Tag colors are now included in the checks list API responses so the UI and integrations can present clearer visual status cues.
* Numerous UX enhancements have been added across check details, SLA/uptime, list views, split views, and group views, including row highlighting based on severity.

#### General Changes

* Check result analysis views (such as Postman, Runbin, Mobile Web, Mobile App, and other browser-based checks) have been refreshed for better layout, clarity, and overall usability, including dark theme alignments.
* Check management improvements include moving monitor groups to the info page, adding tag support, and providing severity mapping options to organize and prioritize checks.

#### Bug Fixes & Reliability

* Dark theme inconsistencies in check list views, check detail pages, SLA hover graphs, and analysis result screens have been corrected for better readability.
* The last 24‑hour SLA bar and hover graphs now display consistent, accurate information for recent check performance.
* Result APIs for Postman and other check types now return the expected steps and request metrics, enabling more detailed troubleshooting from analysis views.

***

### Observe

#### New Features & Improvements

* Tab-based dashboards now support advanced visualizations including box plot, heatmap, bubble chart, funnel, sunburst, pivot table, searchable table, and Sankey diagram, bringing them in line with legacy Redash-style dashboards.
* Auto-refresh is available on data explorer dashboards so views stay up to date without manual refresh.
* An out-of-the-box LLM monitoring dashboard is available for tracking and analyzing large language model workloads.
* JSON lookup files can now be viewed alongside CSV lookup files, improving flexibility when working with lookup-based data flows.

#### General Changes

* Journals are integrated consistently across interfaces such as namespace lists and audit log trails, improving traceability of configuration and access events.
* PDF report lists now support filtering, making it easier to locate specific scheduled or generated reports.
* Subscription report generation has improved UI, filters, and logging so scheduled reports are easier to manage and debug.
* An on-demand flush API and associated Prometheus metrics provide finer control and visibility into flush lifecycles when pushing data to S3.
* Flash can now tolerate Postgres restarts without stopping ingestion, increasing the resilience of log and metric collection.

#### Bug Fixes & Reliability

* Chart label casing has been standardized across dashboards for a more consistent visual experience.
* Tag synchronization has been updated so tags are no longer unintentionally synced from event rules, dashboard, and query syncers, improving tag accuracy.
* Journals now support backend event-name filters, enabling more targeted audit log views.
* Additional logging in subscription report generation helps capture errors and speed up troubleshooting when report runs fail or behave unexpectedly.

***

### Component Versions - Ascent v2.15.0

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.20.0</td></tr><tr><td>Coffee</td><td>v3.21.0</td></tr><tr><td>ASM</td><td>13.39.0</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.2 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.5A</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.1</td></tr></tbody></table>
