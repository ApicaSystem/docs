# Ascent 4.0.1

**Release Date:** \[Add release date]

Ascent 4.0.1 brings Playwright to synthetic monitoring, puts Venn to work managing your checks, and lets you decide where pipeline rules run, at every stage. This release delivers Playwright browser checks, AI-assisted check management with Venn, check-level alerts and maintenance, pipeline rules at every stage, a dedicated Traces data source, and broad security hardening.

This release applies to both cloud and on‑prem deployments where this version is available.

### **Release Highlights**

_**Five changes worth knowing about first.**_

**Script Browser Checks with Playwright**

Bring your Playwright scripts into Ascent. Browser checks can now be built with Playwright. Playwright checks work like any other check: Create, edit, clone and delete them with screenshot options, detailed results analysis, and support for private locations.

**Let Venn Manage Your Checks**

Ask Venn to list, inspect, create or update checks right from chat. You stay in control: Every change Venn proposes goes through a review and approval step before it is saved.

**Alerts and Maintenance Right Where Your Checks Live**

Every check now has its own Alerts tab, so you can create static and dynamic alerts without leaving the check. A new Maintenance area in Settings lets you plan and manage maintenance tasks for check results.

**Pipeline Rules at Every Stage**

Choose where your rules run: In the common, the forwarder or the lake pipeline. Forwarder pipelines now support every rule type, so you can keep raw data intact in storage while sending transformed data downstream. The pipeline graph shows which rules run where. A

**Traces Get Their Own Data Source**

Traces no longer have to be queried through Logs. With a dedicated data source, trace fields such as trace ID, span ID, service name, duration and status are handled natively, which makes trace queries clearer and easier to build.

### **Vanguard**

_**Synthetic monitoring gets Playwright support, Venn-assisted check management, and new controls for alerts, maintenance, messaging and access.**_

**New Features**

* **Playwright browser checks:** Scriptand automate complex, multi-step user workflows with full Playwright support. Create, edit, clone and delete Playwright browser checks directly in the Ascent UI. Scripts written in TypeScript, JavaScript and Python are supported, along with the full set of Playwright command-line options. Keep your test scripts in your own Git repositories and Vanguard pulls them directly from source control at check execution. Playwright checks become part of your existing CI/CD workflows for easier adoption, better automation and simpler maintenance.
* **AI-assisted check management with Venn:** Venn can now list checks, view check details, configuration, SLA and results, create and update checks, and enable or disable them. Every change Venn proposes requires review and approval before it is saved. An "Ask Venn" launcher is available across the Checks pages.
* **Alerts for each check:** Check details now include an Alerts tab that lists the alerts configured for that check, and you can create static or dynamic alerts directly from it. You get a clear view of which alerts cover each check and managing them is easier.
* **Maintenance tasks and historical result adjustments**: New self-service maintenance capabilities give administrators more control over planned outages and historical results for accurate SLA reporting. Schedule and track maintenance activities from a centralized Maintenance view, and make versioned corrections to false-positive severities or corrupted results while preserving full audit history.
* **Messages (notification banner):** Administrators can now publish time-bound banners and messages across all Ascent screens with configurable priority levels (Low, High, Critical) to share organizational notices and operational advisories with every user. Messages can also be managed them from a searchable Messages overview page.
* **Advanced Scripting Engine**: Zebratester 7.5B, the new version of our Advanced Scripting Engine is now available with support for monitoring HTTP/2 sites.
* **Groups as resources in IAM policies:** Groups can now be selected as resources when creating an IAM policy. Local users get group access directly from their policy, while synthetic monitoring users need both a policy and a group assignment.

**Improvements**

* **Chrome 149 for browser checks:** The check execution engine for browser checks has been upgraded to a recent version of Chrome for security and compliance. Selenium based browser checks now run on Chrome 149.
* Inbound and outbound network communications between the check execution engine and HashiCorp Nomad are now logged for SecArch compliance.
* Each URL in a check result now has a "Jump to Scenario Command" option that opens the Scenario Details table and highlights the step that loaded it.
* The date picker on the check details page now supports time frames of up to 14 days.
* Filter sections now stay visible while you scroll in Check Analysis, Manage Checks, Manage Scenarios and Analyze Metrics.
* The check edit, bulk edit and Manage Scenarios screens have been refined for easier use.
* Check start and finish times now include seconds on the check details and result analysis pages.

**Bug Fixes**

* Images in the Screenshots section now display correctly.
* The "Associated With Checks" count no longer shows 0 for scenarios that are in use.
* Screenshots now load when debugging scenarios on private agents.
* Scenarios can now be run on older private agents from Debug Scenarios.
* Creating ad hoc and scheduled subscriptions no longer returns an error.
* The "Jump to URL" option now appears when hovering over rows in the Scenario Details list.
* The group filter now works together with other filters in Check Group View and Split View.
* Selecting a location with no checks in Check Group View and Split View no longer shows a blank page.
* Split View no longer gets stuck after a page refresh.
* Disabled checks no longer appear on the Check Analytics dashboard.
* The aggregated data API no longer returns an error for some checks when step metrics are included.
* Switching between Graph View and Table View on check results now works correctly.
* Fixed visual inconsistencies in Operations View, Checks, Manage Checks, Manage Scenarios and Analyze Metrics.
* Scenario names are now visible in dark mode while editing.
* A clear message is now shown instead of a raw error when a role name is too long.
* Fixed column alignment, pagination and visibility issues across Check Analytics, Manage Checks, Operations View and Manage Scenarios.
* Private agent setup with Podman and a custom repository now works.

