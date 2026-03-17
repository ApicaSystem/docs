---
description: >-
  A Gauge chart displays a single metric as a percentage of capacity using a
  dial. Use it to see how close you are to a limit.
---

# Gauge

A Gauge chart displays a single numeric metric as a percentage of capacity using a speedometer-style dial. It is used to show how close a system is to its limit or threshold.

It’s ideal for:

* Ingest capacity
* CPU utilization
* Disk usage
* License consumption
* Queue utilization

### What a Gauge represents

The Gauge shows the current value as a percentage of the maximum.

The arc is divided into colored zones:

* **Green**: OK
* **Yellow**: Warning
* **Red**: Critical



<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-10 08-54-55.png" alt="Example Gauge showing utilization percent and colored zones"><figcaption><p>Example Gauge chart</p></figcaption></figure>

### Configure a Gauge chart

Set **Chart type** to **Gauge**. Configure threshold values for the OK/Warning/Critical zones.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-10 08-55-39.png" alt="Gauge chart settings showing OK, Warning, and Critical thresholds"><figcaption><p>Gauge configuration</p></figcaption></figure>

### Gauge configuration options

| Option             | Purpose                               |
| ------------------ | ------------------------------------- |
| Chart type         | Must be **Gauge**.                    |
| OK threshold       | Upper limit for the green zone.       |
| Warning threshold  | Upper limit for the yellow zone.      |
| Critical threshold | Maximum value (red zone upper limit). |

{% hint style="info" %}
Key rules:

* Gauge uses one numeric value.
* Value is compared to the **Critical threshold** (max).
* Thresholds define the color zones.
* Built for capacity/utilization monitoring.
{% endhint %}

### What this chart tells you

You can quickly see:

* How full the system is
* Whether it’s safe, risky, or critical
* How close it is to capacity

### When to use Gauge

Use Gauge when you are measuring:

* Utilization
* Capacity
* Limits
* Quotas
* Saturation

It’s perfect for ingest usage, disk %, CPU %, license %, and queue fill level.
