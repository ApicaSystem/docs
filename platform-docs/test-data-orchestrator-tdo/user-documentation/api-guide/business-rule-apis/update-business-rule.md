# Update Business Rule

This is a PATCH call as opposed to a POST call.

<figure><img src="../../../../../.gitbook/assets/image (297).png" alt=""><figcaption><p>Update business rule API call</p></figcaption></figure>

In the body of the message, the ‘entity.ID’ is now a required field. We will update the complex rule created above. The ‘has\_online’ determining attribute is being updated to include both ‘true’ and ‘false’ and the ‘currency\_a’ attribute is being updated to include both USD and GBP currencies. Note that you must include all values that were set in the original rule that you want to keep in the modified rule. If you do not include a value that was set in the original rule it will be deleted.

```
{
    "context": {
        "user": "mbj_test",
        "password": "xxxx",
        "project": {
            "name": "imp_payments_demo",
            "version": "1.0"
        },
        "coverage" : {
            "name": "api_demo_coverage",
          "version": "1.2"
        }
    },
    "entity": {
        "id": "674dd0fb59c7b96171b5a8fa",
        "conditions": {
          "has_app": {"values": ["0"]},
          "acct_type": {"values": ["Checking","Savings"]},
          "has_online": {"values": ["1","0"]},
          "currency_a": {"values": ["USD","GBP"]},
          "customer_type": {"values": ["Retail"]}
    }
    }
}
```

The return message shows the values that were sent.

<figure><img src="../../../../../.gitbook/assets/image (298).png" alt=""><figcaption><p>Update business rule return message</p></figcaption></figure>

In TDO the rule now reflects the new values for ‘has\_online’ and ‘currency\_a’.

<figure><img src="../../../../../.gitbook/assets/image (299).png" alt=""><figcaption><p>Updated business rule in TDO</p></figcaption></figure>
