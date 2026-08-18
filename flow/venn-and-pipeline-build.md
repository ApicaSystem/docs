---
description: >-
  Venn is your AI observability assistant in Apica Ascent. This guide shows how
  to use Venn to build and edit pipeline rules, what each rule kind does, and
  what changed in the pipeline builder layout.
---

# Venn and Pipeline build

### 1. What is Venn?

Venn answers questions about your logs, metrics, traces, and anomalies — and can build pipeline rules for you from plain-language requests.

**How to open Venn:**

* **Floating bubble** — click the bubble in the corner of any page (tooltip **"Ask Venn"**). It opens the Venn drawer.
* **Drawer** — a panel slides in from the right, titled **Venn**. You can pin it, expand it wider, start a **New chat**, or close it.
* **Full page** — click on the Venn menu option from the top navbar for a full-screen chat.

When the chat is empty you'll see **"Ask Venn anything"** with a few starter prompts. Type your question and press **Enter** to send (**Shift+Enter** for a new line).

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2F9g0zsSKgzVs6V4I9Y7QQ%2Fpipeline-with-venn-bubble.png?alt=media&#x26;token=d598a207-2386-4a90-9839-31b6a0f0bdec" alt=""><figcaption><p>The "Ask Venn" bubble</p></figcaption></figure>

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2Fg4yzfaEm5q3ZI82EVLpP%2Fvenn-drawer.png?alt=media&#x26;token=9ba68af6-b6fa-4bd5-b365-d83aa5bcbdef" alt=""><figcaption><p>The Venn drawer's empty state</p></figcaption></figure>

***

### 2. Building pipeline rules with Venn

You do not need to know which rule type to choose. Describe your goal, and Venn determines the best option.

**The flow:**

1. **Ask in plain language.** For example, _"Help me cut log volume from the payment app"_ or _"Redact user name and IP address from access-logs."_
2. **Venn recommends and drafts.** If multiple namespaces or applications are available, Venn asks you to select them, then retrieves logs from the last hour, analyzes them, and drafts suitable rules.
3. **Review the suggestion card.** The card is headed **"Pipeline suggestion ready:"**. It shows the drafted rules and a short summary. Redaction suggestions also show a **"Redaction preview (before → after)"**.
4. **Click "Review."** The chat drawer closes and the **pipeline builder opens pre-filled** with the suggested rules. The **preview runs against real dataflow logs** so you can see the rules' effect before saving:
   1. For **Forward** suggestions, the namespace/application Venn analyzed is **pre-selected** in the preview's Data Flows dropdowns and the preview runs against that flow automatically.
   2. For other kinds (filter, rewrite, code, SIEM…), select the namespace and application on the **IN** tab of the **Pipeline Preview** section — the preview runs against whichever dataflow is selected. This selection only provides logs for the preview; it does not associate the pipeline with the dataflow.
5. **Validate with the DIFF tab.** Select the **DIFF** tab in **Pipeline Preview** to check the rule changes, using the left and right arrows to step through the previous and next logs.
6. **Save, then apply.** When you are satisfied with the preview, click **Save**. Then use **Apply Pipeline** to associate the pipeline with the namespace and application. The rules process incoming data only after you apply the pipeline.

> **Nothing is saved automatically.** Suggested rules arrive as **draft** rules for you to review. Your own hand-authored rules are always kept — Venn's additions are grouped under headings like _Suggested Filters_, _Suggested Rewrites_, so you can tell them apart. Saving happens only when **you** press Save in the builder.

**If a name is already taken:** when a suggested new pipeline's name already exists, Venn renames it and shows a banner (e.g. _A pipeline named "X" already exists, so the suggestion was named "Y". Edit the name above before saving…_). Change the name before saving if you'd like.

**Don't want a suggestion?** Click **Dismiss** on the card. You'll be asked to confirm — dismissing discards the suggestion, and you'd need to ask Venn to regenerate it.

#### Example: cut log volume from the payment app

Ask: _"Help me cut log volume from the payment app."_

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2F5uir2xbfmKVqjOUB2K37%2Fselect-ns-app.png?alt=media&#x26;token=e8aa01a8-a488-4997-913a-501c7861dd72" alt=""><figcaption></figcaption></figure>

If multiple namespaces or applications are available, Venn asks you to select them. After you select a namespace and application, Venn retrieves logs from the last hour, analyzes them, and drafts pipeline rules to filter them.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FTHgBBjiYO5yfXRvA7Sdl%2Fpipeline-search.png?alt=media&#x26;token=a7051d2b-8cb9-4029-87d7-095ccf7cab99" alt=""><figcaption></figcaption></figure>

