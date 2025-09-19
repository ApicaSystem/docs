# Webhooks

1. Define the Webhook name, Example "Critical MS Teams Webhook"
2. Set the Webhook URL where the payload will be sent.
3. Username and password are automatically filled in.

<figure><img src="../../../.gitbook/assets/image (568).png" alt="" width="388"><figcaption></figcaption></figure>

1.  Configure the Field Mapper to extract and rename fields in the payload for better useability. (Optional)

    ```
    {
      "alert_id": "alert.id",
      "name": "alert.name",
      "severity": "alert.severity"
    }
    ```
2.  Configure the Payload Mapper to define the structure and content of the outgoing payload sent to the Webhook. (Optional)&#x20;

    ```
    {
      "alert_id": "{{ alert_id }}",
      "name": "{{ alert_name }}",
      "severity": "{{ alert_severity }}"
    }
    ```

Here is an example of the raw JSON payload being sent after an alert triggered:

```
{
  "event": "alert_state_change",
  "alert": {
    "id": 98,
    "name": "Webhook Test",
    "options": [
      {
        "alertType": "simple alert",
        "anomalySwitch": false,
        "column": "value",
        "op": "!=",
        "selectionCondition": "any",
        "timeColumn": "timestamp",
        "value": 0,
        "muted": false,
        "trackDuration": 15,
        "severityType": "critical"
      }
    ],
    "state": "ok",
    "last_triggered_at": "2025-01-28T17:29:16.088Z",
    "updated_at": "2025-01-28T17:29:16.084Z",
    "created_at": "2025-01-28T16:59:33.174Z",
    "rearm": null,
    "query_id": 514,
    "user_id": 1,
    "severity": "info",
    "rows": []
  },
  "url_base": "test-instance.apica.io"
}
```

Utilize a Webhook tester such as [https://webhook.site/](https://webhook.site/) or similar to test for desired results.
