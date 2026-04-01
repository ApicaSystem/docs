---
description: The SLO creation flow has 5 steps.
---

# Create SLO

1. Define SLI
2. Set Target
3. Name and Description
4. Alert Rules
5. Review and Create

**Step 1: Define SLI**

Configure the metrics used to measure reliability.

Required fields:

* **Time Window**: for example `28d`
* **Data Source**: choose a Prometheus data source
* **Query Type**: use `Ratio`
* **Success Metric**: required in ratio mode
* **Total Metric**: required in ratio mode

Example:

```promql
Success metric: http_requests_total{status=~"2.."}
Total metric:   http_requests_total
```

Validation rules:

* a data source must be selected
* the time window must not be empty
* success and total metrics are both required in ratio mode

**Step 2: Set target and error budget**

Define the reliability target.

Fields:

* **Target**: minimum acceptable SLI from `0` to `100`
* **Error Budget**: calculated automatically as `100% − Target`

Validation rules:

* target percentage is required
* target must be between `0` and `100`

**Step 3: Add name and description**

Provide the SLO a clear identity.

Available fields:

* **SLO Name**: required
* **Description**: optional
* **Service Name**: optional
* **Status**: enable/disable slo

**Step 4: Add SLO alert rules**

Configure alerts for fast and slow error budget burn.

Available fields:

* **Enable Alert Rules:** optional
* **Notification Channel**: required if alert rules is enabled
* **Fast Burn Rate alert**: optional
* **Slow Burn Rate Alert:** optional

See the **alert rules** section for details.

**Step 5: Review and create**

Review all settings before saving.

Use **Run queries** to preview SLI Performance:

* current SLI ratio
* success count
* total count
* time-series graph of success and total metrics

On save, the system:

1. creates the SLO definition
2. provisions a linked SLO dashboard
3. creates alert queries and alert rules when alerting is enabled
4. executes alert queries immediately to seed initial data

#### SLO alert rules

SLO alerts follow the multi-window, multi-burn-rate method from the [Google SRE Workbook](https://sre.google/workbook/alerting-on-slos/).

This combines two signals:

* how fast the budget is burning
* how long the burn has been sustained

{% hint style="info" %}
Reference: \[Alerting on SLOs — Google SRE Workbook]\(https://sre.google/workbook/alerting-on-slos/)
{% endhint %}

**Default thresholds**

The default thresholds are based on a formula. They are not arbitrary.

```
Burn Rate Threshold = (Target Budget Consumption % × SLO Window Hours) / Alert Window Hours
```

The examples below use the standard `30-day` SRE convention for threshold derivation. Your actual SLO window can still be `28d` or another supported value.

**Fast burn alert**

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

**Slow burn alert**

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

**Multi-window logic**

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

**Alert severity**

Each alert can have a severity.

Typical defaults:

* **Critical** for fast burn
* **Warning** for slow burn

You can change severity per alert type during SLO setup.

**Notification channels**

When alerting is enabled, select at least one notification channel.

Supported channels can include:

* Slack
* PagerDuty
* Email
* Webhooks
* other configured destinations#### Notification channels

You can select multiple channels. The same channels are shared by fast and slow burn alerts.

{% hint style="warning" %}
If alerting is disabled on an existing SLO, all linked alert rules and queries are permanently deleted when you save.
{% endhint %}
