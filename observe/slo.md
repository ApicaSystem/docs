---
description: Service Level Objectives
---

# SLO

### Table of Contents

1. What is an SLO?
2. Key Concepts
   * SLI — Service Level Indicator
   * SLO — Service Level Objective
   * Error Budget
   * Error Budget Remaining
   * Burn Rate
3. Creating an SLO — Step-by-Step
   * Step 1: Define SLI
   * Step 2: Set Target and Error Budget
   * Step 3: Add Name and Description
   * Step 4: Add SLO Alert Rules
   * Step 5: Review and Create
4. SLO Alert Rules In Depth
   * Fast Burn Alert
   * Slow Burn Alert
   * Multi-Window Alert Logic
   * Alert Severity
   * Notification Channels
5. SLO Dashboard
6. SLO Status Reference
7. Best Practices
8. Glossary

***

### 1. What is an SLO?

A **Service Level Objective (SLO)** is a measurable reliability target for a service.

> "What percentage of the time must our service behave correctly?"

SLOs are the foundation of reliability engineering. They give your team a shared, data-driven definition of "good enough" — and a clear signal when reliability is degrading before users are impacted.

```
SLO = SLI measured over a time window must meet a target percentage
```

**Example:** "99.9% of HTTP requests to the payment service must succeed over any 28-day rolling window."

***

### 2. Key Concepts

#### 2.1 SLI — Service Level Indicator

An **SLI** is the actual metric that measures your service's behaviour. In this implementation, SLIs are expressed as a ratio:

```
SLI = ( Good Events / Total Events ) × 100%
```

| Term         | Meaning                                  | Example            |
| ------------ | ---------------------------------------- | ------------------ |
| Good Events  | Requests/events that met the quality bar | HTTP 2xx responses |
| Total Events | All requests/events attempted            | All HTTP requests  |
| SLI Ratio    | The percentage of good events            | 99.95%             |

The SLI is computed from Prometheus metrics over the configured time window:

The platform supports one query mode:

* **Ratio mode** — you select a Success metric and a Total metric separately _(recommended)_

***

#### 2.2 SLO — Service Level Objective

The **SLO** is the target you set for your SLI. It is expressed as a percentage and measured over a rolling time window.

| Field             | Description                                        | Default |
| ----------------- | -------------------------------------------------- | ------- |
| Target Percentage | The minimum acceptable SLI value                   | 99.9%   |
| Time Window       | The rolling period over which the SLI is evaluated | 28d     |

**Sample Time windows:** `2h`, `24h`, `7d`, `28d`, `30d`, `90d`

The SLO is met when:

```
SLI ≥ Target Percentage  over the entire time window
```

***

#### 2.3 Error Budget

The **Error Budget** is the allowable amount of unreliability within your SLO. It is automatically calculated as:

```
Error Budget = 100% − Target Percentage
```

| SLO Target | Error Budget |
| ---------- | ------------ |
| 99.9%      | 0.1%         |
| 99.5%      | 0.5%         |
| 99.0%      | 1.0%         |
| 95.0%      | 5.0%         |

In concrete time terms (for a 28-day window):

| SLO Target | Error Budget | Allowed downtime / 28 days |
| ---------- | ------------ | -------------------------- |
| 99.9%      | 0.1%         | \~40 minutes               |
| 99.5%      | 0.5%         | \~3.4 hours                |
| 99.0%      | 1.0%         | \~6.7 hours                |

> The error budget is displayed live in the **Set Target** step and is automatically updated whenever you change the target percentage.

***

#### 2.4 Error Budget Remaining

**Error Budget Remaining** shows how much of your error budget has not yet been consumed during the current SLO window.

The `ErrorBudgetProgress` component renders it as a colour-coded progress bar:

| Remaining Budget | Colour    | Status                      |
| ---------------- | --------- | --------------------------- |
| > 50%            | 🟢 Green  | Healthy                     |
| 10% – 50%        | 🟡 Yellow | Warning — running low       |
| < 10%            | 🔴 Red    | Critical — nearly exhausted |

> When the error budget reaches **0%**, the SLO is violated — meaning more errors occurred than the target allows.

***

#### 2.5 Burn Rate

**Burn rate** measures how fast your service is consuming its error budget relative to the sustainable rate.

```
Burn Rate = Current Error Rate / Error Budget Rate
```

| Burn Rate | Meaning                                                                |
| --------- | ---------------------------------------------------------------------- |
| 1×        | Consuming error budget at exactly the allowed pace — SLO will be met   |
| 2×        | Consuming twice as fast — budget will run out in half the window       |
| 14×       | Consuming 14× faster — budget exhausted in \~2 days (for a 28d window) |

> **Why burn rate matters:** A service can have a low absolute error rate but still be burning its budget too fast. Burn rate alerts catch this before the SLO is violated.

