# Delete Coverage Set

This call will delete the coverage set from the project.  The header is the same as the ‘get coverage set details’ API, except that it is sent as a ‘DELETE’ command.  It is recommended that you confirm the ID of the set you are deleting before you run this API as it cannot be reversed.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (102).png" alt=""><figcaption><p>Delete coverage set API </p></figcaption></figure>

&#x20;The body is the same as the simple body API calls; just credentials and project information.

&#x20;

```
{
    "context": {
        "user": "mbj_test",
        "password": "1234",
        "project": {
            "name": "imp_payments_demo",
            "version": "1.0"
        }
    }
}
```

&#x20;

This API will delete the ‘api\_demo\_coverage 1.0’ coverage set.  The return message is very simple, only showing a result of ‘true’.

&#x20;&#x20;

<figure><img src="../../../../../.gitbook/assets/image (103).png" alt=""><figcaption><p>Delete coverage set return message</p></figcaption></figure>

&#x20;

In TDO, the coverage set main page now shows that ‘api\_demo\_coverage 1.0’ no longer exists.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (104).png" alt=""><figcaption><p>TDO coverage set listing showing target set removed</p></figcaption></figure>

Remember only users with administrator credentials can delete objects in TDO.
