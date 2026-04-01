---
description: Service Level Objectives
---

# SLO

An SLO is a measurable reliability target for a service.

SLOs give teams a shared reliability target. They also show when reliability is degrading before users are heavily impacted.

```
SLO = SLI measured over a time window must meet a target percentage
```

Example:

`99.9% of HTTP requests to the payment service must succeed over a 28-day rolling window.`

Related pages:

* [Create SLO](create-slo.md)
* [SLO Dashboard](slo-dashboard.md)

#### Key concepts

**#**. **SLI**

An **SLI** is the metric that measures service behaviour.

In this implementation, the SLI is a ratio:

```
SLI = (Good Events / Total Events) × 100%
```

Use these terms when defining an SLI:

* **Good Events**: requests or events that met the quality bar
* **Total Events**: all requests or events attempted
* **SLI Ratio**: the percentage of good events

Typical example:

* Good Events: HTTP `2xx` responses
* Total Events: all HTTP requests
* SLI Ratio: `99.95%`

The Ascent platform supports query mode:

* **Ratio mode**: select a success metric and a total metric separately

**#**. **SLO**

An **SLO** is the target for the SLI. It is measured over a rolling time window.

Default values:

* **Target percentage**: `99.9%`
* **Time window**: `28d`

Supported examples:

`2h`, `24h`, `7d`, `28d`, `30d`, `90d`

An SLO is met when:

```
SLI ≥ Target Percentage over the entire time window
```

**#**. **Error budget**

The **error budget** is the allowed amount of unreliability.

It is calculated as:

```
Error Budget = 100% − Target Percentage
```

Examples:

* `99.9%` target → `0.1%` error budget
* `99.5%` target → `0.5%` error budget
* `99.0%` target → `1.0%` error budget
* `95.0%` target → `5.0%` error budget

For a `28d` window:

* `99.9%` target allows about `40 minutes` of downtime
* `99.5%` target allows about `3.4 hours` of downtime
* `99.0%` target allows about `6.7 hours` of downtime

{% hint style="info" %}
The error budget is shown live in the target step. It updates automatically when the target percentage changes.
{% endhint %}

**#**. **Error budget remaining**

**Error budget remaining** shows how much budget is still available in the current SLO window.

The progress bar uses these states:

* More than `50%` remaining: healthy
* `10%` to `50%` remaining: warning
* Less than `10%` remaining: critical

When the remaining budget reaches `0%`, the SLO is violated.

**#**. **Burn rate**

**Burn rate** shows how fast the service is consuming its error budget.

```
Burn Rate = Current Error Rate / Error Budget Rate
```

Examples:

* `1×`: using budget at the expected pace
* `2×`: using budget twice as fast
* `14×`: using budget fast enough to exhaust it in about 2 days for a `28d` window

Burn rate matters because a service can still look acceptable at a glance while burning through its budget too quickly.