***

### 3. Creating an SLO — Step-by-Step

The SLO creation wizard has **5 steps**, navigated sequentially. Each step must be valid before proceeding to the next.

```
1. Define SLI  →  2. Set Target  →  3. Name & Description  →  4. Alert Rules  →  5. Review & Create
```

***

#### Step 1: Define SLI

**Purpose:** Configure the Prometheus metrics that measure your service's reliability.

| Field          | Required             | Description                                                             |
| -------------- | -------------------- | ----------------------------------------------------------------------- |
| Data Source    | ✅ Yes                | Select a Prometheus data source. Auto-selects if only one is available. |
| Query Type     | ✅ Yes                | Ratio _(recommended)_                                                   |
| Success Metric | ✅ Yes _(Ratio mode)_ | Prometheus metric counting good events                                  |
| Total Metric   | ✅ Yes _(Ratio mode)_ | Prometheus metric counting all events                                   |
| Time Window    | ✅ Yes                | Rolling window for SLI evaluation (e.g., `28d`)                         |

**Ratio mode example:**

```promql
Success metric: http_requests_total{status=~"2.."}
Total metric:   http_requests_total
```

After configuring metrics, you can click **Run** to preview the current SLI ratio, success count, total count, and a time-series graph — all computed live from Prometheus.

**Validation rules:**

* A data source must be selected
* Time window must not be empty
* In ratio mode: both success and total metrics are required

***

#### Step 2: Set Target and Error Budget

**Purpose:** Define the reliability target for your SLO.

| Field        | Description                        | Default |
| ------------ | ---------------------------------- | ------- |
| Target       | Minimum acceptable SLI (0–100%)    | 99.9%   |
| Error Budget | Auto-calculated as `100% − Target` | 0.1%    |

> The error budget is **read-only** and updates automatically as you type the target.

**Validation rules:**

* Target percentage is required
* Must be between 0 and 100

***

#### Step 3: Add Name and Description

**Purpose:** Give your SLO a human-readable identity.

| Field        | Required | Description                                     |
| ------------ | -------- | ----------------------------------------------- |
| Name         | Yes      | Unique name for the SLO (minimum 3 characters)  |
| Description  | No       | Free-text description of what this SLO measures |
| Service Name | No       | The service this SLO belongs to                 |
| Team Name    | No       | The team responsible for this SLO               |
| Tags         | No       | Key-value pairs for organisation and filtering  |

***

#### Step 4: Add SLO Alert Rules

**Purpose:** Configure automated alerts that fire when your error budget is burning too fast.

See Section 4 for full details.

***

#### Step 5: Review and Create

**Purpose:** Review all configured settings before saving.

The review step validates all previous steps. If any step has errors, you will be directed back to fix them before the SLO can be created.

On save, the system:

1. Creates the SLO definition
2. Provisions a linked Prometheus dashboard
3. Creates alert queries and alert rules _(if alerting is enabled)_
4. Executes the alert queries immediately to seed initial data

***

### 4. SLO Alert Rules In Depth

