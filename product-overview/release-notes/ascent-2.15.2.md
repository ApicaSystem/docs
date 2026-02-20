# Ascent 2.15.2

### Flow

#### Grafana forwarder

* You can now forward filtered data from Apica Flow into Grafana Loki

#### Ingest and telemetry

* OTEL formatted data now stays in the format you send it in, so events are not altered after ingest inside Ascent.
* The ingest actuator no longer shows a false message that ingest is being disabled when it actually is not, so the status you see now matches what the system is doing.

#### Logs & Insights

* In the Logs and Insights > pipeline tab, the three dots action menu in the pipeline box is fixed, so you can use those actions as intended.

***

### Ascent Synthetics

#### Checks and Scenarios

* Search and filter operations in Manage Checks now return correct results and apply filters reliably.
* The scenario debug button now works as expected, allowing user to test scenarios while creating the browser check.
* Legacy private locations are now displayed correctly during check management.

***

### Observe

#### Dashboards and explorer

* The pipeline dashboard now loads correctly so you can view pipeline related metrics without the page failing to render.
* On shared public dashboards, the Edit query button has been removed, so public viewers cannot modify underlying queries.
* Dashboard headers on public dashboards now work correctly, so sorting and interactions on those headers behave like they do on regular dashboards.
* After fixes to the public dashboard page, the main explorer page no longer crashes; you can move between public dashboards and explorer without breaking the session.

#### Search and audit

* Search has been adjusted so that it returns more accurate results, improving how you find data in Observe.

***

### Component Version 2.15.2

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.20.2</td></tr><tr><td>Coffee</td><td>v3.21.2</td></tr><tr><td>ASM</td><td>13.39.1</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.2 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.5A</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.1</td></tr></tbody></table>

