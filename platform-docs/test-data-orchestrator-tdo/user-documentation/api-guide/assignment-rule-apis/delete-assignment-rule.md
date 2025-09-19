# Delete Assignment Rule

This call is used to delete an assignment rule.  Care should be taken when using this call, as there will be no prompt (‘are you sure you want to delete this rule?’) when it is sent.  The deletion request will be immediately processed.

&#x20;

It is sent as a DELETE call, and the url includes the ID (from the ‘get assignment rules’ call) for the rule to be deleted.

<figure><img src="../../../../../.gitbook/assets/image (813).png" alt=""><figcaption><p>Delete assignment rule API</p></figcaption></figure>

The body of this call is the same as the body for ‘Get Assignment Rules’ or ‘Get Rule Details’ call, containing the user credentials, project, and workset information.

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

The return message for this call is very simple, with a single return code (‘1’ for ‘true’).

<figure><img src="../../../../../.gitbook/assets/image (814).png" alt=""><figcaption><p>Return message for delete rule API</p></figcaption></figure>

In TDO, we can now see no rules for this field (this is the same rule that was updated using the ‘Update Assignment Rule’ call in the previous section).

<figure><img src="../../../../../.gitbook/assets/image (815).png" alt=""><figcaption><p>Deleted rule</p></figcaption></figure>
