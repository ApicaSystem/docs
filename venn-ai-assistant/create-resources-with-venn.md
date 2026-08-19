---
description: >-
  Venn sets up data sources, alert destinations, forwarders, source extensions,
  replays, and Fleet agents by pre-filling the real create forms for you to
  review and save.
---

# Create Resources with Venn

All of Venn's setup flows follow one pattern, so they all feel the same:

1. **You describe** what you want in chat.
2. **Venn stages a draft** and shows a card in the conversation.
3. **The real create form opens pre-filled** with Venn's draft.
4. **You review, complete, and save.** Anything secret (passwords, tokens, API keys) is left blank for you to enter directly in the form. Secrets never pass through the chat.

What you can set up this way:

| Resource                          | Example prompt                                                                                                        |
| --------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| Data sources                      | _"Add a Prometheus data source for our staging cluster"_                                                              |
| Alert destinations                | _"Set up a Slack destination for the on-call channel"_                                                                |
| Forwarders                        | _"Create a Datadog forwarder for the prod namespace"_                                                                 |
| Source extensions (input plugins) | _"Set up a Kafka source extension for the events topic"_                                                              |
| Log replays                       | _"Replay yesterday's payment logs between 2 and 3 pm to the new forwarder"_                                           |
| Fleet agent install               | _"Install a telemetry agent on Linux for the prod namespace"_                                                         |
| Fleet configurations              | _"Draft an agent configuration that collects nginx access logs"_                                                      |
| Queries and SLOs                  | See [Dashboards and queries](dashboards-and-queries-with-venn.md) and [Alerts and SLOs](alerts-and-slos-with-venn.md) |

### Fleet management beyond setup

Once agents exist, Venn manages them conversationally too:

* _"List my fleet agents"_, _"which agent types are available?"_
* _"Restart the agents in the staging namespace"_ (start, stop, and restart)
* _"Update the nginx collection config"_ and assign packages to agents

### Forwarders beyond setup

* _"List my forwarders and where they send data"_
* _"Make S3-archive the default forwarder"_
* _"Route checkout logs in prod to the Splunk forwarder"_, _"remove that routing"_

Forwarders whose configuration includes credentials are created through the pre-filled form flow above, where you enter the secret yourself. Non-credentialed forwarder types can be created and updated directly in the conversation.
