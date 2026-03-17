---
description: >-
  A Disk chart is a capacity indicator. It shows used vs total as a percent-full
  ring.
---

# Disk

A Disk chart is a capacity indicator. It shows how much of something has been used compared to how much is available.

It always answers one question:

**“How full is this?”**

### What a Disk chart shows

A Disk chart displays:

`used ÷ total → percentage`

The chart is drawn as a ring:

* **Filled area**: used portion
* **Empty area**: remaining portion
* **Center number**: percent used



<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-10 09-01-28.png" alt="Example Disk chart showing percent used as a ring"><figcaption><p>Disk chart (capacity indicator)</p></figcaption></figure>

### Configure a Disk chart

Disk charts are designed for bounded metrics. They assume you have two numbers:

* **Used**
* **Total**

{% hint style="info" %}
Key rules:

* Disk charts use a bounded metric (a value with a max).
* The chart computes: `(used / total) × 100`.
* Ensure `total > 0` to avoid invalid percentages.
{% endhint %}



###
