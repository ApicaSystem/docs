# Webhook Destination Field and Payload Mappers

### Overview

The **Webhook Destination** in Ascent allows you to customize the structure of webhook payloads before they are sent to your external systems.\
Two optional configuration parameters are available:

* **`field_mapper`** - remaps or restructures fields inside the webhook payload
* **`payload_mapper`** - wraps the entire payload under a custom root field

These options provide flexibility for integrating alerts with third-party systems that expect a specific JSON schema.

***

### Configuration

#### JSON Schema

```json
{
  "url": "https://your-webhook-endpoint.com/webhook",
  "username": "optional_username",
  "password": "optional_password",
  "field_mapper": "source_field:destination_field,nested.field:nested.destination",
  "payload_mapper": "optional_wrapper_field"
}
```

#### Default Payload (No Mappers)

If no mappers are configured, webhook payloads have this default structure:

```json
{
  "event": "alert_state_change",
  "alert": {
    "id": 123,
    "name": "Alert Name",
    "state": "triggered",
    "severity": "info",
    "rows": [
      { "column1": "value1", "column2": "value2" }
    ]
  },
  "url_base": "https://your-apica-instance.com"
}
```

***

### Field Mapper

#### Purpose

The **`field_mapper`** parameter allows renaming or restructuring fields in the payload to match the format expected by the receiving system.\
It supports dot notation for nested fields and multiple mappings separated by commas.

#### Syntax

```
field_mapper: "source_field:destination_field"
```

**Examples of dot notation:**

* `alert.name:title` → moves `alert.name` → `title`
* `event:meta.type` → moves flat field `event` → nested `meta.type`
* `alert.severity:notification.level` → nested → nested mapping

#### Examples

**1. Simple field renaming**

```
field_mapper: "event:type,url_base:apica_url"
```

**Result:**

```json
{
  "type": "alert_state_change",
  "alert": {...},
  "apica_url": "https://..."
}
```

**2. Extract nested fields**

```
field_mapper: "alert.name:alert_name,alert.severity:severity_level"
```

**Result:**

```json
{
  "alert_name": "Alert Name",
  "severity_level": "high",
  "alert": {...},
  "url_base": "https://..."
}
```

**3. Create nested destinations**

```
field_mapper: "alert.name:notification.title,alert.severity:meta.level,event:meta.event_type"
```

**Result:**

```json
{
  "notification": { "title": "Database Alert" },
  "meta": { "level": "critical", "event_type": "alert_state_change" },
  "alert": {...}
}
```

**4. Mixed levels**

```
field_mapper: "event:notification_type,alert:data,alert.id:alert_id"
```

**Result:**

```json
{
  "notification_type": "alert_state_change",
  "data": {...},
  "alert_id": 123
}
```

#### Behavior Notes

* Dot notation supported for both source and destination.
* Whitespace around names is trimmed.
* Missing fields log warnings but don’t interrupt execution.
* Mapped fields are **moved**, not duplicated.
* Intermediate objects are auto-created for nested destinations.
* Type safety: existing non-object paths are not overwritten.

***

### Payload Mapper

#### Purpose

The **`payload_mapper`** wraps the entire webhook payload inside a single field.\
Useful for APIs that require a top-level object or “envelope.”

#### Syntax

```
payload_mapper: "wrapper_field_name"
```

#### Examples

**1. Basic wrapping**

```
payload_mapper: "data"
```

**Result:**

```json
{
  "data": {
    "event": "alert_state_change",
    "alert": {...},
    "url_base": "https://..."
  }
}
```

**2. Custom wrapper**

```
payload_mapper: "apica_notification"
```

**Result:**

```json
{
  "apica_notification": {
    "event": "alert_state_change",
    "alert": {...},
    "url_base": "https://..."
  }
}
```

#### Behavior Notes

* Wraps as a JSON object (not a string).
* Whitespace trimmed.
* All payload data (including alert rows) is preserved.

***

### Using Both Together

When both mappers are configured:

1. Base payload is built
2. `field_mapper` transformations are applied
3. `payload_mapper` wraps the final payload

#### Example

```json
{
  "field_mapper": "event:type,alert:notification",
  "payload_mapper": "webhook_data"
}
```

**Result:**

```json
{
  "webhook_data": {
    "type": "alert_state_change",
    "notification": {...},
    "url_base": "https://..."
  }
}
```

***

### Limitations

* **Silent failures:** Invalid mappings only log warnings.
* **Type conflicts:** Cannot create nested paths through non-object fields.
* **Fixed order:** field\_mapper runs before payload\_mapper.

Processing order:

```
1. Build base payload
2. Add trigger rows
3. Apply field_mapper
4. Apply payload_mapper
```

***

### Best Practices

#### For field\_mapper

* Use descriptive names for destination fields.
* Prefer hierarchical mappings to group related data.
* Trim extra spaces.
* Test transformations using a sample webhook receiver.

#### For payload\_mapper

* Use when integrating with systems requiring a wrapper field.
* Choose a meaningful top-level name (e.g., `data`, `payload`, `notification`).

***

### Advanced Examples

#### 1. Complex Restructuring

```
field_mapper: "alert.name:incident.title,alert.severity:incident.priority,alert.rows:incident.data,event:meta.source,url_base:meta.origin"
```

**Result:**

```json
{
  "incident": {
    "title": "Database Connection Alert",
    "priority": "high",
    "data": [{ "timestamp": "2024-01-01T10:00:00Z", "value": 95 }]
  },
  "meta": {
    "source": "alert_state_change",
    "origin": "https://apica.company.com"
  },
  "alert": { "id": 123, "state": "triggered" }
}
```

#### 2. Combined with Wrapper

```json
{
  "field_mapper": "alert.name:notification.subject,alert.severity:notification.level",
  "payload_mapper": "webhook_payload"
}
```

**Result:**

```json
{
  "webhook_payload": {
    "notification": { "subject": "Alert Name", "level": "critical" },
    "event": "alert_state_change",
    "alert": {...},
    "url_base": "https://..."
  }
}
```

***

### Example Configurations

| Integration Type          | Example Mapper Configuration                       |
| ------------------------- | -------------------------------------------------- |
| **Slack-style**           | `{"field_mapper": "event:text,alert:attachments"}` |
| **Generic Wrapper**       | `{"payload_mapper": "payload"}`                    |
| **Microsoft Teams-style** | `{"field_mapper": "event:@type,alert:sections"}`   |
