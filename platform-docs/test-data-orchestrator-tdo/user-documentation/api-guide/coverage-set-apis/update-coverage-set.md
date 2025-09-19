# Update Coverage Set

Before you update a coverage set, you need to lock it.  This can be done via the Lock Coverage Set API.

&#x20;

This API is sent as a ‘PATCH’ to update an existing coverage set.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (85).png" alt=""><figcaption><p>Update coverage set call</p></figcaption></figure>

&#x20;&#x20;

In the body of the call, you need to include the ID of the coverage set (instead of name/version).  This can be obtained from the return message on the ‘create’ or ‘get all’ APIs.  You can use this to add or delete determining attributes.  To add determining attributes, include all of the existing attributes plus the ones you want to add.  To delete determining attributes, only include the ones you want to keep and exclude the ones you want to delete.

&#x20;

**Adding one or more determining attributes**

&#x20;

```
{
    "context": {
        "user": "mbj_test",
        "password": "xxxx",
        "project": {
            "name": "imp_payments_demo",
            "version": "1.0"
        }
    },
    "entity": {
        "id": "6744c4ee59c7b96171b5a827",
        "determiningAttributes": [
            {"name": "acct_type", "version": "1.0"},
            {"name": "has_app", "version": "1.0"},
            {"name": "has_online", "version": "1.0"},
            {"name": "balance", "version": "1.0"},
            {"name": "currency_a", "version": "1.0"},
            {"name": "customer_type", "version": "1.0"}
        ]
    }
}
```

&#x20;

When this is run, the successful return message will show all attributes in the coverage set.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (86).png" alt=""><figcaption><p>Successful return message</p></figcaption></figure>

This shows the updated coverage set in TDO.  Note that the updated set is now version 1.1 (the original version still exists with 4 attributes) and contains all six attributes sent in the API. TDO increments the version upwards automatically, so the user should not manually update or increment versions.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (87).png" alt=""><figcaption><p>Updated coverage set contents</p></figcaption></figure>

&#x20;

**Deleting One or More Attributes**

&#x20;

The delete call remains the same as the add call.  Note that you could combine both actions in a single call, by excluding the attributes you want to delete and including the ones you want to add.  In this message, we have removed the ‘balance’ attribute from the set.  Also note that the coverage set ID has changed.  The value used in the update/add call (6744c4ee59c7b96171b5a827) is still the ID for version 1.0 of this coverage set.  The value used below is the value for version 1.1, which is the version we are updating.

&#x20;

{

&#x20;   "context": {

&#x20;       "user": "mbj\_test",

&#x20;       "password": "xxxx",

&#x20;       "project": {

&#x20;           "name": "imp\_payments\_demo",

&#x20;           "version": "1.0"

&#x20;       }

&#x20;   },

&#x20;   "entity": {

&#x20;       "id": "6745f4c559c7b96171b5a82a",

&#x20;       "determiningAttributes": \[

&#x20;           {"name": "acct\_type", "version": "1.0"},

&#x20;           {"name": "has\_app", "version": "1.0"},

&#x20;           {"name": "has\_online", "version": "1.0"},

&#x20;           {"name": "currency\_a", "version": "1.0"},

&#x20;           {"name": "customer\_type", "version": "1.0"}

&#x20;       ]

&#x20;   }

}

&#x20;

The return message will show the updated contents, as well as the new ID for the new version of the coverage set (1.2).

&#x20;&#x20;

<figure><img src="../../../../../.gitbook/assets/image (88).png" alt=""><figcaption><p>Updated coverage set with 'balance' attribute removed</p></figcaption></figure>

When viewing version 1.2 in the TDO UI, the ‘balance’ determining attribute is now removed.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (89).png" alt=""><figcaption><p>Updated coverage set contents in TDO</p></figcaption></figure>

&#x20;

All three versions of the coverage set remain in TDO and can be selected and used.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (90).png" alt=""><figcaption><p>Updated coverage set list</p></figcaption></figure>