SLO alerts use the **multi-window, multi-burn-rate** methodology from the [Google SRE Workbook](https://sre.google/workbook/alerting-on-slos/). This approach reduces both false positives and missed incidents by combining two complementary signals: **how fast** the error budget is burning (burn rate threshold) and **how long** it has been burning (time window).

> **Reference:** [Alerting on SLOs — Google SRE Workbook, Chapter 5](https://sre.google/workbook/alerting-on-slos/)

***

#### Understanding the Default Thresholds

The default thresholds (14.4× for fast burn, 6× for slow burn) are not arbitrary — they are derived from a principled formula that answers the question:

> "If my service burns at this rate continuously, how much of my error budget will be consumed in the alert window?"

The general formula is:

```
Burn Rate Threshold = (Target Budget Consumption %) × (SLO Window Hours)
                      ─────────────────────────────────────────────────────
                                    Alert Window Hours
```

Where:

* **Target Budget Consumption %** — the fraction of the total error budget you want to have consumed before the alert fires (e.g., 2% for fast burn, 5% for slow burn)
* **SLO Window Hours** — the total SLO rolling window in hours used for threshold derivation in this section (30 days = 720 hours)
* **Alert Window Hours** — the long window of the alert (1h for fast burn, 6h for slow burn)

This ensures that if the alert fires and the burn rate is sustained, the error budget will be exhausted in a predictable, bounded time.

> The alert-threshold examples in this section use the standard **30-day** SRE convention. Your configured SLO window can still be `28d` or another supported value.

***

#### 4.1 Fast Burn Alert

A **Fast Burn** alert detects **sudden, major outages** — situations where a large portion of the error budget is consumed in a very short time. This is the highest-priority alert and requires immediate action.

**When does it fire?**

Fast burn fires when your service is experiencing a severe degradation — for example, a deployment gone wrong, a database outage, or a cascading failure. At a 14.4× burn rate, a 30-day error budget would be **completely exhausted in just \~50 hours** (≈ 2 days). The alert is designed to catch this within the first hour.

| Property          | Value               |
| ----------------- | ------------------- |
| Default Threshold | **14.4×** burn rate |
| Short window      | 5 minutes           |
| Long window       | 1 hour              |
| Default Severity  | **Critical**        |
| Recommended range | 10× – 20×           |

**How the 14.4× default is derived:**

The goal is: _"Alert if 2% of the 30-day error budget is consumed within 1 hour."_

```
Fast Burn Threshold = (Budget Consumption % × SLO Window Hours) / Alert Window Hours
                    = (2% × 720h) / 1h
                    = 14.4×
```

**What this means in practice:**

| Burn Rate | Budget exhausted in (30d SLO) | Urgency                              |
| --------- | ----------------------------- | ------------------------------------ |
| 1×        | 30 days                       | Normal — no alert                    |
| 6×        | 5 days                        | Slow burn alert fires                |
| 14.4×     | \~50 hours                    | **Fast burn alert fires**            |
| 36×       | \~20 hours                    | Severe — fast burn fires immediately |

The alert fires when **either** the 5-minute or the 1-hour window exceeds the threshold. The short window catches the problem fast; the long window confirms it is not a transient spike.

> **Action required:** A firing fast burn alert means your service is in a critical state. Investigate immediately — check recent deployments, infrastructure health, and error logs.

***

#### 4.2 Slow Burn Alert

A **Slow Burn** alert detects **gradual, sustained degradation** — situations where the error budget is being consumed at a moderately elevated rate over a longer period. This is often invisible to users in the short term but will eventually exhaust the error budget and violate the SLO.

**When does it fire?**

Slow burn fires when your service has a persistent but non-catastrophic issue — for example, a memory leak causing intermittent timeouts, a misconfigured retry policy, or a noisy dependency. At a 6× burn rate, a 30-day error budget would be exhausted in **\~5 days**.

| Property          | Value            |
| ----------------- | ---------------- |
| Default Threshold | **6×** burn rate |
| Short window      | 30 minutes       |
| Long window       | 6 hours          |
| Default Severity  | **Warning**      |
| Recommended range | 2× – 10×         |

**How the 6× default is derived:**

The goal is: _"Alert if 5% of the 30-day error budget is consumed within 6 hours."_

```
Slow Burn Threshold = (Budget Consumption % × SLO Window Hours) / Alert Window Hours
                    = (5% × 720h) / 6h
                    = 6×
```

**What this means in practice:**

| Burn Rate | Budget exhausted in (30d SLO) | Urgency                     |
| --------- | ----------------------------- | --------------------------- |
| 1×        | 30 days                       | Normal — no alert           |
| 2×        | 15 days                       | Elevated — worth monitoring |
| 6×        | 5 days                        | **Slow burn alert fires**   |
| 14.4×     | \~50 hours                    | Fast burn alert fires       |

> **Action required:** A firing slow burn alert means your service has a persistent issue that will exhaust the error budget within days. Investigate during business hours — check error trends, dependency health, and recent configuration changes.

***

#### 4.3 Multi-Window Alert Logic

The **multi-window** design is the key innovation from the Google SRE Workbook. Each alert type uses **two time windows simultaneously** — a short window and a long window — to balance detection speed against false positive rate.

**Why two windows?**

A single short window (e.g., 5 minutes) is **sensitive but noisy** — it catches problems fast but also fires on transient spikes that resolve themselves. A single long window (e.g., 1 hour) is **stable but slow** — it filters out noise but may take too long to fire during a real outage.

The dual-window approach gets the best of both:

| Window       | Role                                               | Benefit                 |
| ------------ | -------------------------------------------------- | ----------------------- |
| Short window | **Detection** — catches the problem quickly        | Low time-to-detect      |
| Long window  | **Confirmation** — verifies the issue is sustained | Low false positive rate |

**How it works**

The alert fires if **either** window exceeds the burn rate threshold.

* If the **short window** fires → the problem is happening **right now** (fast detection)
* If the **long window** fires → the problem has been **sustained** for a while (high confidence)
* Either condition alone is sufficient to trigger the alert

**Window summary**

| Alert Type | Short Window | Long Window | Fires When                            |
| ---------- | ------------ | ----------- | ------------------------------------- |
| Fast Burn  | 5m           | 1h          | Either 5m **OR** 1h burn rate > 14.4× |
| Slow Burn  | 30m          | 6h          | Either 30m **OR** 6h burn rate > 6×   |

**Why this reduces false positives**

Consider a 2-minute network blip that causes a spike in errors:

* The **5-minute** window may briefly exceed 14.4× — but the **1-hour** window will not, because the blip is too short to affect the hourly average
* Result: **no alert fires** — the blip is correctly identified as transient

Now consider a real outage lasting 30 minutes:

* Both the **5-minute** and **1-hour** windows will exceed the threshold
* Result: **alert fires** — the sustained issue is correctly detected

> **Reference:** This methodology is described in detail in [Chapter 5 of the Google SRE Workbook — "Alerting on SLOs"](https://sre.google/workbook/alerting-on-slos/), specifically the section on _"Multiwindow, Multi-Burn-Rate Alerts"_.

***

#### 4.4 Alert Severity

Each burn rate alert has a configurable severity:

| Severity | Typical Use                              | Default Assignment |
| -------- | ---------------------------------------- | ------------------ |
| Critical | Immediate action required — major outage | Fast Burn          |
| Warning  | Investigate soon — gradual degradation   | Slow Burn          |

> Severity can be changed per alert type in the **Alert Rules** step.

***

#### 4.5 Notification Channels

When alerts are enabled, you must select at least one **notification channel** (destination). Supported destination types include Slack, PagerDuty, email, webhooks, and any other destination configured in the platform.

* Multiple channels can be selected
* Channels are shared between fast and slow burn alerts

> **Disabling alerts:** If you disable alerting on an existing SLO, a confirmation dialog warns that all associated alert rules and queries will be **permanently deleted** on save.

***

### 5. SLO Dashboard

Each SLO has a linked dashboard that visualises:

* Current SLI ratio over the configured time window
* Error budget remaining (colour-coded progress bar)
* Good events vs. total events time series
* Burn rate trends

> The dashboard is automatically provisioned when the SLO is created. Navigate to it via **SLOs → \[SLO Name] → Dashboard**.

***

### 6. SLO Status Reference

The platform assigns a status badge to each SLO based on its current health:

| Status   | Colour    | Meaning                                            |
| -------- | --------- | -------------------------------------------------- |
| Healthy  | 🟢 Green  | SLI is meeting the target; error budget is intact  |
| At Risk  | 🟡 Yellow | Error budget is running low; burn rate is elevated |
| Violated | 🔴 Red    | SLO has been breached; error budget exhausted      |
| Warning  | 🟡 Yellow | Slow burn alert is firing                          |
| Degraded | 🔴 Red    | Fast burn alert is firing                          |
| No Data  | ⚪ Grey    | No metric data available for evaluation            |
| Disabled | ⚪ Grey    | SLO is administratively disabled                   |

***

### 7. Best Practices

#### Setting the Right Target

* Start with **99.5%** for internal services and **99.9%** for customer-facing services
* Avoid setting targets above **99.99%** unless you have the infrastructure to support it — the error budget becomes extremely small
* Review and adjust targets quarterly based on actual SLI data

#### Configuring Alerts

* Always enable **both** fast and slow burn alerts for production services
* Use the default thresholds (14.4× fast, 6× slow) as a starting point — they are derived from Google SRE methodology
* Route **Critical** (fast burn) alerts to an on-call channel (e.g., PagerDuty)
* Route **Warning** (slow burn) alerts to a team channel (e.g., Slack) for async review

#### Choosing Metrics

* Use **counter metrics** (those that only increase) for both good and total events — the platform uses `increase()` internally
* Ensure your total metric truly counts **all attempts**, not just successful ones
* Prefer metrics that are already aggregated at the service level rather than per-instance

#### Time Windows

* **28 days** is the recommended default — it aligns with the Google SRE standard and provides a stable rolling window
* Use **7 days** for faster feedback during initial SLO setup
* Avoid windows shorter than **24 hours** for production SLOs — they are too noisy

***

### 8. Glossary

| Term                   | Definition                                                                           |
| ---------------------- | ------------------------------------------------------------------------------------ |
| SLI                    | Service Level Indicator — the actual measured ratio of good events to total events   |
| SLO                    | Service Level Objective — the target percentage the SLI must meet over a time window |
| Error Budget           | The allowable amount of unreliability: `100% − SLO Target`                           |
| Error Budget Remaining | How much of the error budget has not yet been consumed in the current window         |
| Burn Rate              | How fast the error budget is being consumed relative to the sustainable rate         |
| Fast Burn              | A burn rate alert for sudden, high-severity outages (default: 14.4× over 5m/1h)      |
| Slow Burn              | A burn rate alert for gradual, sustained degradation (default: 6× over 30m/6h)       |
| Multi-window alert     | An alert that checks two time windows simultaneously to reduce false positives       |
| Time Window            | The rolling period over which the SLI is evaluated (e.g., 28 days)                   |
| Notification Channel   | A destination (Slack, PagerDuty, email, etc.) that receives alert notifications      |
| PromQL                 | Prometheus Query Language — used to define SLI metrics and burn rate queries         |
