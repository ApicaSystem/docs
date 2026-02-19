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

#### Ingest and checks

* The ASM+ ingest processor now keeps consuming traces reliably instead of occasionally stopping, which avoids silent gaps in synthetic trace data.
* ASM checks no longer cancel their context right after the first successful request when more work is pending, so checks complete properly and results are more accurate.

#### Locations and scenarios

* Search and filtering for locations inside a check now returns the right results, which makes it easier to select and manage locations.
* The location API for the Etrade environment now behaves as expected, so location data from that environment is returned correctly.
* In the create browser flow, clicking the Scenario debug button now works in create mode instead of doing nothing.

***

### Observe

#### Dashboards and explorer

* The pipeline dashboard now loads correctly so you can view pipeline related metrics without the page failing to render.
* On shared public dashboards, the Edit query button has been removed, so public viewers cannot modify underlying queries.
* Dashboard headers on public dashboards now work correctly, so sorting and interactions on those headers behave like they do on regular dashboards.
* After fixes to the public dashboard page, the main explorer page no longer crashes; you can move between public dashboards and explorer without breaking the session.

#### Search and audit

* Search has been adjusted so that it returns more accurate results, improving how you find data in Observe.
* Long polling in the audit trail now works correctly across multiple pods, which makes audit log retrieval more reliable in larger clusters.

