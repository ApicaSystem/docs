# Delete Coverage Set

This call will delete the coverage set from the project. The header is the same as the ‘get coverage set details’ API, except that it is sent as a ‘DELETE’ command. It is recommended that you confirm the ID of the set you are deleting before you run this API as it cannot be reversed.

<figure><img src="../../../../../.gitbook/assets/image (288).png" alt=""><figcaption><p>Delete coverage set API</p></figcaption></figure>

The body is the same as the simple body API calls; just credentials and project information.

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

This API will delete the ‘api\_demo\_coverage 1.0’ coverage set. The return message is very simple, only showing a result of ‘true’.

<figure><img src="../../../../../.gitbook/assets/image (289).png" alt=""><figcaption><p>Delete coverage set return message</p></figcaption></figure>

In TDO, the coverage set main page now shows that ‘api\_demo\_coverage 1.0’ no longer exists.

<figure><img src="../../../../../.gitbook/assets/image (290).png" alt=""><figcaption><p>TDO coverage set listing showing target set removed</p></figcaption></figure>

Remember only users with administrator credentials can delete objects in TDO.
