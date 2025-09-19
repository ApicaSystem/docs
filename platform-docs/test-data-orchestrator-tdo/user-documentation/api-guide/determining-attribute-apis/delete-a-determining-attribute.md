# Delete a Determining Attribute

You can delete determining attributes one at a time using this method.  The call is defined as ‘DELETE’ instead of ‘POST’ or ‘PATCH’.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (78).png" alt=""><figcaption><p>Call to delete a determining attribute</p></figcaption></figure>

&#x20;

The determining attribute ID shown above is for the ‘data\_block\_based’ seen below.

&#x20;

Prior to deletion, you can see the determining attribute in TDO.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (79).png" alt=""><figcaption><p>Determining attribute list</p></figcaption></figure>

&#x20;

The body of the message is the same as for ‘get details’ API’s.

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

When run, the message only shows the successful completion of the call.

&#x20;&#x20;

<figure><img src="../../../../../.gitbook/assets/image (80).png" alt=""><figcaption><p>Successful deletion return message</p></figcaption></figure>

&#x20;

Checking the determining attributes list in TDO, this attribute is no longer present.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (81).png" alt=""><figcaption><p>Attribute list showing successful deletion</p></figcaption></figure>

&#x20;

Remember, only users with administrative credentials can delete objects in TDO.