Choose a suggestion, such as _"Suppress payment logs — keep 5 per minute, drop the rest."_

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FFBdEJinbmbNyUQo43WJr%2Fkeep-5-suppress-all-logs.png?alt=media&#x26;token=1a80b840-90ae-478a-b925-6adc52392669" alt=""><figcaption></figcaption></figure>

Venn may ask for a pipeline name. Choose a suggested name or enter your own.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FvpKn5uGhWqAhjqNC5iCo%2Fpick-pipeline-name.png?alt=media&#x26;token=f33b4768-3fc0-43ff-9719-dda1b7def397" alt=""><figcaption></figcaption></figure>

After you provide a name, Venn presents the proposed pipeline and its rules.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FW8dhbf3XvEgb56Wm9Kd6%2Fpipeline-with-review-btn.png?alt=media&#x26;token=58811ba6-d8d3-47ad-84d0-2b3a53e708f6" alt=""><figcaption></figcaption></figure>

Click **Review** to open the pipeline builder with the drafted rules.

In the **Pipeline Preview** section, select the namespace and application on the **IN** tab. This selection provides logs for the preview. It does not associate the pipeline with the dataflow.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FjRfUCmsg2JcGDkbwmx3s%2FScreenshot%20from%202026-07-21%2013-46-48.png?alt=media&#x26;token=67168afe-f698-4ddd-9ffc-810494a0879d" alt=""><figcaption></figcaption></figure>

Select the **DIFF** tab in **Pipeline Preview** to validate the rule changes.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FyCHKL4XxP5NAg3fMrYRy%2Freview-pipeline-rules.png?alt=media&#x26;token=c7dd6454-a08e-484a-86b0-756745212393" alt=""><figcaption></figcaption></figure>

Use the left and right arrows to view the previous and next logs. This view shows which logs the pipeline filters. The following screenshot shows a filtered log.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FLAroIPRc1uyUaBY6NyOs%2Freview-pipeline-results.png?alt=media&#x26;token=d3dbac1f-5e3e-46cd-b33d-e91aad1aab59" alt=""><figcaption></figcaption></figure>

When you are satisfied with the preview, click **Save**. Then use **Apply Pipeline** to associate the pipeline with the namespace and application. The rules process incoming data only after you apply the pipeline.

#### Example: redact user name from access-logs

Ask: _"Redact user name from access-logs."_

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FKnW5HQApXKRwbin90vJR%2Fredact-pipeline.png?alt=media&#x26;token=8e56e4c7-7318-471b-bc2b-c3d2f3da82a8" alt=""><figcaption></figcaption></figure>

The suggested pipeline with the redaction review of the logs is shown below.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FziHmSC68flNwIELf90NE%2Fredact-pipeline-review.png?alt=media&#x26;token=6af6b08f-44bd-4488-8364-f1b9b4e0e38a" alt=""><figcaption></figcaption></figure>

Click the **Review** button.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FpV1dnBHbTPj56p7c5OKH%2Fpipeline-review.png?alt=media&#x26;token=73c96b76-01e8-4bb8-b9f3-2b8e49fec9b0" alt=""><figcaption></figcaption></figure>

Use the **DIFF** view to validate the rule's output.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FDRaPZ0jV461fN0Wv61yH%2Fpipeline-review-results.png?alt=media&#x26;token=77fec434-d0d5-41a2-8afc-d1ac2f56faf7" alt=""><figcaption></figcaption></figure>

***

### 3. The rule kinds

Rules are added from the **Add Rule** menu in the builder. Ask Venn for any of these in plain language, or add them yourself.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FMef98Zf25OKavcp9KQge%2FScreenshot%20from%202026-07-21%2016-22-31.png?alt=media&#x26;token=dc60303e-b1ec-4fb8-9a4d-20f295668253" alt=""><figcaption></figcaption></figure>

#### Filter

* **What it does:** Excludes whole events, or strips low-value labels off an event, to save storage and processing.
* **When to use:** Cut ingest volume and cost by dropping noise.
* **Ask Venn:** _"Drop debug-level logs from the checkout service."_

#### Rewrite

* **What it does:** Masks or replaces sensitive information using pattern matching — mainly PII redaction.
* **When to use:** Redact emails, tokens, card numbers, etc.
* **⚠️ Caveat:** Redaction is **permanent** — the original value is not recoverable once masked. Check the before → after preview first.
* **Ask Venn:** _"Mask all email addresses in the auth logs."_

#### Code

* **What it does:** Runs a small custom script on each event, for logic a filter or rewrite can't express (parse, transform, enrich).
* **When to use:** Advanced, one-off transformations.
* **Ask Venn:** _"Write a rule that adds a field marking events over 500ms as slow."_

#### Extract

