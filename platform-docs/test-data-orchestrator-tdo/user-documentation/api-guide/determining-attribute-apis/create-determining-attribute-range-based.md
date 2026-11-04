# Create Determining Attribute (Range-based)

In the example shown below, we are creating a determining attribute called ‘amount\_1’ as a numerical range determining attribute, with 3 values: 0 – 250, 250.01 – 2500, and 2500.01 – 25000. We are creating this in the ‘imp\_payments\_demo’ project, version 1.0

The API is defined as

<figure><img src="../../../../../.gitbook/assets/image (248).png" alt=""><figcaption><p>URL format</p></figcaption></figure>

Where ‘http://99.99.99.99:8080/ is the protocol://server:port where TDO resides.

```
{
    "context": {
        "user": "mj_test",
        "password": "xxxx",
        "project": {
            "name": "imp_payments_demo",
            "version": "1.0"
        }
    },
    "entity": {
        "name": "amount_1",
        "dataType": "NUMBER",
        "type": "RANGE",
        "values": [
            {
                "minValue": 0.01,
                "maxValue": 250
            },
            {
                "minValue": 250.01,
                "maxValue": 2500
            },
            {
                "minValue": 2500.01,
                "maxValue": 25000
            }
        ]
    }
}
```

This screen print shows the results code in Postman. You will also note that the parameters screen is set up with the type of call (POST) and the full URL for the call (server name/port + URL from the initial table).

<figure><img src="../../../../../.gitbook/assets/image (249).png" alt=""><figcaption><p>Results message with determining attribute details</p></figcaption></figure>

Here is how the determining attribute looks in TDO.

<figure><img src="../../../../../.gitbook/assets/image (250).png" alt=""><figcaption><p>Determining attribute in TDO after creation</p></figcaption></figure>
