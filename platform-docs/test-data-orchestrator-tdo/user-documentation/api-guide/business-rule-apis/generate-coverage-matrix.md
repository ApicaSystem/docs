# Generate Coverage Matrix

This call generates the coverage matrix from the business rules. &#x20;

{% hint style="warning" %}
If you do not have any business rules set, this call will not return any data.
{% endhint %}

This is sent as a POST call.

<figure><img src="../../../../../.gitbook/assets/image (1022).png" alt=""><figcaption><p>Generate Coverage Matrix API call</p></figcaption></figure>

The body of the call is simple; it contains the user credentials, project, and coverage set information.

```postman_json
{
	"context": {
		"user": "user_id",
		"password": "xxxx",
		"project": {
			"name": "imp_payments_demo",
			"version": "1.0"
		},
		"coverage" : {
		  "name": "api_demo_coverage",
		  "version": "1.9"
		}
	}
}
```

The results of this call will display information on the generated coverage matrix.  The body contains information on each row generated as part of the coverage matrix.

<figure><img src="../../../../../.gitbook/assets/image (1023).png" alt=""><figcaption><p>Coverage generation return messagel</p></figcaption></figure>

In TDO, the generate coverage matrix can be viewed from the Coverage Matrix section of the menu.

<figure><img src="../../../../../.gitbook/assets/image (1024).png" alt=""><figcaption><p>Generated coverage matrix</p></figcaption></figure>
