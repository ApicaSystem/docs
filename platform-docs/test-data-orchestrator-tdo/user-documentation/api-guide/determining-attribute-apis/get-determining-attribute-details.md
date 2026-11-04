# Get Determining Attribute Details

This can be run two ways – one will return all details for a single determining attribute, and the other will return details on all determining attributes in a project.

For the single attribute details, you need the attribute ID to run the API. So we will look at the ‘all determining attributes’ process first, as that will provide the determining attribute ID.

**Get all Details**

For returning details on all determining attributes, the API call is defined as POST (the same as for creating determining attributes.

<figure><img src="../../../../../.gitbook/assets/image (260).png" alt=""><figcaption><p>URL for determining attribute details</p></figcaption></figure>

The body of the message is very simple, just listing the credentials and the project.

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

The response in Postman shows the details for all determining attributes in this project.

<figure><img src="../../../../../.gitbook/assets/image (261).png" alt=""><figcaption><p>Return messge with all attribute details</p></figcaption></figure>

**Get Single Attribute Details**

We will use the first determining attribute (‘has\_app’) for the single determining attribute call. The ID for this attribute is 645e0000390613152b16ecbb. To set the call for a single determining attribute, it is defined as above, but with the attribute ID appended at the end of the call.

<figure><img src="../../../../../.gitbook/assets/image (262).png" alt=""><figcaption><p>URL for single determining attribute details</p></figcaption></figure>

The body of the message remains the same as the ‘all attributes’ call.

{

"context": {

"user": "mbj\_test",

"password": "xxxx",

"project": {

"name": "imp\_payments\_demo",

"version": "1.0"

}

}

}

And here you can see that the return message only has the details on the determining attribute we defined in the API.

<figure><img src="../../../../../.gitbook/assets/image (263).png" alt=""><figcaption><p>Return message with single attribute details</p></figcaption></figure>
