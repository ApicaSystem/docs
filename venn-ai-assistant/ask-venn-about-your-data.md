---
description: >-
  Search, tail, and summarize logs, metrics in plain language, check dataflow
  health, and get documentation answers without leaving the chat.
---

# Ask Venn About Your Data

### Search logs in plain language

Ask for what you want to see; Venn builds and runs the search and shows matching log lines inline in the chat, color-coded by severity.

* _"Show me errors from the payments app in prod in the last 2 hours"_
* _"Find logs mentioning timeout in the checkout namespace"_
* _"Any warnings from nginx today?"_

How it behaves:

* If you do not give a time range, Venn searches the **last hour** by default.
* Results are paginated: **100 lines per page, up to 1,000 lines** per search. Ask for "more" or "the next page" to continue the same search.
* Alongside log lines, results include a breakdown of the fields in the result set (services, severities, hosts) and, where available, recurring message patterns with counts, so you can see the shape of the traffic at a glance.

**Power users**: you can give Venn precise field-level filters and it will use an expression instead of a plain keyword, for example: _"search the prod namespace where severityString is ERROR and message matches timeout"_. Boolean combinations and regular expressions are supported.

### Tail logs live

Ask Venn to watch live traffic for a bounded window:

* _"Tail the prod namespace for 60 seconds"_
* _"Watch the checkout app for errors for two minutes"_

Venn collects up to **120 seconds or 500 lines**, whichever comes first, then returns the batch together with a short summary: severity counts, the busiest applications and hosts, and repeated patterns. Tailing is a single bounded batch, not a continuous stream.

### Summarize what you found

After a search, ask:

* _"Summarise these logs"_
* _"Summarise the last search, focus on errors only"_

Venn produces a triage-ready summary: grouped errors, recurring patterns, and likely-cause hints. You can steer the focus (errors, performance, security). Summaries work on your most recent search results; after roughly 10 minutes Venn re-runs the search first.

### Check dataflow health

* _"Which dataflows have the most errors in the last 24 hours?"_

Venn scans error and warning volumes per dataflow over your chosen window (15 minutes up to 7 days) and lists the worst offenders first, with a severity breakdown. Venn also explains what makes up the totals: on many environments a large "critical" count comes from synthetic check states rather than application errors, and Venn calls that out instead of quoting a scary number.

### Documentation answers in the same chat

Ask how-to and concept questions right in the conversation:

* _"How do I configure a Kafka source?"_
* _"What is a stream rule?"_

Venn answers from the Apica documentation with links to the relevant pages, and decides on its own when a question needs the docs and when it needs your live data.
