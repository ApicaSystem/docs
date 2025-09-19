---
description: >-
  This guide will allow you to create your own JSON ingestion to your Apica
  environment.
---

# Use Apica API to ingest JSON data

**Pre-Requisites**

* Ingest Token ([Generating a secure ingest token](https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token))
* Domain name (mydomain.apica.io)

**Request**&#x20;

Endpoint

```
POST https://mydomain.apica.io/v1/json_batch
```

Header

```
Authorization: Bearer ${IngestToken}
```

**Request Body**

Json Example 1

```
[
    {
        "namespace":"my-test",
        "application":"my-awesome-app",
        "message":"This is a test message"
    }
]
```

Json Example 2

```
[
    {
        "namespace":"joakim-test",
        "application":"joakims-awesome-app",
        "message":{
            "host":"localhost",
            "ip":"127.0.0.1",
            "port":"443",
            "message":"This is a test message"
        }
    }
]
```

Json Example 3

```
[
    {
        "namespace":"my-test",
        "application":"my-awesome-app",
        "message":"This is a test message"
    },
    {
        "namespace":"my-test",
        "application":"my-awesome-app",
        "message":"This is a test message 2"
    },
    {
        "namespace":"my-test",
        "application":"my-awesome-app",
        "message":"This is a test message 3"
    }
]
```

{% hint style="info" %}
_Namespace & Application is generated automatically based on your request. If either doesn't exist, new ones will be generated._
{% endhint %}

**Result (User-Interface)**

Using Json Example 1, this is how the results look like in your environment

<figure><img src="../../.gitbook/assets/image (421).png" alt=""><figcaption></figcaption></figure>

**Response**

Example response 1

```
200 OK

status_code: "200"
```

Example response 2

```
400 Bad Request

{
    "message": "cookie x-api-key not found"
}

// Authorization header invalid / misconfigured
```
