# Get All Business Rules

This API returns details on all rules within a single coverage set.  It is sent as a POST, with the same header details as the ‘create’ and ‘update’ calls.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (116).png" alt=""><figcaption><p>URL for Get All Rules call</p></figcaption></figure>

&#x20;The body of the call looks like the body of the ‘Get Rule Details’ call.

&#x20;

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

&#x20;The return message of the API shows the information for all rules contained in this coverage set.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (117).png" alt=""><figcaption><p>Results for Get All Rules</p></figcaption></figure>

This coverage set now contains three rules; the information on all three is included above.  In TDO, the three rules are also shown.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (118).png" alt=""><figcaption><p>Rules in TDO</p></figcaption></figure>
