---
description: >-
  Create, tune, mute, and delete alerts and SLOs by conversation, with every new
  alert reviewed by you before it goes live.
---

# Alerts and SLOs with Venn

### Alerts

The full alert lifecycle works conversationally:

* _"Alert me when the error rate in checkout passes 5 per minute"_: Venn drafts the alert (condition, thresholds, destinations) and opens the alert create form pre-filled for your review. You save it through the normal flow.
* _"List my alerts"_, _"what does the checkout-errors alert do?"_
* _"Mute the disk-space alert for now"_, _"unmute it"_
* _"Update the threshold on checkout-errors to 10 per minute"_
* _"Delete the old staging alert"_: available once your administrator has enabled delete tools (they are off by default); deletions then still require your explicit approval before anything is removed.

Alert destinations (Slack, email, webhooks, and more) can also be set up with Venn's help: it stages the destination configuration and opens the create wizard pre-filled. If the destination needs a secret such as a webhook token, you enter that in the form yourself; Venn never asks for secrets in chat.

### SLOs

* _"Create an SLO for the payments API: 99.9 percent availability over 30 days"_

Venn drafts the SLO (objective, indicator, window, targets) and opens the multi-step SLO form pre-filled, marked as AI-prefilled, for you to review and save.

{% hint style="warning" %}
SLOs in Ascent are **availability-based** today. Latency-based SLIs are not supported yet, and Venn will steer you toward an availability objective if you ask for one.
{% endhint %}

### A note on alerts created by SIEM detections

When a [SIEM detection built with Venn](pipelines-with-venn.md) includes an alert, that alert is created **disabled** with no destination. Enable it and pick destinations when you are ready. This prevents a drafted detection from paging anyone by accident.
