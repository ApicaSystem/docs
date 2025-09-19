# Clone Workset

This API will create a copy of the workset with the new name specified in the API call.  It is run as a POST call and adds a variable for the new workset name to the call used to get workset details (ie, after 'workset' the API includes the instruction 'clone' and then the ID of the workset being cloned and the name of the new workset being created).

The API looks like the example below.

https://\<server>:\<port>/core/API/workSet/clone/\<workset\_id>?name=\<new\_name>.

For example, it would be:  https://localhost:8080/core/API/workSet/clone/6761ae6d98cd8a04d7f4e959?api\_clone\_workset.

When creating this url, remember to use a new name ending in '\_workset'.

&#x20; In this case, we are cloning the workset ‘api\_2\_workset’ shown below.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (30).png" alt=""><figcaption><p>workset list showing workset to be cloned</p></figcaption></figure>

&#x20;The body of this call is still the very simple body (user ID, password, and project).

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

When run, the response shows the details of the cloned workset.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (31).png" alt=""><figcaption><p>Results for clone workset API</p></figcaption></figure>

&#x20;TDO now shows the cloned workset in the workset listing, and when you edit that workset the details are the same as the one that was cloned.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (32).png" alt=""><figcaption><p>New workset shown in list</p></figcaption></figure>

&#x20;&#x20;

<figure><img src="../../../../../.gitbook/assets/image (33).png" alt=""><figcaption><p>New workset details</p></figcaption></figure>
