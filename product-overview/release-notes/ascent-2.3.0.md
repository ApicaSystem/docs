# Ascent 2.3.0

Discover the latest advancements and improvements of the Apica Ascent platform. This is your go-to destination for updates on platform enhancements and new features. Explore what's new to optimize your observability and data management strategies.

#### **Synthetic Monitoring (ASM 13.26.0) - SaaS**

**Features**

* Browser checks will automatically accept dialogs/modals that can pop up during a test such as alert/confirmation/prompts.
* Browser checks will attach and include control of new tabs created by the target site.\
  I.e. the chrome WebDriver will automatically attach to new tabs that are opened during check execution of a Browser check.
* Added SAN/SNI options to SSL Cert Expiration and Fingerprint Validation for URL checks.

**Bugs Fixes:**

* Screenshots for Browser checks were not working in new tabs or windows created by the check. This is fixed as part of the above feature that include control of created tabs and windows by the target site.

#### **ADF v3.8**

**Features**

* **Data Explorer** adds a new way to create queries, dashboards, and widgets directly from a browsable inventory of available metrics and events. With just a few clicks, a query builder is guiding the simple creation of dashboards and widgets.\
  Please read further on this substation set of features in our product documentation:\
  [https://docs.apica.io/data-explorer/overview](https://docs.apica.io/data-explorer/overview)
* **Code Rule** is a new rule type that is introduced with this release, where user can add JavaScript code to enhance the logs. With the help of Code Block, add Code Rule to improve your pipelines. Code Rules takes in a JavaScript function that gets integrated with your pipeline.\
  Please read further on this in the product documentation:\
  [https://docs.apica.io/data-management/code](https://docs.apica.io/data-management/code)
* **Fleet** 🚢 is the ultimate solution for making the collection of observability data responsive to changes in your environment using your pre-existing observability agents.\
  With Fleet, you can collect more data when you need it and less when you don’t. And the best part? Almost all observability agents can be managed through configuration files describing how to collect, enrich, and send data.\
  Fleet aims to simplify this process through an agent manager. The Fleet Agent Manager functions as a sidecar utility that checks for new configuration files and triggers the appropriate restart/reload functionality of the supported agent. The Agent Manager is kept intentionally simple, with the goal that it only needs to be installed once and updated infrequently.\
  Please read further on this in the product documentation:\
  [https://docs.apica.io/fleet/fleet](https://docs.apica.io/fleet/fleet)
* **JS Code Forwarder** is a robust batch processing tool designed to efficiently handle and forward batches of events. It supports forwarding arrays of event objects to a specified endpoint, and includes built-in functions for recording metrics, making HTTP requests, and logging.\
  [https://logflow-docs.logiq.ai/forwarding-to-monitoring-tools/js-code-forwarding](https://logflow-docs.logiq.ai/forwarding-to-monitoring-tools/js-code-forwarding)
* **AWS XRay Forwarder**. This allows users to send trace data to AWS XRay.
* Alert page search. Ability to search across all existing Alerts by use of central search bar within Alert list view.\


**Improvements**

* Revamped Alert API to support multiple severities (Info, Warning, Critical, Emergency) with multiple thresholds, in the same alert.
* Changed the location of Track duration in alert screens to be adjacent to the Alert condition.
* All the alert destinations (Slack, PagerDuty, Mattermost, Chatwork, Zenduty, Opsgenie, Webhook, ServiceNow, and Email) will now start receiving values that triggered that specific alert.
* Further UI changes for Alert Screens, Integrations Screen, and Distributed Tracing to align with the new design system.
* Search improvements in ASM+. Now search by location, severity, type, and checkID are supported. Search is also a lot faster because of parallel queries.
* Improved waterfall chart in ASM+ analysis view.
* Improved pattern signature enables/disables usability.

**Bug Fixes:**

* Fixed ServiceNow alert destination API errors.
* Fixed Email settings page bug.
* Fixed User page bug because of which admin was not able to change groups of users.
* Fixed missing services in ASM+.
* Bring back scenario commands and request/response headers for FPR checks in ASM+.

**Others:**

* Deprecated Hipchat alert destination.

#### **IRONdb**

**Bugfixes**

* Avoid metric index corruption by using pread(2) in jlog instead of mmap(2).
* Fix the bug where a node could crash if we closed a raw shard for delete, then tried to roll up another shard before the delete ran.
* Fix the bug where setting raw shard granularity values above 3w could cause data to get written with incorrect timestamps during rollups.
* Fix the NNTBS rollup fetch bug where we could return no value when there was valid data to return.
* Fix the bug where histogram rollup shards were sometimes not being deleted even though they were past the retention window.

**Improvements**

* Deprecate max\_ingest\_age from the graphite module. Require the validation fields instead.
* Change the Prometheus module to convert nan and inf records to null.
* Add logging when when the snowth\_lmdb\_tool copy operation completes.
* Improve various listener error messages.
* Add checks for timeouts in the data journal path where they were missing.
* Improve graphite PUT error messages.
