# LogicMonitor Forwarder (via JS Forwarder)

This guide explains how to forward logs from **Apica Ascent / Flow** to **LogicMonitor** using **JS Code Forwarding** (custom forwarder). This approach is recommended when the destination does **not** provide a native OTLP ingestion endpoint for logs, and instead expects **REST/JSON** (as LogicMonitor does).

***

### Overview

LogicMonitor’s **Logs Ingestion API** accepts log events over HTTPS as **JSON** (REST API), and supports authentication using **LMv1 tokens** or **Bearer tokens**.

Apica’s **JS Code Forwarding** lets you take the batched events Apica has ingested (`Events`) and forward them to a custom HTTP endpoint using `fetchSync(url, cfg)`.

***

### Prerequisites

* Logs are already being ingested into **Apica Ascent**
* You have permission in Apica to create and map forwarders
* You have a **LogicMonitor account name** (subdomain) and an API auth method:
  * **Bearer token** (recommended for simplicity), or
  * **LMv1 token** (requires request signing)

***

### LogicMonitor endpoint and authentication

#### Endpoint

LogicMonitor Logs Ingestion API endpoint format:

```
https://<LM_ACCOUNT>.logicmonitor.com/rest/log/ingest
```

#### Authentication options

LogicMonitor documents two supported auth methods for the log ingestion API:

* **Bearer token**
* **LMv1 API token** (`Authorization: LMv1 <AccessId>:<Signature>:<Timestamp>`)

> **Recommendation:** Use a **Bearer token** for the JS forwarder when possible, because LMv1 requires generating an HMAC signature per request. LogicMonitor provides background on bearer tokens in their docs.

***

### Create the JS Code Forwarder in Apica

1. In the **Ascent UI**, navigate to **Forwarders**
2. Select **Create Forwarder**
3. Choose **JS Code Forwarding**
4. Paste a JS script similar to the examples below
5. Save the forwarder

Apica’s JS code environment provides:

* `Events`: a batch array of ingested events
* `fetchSync(url, cfg)`: synchronous HTTP request helper
* `console.log()` for debugging

***

### Example: Forward logs to LogicMonitor using a Bearer token (recommended)

> LogicMonitor requires log events to include `msg` or `message` (the log message). This example maps whatever message field you have into `msg`.

```javascript
/**
 * Apica JS Code Forwarder -> LogicMonitor Logs Ingestion API
 *
 * Prereqs:
 * - Replace LM_ACCOUNT and LM_BEARER_TOKEN
 * - Ensure each event maps to a `msg` (or `message`) field required by LogicMonitor
 */

const LM_ACCOUNT = "<LM_ACCOUNT>"; // e.g., "acme"
const LM_BEARER_TOKEN = "<LM_BEARER_TOKEN>";

const url = `https://${LM_ACCOUNT}.logicmonitor.com/rest/log/ingest`;

// Convert Apica Events -> LogicMonitor ingestion schema
const payload = Events.map(e => {
  // Depending on your event shape, your raw log may be at e, e.event, or e.body
  const ev = e.event ?? e;

  return {
    // LogicMonitor requires msg/message
    msg: ev.message ?? ev.msg ?? ev.log ?? JSON.stringify(ev),

    // Optional: include a timestamp if you have one
    // Use epoch ms or ISO-8601 depending on your source format
    timestamp: ev.timestamp ?? e.timestamp,

    // Optional: pass through useful context
    // level: ev.level,
    // service: ev.service?.name,
    // host: ev.host?.name
  };
});

const cfg = {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
    "Authorization": `Bearer ${LM_BEARER_TOKEN}`,
  },
  body: JSON.stringify(payload),
};

const resp = fetchSync(url, cfg);
console.log("LogicMonitor ingest response:", resp);
```

This uses Apica’s `fetchSync` and the built-in `Events` array.

***

### Example: Using LMv1 authentication (advanced)

LogicMonitor’s docs show the LMv1 Authorization header format required by the log ingestion API.

Because LMv1 requires generating `Signature` (HMAC-SHA256 + Base64) per request, use this option only if:

* you must use LMv1, and
* your Apica JS environment supports the necessary crypto functions (or you have an approved implementation approach).

> If you want, tell me whether Apica JS forwarder runtime includes crypto helpers (or show me your “available functions” list from that editor), and I’ll provide an LMv1-ready snippet.

***

### Map the forwarder to your log sources

Creating the forwarder does not automatically forward all logs. After saving it:

1. Go to **Explore**
2. Select the application/namespace you want to forward
3. Use the **Actions (⋯)** menu
4. Select **Map Forwarder**
5. Choose your **JS Code Forwarding** forwarder
6. Save

(Forwarder mapping is part of the standard Apica forwarding workflow.)
