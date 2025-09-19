# Data Management Overview

Apica Ascent automatically parses various log formats. Custom rules can be applied to the incoming log streams which are discussed in the [Rules](../flow/rules/) Section.

#### Embedded JSON

Apica Ascent looks for any well-formatted JSON string embedded in the incoming log line when logs are not JSON-formatted. If there are any, the Apica Ascent extracts the key-value pairs and makes them available in the structured data. Fields get flattened if the nested fields are available in the embedded JSON.

```
// Unstructured log line with structured data embedded.
user login attempt {"user":"LGQ123","type":"admin","is_active":1}
```

Apica Ascent extracts `user`, `type`, and `is_active` fields from the above line.

#### Key-Value Pairs

Apart from identifying formatted JSON, Apica Ascent also checks for any key-value pairs in the incoming data and makes that available in the structured data.

```
// Unstructured log line with key-value pairs.
user login attempt user:LGQ123 type=admin is_active:=1
```

Apica Ascent extracts `user`, `type`, and `is_active` fields from the above line.

{% hint style="info" %}
Teams spend enormous time cleaning data to get a sense of it; readily available fields make reporting, searching, and filtering easier.
{% endhint %}

#### IP addresses

Apica Ascent detects IP addresses in the log lines and extracts them as a separate field. Logs are enriched with geo-location information if public IP addresses are available, making it easier for users to visualize traffic patterns.

![](<../.gitbook/assets/image (255).png>)
