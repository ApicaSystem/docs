# Get Rule Details

This call returns the details on a specific rule. The URL includes the object ID for the rule being called and again is sent as a POST call.

<figure><img src="../../../../../.gitbook/assets/image (69).png" alt=""><figcaption><p>Get details call including object ID</p></figcaption></figure>

The body of the message contains the project name and workset name that the specific rule is in.

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
    }
}
```

The results message will include the rule details.

<figure><img src="../../../../../.gitbook/assets/image (70).png" alt=""><figcaption><p>Return message with rule details</p></figcaption></figure>
