# Ascent 3.0.1

Live in production Wednesday, July 22. Here's what's new: A built-in AI assistant, an open door for your own AI tools via MCP, a new Kafka destination, and a long list of fixes and quality-of-life improvements across every part of the platform.

## **Release Highlights**

Three things in this release are worth slowing down for.

### **Venn AI Assistant**

Meet Venn: A built-in AI assistant named Venn is now integrated across Ascent. Venn lives in a persistent side panel with conversation history and streaming responses and is also the new default landing experience. It can:

Answer questions about your data and about the product. Documentation search has been folded into Venn, replacing the standalone navbar search button.

Search, summarize, and tail log data, and check dataflow health.

Build pipeline rules conversationally across all rule types (filter, rewrite, forward, stream, SIEM, code, aggregate, extract), with a review-and-save (HITL) step before anything is applied.

Author and edit dashboards with live draft changes you can review before saving.

Prefill create forms with AI-generated context for alerts, queries, data sources, dashboards and Data Explorer widgets, SLOs, pipelines, forwarders, alert destinations, source extensions, replay configurations, and Fleet agents and configurations. Secrets are always entered on the form, never in chat.

Offer numbered follow-up suggestions at the end of each response, so you can continue with one click.

Guardrails built in: Venn asks for confirmation before destructive actions, and delete operations are disabled by default until an administrator enables them.

### **MCP Server**

Prefer to bring your own AI tools? Now you can. Ascent now exposes a built-in Model Context Protocol (MCP) server, allowing external AI tools and assistants to securely connect to your observability data and platform configuration using your Ascent credentials. The MCP server provides access to:

Search, summarize, and tail log data, check dataflow health, and search product documentation.

Pipelines: List pipelines, inspect rules, apply pipelines to dataflows, enable or disable pipelines, delete pipelines, and retrieve read-only references for all pipeline rule types. (Creating new pipeline rules conversationally remains a Venn in-product capability.)

Forwarders: Create, update, and delete forwarders, list supported destination schemas, and manage forwarder mappings, including the default forwarder.

Alerts and alert destinations, SLOs, data sources, dashboards, queries, source extensions, and replay configurations.

Fleet: Create, read, update, and delete agents and agent configurations, trigger agent actions, and read and assign packages.

The MCP server requires confirmation before destructive actions, and delete operations are disabled by default until enabled by an administrator.

### **Kafka Forwarding Destination**

Streaming teams, this one's for you. A new Kafka destination is available in Flow, with a dynamically generated configuration form and a full create and edit workflow.

## **Flow**

Flow picks up the new MCP server and Kafka destination, plus AI-assisted setup and a cleaner pipeline builder.

#### **New Features**

Kafka Destination Integration: A Kafka forwarding destination is now available. The configuration form is built dynamically from the destination's schema, supporting the full create and edit workflow.

MCP Server: Ascent ships a built-in MCP server that exposes a broad set of tools for AI assistants to interact with the platform. Covered capabilities include searching, explaining, and tailing log data; managing pipelines and pipeline rules (filter, rewrite, forward, stream, SIEM, and code rule types); managing forwarders, alert destinations, source extensions, and replay configurations. The server includes confirmation prompts before destructive actions and supports intent-based tool subsetting so that AI clients only surface the tools relevant to a given task.

AI Provider Support: The AI layer now supports multiple providers, including Anthropic Claude and OpenAI, with a streaming agent loop, prompt caching, and token cost estimation built in.

AI-Assisted Create: Create forms across Flow can now be prefilled with AI-generated context. This covers pipelines, forwarders, alert destinations, source extensions, and replay configurations, reducing the manual work involved in setting up new resources.

Savings Indicator: The pipeline savings indicator, which shows how much data cost reduction active pipelines are delivering, is now enabled by default for all customers. The toggle in Admin Settings remains available for manual control.

#### **Improvements**

