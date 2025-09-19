---
description: >-
  This page describes the API for querying the data from Apica Ascent
  Observability stack
---

# Query API

Getting data is a two step process

**Create a Query Request**

POST /v1/query will respond with a QueryId. Use that to access data

```
$ curl --location --request POST 'http://cluster-1.logiq.ai/v1/query' \
--header 'Accept: application/json' \
--header 'Content-Type: application/json' \
--data-raw '{
    "applicationNames": [
        "tomcat"
    ],
    "filters": {
        "Message": {
            "values": [
                "user-369"
            ]
        }
    },
    "namespace": "production",
    "pageSize": 100,
    "startTime": "2020-05-10T17:55:20+05:30"
}'
```

```
{
    "queryId": "4c977d08-4acf-52b5-a99d-d8c0eb41fe4b-lgq"
}
```

Use GET /v1/data/{queryId}/next and GET /v1/data/{queryId}/previous to retrieve data.

```
$ curl 'https://cluster-1.logiq.ai/v1/data/4c977d08-4acf-52b5-a99d-d8c0eb41fe4b-lgq/next'
[...data]
$ curl 'https://cluster-1.logiq.ai/v1/data/4c977d08-4acf-52b5-a99d-d8c0eb41fe4b-lgq/previous'
[...data]

```

## Query API Documentation

### Version: 1.0

#### /v1/query

**POST**

**Parameters**

