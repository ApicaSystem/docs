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

