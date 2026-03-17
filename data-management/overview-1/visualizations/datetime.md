---
description: >-
  A DateTime chart displays a time-based value as a human-readable duration. Use
  it for uptime, age, and time-since metrics.
---

# Datetime

A DateTime chart displays a time-based value in a human-readable duration format. It is used to show how long something has been running, how old something is, or when an event occurred.

It’s ideal for:

* Uptime
* Last restart time
* Time since last failure
* SLA age
* Job duration

### What a DateTime chart represents

The DateTime tile converts a timestamp or duration into a readable form:

Weeks, days, hours, minutes.

Example:

`37W, 3D, 17h, 14m`

This means the system has been running for 37 weeks, 3 days, 17 hours, and 14 minutes.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-10 09-16-48.png" alt="Example DateTime tile showing an elapsed duration (weeks, days, hours, minutes)"><figcaption><p>Example DateTime tile</p></figcaption></figure>

### What kind of data it uses

The DateTime chart works with:

* Durations in seconds

It automatically converts them into elapsed time from now.

### How the value is calculated

The system computes:

`current time − input time = duration`



That duration is formatted into:

`W, D, h, m`

{% hint style="info" %}
Key rules:

* Input must be time-based.
* The chart always shows relative time.
* Display is automatically formatted.
* Best for lifecycle and uptime metrics.
{% endhint %}

### What this chart tells you

The user instantly sees:

* How long the system has been running
* Whether something was recently restarted
* Whether uptime is healthy

This avoids checking logs or timestamps.

### When to use DateTime

Use DateTime when you want to show:

* Uptime
* Age
* Duration
* Time since an event

It’s perfect for server uptime, pod age, last deployment, SLA tracking, and maintenance windows.
