# Using the FORMAT Function in an Assignment Rule

When you want to assign a value using the FORMAT function (e.g., assign the current date to a date field in a specific format) you need to add the ‘function’ parameter to the ‘operand’ section of the message, and then the actual formatting string in the ‘value’ section.

&#x20;

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
    "entity": {
        "step": {
            "name": "imp_enter_details",
            "version": "1.0"
        },
        "attribute": "test_string",      
        "operands": [
            {
                "operator": "ASSIGN",
                "function": "FORMAT",
                "value": "%D|yyyy-MM-dd"
            }      
        ]
    }
}
```

&#x20;

The return message will include the information on the rule that you created.

<figure><img src="../../../../../../.gitbook/assets/image (803).png" alt=""><figcaption><p>Return message using FORMAT function</p></figcaption></figure>

In TDO, you can now see the rule that you created.

<figure><img src="../../../../../../.gitbook/assets/image (804).png" alt=""><figcaption><p>Assignment Rule using FORMAT function</p></figcaption></figure>
