---
description: 'Each SLO has a linked dashboard that shows:'
---

# SLO Dashboard

* Current SLI ratio over the selected window
* Error budget remaining
* Good events versus total events
* Burn rate trends

The dashboard is created automatically when the SLO is created.

#### SLO status reference

An SLO can appear in these states:

* **Healthy**: target is being met and budget is intact
* **At Risk**: budget is running low
* **Violated**: the SLO has been breached
* **Warning**: a slow burn alert is firing
* **Degraded**: a fast burn alert is firing
* **No Data**: there is not enough metric data to evaluate
* **Disabled**: the SLO is administratively disabled

#### Best practices

**Set the right target**

* Start with `99.5%` for internal services
* Start with `99.9%` for customer-facing services
* Avoid targets above `99.99%` unless your platform can support it
* Revisit targets regularly using actual SLI data

**Configure alerts well**

* Enable both fast and slow burn alerts for production services
* Start with the default thresholds
* Route fast burn alerts to an on-call channel
* Route slow burn alerts to a team channel for review

**Choose metrics carefully**

* Prefer counter metrics for both good and total events
* Make sure the total metric includes all attempts
* Prefer service-level metrics over per-instance metrics when possible

**Pick a stable time window**

* `28d` is the recommended default
* `7d` can help during early setup and tuning
* avoid windows shorter than `24h` for production SLOs

#### Glossary

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
