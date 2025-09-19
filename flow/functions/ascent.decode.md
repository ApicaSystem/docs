---
description: Decoding methods for data in Ascent
---

# ascent.decode

### Ascent.decode - Data Decoding Methods

### Apica.decode.base64

decodes a string in Base64 format.

```typescript
ascent.decode.b64(input:string):string;
```

| Parameter | Type   | Description     |
| --------- | ------ | --------------- |
| string    | string | Value to decode |

Examples

To base64-encode the username

```
Event.decode = Ascent.decode.b64("Username")
```

### Ascent.decode.gzip

Compress a string using Gzip. Output a base64 encode string

```
ascent.decode.gzip(input: string): string;
```

| Parameter | Type   | Description     |
| --------- | ------ | --------------- |
| string    | string | Value to encode |

Examples

To encode the username

```
Event.decode =  Ascent.decode.b64("Username");
```

### Ascent.decode.uri

Encodes a string using URI encoding

```
Ascent.decode.uri(input: string): string;
```

| Parameter | Type   | Description     |
| --------- | ------ | --------------- |
| string    | string | Value to encode |

Examples

To decode the username

```
Event.decode =  Ascent.decode.uri("Username");
```

decodes a string in Hexadecimal format.

```
Ascent.decode.hex(input: String): String
```

| Parameter | Type   | Description     |
| --------- | ------ | --------------- |
| string    | string | Value to encode |

Examples

To decode the username

```
Event.decode =  Ascent.decode.hex("Username");
```

### Ascent.decode.unflatten

Transforms a flattened object into a nested JSON structure.\
Useful for reconstructing nested data models from flat key-value mappings.

```
ascent.decode.unflatten(input: Record<string, any>): object;
```

| Parameter | Type             | Description                |
| --------- | ---------------- | -------------------------- |
| input     | {}\<string, any> | Flattened key-value object |

**Examples**\
Unflatten a flattened object:

```javascript
let flattened = {
  "resource[0].name": "Kevin",
  "resource[0].value": "Test"
};
let unflattened = ascent.decode.unflatten(flattened);
/*
Result:
{
  "resource": [
    {
      "name": "Kevin",
      "value": "Test"
    }
  ]
}
*/

```
