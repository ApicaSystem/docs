# Using Conditions in Assignment Rules

When using conditions in assignment rules, you will need to send each condition in a separate API call.  This is because each condition is creating a different rule, and only one rule can be sent per API.

In this example, we are using the account currency (GBP or USD) to set the value for a numerical field (test\_number).  In the first call, our body will look like this:

&#x20;

```
{
    "context": {
        "user": “user_id",
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
        "attribute": "test_number",
        "conditions": [
            {
                "operand": {
                    "name": "format_cov_view",
                    "version": "1.0",
                    "attribute": "currency_a"
                },
                "operator": "EQUAL",
                "value": "GBP"
            }
        ],
        "operands": [
            {
                "operator": "ASSIGN",
                "value": "100"
            }      
        ]
    }
}
```

&#x20;

&#x20;

Here, we are setting the condition that if the ‘currency\_a’ field is equal to ‘GBP’ then the field should be set to ‘100’.  For the second rule, below, we are setting the condition to ‘if currency\_a equals USD then test\_number is 500’.

```
{
    "context": {
        "user": "user_ID",
        "password": "XXXX",
        "project": {
            "name": "imp_payments_demo",
            "version": "1.0"
        },
        "workSet": {
            "name": "api_2_workset",
            "version": "1.1"
        }
    },
    "workSet": {
            "name": "api_2_workset",
            "version": "1.1"
    },
    "entity": {
        "step": {
            "name": "imp_validate_outcomes",
            "version": "1.0"
        },
        "attribute": "test_number",
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
        ],
        "operands": [
            {
                "operator": "ASSIGN",
                "value": "500"
            }      
        ]
    }  
}
```

&#x20;

The return messages are the same as for the other assignment rule calls.  In TDO, after running both of these calls, the assignment rules page now reflects this.  Each rule is shown individually on the page and sets the value per the rule only if the condition is equal to what was stated.

<figure><img src="../../../../../../.gitbook/assets/image (800).png" alt=""><figcaption><p>Assignment Rules with Conditions</p></figcaption></figure>
