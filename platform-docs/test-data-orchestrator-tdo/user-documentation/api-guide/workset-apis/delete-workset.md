# Delete Workset

This API deletes an existing workset. As the workset ID is passed in the URL, you can only delete one workset at a time. It is run as a DELETE call. This API can only be run by a user with Admin privileges; all other users will get a return message that they do not have proper authorization to perform this function.

<figure><img src="../../../../../.gitbook/assets/image (221).png" alt=""><figcaption><p>Delete workset API</p></figcaption></figure>

The body is the same body as the other simple calls (other than ‘create’ and ‘update’).

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

Here is the workset listing prior to running this call. The ID in the call URL is for the ‘cloned\_workset’.

<figure><img src="../../../../../.gitbook/assets/image (222).png" alt=""><figcaption><p>Workset list from TDO</p></figcaption></figure>

When run, the response contains the result (‘0’ for false and ‘1’ for true). A response of ‘1’ indicates that the workset has been deleted.

<figure><img src="../../../../../.gitbook/assets/image (223).png" alt=""><figcaption><p>Results message for delete workset API</p></figcaption></figure>

When viewing the workset listing in TDO, the workset ‘cloned\_workset’ is no longer present.

<figure><img src="../../../../../.gitbook/assets/image (224).png" alt=""><figcaption><p>TDO workset list showing successful deletion</p></figcaption></figure>
