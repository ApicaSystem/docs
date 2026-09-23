# PathSolutions TotalView

Ingest network root-cause and performance data from PathSolutions TotalView into Apica Ascent using TotalView's documented JSON API v2.0.

{% hint style="warning" %}
**Status:** This page documents the TotalView JSON API integration surface and the target ingestion design for Apica Ascent. As of September 2026, ingestion uses Ascent's standard REST/JSON polling extension pattern — the same mechanism used by the SNMP and IBM QRadar extensions — rather than a dedicated, pre-built "PathSolutions TotalView" plugin, which has not yet shipped. Treat the configuration steps below as the target workflow and confirm exact field labels against the released extension before publishing this page to customers.
{% endhint %}

### Overview

PathSolutions TotalView is an on-premises network performance monitoring platform that polls SNMP and NetFlow data from switches, routers, firewalls, and VoIP/UC infrastructure, and runs it through a heuristics engine that turns raw counters into plain-English root-cause diagnostics. TotalView exposes this data — device and interface health, path-level root-cause mapping, VoIP call quality (MOS), NetFlow, SD-WAN, and more — through a RESTful JSON API (v2.0).

Apica Ascent connects to a customer's TotalView server over this API to pull network-layer health, utilization, and root-cause data alongside Apica's own synthetic, RUM, and infrastructure telemetry. This is the foundation of the joint Apica + PathSolutions correlation use case: an Apica Vanguard synthetic check failure triggers an on-demand pull against TotalView's API to attach the network-layer root cause to the same incident, without continuously polling every monitored path.

**This integration is a good fit when:**

* The customer runs PathSolutions TotalView on-premises or in an air-gapped network segment and wants its network root-cause data available in Apica Ascent alongside application and infrastructure telemetry.
* Apica Vanguard synthetic or RUM checks need to be automatically correlated with the underlying network path's health at the moment a check fails.
* Network operations wants TotalView's issue, Top 10, and VoIP/MOS reporting queryable and dashboarded inside Ascent.

### Prerequisites

* A TotalView server (v8 or later) reachable from Apica Ascent (or from the Apica Flow instance performing the pull) over HTTP or HTTPS.
* TotalView's JSON API v2.0 enabled on that server.
* A TotalView user account (local or Active Directory) with permission to view the pages/data being polled. The API uses the same credentials and access scope as the TotalView web UI.
* The TotalView server's hostname or IP address and port.
* Network access from the Ascent ingestion point to the TotalView server — if TotalView sits in an air-gapped or firewalled segment, an Apica Flow node with reachability to that segment should perform the polling (see Recommended ingestion pattern below).

### Authentication

TotalView's API uses session-based authentication. Log in once, capture the session cookie, and reuse it for subsequent GET requests until it expires.

**1. Log in and obtain a session:**

```
POST https://<totalview-server>/api/login.json
```

Request body:

```json
{
  "user": "admin",
  "pass": "<password>"
}
```

Use the TotalView username in `user`. If Active Directory authentication is enabled on the server, use the AD credentials in `user`/`pass` instead of a local account.

A successful login returns:

```json
{
  "redirect": "Dashboard.html"
}
```

and sets a `SessionId` cookie. Include this cookie on every subsequent GET request.

{% hint style="info" %}
**Session lifetime:** Assume the `SessionId` expires after 30 minutes of inactivity, or immediately if the TotalView server restarts. The polling extension should detect a failed/unauthorized GET and transparently re-authenticate rather than surfacing the failure.
{% endhint %}

**2. Query data:**

```
GET http://<totalview-server>:<port>/api/<Endpoint>.json[?<query-string>]
```