Pipeline Builder: The pipeline configuration UI has been streamlined. The deprecated pipeline flow diagram (middle visualization panel) has been removed, leaving a cleaner two-panel layout. The pipeline preview now offers a toggle between side-by-side and unified (GitHub-style) diff views. Required-field validation has been improved: Validation now runs only on Save (not on tab switch), error messages correctly identify the empty field by name, and all per-rule errors are surfaced in a single consolidated banner rather than stacking individual toasts.

Security Updates: A broad set of dependencies have been updated to address known security vulnerabilities, covering authentication, containerization, observability tooling, and API handling components.

Datadog Forwarder: The Datadog forwarder now uses a configurable region rather than a hardcoded value.

Rate Limiting: Rate limiting reliability has been improved under high-load conditions, including timeout behavior and more efficient memory handling for rejected requests.

Memory Management: The ingest service now automatically configures a memory limit based on the available container resources, helping prevent out-of-memory conditions under heavy ingest load.

Platform Stability: The ingest service now recovers automatically from a corrupted local backup state rather than entering a crash loop on startup.

Agent Forward Buffer: ForwardBuffer performance has been improved, reducing memory usage and garbage collection pressure during high-throughput forwarding.

Alert types can be changed while editing, queries require a name before saving, and the byte stat field populates correctly when saving a forward rule.

Deleting a destination mapping stops data forwarding as expected.

Metrics generated by pipeline aggregate rules are visible in the query builder for all users, not just system or admin accounts.

The calendar and date-time picker, tag editing, and pipeline rule metrics all work as expected.

Group creation, SAML group audit logging, audit trail pagination, and the SAML group delete confirmation all work correctly, including in dark mode.

Pipeline statistics persist correctly when a dataflow is removed from a pipeline, and destination information for dataflow attachments displays correctly in the Pipelines view.

Reviewing a second AI-generated pipeline suggestion won't overwrite a previously saved one, and adding or reordering rules correctly triggers a pipeline preview refresh.

## **Observe**

Observe gets its own Venn integration, plus a big round of Data Explorer and dashboard cleanup.

#### **New Features**

Venn AI Assistant: An AI assistant (Venn) is now integrated into the Observe interface with a persistent side panel, conversation history, and streaming responses. Drawing on the platform's MCP server, Venn can answer questions, run log queries, manage data sources, dashboards, queries, alerts, SLOs, and forwarders, and surface contextual information directly within the UI. Documentation and how-to questions are now handled through Venn, and the standalone navbar AI search button has been removed.

AI-Assisted Create: Create forms for alerts, queries, data sources, and Data Explorer widgets can now be prefilled from AI context through Venn.

#### **Improvements**

Data Explorer and Dashboards: A comprehensive set of improvements has been made to the Data Explorer and dashboard system:

Widget configuration and dashboard state are now managed through a unified centralized schema.

Dashboard import has been consolidated, and the legacy import path has been removed.

Multiple alerts per widget are now supported without requiring duplicate queries.

Newly created widgets correctly inherit the dashboard's selected time range.

Visualization configuration is now stored in the correct location (dashboard schema rather than query definition).

Parameterized query support has been revamped for greater flexibility.

Preview mode no longer persists query entries when adding new widgets.

Bulk query updates are now supported across widgets in a dashboard.

The algorithm section is visible in both Data Explorer and Dashboard views.

A time range picker tooltip shows the selected time range on hover.

A performance regression that triggered redundant API calls on tab switch has been resolved.

Dashboards can be imported while in Data Explorer preview mode.

Several layout and styling inconsistencies across the editor have been resolved.

Venn AI Assistant: Venn follow-up suggestions now appear as numbered clickable buttons at the end of each response, letting users continue a conversation with one tap rather than retyping. The AI pipeline assistant has been improved: Directed rule requests (where the user names the specific field or change) no longer trigger unnecessary log sampling, and a duplicate-rule issue on create and edit has been fixed.

