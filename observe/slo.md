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

### Key concepts

#### SLI

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

The platform supports one query mode:

* **Ratio mode**: select a success metric and a total metric separately

#### SLO

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

#### Error budget

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

#### Error budget remaining

**Error budget remaining** shows how much budget is still available in the current SLO window.

The progress bar uses these states:

* More than `50%` remaining: healthy
* `10%` to `50%` remaining: warning
* Less than `10%` remaining: critical

When the remaining budget reaches `0%`, the SLO is violated.

#### Burn rate

**Burn rate** shows how fast the service is consuming its error budget.

```
Burn Rate = Current Error Rate / Error Budget Rate
```

Examples:

* `1×`: using budget at the expected pace
* `2×`: using budget twice as fast
* `14×`: using budget fast enough to exhaust it in about 2 days for a `28d` window

Burn rate matters because a service can still look acceptable at a glance while burning through its budget too quickly.

### Creating an SLO

The SLO creation flow has 5 steps.

```
1. Define SLI → 2. Set Target → 3. Name and Description → 4. Alert Rules → 5. Review and Create
```

#### Step 1: Define SLI

Configure the metrics used to measure reliability.

Required fields:

* **Data Source**: choose a Prometheus data source
* **Query Type**: use `Ratio`
* **Success Metric**: required in ratio mode
* **Total Metric**: required in ratio mode
* **Time Window**: for example `28d`

Example:

```promql
Success metric: http_requests_total{status=~"2.."}
Total metric:   http_requests_total
```

Use **Run** to preview:

* current SLI ratio
* success count
* total count
* time-series graph

Validation rules:

* a data source must be selected
* the time window must not be empty
* success and total metrics are both required in ratio mode

#### Step 2: Set target and error budget

Define the reliability target.

Fields:

* **Target**: minimum acceptable SLI from `0` to `100`
* **Error Budget**: calculated automatically as `100% − Target`

Validation rules:

* target percentage is required
* target must be between `0` and `100`

#### Step 3: Add name and description

Give the SLO a clear identity.

Available fields:

* **Name**: required, minimum 3 characters
* **Description**: optional
* **Service Name**: optional
* **Team Name**: optional
* **Tags**: optional key-value metadata

#### Step 4: Add SLO alert rules

Configure alerts for fast and slow error budget burn.

See the next section for details.

#### Step 5: Review and create

Review all settings before saving.

If any previous step is invalid, the flow sends you back to fix it.

On save, the system:

1. creates the SLO definition
2. provisions a linked Prometheus dashboard
3. creates alert queries and alert rules when alerting is enabled
4. executes alert queries immediately to seed initial data

### SLO alert rules

