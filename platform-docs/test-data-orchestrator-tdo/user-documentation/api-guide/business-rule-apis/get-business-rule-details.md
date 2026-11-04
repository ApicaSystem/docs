# Get Business Rule Details

This API gets details on a single business rule in a coverage set. It is sent as a POST. The ID of the rule you want details on is included in the call.

<figure><img src="../../../../../.gitbook/assets/image (300).png" alt=""><figcaption><p>Get business rule details call</p></figcaption></figure>

The body of the call includes the context – user ID, password, and coverage set. No other items are required.

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

The return message on this API gives all details on the specified rule, including created by, updated by, and all of the conditions.

<figure><img src="../../../../../.gitbook/assets/image (301).png" alt=""><figcaption><p>Return message showing business rule details</p></figcaption></figure>