SLO Performance: SLO stats hydration queries are now batched, reducing the number of API calls when loading SLO data and improving load time on pages with many SLOs.

Access and Policy Management: Admins can now configure idle session timeout and maximum login attempt limits from the UI. The policy management page now explains wildcard usage per resource and includes a select-all option when searching for resources. Expired API keys are now visible in the key management view. Admins can now create API keys on behalf of other users. Roles and groups now have full authorization enforcement.

Audit Trail: Audit trail pagination works correctly. SAML group addition and removal events are now captured accurately in audit logs.

Security: Exception detail is no longer exposed in API error responses, in line with security scanning recommendations.

SLO Labeling: “Slos” has been corrected to “SLOs” throughout the product UI.

Forwarders: The Integrations page now opens to the Forwarders tab by default rather than the Forwarder Mapping tab.

Synthetic monitoring dashboards, check results, and the alerts page all load and update reliably.

Deleting a source extension, sharing dashboards with query results, removing a policy, and viewing role member pages all work as expected.

API requests return accurate error codes when backend services are temporarily unavailable.

Dark mode fully supports Compare Fields in the Alive view, the queries UI, and the SAML group delete popup.

Data Explorer widget layout, Edit Mode state, visualization configuration storage, and query timestamp fields for check data sources all behave correctly, along with a range of additional rendering and persistence improvements.

The License settings page shows the option to upload a license when no license data is present.

Scheduled queries refresh automatically at the configured interval.

## **Vanguard**

Vanguard's headline this release: Synthetic monitoring extends into agentic AI workflows, alert routing gets a lot more organized, and check management picks up a long list of quality-of-life upgrades.

#### **New Features**

Synthetic Monitoring for AI Workflows: Synthetic monitoring checks for agentic AI workflows let you verify AI process outputs and detect drift, hallucinations, and performance regressions, using existing Vanguard checks and the advanced scripting engine. Diagnosis and key metrics are displayed on the check result analysis page.

Alert Destination Teams: Alert destination teams can now be created, viewed, and edited directly in Vanguard. A new Teams tab has been added to the Alert Destinations dashboard, letting you group multiple alert destinations (email, SMS, webhook, etc.) under a single team for easier alert routing and management.

Monthly Graph Reports for Browser Checks: Monthly graph reports are now available for browser checks, with scenarios including step-level information. Report scheduling and delivery now correctly handle timezones.

Check View Customization | Save View Layout: You can now save your preferred check view layout (Split View, Group View) along with Status Color and Auto-refresh settings.

Tag Filtering Across Check Views: A tag filter has been added to the Group View, Split View, and Manage Check pages, so you can filter checks by tag across all major views.

Check Description & Tags in Analysis Page: The Check Details and Analysis pages now display the check description and tags in the Overview section when available, for better context at-a-glance.

Check Management: The check management interface has received several quality-of-life improvements, a fix for navigation state issues when using the browser back button from check details; check Location now shows properly formatted location names instead of raw location codes; confirmation popups before assigning or unassigning checks and users; the Assign/Unassign button is disabled when no checks are selected; and inclusion/exclusion settings in check scheduling now show accurate values without duplicates.

Check Analytics: Drag-and-rearrange of monitor groups now persists across page reloads after saving.

Browser Check Settings: A screen resolution dropdown is now available in browser behavior settings. Custom headers no longer allow saving multiple empty rows. Browser check creation now pre-populates the Ignore File Types field with default values. Custom headers in browser settings now only allow one empty block at a time, consistent with Block URLs behavior. Block URLs are now correctly displayed when editing browser checks in Ascent.

Zebratester Checks: The configured result unit is now shown in the check results table. Checks now correctly capture all advanced setting attributes (Collect Ticks, Additional URL Sampling Options, Verify DNS, and Result Unit). The specific URL that triggered an error in a ZT check is now identified in results rather than reporting generically.

