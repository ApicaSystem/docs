# Create Determining Attribute (Value-based)

This API can be used to create one determining attribute. The determining attribute can be sourced from an imported data block or can be standalone (meaning no data block source). The examples below show how the API should be laid out for each option.

**No Data Block Source**

In this API, the ‘entity’ values are passed to create a new determining attribute named “currency\_a”. Since there is no underlying data block, the entity source is not identified.

The API is still defined the same way as for a range-based determining attribute:

<figure><img src="../../../../../.gitbook/assets/image (61).png" alt=""><figcaption><p>Determining attribute API</p></figcaption></figure>

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
        "name": "currency_a",
        "dataType": "STRING",
        "type": "VALUE",
        "values": [
            "USD", "GBP", "EUR"
        ]
    }
}
```

The results screen from Postman shows the API was created.

<figure><img src="../../../../../.gitbook/assets/image (65).png" alt=""><figcaption><p>Return message with details</p></figcaption></figure>

An ID for the determining attribute is provided in the results section. If you are going to update or delete this determining attribute, you will need this ID. (Note that the ID can also be found in the ‘Get all DAs’ API.) This is the attribute in TDO after it has been created by API.

<figure><img src="../../../../../.gitbook/assets/image (66).png" alt=""><figcaption><p>New determining atttribute, no data block source</p></figcaption></figure>

**Data Block Used as Source**

The data block to be used as the source must already exist in TDO to run this API. It is the same as the API above, except that the entity.source .name and entity.source.version are also included in the API. You will want to link a determining attribute to an underlying data block if you intend to filter the attributes at a later date. This filtering is performed using the entity.criteria field.

The url is the same as for the no data block source API call. The body contains additional information.

{

"context": {

"user": "mbj\_test",

"password": "xxxx",

"project": {

"name": "imp\_payments\_demo",

"version": "1.0"

}

},

"entity": {

"name": "acct\_type",

"dataType": "STRING",

"type": "VALUE",

"values": \[

"Checking", "Savings", "Current"

],

"source": {

"name": "imp\_accounts",

"version": "1.0",

"attribute": "account\_type"

}

}

}

When this API is run, the results screen in Postman shows the following.

<figure><img src="../../../../../.gitbook/assets/image (67).png" alt=""><figcaption><p>Return message with details</p></figcaption></figure>

As with other successful calls, the ID for the new determining attribute is returned with the message.

In the TDO UI, the new determining attribute displays the linked data block and field (top portion of screen) in addition to the attribute values.

<figure><img src="../../../../../.gitbook/assets/image (68).png" alt=""><figcaption><p>Determining attribute with data block source</p></figcaption></figure>
