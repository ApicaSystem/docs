# ascent.persist

#### Ascent.persist.set

Stores a value persistently

```typescript
ascent.persist.set(key: string, value: any, expiry?: number): any;
```

| Parameter | Type   | Description                           |
| --------- | ------ | ------------------------------------- |
| Key       | String | Identifier that will map to the value |
| Value     | Any    | Value to persist                      |
| expiry    | Number | \<optional>                           |

Example

```typescript
ascent.persist.set("Customer Id","Last Name",15)
```

#### ascent.persist.get

Retrieves a Value by Key.

```
ascent.persist.get(key: String): any;
```

| Parameter | Type   | Description            |
| --------- | ------ | ---------------------- |
| Key       | String | accepts a String value |

Example

```
ascent.persist.set("Customer Id")
```

#### Ascent.persist.redis.set

Stores a value in Redis

```
Ascent.persist.redis.set(url: string,key: string, value: any, expiry?: number): any;
```

<table><thead><tr><th width="143.4000244140625">Parameter</th><th width="132.20001220703125">Type</th><th>Description</th></tr></thead><tbody><tr><td>url</td><td>string</td><td>Redis server url</td></tr><tr><td>key</td><td>string</td><td>key under which to store</td></tr><tr><td>value</td><td>any</td><td>value to store</td></tr><tr><td>expiry?</td><td>number</td><td>(Optional) expiry time in seconds</td></tr></tbody></table>

Example

```
ascent.redis.set("","","",10);
```

#### ascent.persist.redis.get

Retrieves a value from Redis

```
ascent.persist.redis.get(url: string,key: string): any;
```

<table><thead><tr><th width="143.4000244140625">Parameter</th><th width="132.20001220703125">Type</th><th>Description</th></tr></thead><tbody><tr><td>url</td><td>string</td><td>Redis server url</td></tr><tr><td>key</td><td>string</td><td>key to fetch</td></tr></tbody></table>
