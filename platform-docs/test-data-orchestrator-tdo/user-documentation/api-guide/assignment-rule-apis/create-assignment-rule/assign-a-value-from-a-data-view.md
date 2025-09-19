# Assign a Value from a Data View

The API call remains the same.  The body varies only in the ‘entity’ section.  In the straight text assignment above, the ‘value’ section contains only the string to be assigned.  Here, in the ‘value’ section, we include three additional items from the data view to be used as the data source:  the data view name, it’s version, and the name of the attribute from the data view to be used.

&#x20;

```
{
    "context": {
        "user": "usef_id",
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
        "step": {
            "name": "imp_validate_outcomes",
            "version": "1.0"
        },
        "attribute": "test_string",
        "operands": [
            {
                "operator": "ASSIGN",
                "value": {
                    "name": "cust_data_view",
                    "version": "1.0",
                    "attribute": "customer_type"
                }
            }
        ]
    }
}
```

&#x20;

In Postman, the call looks like this:

<figure><img src="../../../../../../.gitbook/assets/image (797).png" alt=""><figcaption><p>Rule in Postman</p></figcaption></figure>

The return message (for a successful call) is the same as for the prior call, showing all of the details for the rule created:

<figure><img src="../../../../../../.gitbook/assets/image (798).png" alt=""><figcaption><p>Return message in Postman</p></figcaption></figure>

In TDO, you can see the new rule.

<figure><img src="../../../../../../.gitbook/assets/image (799).png" alt=""><figcaption><p>New Rule in TDO</p></figcaption></figure>
