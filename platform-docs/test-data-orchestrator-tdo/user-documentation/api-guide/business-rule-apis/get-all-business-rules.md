# Get All Business Rules

This API returns details on all rules within a single coverage set. It is sent as a POST, with the same header details as the ‘create’ and ‘update’ calls.

<figure><img src="../../../../../.gitbook/assets/image (302).png" alt=""><figcaption><p>URL for Get All Rules call</p></figcaption></figure>

The body of the call looks like the body of the ‘Get Rule Details’ call.

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

The return message of the API shows the information for all rules contained in this coverage set.

<figure><img src="../../../../../.gitbook/assets/image (303).png" alt=""><figcaption><p>Results for Get All Rules</p></figcaption></figure>

This coverage set now contains three rules; the information on all three is included above. In TDO, the three rules are also shown.

<figure><img src="../../../../../.gitbook/assets/image (304).png" alt=""><figcaption><p>Rules in TDO</p></figcaption></figure>
