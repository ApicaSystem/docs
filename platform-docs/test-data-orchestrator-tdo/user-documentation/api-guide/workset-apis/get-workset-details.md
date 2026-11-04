# Get Workset Details

This call returns details on a specific workset. It is very similar to the ‘Get all Worksets for Project’ call, with the exception of having the workset’s TDO id in the call.

<figure><img src="../../../../../.gitbook/assets/image (315).png" alt=""><figcaption><p>Get workset details API call</p></figcaption></figure>

The body for this call is the same as the body for ‘get all worksets’.

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

The return message contains the details for the requested workset.

<figure><img src="../../../../../.gitbook/assets/image (316).png" alt=""><figcaption><p>Get workset details result (successful)</p></figcaption></figure>

These details can be compared to the details shown in the ‘Edit Workset’ screen on TDO.

<figure><img src="../../../../../.gitbook/assets/image (317).png" alt=""><figcaption><p>Workset details in TDO</p></figcaption></figure>