SSL Checks: The SSL Verification Type dropdown is now disabled in edit mode, to prevent accidental type changes.

Mobile Checks: The Monitoring Type selector is now disabled in edit mode, to prevent incompatible type switches.

Severity Thresholds: Severity threshold percentage calculation now matches between the Ascent UI and the API, resolving a long-standing discrepancy.

Private Locations: Several issues with private location handling have been resolved, including how unavailable locations are displayed, how location identifiers appear in the UI, and the behavior of the agent refresh button. Repository profiles no longer show deleted private locations.

#### **Improvements**

Subscription Reports: The report format date picker no longer allows selection of the current date, month, or year. A group filter has been added to the Select Check step. The ad-hoc report date picker now properly resets when switching between Day/Week/Month frequencies.

Several navigation and redirect issues in check management have been fixed: The check details page no longer redirects to unrelated views, tab navigation within check reports (Details, Aggregator) works correctly, and the transition from check creation to the results graph is smooth. Report tabs no longer disappear on page reload, and the tab name no longer disappears when navigating from check edit back to details via the browser back button.

Check results: Opening a result no longer opens a phantom second result alongside it, and response body content is correctly visible.

Dark mode: Check rows are visible when status color coding is active, and the subscription report tags column is readable.

Private location repositories no longer show locations that have been deleted. Duplicate API requests on the Repository Settings page have been eliminated.

Several additional check management issues have been resolved: The Update button in the scenario editor is correctly disabled until a file is attached, cloning a check with an unavailable location no longer leaves a blank page, sorting in list view works across all pages, and the assign users workflow has been fixed.

Threshold values changed through the API now sync correctly to the Ascent UI.

Fixed severity threshold percentage calculation rounding errors when saving checks multiple times.

Split view works correctly for read-only users.

Tag creation was failing with an error; this has been fixed. Policies can now be edited and saved without error.

Fixed an issue where URL errors were not highlighted in the waterfall graph for ZebraTester checks with certain error types.

## **Fleet**

Fleet rounds out the release with MCP tooling, bulk agent management, and a token-security tightening.

#### **New Features**

MCP Tools for Fleet: AI tools are now available for managing Fleet agents and configurations, including creating, reading, updating, and deleting agents and agent configurations, triggering agent actions, and reading and assigning packages to agents through the MCP interface.

Bulk Agent Configuration Assignment: Configurations can now be assigned to multiple agents at once using bulk selection, eliminating the need to update agents one at a time.

AI-Assisted Create: The Fleet agent creation form can now be prefilled from AI-generated context through Venn.

#### **Improvements**

Agent filter options now update dynamically based on which filters are currently applied, making it easier to narrow down large agent lists.

The agent detail view now clearly shows which configuration is currently assigned to each agent.

The Repository Management page in Admin Settings loads correctly.

Deleting a policy completes without error.

We've tightened authorization checks around API token creation: non-admin users can only create tokens for themselves, while admins retain the ability to create tokens on behalf of other users.

***

## Component Versions 3.0.1

| Component                              | Version                                         |
| -------------------------------------- | ----------------------------------------------- |
| Flash                                  | v4.0.1                                          |
| Coffee                                 | v4.0.1                                          |
| ASM                                    | 13.40.2                                         |
| NG Private Agent                       | 1.0.9                                           |
| Check Execution Container: Browser     | fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0 |
| Check Execution Container: Zebratester | zt-7.5a-p0-r-2025.04.02-0-base-1.2.0            |
| Check Execution Container: Runbin      | runbin-2025.04.17-0-base-2.2.1                  |
| Check Execution Container: Postman     | postman-2025.04.17-0-base-1.4.1                 |
| Bnet (Chrome Version)                  | 10.2.2 (Chrome 130)                             |
| Zebratester                            | 7.5A                                            |
| ALT                                    | 6.13.3.240                                      |
| IronDB                                 | 1.5.1                                           |