All fetches are relative, so requests work correctly if the TotalView server sits behind a URL proxy. Responses are standards-based JSON ([json.org](https://www.json.org/)).

### Connecting PathSolutions TotalView to Apica Ascent

1. Navigate to the **Integrations** page in Apica Ascent and click **New Plugin**.
2. Select the PathSolutions TotalView (REST/JSON polling) extension and provide a plugin name.
3. Enter the TotalView server's hostname/IP and port.
4. Provide the TotalView credentials (local account or AD) used for the `login.json` call.
5. Set the polling interval. TotalView's own poll frequency is typically 5 minutes (`PollFrequency` in `NetStat.json`); polling Ascent's extension faster than the source data refreshes adds load without adding new data.
6. Select which endpoints/data categories to ingest (see Data available for ingestion below) — most deployments start with Dashboard/Health, Issues, Devices/Interfaces, and MOS, and add Top 10, NetFlow, SD-WAN, or Cloud as needed.
7. Configure resource requirements and complete the ingest configuration.

_\[Screenshot: Integrations → New Plugin]_ _\[Screenshot: PathSolutions TotalView plugin configuration — host/port, credentials, polling interval, endpoint selection]_

After the plugin is created, TotalView data will begin flowing into Apica Ascent on the configured interval, tagged by device, interface, and group so it can be filtered and correlated alongside other telemetry sources.

### Data available for ingestion

TotalView's API surfaces roughly 65 distinct endpoints, grouped below by category. Most accept optional query-string parameters (`d` = device number, `i` = interface number, `t` = graph type or timeslot modifier, `GroupName` = interface group) to scope the response to a specific device, interface, or group rather than returning the entire network.

#### Network health & dashboard

| Endpoint                                               | Description                                                                                                              |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------ |
| `NetStat.json`                                         | General network state: last poll time, overall health, poll frequency, page/footer metadata. Fetched on every page load. |
| `DashboardHealth.json`                                 | Overall network health percentage                                                                                        |
| `DashboardManufacturers.json`                          | Equipment manufacturers seen on the network                                                                              |
| `DashboardSpeed.json`                                  | Interface speed distribution                                                                                             |
| `DashboardDuplex.json`                                 | Interface duplex distribution                                                                                            |
| `DashboardHED.json`                                    | Overall error summary                                                                                                    |
| `DashboardHUD.json`                                    | Overall utilization summary                                                                                              |
| `DashboardHID.json`                                    | Overall issues summary                                                                                                   |
| `DashboardHPD.json`                                    | Overall port usage summary                                                                                               |
| `DashboardDevicesList.json?t={cpu\|ram\|mos\|intUtil}` | Devices with the specified graph type available                                                                          |
| `DashboardCPU.json?d={device}`                         | CPU utilization for a device                                                                                             |
| `DashboardRAM.json?d={device}`                         | Free RAM for a device                                                                                                    |
| `DashboardMOS.json?d={device}`                         | MOS (call quality) score for a device                                                                                    |
| `DashboardInterfacesList.json?d={device}`              | Interfaces available for a device                                                                                        |
| `DashboardIntUtil.json?d={device}&i={interface}`       | Utilization for a specific interface                                                                                     |
| `NLT.json?q={question}`                                | Natural-language query against TotalView's NLT processor (e.g. "is the internet up?")                                    |

#### Devices & interfaces

| Endpoint                                                 | Description                                                       |
| -------------------------------------------------------- | ----------------------------------------------------------------- |
| `Devices.json[?d={device}[&i={interface}]]`              | List monitored devices, or detail for a specific device/interface |
| `DevicesGraphData.json?d={device}[&i={interface}][&t=h]` | Current or historic (`t=h`) graph data for a device/interface     |
| `DevicesCurrent.json?d={device}&i={interface}`           | Current utilization snapshot for an interface                     |
| `DevicesDNSLookup.json?ip={ip}`                          | Reverse DNS lookup for an IP address                              |
| `favorites.json`                                         | Interfaces pinned to the Favorites tab                            |

#### Path & topology mapping (root-cause tracing)

| Endpoint                              | Description                                                                                     |
| ------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `Path.json`                           | Path map last-updated date/time                                                                 |
| `PathMap.json?t=fh&ipa={ip}&ipb={ip}` | Forward path map between two IP endpoints — the core root-cause tracing call                    |
| `PathGraphData.json?{interface list}` | Path graph data for a set of specified interfaces                                               |
| `Map.json`                            | Map name listing                                                                                |
| `MapConfig.json?tab={n}`              | Map configuration for a given map tab                                                           |
| `MapCurrent.json?tab={n}`             | Map utilization info for a given map tab                                                        |
| `diagramLayer3.json`                  | Layer-3 network diagram data — devices, links, and subnets, with each device/link's live status |

#### Groups & issues

| Endpoint                                           | Description                                                                             |
| -------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `Gremlins.json[?GroupName={group}][&timeslot={n}]` | Interface-group polling history; `timeslot` steps back N polls for trend/rollback views |
| `Issues.json[?GroupName={group}]`                  | Current network issues, optionally scoped to an interface group                         |

#### NetFlow

| Endpoint                                                             | Description                                       |
| -------------------------------------------------------------------- | ------------------------------------------------- |
| `Netflow.json`                                                       | Interfaces configured for NetFlow                 |
| `NetflowGraphData.json?{interface list}`                             | NetFlow interface graph data                      |
| `NetflowFlows.json?d={device}&i={interface}&f={tx\|rx}&t={timeslot}` | Flow-level detail for a device/interface/timeslot |

#### Top 10 reports

| Endpoint                                                            | Description                                         |
| ------------------------------------------------------------------- | --------------------------------------------------- |
| `Top10Error.json[?GroupName={group}&scope={peak daily\|last poll}]` | Top 10 interfaces by error rate                     |
| `Top10TxPct.json` / `Top10RxPct.json`                               | Top 10 transmitters / receivers by utilization      |
| `Top10Latency.json` / `Top10Jitter.json` / `Top10Loss.json`         | Top 10 interfaces by latency / jitter / packet loss |

#### WAN & SD-WAN

| Endpoint                             | Description                                                                                   |
| ------------------------------------ | --------------------------------------------------------------------------------------------- |
| `WAN.json`                           | WAN interface listing                                                                         |
| `WanGraphData.json?{interface list}` | WAN graph data                                                                                |
| `sdwan.json`                         | SD-WAN interface listing (per-path address, latency, hop-by-hop route, online/reached status) |
| `sdwangraphdata.json?{query}`        | SD-WAN graph data                                                                             |

#### Interface filters

| Endpoint                                                                     | Description                                      |
| ---------------------------------------------------------------------------- | ------------------------------------------------ |
| `InterfacesHalfDuplex.json`                                                  | Half-duplex interfaces                           |
| `InterfacesTrunks.json`                                                      | Trunk ports                                      |
| `InterfacesUnknownProto.json`                                                | Interfaces with unrecognized protocols           |
| `Interfaces{Sub10Meg\|10Meg\|100Meg\|1Gig\|10Gig\|100Gig\|Above100Gig}.json` | Interfaces filtered by speed tier                |
| `InterfacesOperDown.json` / `InterfacesAdminDown.json`                       | Operationally / administratively down interfaces |

#### Tools & lookups

| Endpoint                     | Description                                                        |
| ---------------------------- | ------------------------------------------------------------------ |
| `Tools.json`                 | Tools page update status                                           |
| `ToolsIPtoMAC.json?q={ip}`   | ARP lookup (IP → MAC address)                                      |
| `ToolsMACtoInt.json?q={mac}` | MAC address → switch interface lookup                              |
| `ToolsMACtoIP.json?q={mac}`  | MAC address → IP lookup (reverse ARP)                              |
| `ToolsSubnets.json`          | Subnets in use, with device counts                                 |
| `ToolsVLAN.json`             | Devices with VLAN assignments                                      |
| `search.json?q={query}`      | General search across devices/interfaces                           |
| `update.json`                | Trigger/status of a refresh of bridge, ARP, and routing table data |

#### VoIP, MOS & QoS

| Endpoint                             | Description                                                               |
| ------------------------------------ | ------------------------------------------------------------------------- |
| `Phones.json`                        | Monitored VoIP phones                                                     |
| `MOS.json`                           | Devices on the MOS (Mean Opinion Score) tab                               |
| `MOSGraphData.json?{device list}`    | MOS graph data                                                            |
| `qos.json`                           | Interfaces with QoS configured                                            |
| `qosgraphdata.json?{interface list}` | QoS utilization graph data                                                |
| `siptrunks.json`                     | Configured SIP trunks (address, hop path, latency, online/reached status) |
| `siptrunksgraphdata.json?{query}`    | SIP trunk graph data                                                      |
| `VoIPTools.json`                     | VoIP Tools page status                                                    |
| `VoIPToolsWhereConn.json?q={ip}`     | Locate where a VoIP endpoint is physically connected                      |

#### Cloud, Internet & predictive indicators

| Endpoint                      | Description                                |
| ----------------------------- | ------------------------------------------ |
| `cloud.json`                  | Monitored cloud services                   |
| `CloudGraphData.json?{query}` | Cloud service graph data                   |
| `Internet.json`               | Internet connectivity stats                |
| `PredictorsCabling.json`      | Cabling-fault predictive indicators        |
| `PredictorsBandwidth.json`    | Bandwidth-exhaustion predictive indicators |

### Example response formats

**`DevicesCurrent.json?d=0&i=1`** — current utilization snapshot for a single interface:

```json
{
  "currBitsRx": 0,
  "currBitsTx": 0,
  "currUtilRx": 0,
  "currUtilTx": 0,
  "dev": 0,
  "devIp": "10.0.0.7",
  "devName": "hqpa500",
  "int": 1,
  "intDescr": "dedicated-ha1: dedicated-ha1",
  "intName": "Int #1",
  "intSpeed": "-Unknown-",
  "nextDev": "d=1&i=1",
  "nextInt": "d=0&i=2",
  "valid": true
}
```

**`diagramLayer3.json`** — Layer-3 topology (devices, links, subnets), useful for rendering or cross-referencing network topology in Ascent:

```json
{
  "devices": [
    {
      "image": "Graphics/Firewall.png",
      "ipAddress": "10.86.0.2",
      "location": "Santa Clara HQ",
      "manufacturer": "Ubiquiti Networks",
      "model": "",
      "name": "hqfw1",
      "softwareOS": "",
      "url": "Devices.html?d=1"
    }
  ],
  "links": [
    {
      "LastChanged": "29 days 12:21:04.55",
      "MTU": 1500,
      "bandwidth": 1000000000,
      "errors": 0,
      "intDescription": "eth0: eth0 (Internet)",
      "intNum": 6,
      "ipAddress": "104.8.32.105",
      "source": "hqfw1",
      "target": "Cloud-104.8.32.104",
      "url": "Devices.html?d=1&i=6"
    }
  ],
  "subnets": [
    { "image": "Graphics/cloud.png", "mask": "255.255.255.0", "name": "Cloud-10.86.0.0", "subnet": "10.86.0.0" }
  ]
}
```

**`Top10Error.json`** — Top 10 interfaces by error rate, with group/scope filters and inline device links:

```json
{
  "table": [
    [
      { "hint": "24-Port Gigabit L2 Managed PoE Switch with 4 Combo SFP Slots", "href": "Devices.html?d=21", "value": "Bardolino" },
      "10.0.0.47",
      "..."
    ]
  ],
  "title": "Top 10 Interfaces With Highest Daily Error Rates Sorted by Error Rate"
}
```

`Issues.json`, `PathMap.json`, and `MOS.json` follow the same object/array response pattern documented above — see the full TotalView JSON API v2.0 reference (PDF, provided by PathSolutions) for their complete field-level schemas before building ingestion mappings for those three.

### Recommended ingestion pattern

* **On-demand root-cause pulls, not continuous polling of every path.** The primary Apica + PathSolutions use case triggers a `PathMap.json` / `Issues.json` / `MOS.json` pull from Apica Flow when an Apica Vanguard synthetic or RUM check fails, rather than continuously polling every monitored path. This keeps TotalView API load proportional to actual incident volume.
* **Separate, lighter continuous polling for dashboard/health data.** `NetStat.json`, `DashboardHealth.json`, and the Top 10 endpoints are cheap, network-wide summaries well suited to a standing poll on TotalView's own refresh cadence (\~5 minutes).
* **Poll from inside the network boundary when TotalView is air-gapped.** If the TotalView server sits in an isolated or on-prem-only segment, run the polling extension on an Apica Flow node with reachability to that segment, rather than expecting Apica Ascent to reach it directly.
* **Re-authenticate transparently.** Treat a 401/redirect-to-login response as a signal to re-POST `login.json` and retry, rather than as a hard failure — the 30-minute session lifetime and restart-triggered expiry mean this will happen routinely during normal operation.

### Related Apica Ascent use cases

This API is the data source behind the joint Apica + PathSolutions "app-vs-network blame game" correlation use case: PathSolutions TotalView supplies on-premises, SNMP/NetFlow-based network root cause; Apica Vanguard supplies synthetic and RUM-based application-layer detection; Apica Flow binds the two by transaction/path context into a single correlated incident routed to the customer's ITSM tool. See the internal reference architecture and POC kickoff materials for the full integration design.

### See Also

* SNMP
* IBM QRadar
* Network Packets
