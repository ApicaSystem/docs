---
description: >-
  Draft telemetry pipeline rules from plain language, merge suggestions into
  existing pipelines, build pipelines in one step, and manage pipelines
  conversationally.
---

# Pipelines with Venn

Venn turns intent into reviewable pipeline rules. Describe the goal; Venn samples your real logs, drafts the rules, and hands them to you in the pipeline builder for review. Nothing is saved until you press **Save**.

{% hint style="info" %}
For the full walkthrough with screenshots (the Review card, the pipeline builder preview, the DIFF tab, and per-rule-kind guidance), see [Venn and Pipeline build](../flow/venn-and-pipeline-build.md).
{% endhint %}

### What to ask for

* _"Reduce log volume from the checkout service"_ (filter and suppression rules)
* _"Mask all email addresses in the auth logs"_ (rewrite and redaction rules; the redaction is permanent, so check the before and after preview)
* _"Extract the status code and latency from my nginx logs"_ (extract rules)
* _"Count errors per service every minute"_ (aggregate rules)
* _"Forward only error logs to the SIEM destination"_ (forward rules; a forward rule needs its own pipeline)
* _"Send audit logs to the security namespace"_ (stream rules)

Venn picks the right rule kind for you, groups multiple rules into one pipeline where possible, and preserves any rules you wrote yourself when it refines a suggestion.

### Add rules to an existing pipeline

Ask Venn to extend a pipeline you already have:

* _"Add a rule to the payments pipeline that also drops health-check logs"_

Venn merges the new suggestions into the existing pipeline and deduplicates against what is already there, instead of creating a parallel pipeline.

### Manage pipelines conversationally

* _"List my pipelines"_ (includes the savings each pipeline delivers)
* _"What does the drop-debug rule in the payments pipeline do?"_ (Venn explains rules in plain language)
* _"Reorder the rules so the filter runs first"_, _"rename this pipeline"_ (non-destructive structural edits: these act on the pipeline open in the builder, and you save the result yourself)
* _"Remove rule 3"_ (a destructive edit; Venn asks for confirmation before removing the rule)
* _"Attach this pipeline to the prod dataflow"_, _"disable this pipeline"_ (attaching, enabling, and disabling; replacing the pipelines on a dataflow asks for your confirmation first)
* _"Which dataflows have the most errors today?"_ (health triage before you decide what to fix)

### The rule kinds Venn can draft

Filter, Rewrite (redaction), Code (JavaScript), Extract, Aggregate, Forward, Stream, and SIEM. One additional kind exists in the pipeline builder that Venn does not draft: **Tag** (also called Evaluate), which flags matched events and tracks them as a real-time metric; you author Tag rules by hand in the builder's **Add Rule** menu.
