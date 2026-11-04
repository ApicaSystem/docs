# Delete Business Rule

This call is sent as a DELETE call. You can only delete one rule at a time using this call, as the rule ID is part of the header.

The body of this call is the same as the details calls, only containing the context.

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
    }
}
```

For this call, we are sending the ID for the third rule in the ‘Get All Details’ call illustrated earlier. The return message simply shows a successful call.

<figure><img src="../../../../../.gitbook/assets/image (305).png" alt=""><figcaption><p>Results of delete rule API</p></figcaption></figure>

Viewing the business rules in TDO after this call is sent, you can see that the third business rule is no longer present.

<figure><img src="../../../../../.gitbook/assets/image (306).png" alt=""><figcaption><p>Rule deleted from TDO</p></figcaption></figure>
