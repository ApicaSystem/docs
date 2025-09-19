---
description: Encoding methods for data in Ascent
---

# ascent.encode



### ascent.encode.base64()

Encodes a string in base64 format.

<pre class="language-go"><code class="lang-go"><strong>ascent.encode.b64(input:string) : string;
</strong></code></pre>

| Parameter | Type   | Description     |
| --------- | ------ | --------------- |
| string    | string | Value to encode |



#### Examples

To base64-encode the username

```typescript
let encoded = ascent.encode.b64("Username");

console.log(encoded) // VXNlcm5hbWU=
```

***

### ascent.encode.gzip()

Compress a string using Gzip. Output a base64 encoded string

```
ascent.encode.gzip(input: string): string;
```

| Parameter | Type   | Description     |
| --------- | ------ | --------------- |
| string    | string | Value to encode |

Examples

To encode the username

```typescript
let gzip = ascent.encode.gzip("Username");
```



### ascent.encode.uri()

Encodes a string using URI encoding

```typescript
ascent.encode.uri(input: string): string;
```

| Parameter | Type   | Description     |
| --------- | ------ | --------------- |
| string    | string | Value to encode |

Examples

To encode the username

```typescript
let encoded = ascent.encode.uri("Username:A");

console.log(encoded);
```

### ascent.encode.hex

Encodes a string in Hexadecimal format.

```
ascent.encode.hex(input: string): string
```

| Parameter | Type                                      | Description     |
| --------- | ----------------------------------------- | --------------- |
| string    | <mark style="color:yellow;">string</mark> | Value to encode |

Examples

To encode the username

```
Event.encode =  ascent.encode.hex("Username");
```

### ascent.encode.flatten()

Flattens a nested object into a single-level key-value mapping using dot `.` and bracket `[]` notation.

```
ascent.encode.flatten(input: object): Record<string, any>;
```

| Function                  | Description                                                           |
| ------------------------- | --------------------------------------------------------------------- |
| `ascent.encode.flatten()` | Takes a nested JSON object and flattens it into a flat key-value map. |

#### Examples

To flatten a nested resource object:

```javascript
let nested = {
  resource: [
    {
      name: "Kevin",
      value: "Test"
    }
  ]
};

let flattened = ascent.encode.flatten(nested);

console.log(flattened);
/*
{
  "resource[0].name": "Kevin",
  "resource[0].value": "Test"
}
*/

```
