---
description: >-
  Ascent ships a standards-compliant MCP server, so you can work with your
  observability data from Claude Code, Claude Desktop, Cursor, or any MCP
  client, using your own Ascent token.
---

# Connect Your Own AI Client (MCP)

Everything Venn does runs on tools served by Ascent's built-in MCP (Model Context Protocol) server. That same server is exposed to your own AI tools, so you can search logs, manage alerts and SLOs, inspect pipelines, and control your fleet from the assistant you already use.

### Endpoint and authentication

* Endpoint: `POST https://<your-ascent-host>/v1/mcp`
* Transport: streamable HTTP (stateless), JSON-RPC 2.0
* Authentication: `Authorization: Bearer <your Ascent token>`

Your token carries your own permissions: an MCP client can do no more than your user can do in the UI.

### Set up your client

**Claude Code**

```bash
claude mcp add ascent --transport http https://<your-ascent-host>/v1/mcp \
  --header "Authorization: Bearer <your-token>"
```

**Claude Desktop** (via `mcp-remote`)

```json
{
  "mcpServers": {
    "ascent": {
      "command": "npx",
      "args": [
        "mcp-remote",
        "https://<your-ascent-host>/v1/mcp",
        "--header",
        "Authorization: Bearer <your-token>"
      ]
    }
  }
}
```

**Cursor**

```json
{
  "mcpServers": {
    "ascent": {
      "url": "https://<your-ascent-host>/v1/mcp",
      "headers": { "Authorization": "Bearer <your-token>" }
    }
  }
}
```

Verify the connection by asking your client: _"ping the Ascent MCP server"_ (it answers with your authenticated username) or _"list my Ascent namespaces"_.

### What you can do over MCP

* Search, tail, and summarize logs; discover namespaces and applications
* Alert and SLO lifecycle: list, get, create, update, mute; plus delete once your administrator enables delete tools
* List and explain pipelines, check dataflow health, attach pipelines to dataflows, enable and disable them
* Manage dashboards, queries, and data sources; run log replays
* Manage Fleet agents, configurations, and packages
* Manage forwarders and their routing (non-credentialed types)
* Search the Apica documentation

Delete capability is disabled by default across both Venn and MCP: an administrator turns it on in **Settings > Admin Settings** (see [Administer Venn](administer-venn.md)), and the change applies to connected clients immediately. Even with it enabled, destructive operations (deletes, replacing a dataflow's pipelines) are refused on the first call and return a confirmation token; your client calls again with `confirm: true` to proceed. The server enforces this; a model cannot skip it.

### What stays in the Ascent UI on purpose

Some flows exist only in the in-product Venn chat, where a human can review a visual diff or type a secret into a form. Over MCP these tools are absent, and the server's instructions tell your client where to send you instead:

* Drafting pipeline **rule content** (the builders behind [Pipelines with Venn](pipelines-with-venn.md))
* Dashboard prepare and live-edit flows
* Creating credentialed resources: forwarders with secrets, data sources, alert destinations, source extensions
