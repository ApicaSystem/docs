# Using Multiple Operators in an Assignment Rule

Sometimes you may need to perform operations in assignment rules that use operators such as ‘Add’, ‘Subtract’, etc.  (Note that ‘Add’ is both a mathematical operator – add the values of two fields together – and also a text concatenation operator – add one string to the end of another string.)

&#x20;

To perform these operations, you send the multiple operators in a single ‘operands’ array, as shown below where we are assigning the value from the ‘balance’ field in the acts\_view to ‘test\_number’, and then subtracting 525 from that value.

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
                    "attribute": "test_number",           
                     "operands": [
                      {
                               "operator": "ASSIGN",
                               "value": {
                                "name": "acts_view",
                                "version": "1.0",
                               "attribute": "balance"
                     }
            },
                      {
                               "operator": "SUBTRACT",
                               "value": "525"
                     }
        ]
          }
}
```

&#x20;

When run in TDO, the response message for a successful call will look very similar to other rules assignment messages.  Both of the operators and their values will be reflected in the return message.

<figure><img src="../../../../../../.gitbook/assets/image (801).png" alt=""><figcaption><p>Return Message using multiple operators</p></figcaption></figure>

In TDO, after this call runs, you will see the rule assigned to the field.

<figure><img src="../../../../../../.gitbook/assets/image (802).png" alt=""><figcaption><p>Assignment Rule with multiple operators</p></figcaption></figure>
