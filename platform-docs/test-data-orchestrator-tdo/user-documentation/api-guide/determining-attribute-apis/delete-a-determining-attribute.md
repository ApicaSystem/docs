# Delete a Determining Attribute

You can delete determining attributes one at a time using this method. The call is defined as ‘DELETE’ instead of ‘POST’ or ‘PATCH’.

<figure><img src="../../../../../.gitbook/assets/image (264).png" alt=""><figcaption><p>Call to delete a determining attribute</p></figcaption></figure>

The determining attribute ID shown above is for the ‘data\_block\_based’ seen below.

Prior to deletion, you can see the determining attribute in TDO.

<figure><img src="../../../../../.gitbook/assets/image (265).png" alt=""><figcaption><p>Determining attribute list</p></figcaption></figure>

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

When run, the message only shows the successful completion of the call.

<figure><img src="../../../../../.gitbook/assets/image (266).png" alt=""><figcaption><p>Successful deletion return message</p></figcaption></figure>

Checking the determining attributes list in TDO, this attribute is no longer present.

<figure><img src="../../../../../.gitbook/assets/image (267).png" alt=""><figcaption><p>Attribute list showing successful deletion</p></figcaption></figure>

Remember, only users with administrative credentials can delete objects in TDO.
