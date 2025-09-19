# Create Coverage Set

The first action to take on coverage sets is to create a new coverage set.  This can be done for one or more determining attributes.  The call is set up as a POST call.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (82).png" alt=""><figcaption><p>Create coverage set API call</p></figcaption></figure>

&#x20;

The body of the call contains the project name and version and credentials in the ‘context’ section.  In the entity section, you provide the name of the coverage set you are creating (it must end with ‘\_coverage’) and the determining attribute name(s)/version(s) you want to include.

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
        "name": "api_demo_coverage",
        "determiningAttributes": [
            {"name": "acct_type", "version": "1.0"},
            {"name": "has_app", "version": "1.0"},
            {"name": "has_online", "version": "1.0"},
            {"name": "balance", "version": "1.0"}
        ]
    }
}
```

&#x20;

When this is run, a successful return message will show the return code (200) as well as the information on the coverage set created by this call.

&#x20;&#x20;

<figure><img src="../../../../../.gitbook/assets/image (83).png" alt=""><figcaption><p>Create coverage set return message</p></figcaption></figure>

&#x20;&#x20;

When the coverage set is viewed in the TDO UI, you can see the determining attributes linked to this set.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (84).png" alt=""><figcaption><p>Coverage set contents in TDO</p></figcaption></figure>
