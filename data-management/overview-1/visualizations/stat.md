---
description: >-
  A Stat chart shows a single key metric with its recent trend. Use it to see
  the latest value plus context over time.
---

# Stat

A Stat chart shows a single key metric with its recent trend. It combines a big number with a sparkline to give current value plus context.

It’s ideal for:

* Data ingestion rate (GB/h)
* Error rate
* Throughput
* Latency
* Cost per hour
* Traffic volume

### What a Stat chart represents

The Stat tile displays:

* **Large number**: current or latest value
* **Sparkline**: trend over time
* **Unit**: measurement label



<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-10 08-38-10.png" alt="Example Stat tile showing a value with a sparkline trend"><figcaption><p>Example Stat tile</p></figcaption></figure>

### Configure a Stat chart

Set **Chart type** to **Stat**. Set **Unit** to the label shown with the value.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-10 08-38-51.png" alt="Stat chart settings showing the Unit field"><figcaption><p>Stat configuration</p></figcaption></figure>

### Stat configuration options

| Option     | Purpose                             |
| ---------- | ----------------------------------- |
| Chart type | Must be **Stat**.                   |
| Unit       | Display label shown with the value. |



{% hint style="info" %}
Key rules:

* Uses one numeric metric.
* Unit is display-only.
* Sparkline always reflects the selected time range.
* Built for rate or summary metrics.
{% endhint %}

### How the Stat value is chosen

The Stat uses:

* The latest data point from the query, or



The sparkline is built from all points in the selected time range.

### What this chart tells you

You can quickly see:

* The current value
* Whether it’s rising or falling
* Whether there was a spike

### When to use Stat

Use Stat when you want:

* A KPI with context
* Trend + current value
* Monitoring tiles
* Rate or usage indicators

It’s perfect for logs per hour, GB ingested, errors per minute, requests per second, and cost per day.
