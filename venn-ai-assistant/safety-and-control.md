---
description: >-
  The rules Venn always follows: review before save, explicit approval for
  destructive actions, and no secrets through the model, ever.
---

# Safety and Control

Venn is designed so that using an AI assistant near production systems is boring, in the best way. Five rules apply everywhere and cannot be talked around:

### 1. You review before anything is saved

Everything Venn creates (pipelines, dashboards, alerts, SLOs, queries, data sources, forwarders, agents, configurations) arrives as a draft in the real create form or builder, marked as AI-prefilled. It becomes real only when you press Save. There is no auto-save path.

### 2. Destructive actions need your explicit approval

Deletes and replacements pause on a confirmation card, and the approval is enforced by the server, not by the model: Venn cannot approve its own request, and a cleverly worded prompt cannot skip the step. The same applies to external MCP clients through a mandatory confirm round-trip. Delete capability is also off by default: an administrator must enable delete tools in [Admin Settings](administer-venn.md) before Venn or any connected MCP client can delete anything at all.

### 3. Secrets never pass through the model

Venn refuses credentials in chat. When a resource needs a password, token, or key, the pre-filled form opens with that field blank and you type the secret directly into the UI under your own session. Credentialed creation is not even exposed to external MCP clients.

### 4. Venn sees only what you can see

Venn acts with your user's permissions. Internal system data sources that the product blocks in Data Explorer are blocked for Venn too, so platform-internal data does not leak into a chat.

### 5. Venn stays on topic

Venn answers observability and Apica Ascent questions. It declines everything else (general knowledge, unrelated coding, legal or financial or medical advice) and it is instructed to resist attempts to talk it out of these rules through role-play or hypotheticals.

### Cost visibility

Every Venn conversation meters its own model usage (tokens and cost per turn), giving administrators the raw data to watch AI spend. See [Administer Venn](administer-venn.md) for provider configuration.