SLO alerts follow the multi-window, multi-burn-rate method from the [Google SRE Workbook](https://sre.google/workbook/alerting-on-slos/).

This combines two signals:

* how fast the budget is burning
* how long the burn has been sustained

{% hint style="info" %}
Reference: [Alerting on SLOs — Google SRE Workbook](https://sre.google/workbook/alerting-on-slos/)
{% endhint %}

#### Default thresholds

The default thresholds are based on a formula. They are not arbitrary.

```
Burn Rate Threshold = (Target Budget Consumption % × SLO Window Hours) / Alert Window Hours
```

Terms:

* **Target Budget Consumption %**: how much of the budget should be consumed before firing
* **SLO Window Hours**: total rolling window in hours
* **Alert Window Hours**: long alert window in hours

The examples below use the standard `30-day` SRE convention for threshold derivation. Your actual SLO window can still be `28d` or another supported value.

#### Fast burn alert

A **fast burn** alert detects sudden and major outages.

Default settings:

* threshold: `14.4×`
* short window: `5m`
* long window: `1h`
* default severity: `Critical`
* recommended range: `10×` to `20×`

The `14.4×` threshold comes from this goal:

`Alert if 2% of a 30-day error budget is consumed within 1 hour.`

```
Fast Burn Threshold = (2% × 720h) / 1h = 14.4×
```

What it means:

* `1×`: no alert
* `6×`: slow burn territory
* `14.4×`: budget exhausted in about `50 hours`
* `36×`: severe outage

The alert fires when either the `5m` window or the `1h` window exceeds the threshold.

Use this alert for incidents that need immediate investigation.

#### Slow burn alert

A **slow burn** alert detects sustained and moderate degradation.

Default settings:

* threshold: `6×`
* short window: `30m`
* long window: `6h`
* default severity: `Warning`
* recommended range: `2×` to `10×`

The `6×` threshold comes from this goal:

`Alert if 5% of a 30-day error budget is consumed within 6 hours.`

```
Slow Burn Threshold = (5% × 720h) / 6h = 6×
```

What it means:

* `1×`: no alert
* `2×`: elevated and worth watching
* `6×`: budget exhausted in about `5 days`
* `14.4×`: fast burn territory

Use this alert for issues that are serious but not yet catastrophic.

#### Multi-window logic

Each alert type uses two windows:

* a **short window** for fast detection
* a **long window** for confirmation

This balances speed and false positives.

Fast burn uses:

* `5m`
* `1h`

Slow burn uses:

* `30m`
* `6h`

The alert fires if either window exceeds the configured threshold.

This means:

* a short window catches problems quickly
* a long window confirms the issue is sustained

This pattern reduces noisy alerts from very brief spikes.

#### Alert severity

Each alert can have a severity.

Typical defaults:

* **Critical** for fast burn
* **Warning** for slow burn

You can change severity per alert type during SLO setup.

#### Notification channels

When alerting is enabled, select at least one notification channel.

Supported channels can include:

* Slack
* PagerDuty
* email
* webhooks
* other configured destinations

You can select multiple channels. The same channels are shared by fast and slow burn alerts.

{% hint style="warning" %}
If alerting is disabled on an existing SLO, all linked alert rules and queries are permanently deleted when you save.
{% endhint %}

### SLO dashboard

Each SLO has a linked dashboard that shows:

* current SLI ratio over the selected window
* error budget remaining
* good events versus total events
* burn rate trends

The dashboard is created automatically when the SLO is created.

### SLO status reference

An SLO can appear in these states:

* **Healthy**: target is being met and budget is intact
* **At Risk**: budget is running low
* **Violated**: the SLO has been breached
* **Warning**: a slow burn alert is firing
* **Degraded**: a fast burn alert is firing
* **No Data**: there is not enough metric data to evaluate
* **Disabled**: the SLO is administratively disabled

### Best practices

#### Set the right target

* Start with `99.5%` for internal services
* Start with `99.9%` for customer-facing services
* Avoid targets above `99.99%` unless your platform can support it
* Revisit targets regularly using actual SLI data

#### Configure alerts well

* Enable both fast and slow burn alerts for production services
* Start with the default thresholds
* Route fast burn alerts to an on-call channel
* Route slow burn alerts to a team channel for review

#### Choose metrics carefully

* Prefer counter metrics for both good and total events
* Make sure the total metric includes all attempts
* Prefer service-level metrics over per-instance metrics when possible

#### Pick a stable time window

* `28d` is the recommended default
* `7d` can help during early setup and tuning
* avoid windows shorter than `24h` for production SLOs

### Glossary

* **SLI**: the measured ratio of good events to total events
* **SLO**: the target percentage the SLI must meet over a time window
* **Error Budget**: the allowed unreliability, calculated as `100% − SLO Target`
* **Error Budget Remaining**: the portion of the budget not yet consumed
* **Burn Rate**: how fast the budget is being consumed
* **Fast Burn**: alert for sudden high-severity outages
* **Slow Burn**: alert for gradual sustained degradation
* **Multi-window alert**: alert that checks two windows to reduce false positives
* **Time Window**: rolling evaluation period such as `28d`
* **Notification Channel**: destination that receives SLO alerts
* **PromQL**: Prometheus Query Language used to define SLI metrics and alert queries