* **What it does:** Parses unstructured log text into structured fields using a pattern with named captures — each captured piece becomes its own field.
* **When to use:** Turn raw log lines into queryable fields.
* **Ask Venn:** _"Extract the status code and latency from my nginx logs."_

#### Aggregate

* **What it does:** Applies statistical functions (count, sum, average, min, max, median, percentiles, distinct…) over a time window. The result can be added back onto the event or turned into a metric.
* **When to use:** Summarize high-volume events into counts or rates.
* **Ask Venn:** _"Count errors per service every minute."_

#### Forward

* **What it does:** Chooses which events (and which fields) are forwarded to downstream destinations, to lower EPS and cost. The original is retained in storage.
* **⚠️ Caveat:** Forward rules **cannot be mixed** with other rule types — a forward rule needs its **own pipeline**.
* **Ask Venn:** _"Forward only error logs to the SIEM destination."_

#### Stream

* **What it does:** Redirects incoming logs by changing their Namespace and Application. By default it **copies** the events; if the originals are dropped it effectively **moves** them.
* **When to use:** Route a subset of logs to a different namespace/app.
* **Ask Venn:** _"Send audit logs to the security namespace."_

#### SIEM

* **What it does:** Matches known security signatures/patterns and turns matches into a real-time metric. Can optionally add a dashboard widget and an alert.
* **⚠️ Note:** Any alert it creates starts **disabled** — enable it when you're ready.
* **Ask Venn:** _"Detect failed SSH login attempts."_

#### Tag

* **What it does:** Identifies interesting events based on evaluation criteria and tracks them in real time.
* **When to use:** Flag and follow events matching a condition.
* **Ask Venn:** _"Tag every event mentioning 'OutOfMemory'."_

> A pipeline with no rules shows: _"No rules have been configured for this pipeline. Select '+ Add Rule' to configure new rule."_

***

### 4. Editing an existing pipeline

**Refine a suggestion:** with the builder open, just ask Venn again — _"make the filter also drop info logs"_ — and the rules **refresh live** in the builder, replacing the previous AI suggestion. Your own rules stay put.

**Structural changes** (without regenerating rule content) — Venn shows a card for each:

| You ask                                    | Card label          | What happens             |
| ------------------------------------------ | ------------------- | ------------------------ |
| Change rule order                          | **Reorder rules**   | Execution order updated  |
| Remove rules                               | **Delete rules**    | Named rules removed      |
| Rename the pipeline / edit its description | **Rename pipeline** | Name/description updated |

Click **Review** on the card to apply it. These act on the pipeline **currently open in the builder** — if it isn't open you'll see _"Open the pipeline in the builder to apply this change."_ Once applied, the card reads **"Applied to the pipeline."** All rule kinds are preserved — nothing gets regenerated or lost.

#### Example: reorder the pipeline rules — swap rule #1 with rule #3

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2F7cXBhyimBLc6DutbcJGt%2Fpipeline-reorder-rules.png?alt=media&#x26;token=0af3da6e-234a-4f10-b5c8-481d0b6bf4a2" alt=""><figcaption></figcaption></figure>

After reordering the rules:

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2F71BAiK8GZIhDvtMOf8cF%2Fpost-reorder-rules.png?alt=media&#x26;token=ace054c6-6509-42b9-9553-1e537b7ac7a4" alt=""><figcaption></figcaption></figure>

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2Ft09ULdd0YV8kqOJEx1Ij%2Fpipeline-ordered-rules.png?alt=media&#x26;token=9f815803-71f1-4d5d-8031-279ffeec3ad7" alt=""><figcaption></figcaption></figure>

***

### 5. Deleting rules — you approve, always

Deleting rules needs **your explicit approval**. Venn cannot approve a deletion on its own — you confirm it before anything is removed. This is a safety guard so an AI request can never quietly drop rules you meant to keep.

#### Example: delete rule #3 from the pipeline

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FgvtGBcjwjMsfzu8OyhHJ%2Fdelete-rule.png?alt=media&#x26;token=589c8306-b611-433c-83c1-3207c9baa9bc" alt=""><figcaption></figcaption></figure>

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FcE5W35a37DusCNe8dbox%2Fdelete-confirm.png?alt=media&#x26;token=0e3c7133-da87-4e74-8226-f1b5da832e55" alt=""><figcaption></figcaption></figure>

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2Fck44PXU4pUp47zVeAcjv%2Fdelete-approve.png?alt=media&#x26;token=0cefad2f-8de1-44e7-9d13-4b222b6b686d" alt=""><figcaption></figcaption></figure>

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FE0ju63i4GoR7mSObtfy4%2Fdeleted-rule.png?alt=media&#x26;token=27e10429-5b82-4b65-a145-d6049f8888cd" alt=""><figcaption></figcaption></figure>
