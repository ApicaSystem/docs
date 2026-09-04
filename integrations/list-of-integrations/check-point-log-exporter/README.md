# Check Point Log Exporter

## Overview

This guide covers how to forward security logs from a Check Point Gaia management server to Apica Ascent using `cp_log_export`. Once configured, Check Point blade events (firewall, VPN, admin activity, threat detections) will appear as a live log source in Apica Ascent.

***

## Step 1 — Enable Ports in Apica Ascent

Before configuring Check Point, ensure the required ingestion ports are enabled in your Apica environment.

Navigate to **Admin → Port Management** in Apica Ascent, or refer to the [Apica Port Management documentation](https://docs.apica.io/admin/port-management).

Enable the following ports:

| Port | Protocol | Description               |
| ---- | -------- | ------------------------- |
| 515  | TCP      | CEF (Common Event Format) |
| 7515 | TCP      | CEF TLS (encrypted)       |

{% hint style="info" %}
The Apica collector IP address is not publicly listed. Contact Apica Support at **support@apica.io** to obtain the collector IP for your environment.
{% endhint %}

## Step 2 — Configure the Log Exporter on Gaia

{% stepper %}
{% step %}
### Access the Gaia Management Server

Connect to the Check Point management server via SSH or console:

```bash
ssh admin@<management-server-ip>
```
{% endstep %}

{% step %}
### Enter Expert Mode

```bash
expert
```

Enter the expert password when prompted.
{% endstep %}

{% step %}
### Create the Apica Log Exporter

Replace `<apica-collector-ip>` with the IP provided by Apica Support:

```bash
cp_log_export add name apica \
  target-server <apica-collector-ip> \
  target-port 515 \
  protocol tcp \
  format cef

cp_log_export start name apica
```
{% endstep %}

{% step %}
### Verify the Exporter is Running

```bash
cp_log_export show name apica
```

Confirm the output shows:

* `enabled: true`
* `target-server: <apica-collector-ip>`
* `target-port: 515`
* `protocol: tcp`
* `format: cef`
{% endstep %}
{% endstepper %}

## Step 3 — Verify Logs in Apica Ascent

Trigger log activity on the Gaia management server by performing one of the following:

* Log into the **Gaia Portal** (web UI) — appears in Apica as source `Check Point:Gaia Portal`
* Open an **SSH/console session** to the management server — appears as `Check Point:Console`
* Any **firewall, VPN, or admin** event processed by the management server

Check Apica Ascent for incoming log entries from the Check Point source. Each login or admin action should produce a visible log entry with populated fields.

{% hint style="info" %}
`cp_log_export` ships Check Point blade logs (firewall hits, VPN events, admin actions, threat detections) from the management server's log database. It does not forward generic OS syslog — those require separate configuration under **System Management → System Logging → Remote System Logging** in the Gaia Portal.
{% endhint %}



## Troubleshooting

<details>

<summary>No logs appearing in Apica</summary>

* Verify connectivity: `tcpdump -i any tcp port 515 -n` on the Ubuntu host and confirm packets flow from `192.168.122.10` through to the external interface
* Check the exporter log: `tail -50 /opt/CPrt-R81/log_exporter/targets/apica/logs/apica.log`
* Confirm the exporter is running: `cp_log_export show name apica`

</details>

<details>

<summary>Reconfigure the exporter</summary>

```bash
cp_log_export set name apica target-port 515
cp_log_export set name apica format cef
cp_log_export restart name apica
```

</details>
