# Update Determining Attributes

Several types of updates can be performed using this API.  You can add more values to the attribute, you can add priorities to the determining attribute, and you can set filters on determining attributes.  Note that these are run as ‘PATCH’ for updates, as opposed to ‘POST’ for creation.

&#x20;

**Setting Priorities**

This example shows using the valuesPriority option to set priorities on previously created attributes.

&#x20;

Here, we use the id for the determining attribute in the entity section to identify it as an existing attribute. This can be found in the response of the Create Determining Attribute API or in the Get DA Details API.  We also identify the values of the determining attribute that we want to set priorities for (this DA has only two values).  In the valuesPriority section, we list the value and the associated priority.&#x20;

&#x20;

The API call is the same protocol://server:port as above, but it is defined as ‘PATCH’ instead of ‘POST’ for this process.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (69).png" alt=""><figcaption><p>Update Determnining Attribute URL</p></figcaption></figure>

&#x20;

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
        "id": "645e0000390613152b16ecbb",
        "values": [
            "0",
            "1"
        ],
        "valuesPriority": {
            "0": "1",
            "1": "2",
        }
    }
}
```

&#x20;

Here is the Postman screen after the API has been run showing that the priorities were set.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (70).png" alt=""><figcaption><p>Return message showing priorities are set</p></figcaption></figure>

&#x20;

&#x20;

And here is the edit determining attributes screen from the TDO UI, showing the priorities assigned to the values.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (71).png" alt=""><figcaption><p>Determining attribute with priorities</p></figcaption></figure>

#### &#x20;

**Group by Settings for Attributes**

Group by for determining attributes is a process in TDO that allows you to enforce valid combinations of data – for instance, I can choose to group ‘has\_app’ by ‘customer\_type’.  In this demo database, customers with a customer type of ‘Retail’ can have the value of ‘0’ \[false] or ‘1’ \[true] for ‘has\_app’ but customer type of ‘Corporate’ can only have the value of ‘0’.  By adding the group by, I make sure that if I select the ‘Corporate’ customer type, only the ‘false’ option will display for has\_app, preventing a user from selecting an invalid option (‘true’) in error.

&#x20;

Group by will only work for fields that are in the same source data block; you cannot group by a field that exists in a different data block as there is not relationship defined for TDO to refer to. The determining attribute is identified by it’s id number.  The attribute values are listed.  Then in the criteria section, each value has the ‘group by’ attribute identified.

&#x20;

The API is defined the same as for setting priorities.  The body is similar, except that the 'group by' field is listed in the criteria section of the body instead of the 'priority'.

&#x20;

&#x20;

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

&#x20;       "id": "645e0000390613152b16ecbb",

&#x20;           "values": \[

&#x20;           "0",

&#x20;           "1"

&#x20;       ],

&#x20;       "criteria": {

&#x20;           "0": "customer\_type",

&#x20;           "1": "customer\_type",

&#x20;       }

&#x20;   }

}

&#x20;

When run, Postman shows the results as below.

&#x20;

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (72).png" alt=""><figcaption><p>Return message with updates applied</p></figcaption></figure>

&#x20;

&#x20;

In TDO, you can now see the group by results.  The column on the right in the bottom section of the screen below (Determining Attribute) is the column that the Data Block Attribute (on the left) is grouped by.  Note that since this update was performed on an attribute that already had priorities set, those are also shown in the return message.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (73).png" alt=""><figcaption><p>Determining attribute with group-by values set</p></figcaption></figure>
