# Assign a Fixed Value

In Postman, the API looks like this:

<figure><img src="../../../../../../.gitbook/assets/image (793).png" alt=""><figcaption><p>API call for assignment rule creation</p></figcaption></figure>

The body of the file for this call will look like this:

&#x20;

```
{
    "context": {
        "user": "id_name",
        "password": "password",
        "project": {
            "name": "imp_payments_demo",
            "version": "1.0"
        },
        "workSet": {
            "name": "api_2_workset",
            "version": "1.1"
        }
    },
    "entity": {
        "step": {
            "name": "imp_enter_details",
            "version": "1.0"
        },
        "attribute": "test_string",    
        "operands": [
            {
                "operator": "ASSIGN",
                "value": "125"
            }      
        ]
    }
}
```

&#x20;

In the entity section, you will need to provide the step name and version (version can be validated in the ‘data blocks’ section of TDO or on the ‘assembled data’ page).

&#x20;

The attribute name is the name from the list in the TDO data assignment page.  In this case, we are working on the third attribute in the list:

<figure><img src="../../../../../../.gitbook/assets/image (794).png" alt=""><figcaption><p>Assignment rules page in TDO</p></figcaption></figure>

In the final section of the body, we are specifying the method being used (‘ASSIGN’) and the value to be assigned (‘125’).  Since we have not specified a format type, this will be assigned using the default value of STRING.

&#x20;

When the API is successfully run, you will receive the following return message:

<figure><img src="../../../../../../.gitbook/assets/image (795).png" alt=""><figcaption><p>Return message for successful execution</p></figcaption></figure>

Note that the return message starts with the Mongo object ID, provides the rule name and properties.&#x20;

&#x20;

Here is that rule in TDO after the API is run.

<figure><img src="../../../../../../.gitbook/assets/image (796).png" alt=""><figcaption><p>New rule created in TDO</p></figcaption></figure>

You can see that the rule name on the TDO screen is the same as the rule name returned to Postman after the API was run and the value assigned is the value sent in the API.