### **General Updates**

* Creating a role no longer fails at random with a misleading "Role name already exists" message.
* The policy creation form no longer hangs when the policy name is too long.
* Creating a group with a name that is too long now shows a clear message instead of failing silently.
* A clear message is now shown instead of a raw error when a tag key or value is too long.
* SAML configuration changes are now saved completely and consistently.

### **Flow**

_**Control where transformations happen with pipeline rules at every stage, backed by completed security-audit remediation and better visibility under heavy load.**_

**New Features**

* **Pipelines with all rule types at every stage:** Apply pipelines at any stage, common, forwarder or lake. Forwarder pipelines now support all rule types, so you can keep raw data intact in storage while sending transformed data downstream. When assigning a pipeline, a stage selector sets where it applies, and the pipeline graph can be viewed by stage to show which rules run where.

**Improvements**

* **Security and dependency updates:** All remediation from third-party security audit is complete.
* Filter rules can now select multiple fields to drop with a single regular expression.
* The pipeline view is easier to read when stream rules are in use.
* User invitations can now be cancelled and resent.
* Storage credentials can now be read from a Kubernetes Secret instead of being kept in plain text in the deployment configuration.
* Improved Datadog forwarder performance.
* Data dropped during heavy ingest load is now reported as a metric, so overload is visible instead of silent.
* Event rule endpoints now validate the rule type before saving.

**Bug Fixes**

* Forward rules now route to multiple destinations.
* The OpenTelemetry log forwarder now handles headers that contain "==".
* Pipeline filtering now behaves consistently.
* Log flows are now mapped to InstaStore by default.
* The confirmation message when deleting a lookup or certificate is now correct.
* The Add Cluster button is now disabled until required fields are filled, and fields are validated.
* Roles can now be searched in the dropdown when creating a user, and they are listed in sorted order.
* Venn now asks for review before creating a forwarder.
* Variable names containing special characters or "/" no longer break the Variables page.
* Newly created forwarders now appear in the expected position in the list.
* Pipeline filters no longer return repeated errors.
* Fixed several API issues, including duplicated fields in the user policy API documentation, errors when creating users, the data source metadata endpoint, and responses from the query unarchive and query results endpoints.
* Fixed a crash on the Forwarder page under Integrations.
* Fixed a load error and spacing issues on the Pipelines tab in Explore.
* Fixed SSO login configuration mismatches.
* OpenTelemetry resource attributes no longer overwrite log record attributes at ingest, including namespace and application routing keys.
* InstaStore no longer disappears from the destination view in the Pipelines tab and Logs & Insights.
* Lookup tables are now referenced by ID instead of name, so renaming one no longer breaks references.

### **Observe**

_**Traces become a first-class data source, and large log queries now show results as they arrive instead of timing out.**_

**New Features**

* **Traces data source:** Traces are now a dedicated data source, separate from Logs, with native support for trace-specific fields.

**Improvements**

* Data Explorer widgets now show logs query results progressively as they arrive, so large queries no longer time out before displaying data.
* Venn picks a suitable chart type based on the shape of the metric.
* The Role > Members list in IAM now has a search box.
* Search boxes on Dashboards, Queries and Alerts keep focus when a search returns no results.
* Session cookie handling is now consistent across all sign-in paths.

**Bug Fixes**

* Alert notification links for Slack, Chatwork, webhook and iLert are now complete, clickable URLs.
* Invitation and password reset emails now contain complete, working links.
* Administrators can now reset another user's password
* Baseline anomaly detection no longer fails when a query returns a flat or constant series.
* All applications now appear under their namespaces in Data Explorer.
* Query search now returns the expected results.
* Query creation no longer fails silently.
* The topology name field can no longer be edited before clicking Edit.
* Empty alert event details no longer flicker on hover.
* The RUM script no longer swaps the metric and trace endpoints when they are set explicitly.
* Fixed button padding on the New Report screen.
* Check schemas now load on the New Query page, and spacing issues on query subtabs are fixed.
* Fixed filter alignment in Logs & Insights and an issue where the Topology page would intermittently disappear.
* Editing an alert and selecting an alert destination no longer crash the page, and the destination column is visible in dark mode.
* Fixed dark mode issues in the Query Builder and extra spacing on dashboard subtabs.
* The Dashboard page under Integrations now loads correctly.

### **Fleet**

_**More reliable agent status, cleaner agent pages, and ingest tokens that are no longer tied to your browser session.**_

**Bug Fixes**

* Agents now appear correctly instead of showing a "Can't Fetch" error.
* The agent manager no longer shows as disconnected while its service is running.
* Agent details no longer show connected-looking information for a disconnected agent.
* Fixed agent tag rendering, Agent Types dropdown sizing and tag padding.
* Fixed misaligned controls on the Agents and Agent Types pages.
* Ingest tokens no longer expire after 60 minutes or depend on the browser session.
