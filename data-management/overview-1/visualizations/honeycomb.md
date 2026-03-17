---
description: >-
  A Honeycomb chart shows the status of many entities as color-coded hexagons.
  Use it for at-a-glance fleet or cluster health.
---

# Honeycomb

A Honeycomb chart displays the status of multiple entities using color-coded hexagons. Each hexagon represents one instance (node, server, pod, service, device). It’s built for fast “what’s up/down?” scanning.

It’s ideal for:

* Cluster health
* Node availability
* Service status
* Pod or container health
* IoT device monitoring

### What a Honeycomb chart represents

Each hexagon = one instance. Hexagon color shows its current state.

Common states:

* Green = Up / OK
* Yellow = Warning / Degraded
* Red = Down / Critical

<figure><img src="../../../.gitbook/assets/image (556).png" alt="Example Honeycomb chart showing many instances as hexagons with status colors"><figcaption><p>Example Honeycomb status chart</p></figcaption></figure>

### Configure a Honeycomb chart

Set **Chart type** to **Honeycomb**. Pick the **Label column** and **Value column**. Enable **Custom config** to define status rules.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-15 12-45-17 (1).png" alt=""><figcaption></figcaption></figure>

### Honeycomb configuration options

| Option        | Purpose                                                 |
| ------------- | ------------------------------------------------------- |
| Chart type    | Must be **Honeycomb**.                                  |
| Label column  | The entity name shown for each hexagon.                 |
| Value column  | Numeric field used to compute status.                   |
| Custom config | Enables status rules.                                   |
| Condition     | Operator used in a rule (`>`, `<`, `>=`, `<=`, `=`).    |
| Threshold     | Comparison value for the rule.                          |
| Text          | Label applied when the rule matches (for example `up`). |
| Color         | Hexagon color when the rule matches.                    |

Example rules:

* `= 1` → `up` (green)
* `< 1` → `down` (red)

{% hint style="info" %}
Key rules:

* Each instance is evaluated independently.
* Rules are evaluated **top-to-bottom** (in order).
* The first matching rule is applied.
* Keep rules mutually exclusive, or order them carefully.
{% endhint %}

### What the user sees

The user instantly sees:

* How many entities are healthy
* Which entities are down
* Where problems are concentrated

No log digging required.

### When to use Honeycomb

Use Honeycomb when you need to:

* Monitor many components at once
* Detect failures quickly
* Show binary or state-based health

Ideal for Kubernetes nodes, microservices, servers, network devices, and IoT fleets.

### Why the honeycomb layout works

The hexagon layout:

* Packs many items into a small space
* Makes failures visually obvious
* Works better than tables for live monitoring
