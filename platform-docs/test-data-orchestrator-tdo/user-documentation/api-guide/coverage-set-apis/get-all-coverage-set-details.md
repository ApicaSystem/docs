# Get All Coverage Set Details

This call is also sent as ‘POST’.  It will return information on all coverage sets in the project, including ID.&#x20;

&#x20;&#x20;

<figure><img src="../../../../../.gitbook/assets/image (91).png" alt=""><figcaption><p>Get all coverage sets call</p></figcaption></figure>

&#x20;&#x20;

The body of the call is very simple, just the credentials and project/version.

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
    }
}
```

&#x20;

The return message contains the details for all coverage sets in this project (there are six in this project).  Note that the return message contains IDs and details for the coverage sets as well as for all determining attributes in that coverage set.  The highlighted section below shows the details for the api\_demo\_coverage 1.0 set.

&#x20;

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (92).png" alt=""><figcaption><p>Return message with details on all coverage sets</p></figcaption></figure>
