---
description: >-
  JSON Data source provides a quick and flexible way to issue queries to
  arbitrary RESTful endpoints that return JSON data.
---

# JSON Data source

## Create the JSON Data source

1. Navigate to **Integrations** > **Data** **Sources**
2. Click **New** **Data** **Source**
3. Select **JSON**
4. Create the data source
   1. Enter a name for your data source (required)
   2. Enter Basic Authentication credentials (optional)

<figure><img src="../../.gitbook/assets/image (643).png" alt=""><figcaption></figcaption></figure>

## Writing queries

1. Navigate to **Queries** and click **New Query**
2. In the **drop-down** on your left hand side, select your new data source

### Providing HTTP Options

The following HTTP options are used for sending a query

{% hint style="info" %}
The URL parameter is the only required parameter
{% endhint %}

* `url` - This is the URL where the RESTful API is exposed
* `method` - the HTTP method to use (default: `get`)
* `headers` - a dictionary of headers to send with the request
* `auth` - basic auth username/password (should be passed as an array: `[username, password]`)
* `params` - a dictionary of query string parameters to add to the URL
* `data` - a dictionary of values to use as the request body
* `json` - same as `data` except that it’s being converted to JSON
* `path` - accessing attributes within the response
  * `field` - rows of objects within selected attribute

#### Example query:&#x20;

```
url: https://www.googleapis.com/books/v1/volumes?q=isbn:0747532699
path: items
fields: ["volumeInfo.authors","volumeInfo.title","volumeInfo.publisher","accessInfo.webReaderLink"]
```

<figure><img src="../../.gitbook/assets/image (644).png" alt=""><figcaption></figcaption></figure>

#### Example query including all HTTP options:

```
url: https://httpbin.org/post
method: post
headers: {"User-Agent": "Test", "Accept": "*/*"}
auth: [username, password]
params: {?q=myQuery}
json: {"this": "is", "my": {"json":"body"}}
path: json
fields: ["my.json"]
```

## Filtering response data: path and fields

The response data can be filtered by specifying the `path` and `fields` parameters. The `path` filter allows accessing attributes within the response, for e.g. if a key `foo` in the response contains rows of objects you want to access, specifying `path` `foo` will convert each of the objects into rows.

In the example below, we are then selecting `fields` _volumeInfo.authors, volumeInfo.title, volumeInfo.publisher and accessInfo.webReaderLink_

```
url: https://www.googleapis.com/books/v1/volumes?q=isbn:0747532699
path: items
fields: ["volumeInfo.authors","volumeInfo.title","volumeInfo.publisher","accessInfo.webReaderLink"]
```

The resulting data from the above query is a nicely formatted table that can be searched in Apica Ascent or made available as a widget in a dashboard

<figure><img src="../../.gitbook/assets/image (645).png" alt=""><figcaption></figcaption></figure>
