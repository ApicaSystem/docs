# Create Determining Attribute (Value-based)

This API can be used to create one determining attribute.  The determining attribute can be sourced from an imported data block or can be standalone (meaning no data block source). The examples below show how the API should be laid out for each option.

&#x20;

**No Data Block Source**

In this API, the ‘entity’ values are passed to create a new determining attribute named “currency\_a”.  Since there is no underlying data block, the entity source is not identified.

&#x20;

The API is still defined the same way as for a range-based determining attribute:

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (64).png" alt=""><figcaption><p>Determining attribute API</p></figcaption></figure>

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
        "name": "currency_a",
        "dataType": "STRING",
        "type": "VALUE",
        "values": [
            "USD", "GBP", "EUR"
        ]
    }
}
```

&#x20;

The results screen from Postman shows the API was created.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (65).png" alt=""><figcaption><p>Return message with details</p></figcaption></figure>

&#x20;

An ID for the determining attribute is provided in the results section.  If you are going to update or delete this determining attribute, you will need this ID.  (Note that the ID can also be found in the ‘Get all DAs’ API.) This is the attribute in TDO after it has been created by API.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (66).png" alt=""><figcaption><p>New determining atttribute, no data block source</p></figcaption></figure>

**Data Block Used as Source**

The data block to be used as the source must already exist in TDO to run this API.  It is the same as the API above, except that the entity.source .name and entity.source.version are also included in the API.  You will want to link a determining attribute to an underlying data block if you intend to filter the attributes at a later date.  This filtering is performed using the entity.criteria field.

&#x20;

The url is the same as for the no data block source API call.  The body contains additional information.

&#x20;&#x20;

{

&#x20;   "context": {

&#x20;       "user": "mbj\_test",

&#x20;       "password": "xxxx",

&#x20;       "project": {

&#x20;           "name": "imp\_payments\_demo",

&#x20;           "version": "1.0"

&#x20;       }

&#x20;   },

&#x20;   "entity": {

&#x20;       "name": "acct\_type",

&#x20;       "dataType": "STRING",

&#x20;       "type": "VALUE",

&#x20;       "values": \[

&#x20;           "Checking", "Savings", "Current"

&#x20;       ],

&#x20;       "source": {

&#x20;           "name": "imp\_accounts",

&#x20;           "version": "1.0",

&#x20;           "attribute": "account\_type"

&#x20;       }

&#x20;   }

}

&#x20;

When this API is run, the results screen in Postman shows the following.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (67).png" alt=""><figcaption><p>Return message with details</p></figcaption></figure>

&#x20;

As with other successful calls, the ID for the new determining attribute is returned with the message.

&#x20;

In the TDO UI, the new determining attribute displays the linked data block and field (top portion of screen) in addition to the attribute values.&#x20;

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (68).png" alt=""><figcaption><p>Determining attribute with data block source</p></figcaption></figure>
