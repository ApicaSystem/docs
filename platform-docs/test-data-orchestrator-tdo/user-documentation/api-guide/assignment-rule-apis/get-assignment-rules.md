# Get Assignment Rules

This call gets the details for all assignment rules in a workset. It is sent as a POST call.

<figure><img src="../../../../../.gitbook/assets/image (805).png" alt=""><figcaption><p>Get Assignment Rules call</p></figcaption></figure>

The body of the call contains the information on the project and workset you want to get assignment rule information on.

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
    }
}
```

&#x20;

The return message will contain information on all rules in that workset.  In the sample below, there are two steps in the workset and rules for both steps are returned.

<figure><img src="../../../../../.gitbook/assets/image (806).png" alt=""><figcaption><p>Return message with all rules</p></figcaption></figure>

For the remaining calls referenced in this section, the rule ID returned in this call is used to target the call to a specific rule.
