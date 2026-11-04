# Create Workset

This is sent as a POST call.

<figure><img src="../../../../../.gitbook/assets/image (307).png" alt=""><figcaption><p>Create workset API</p></figcaption></figure>

The body of the call to create a workset with two data views is shown below. Note that the ‘data views’ section of the entity portion of the body is an array and needs to follow JSON formatting rules for an entity.

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
        "name": "api_workset",
        "scenario": {
            "name": "imp_make_payment",
            "version": "1.0"
        },
        "primary": {
            "view": {
                "name": "format_cov_view",
                "version": "1.0"
            },
            "dataSet": {
                "name": "api_demo_coverage",
                "version": "1.0.0"
            }
        },
        "dataViews": [
            {
              "view": {
                "name": "cust_data_view",
                "version": "1.0"
            },
            "dataSet": {
                "name": "imp_customers",
                "version": "1.0.0"
            }
            },
            {
              "view": {
                "name": "acts_view",
                "version": "1.0"
            },
            "dataSet": {
                "name": "imp_accounts",
                "version": "1.0.0"
            }            
            }            
        ]
    }
}
```

The return message shows the status of the call as well as the details of the workset that has been created.

<figure><img src="../../../../../.gitbook/assets/image (308).png" alt=""><figcaption><p>Create workset return message (successful)</p></figcaption></figure>

The created workset can now be viewed in the worksets page of TDO. When you enter edit mode for this workset you can see the workset details in this page match the parameters sent in the body of the call.

<figure><img src="../../../../../.gitbook/assets/image (309).png" alt=""><figcaption><p>New workset shown in TDO</p></figcaption></figure>
