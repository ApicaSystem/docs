# Update Assignment Rule

This call is used to change an assignment rule. The existing assignment rule for this field is a simple assignment from the customer view.

<figure><img src="../../../../../.gitbook/assets/image (809).png" alt=""><figcaption><p>Existing rule to be updated</p></figcaption></figure>

We will change the field being assigned, and add a condition to the rule.

This call is sent as a PATCH call.

<figure><img src="../../../../../.gitbook/assets/image (810).png" alt=""><figcaption><p>Update rule call</p></figcaption></figure>

The body of the call contains the information being sent to update the rule.  The project and workset are sent to set the context.  The entity is sent using the rule ID from the Get Assignment Rules call (67ea97d49df32c722419d903) to point to the specific rule being updated.  Finally, the call contains the operand and conditions to be sent (using the same format as when creating a rule with operands and conditions).

&#x20;

```
{
    "context": {
        "user": "user_ID",
        "password": "xxxx",
        "project": {
            "name": "imp_payments_demo",
            "version": "1.0"
        },
        "workSet": {
            "name": "api_2_workset",
            "version": "1.1"
        }
    },
    "entity": {
        "id": "67ea97d49df32c722419d903",
        "operands": [
            {
                "operator": "ASSIGN",
                "value": {
                    "name": "acts_view",
                    "version": "1.0",
                    "attribute": "account_type"
                }
            }  
        ],
      "conditions": [
            {
                "operand": {
                    "name": "format_cov_view",
                    "version": "1.0",
                    "attribute": "currency_a"
                },
                "operator": "EQUAL",
                "value": "USD"
            }
        ]  
    }
}
```

&#x20;

The return message contains the information on the updated rule.

<figure><img src="../../../../../.gitbook/assets/image (811).png" alt=""><figcaption><p>Return message with upated rule </p></figcaption></figure>

TDO now reflects the updated rule. The view and field being assigned are updated and the condition is now there as well.

<figure><img src="../../../../../.gitbook/assets/image (812).png" alt=""><figcaption><p>Updated rule in TDO</p></figcaption></figure>