| Name | Located in | Description | Required | Schema                                                          |
| ---- | ---------- | ----------- | -------- | --------------------------------------------------------------- |
| body | body       |             | Yes      | [queryQueryProperties](historical-data.md#queryqueryproperties) |

**Responses**

| **Code** | Description            | Schema                                                            |
| -------- | ---------------------- | ----------------------------------------------------------------- |
| 200      | A successful response. | [queryGetQueryResponse](historical-data.md#querygetqueryresponse) |

#### /v1/data/{queryId}/next

**GET**

**Parameters**

| Name    | Located in | Description | Required | Schema |
| ------- | ---------- | ----------- | -------- | ------ |
| queryId | path       |             | Yes      | string |

**Responses**

| Code | Description                                | Schema                                                          |
| ---- | ------------------------------------------ | --------------------------------------------------------------- |
| 200  | A successful response.                     | [queryGetDataResponse](historical-data.md#querygetdataresponse) |
| 400  | Invalid Request.                           |                                                                 |
| 403  | Token Expired.                             |                                                                 |
| 404  | Returned when the resource does not exist. |                                                                 |

#### /v1/data/{queryId}/previous

**GET**

**Parameters**

| Name       | Located in | Description | Required | Schema            |
| ---------- | ---------- | ----------- | -------- | ----------------- |
| queryId    | path       |             | Yes      | string            |
| \_internal | query      |             | No       | boolean (boolean) |

**Responses**

| Code | Description                                | Schema                                                          |
| ---- | ------------------------------------------ | --------------------------------------------------------------- |
| 200  | A successful response.                     | [queryGetDataResponse](historical-data.md#querygetdataresponse) |
| 400  | Invalid Request.                           |                                                                 |
| 403  | Token Expired.                             |                                                                 |
| 404  | Returned when the resource does not exist. |                                                                 |

**protobufAny**

`A`

```
if (any.UnpackTo(&foo)) {
  ...
}
```

Example 2: Pack and unpack a message in Java.

```
Foo foo = ...;
Any any = Any.pack(foo);
...
if (any.is(Foo.class)) {
  foo = any.unpack(Foo.class);
}
```

Example 3: Pack and unpack a message in Python.

```
foo = Foo(...)
any = Any()
any.Pack(foo)
...
if any.Is(Foo.DESCRIPTOR):
  any.Unpack(foo)
  ...
```

Example 4: Pack and unpack a message in Go

```
 foo := &pb.Foo{...}
 any, err := ptypes.MarshalAny(foo)
 ...
 foo := &pb.Foo{}
 if err := ptypes.UnmarshalAny(any, foo); err != nil {
   ...
 }
```

The pack methods provided by protobuf library will by default use 'type.googleapis.com/full.type.name' as the type URL and the unpack methods only use the fully qualified type name after the last '/' in the type URL, for example "foo.bar.com/x/y.z" will yield type name "y.z".

## JSON

The JSON representation of an `Any` value uses the regular representation of the deserialized, embedded message, with an additional field `@type` which contains the type URL. Example:

```
package google.profile;
message Person {
  string first_name = 1;
  string last_name = 2;
}

{
  "@type": "type.googleapis.com/google.profile.Person",
  "firstName": <string>,
  "lastName": <string>
}
```

If the embedded message type is well-known and has a custom JSON representation, that representation will be embedded adding a field `value` which holds the custom JSON in addition to the `@type` field. Example (for message \[google.protobuf.Duration]\[]):

```
{
  "@type": "type.googleapis.com/google.protobuf.Duration",
  "value": "1.212s"
}
```

**queryFilterValues**

| Name   | Type        | Description | Required |
| ------ | ----------- | ----------- | -------- |
| values | \[ string ] |             | No       |

#### **queryGetDataResponse**

| Name      | Type                                                             | Description | Required |
| --------- | ---------------------------------------------------------------- | ----------- | -------- |
| data      | \[ [querySysLogMessage](historical-data.md#querysyslogmessage) ] |             | No       |
| Status    | string                                                           |             | No       |
| remaining | integer                                                          |             | No       |

#### **queryGetQueryResponse**

| Name    | Type                                                         | Description | Required |
| ------- | ------------------------------------------------------------ | ----------- | -------- |
| queryId | string                                                       |             | No       |
| info    | \[ [queryQueryInfo](historical-data.md#queryqueryinfo) ]     |             | No       |
| errors  | \[ [queryQueryErrors](historical-data.md#queryqueryerrors) ] |             | No       |
| meta    | object                                                       |             | No       |

**queryOrderBy**

| Name         | Type   | Description | Required |
| ------------ | ------ | ----------- | -------- |
| queryOrderBy | string |             |          |

#### **queryQueryErrors**

| Name    | Type   | Description | Required |
| ------- | ------ | ----------- | -------- |
| Key     | string |             | No       |
| message | string |             | No       |

#### **queryQueryInfo**

| Name    | Type   | Description | Required |
| ------- | ------ | ----------- | -------- |
| Key     | string |             | No       |
| message | string |             | No       |

#### **queryQueryProperties**

| Name             | Type        | Description | Required |
| ---------------- | ----------- | ----------- | -------- |
| applicationNames | \[ string ] |             | No       |
| filters          | object      |             | No       |
| namespace        | string      |             | No       |
| pageSize         | long        |             | No       |
| startTime        | string      |             | No       |
| endTime          | string      |             | No       |
| keyWord          | string      |             | No       |

#### **querySysLogMessage**

| Name           | Type   | Description | Required |
| -------------- | ------ | ----------- | -------- |
| ID             | string |             | No       |
| AppName        | string |             | No       |
| Facility       | string |             | No       |
| FacilityString | string |             | No       |
| Hostname       | string |             | No       |
| Message        | string |             | No       |
| MsgID          | string |             | No       |
| PartitionID    | string |             | No       |
| Priority       | string |             | No       |
| ProcID         | string |             | No       |
| Sender         | string |             | No       |
| Severity       | string |             | No       |
| SeverityString | string |             | No       |
| StructuredData | string |             | No       |
| Tag            | string |             | No       |
| Timestamp      | string |             | No       |
| Namespace      | string |             | No       |

**runtimeError**

| Name    | Type    | Description | Required |
| ------- | ------- | ----------- | -------- |
| error   | string  |             | No       |
| code    | integer |             | No       |
| message | string  |             | No       |
