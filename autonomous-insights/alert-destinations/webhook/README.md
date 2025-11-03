---
description: Webhook Alert Destination
---

# Webhook

## Overview

Webhook destinations allow Ascent to send real-time alert notifications to any external system that supports HTTP endpoints (such as Microsoft Teams, Slack, ServiceNow, PagerDuty, or custom APIs).\
When an alert changes state (e.g., from _OK_ to _Triggered_), Ascent automatically sends an HTTP POST request containing detailed alert data to the configured webhook URL.

***

### Creating a Webhook Destination

1. **Go to:**\
   **Settings → Alert Destinations → Create New Destination**
2. **Select Destination Type:**\
   Choose **Webhook** from the available destination types.
3. **Fill in Configuration Details:**

| Field              | Description                                                                          | Required |
| ------------------ | ------------------------------------------------------------------------------------ | -------- |
| **Name**           | Friendly name for the destination (e.g., “Critical MS Teams Webhook”)                | ✔        |
| **URL**            | The webhook endpoint URL provided by your target system. Must begin with `https://`. | ✔        |
| **Username**       | Optional HTTP Basic Auth username (if required by your endpoint).                    | ✖        |
| **Password**       | Optional HTTP Basic Auth password.                                                   | ✖        |
| **Field Mapper**   | Optional key-value remapping for the webhook payload (explained in sub-page).        | ✖        |
| **Payload Mapper** | Optional top-level wrapper for the entire JSON payload (explained in sub-page).      | ✖        |

Once you’ve entered all required fields, click **Create** to save the destination.

***

#### Example Configuration

| Field          | Example Value                              |
| -------------- | ------------------------------------------ |
| Name           | `Critical MS Teams Webhook`                |
| URL            | `https://webhook.office.com/webhookb2/...` |
| Username       | `devops@apica.io`                          |
| Password       | `********`                                 |
| Field Mapper   | `event:@type,alert:sections`               |
| Payload Mapper | _(leave blank)_                            |

In this example, the user configures a webhook destination named **Critical MS Teams Webhook**.\
The destination includes Basic Authentication credentials and can optionally define mapping logic to match Microsoft Teams’ JSON structure.

***

### Authentication Support

Webhook destinations support optional **Basic Authentication**:

* If your webhook endpoint requires authentication, specify a **Username** and **Password**.

If no credentials are specified, Ascent sends the webhook request unauthenticated.

***

### Default Payload Structure

By default, each webhook event is sent as a JSON payload containing:

```json
{
  "event": "alert_state_change",
  "alert": {
    "id": 123,
    "name": "CPU Utilization High",
    "state": "triggered",
    "severity": "critical",
    "rows": [...]
  },
  "url_base": "https://your-apica-instance.com"
}
```

You can further customize this structure using **Field Mapper** and **Payload Mapper**, which are described in the next section.



