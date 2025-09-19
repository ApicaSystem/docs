# Ascent.mask

#### ascent.mask.cc

Masks a credit card number, leaving a specified number of unmasked digits.

```
ascent.mask.cc(input: string, unmasked: number, maskChar: string): string;
```

| Parameter | Type   | Description |
| --------- | ------ | ----------- |
| input     | string |             |
| unmasked  | number |             |
| maskChar  | string |             |

#### ascent.mask.IMEI

Mask an IMEI number, leaving a specified number of unmasked digits

<pre><code><strong>ascent.mask.IMEI(input: string, unmasked: number, maskChar: string): string;
</strong></code></pre>

| Parameter | Type   | Description |
| --------- | ------ | ----------- |
| input     | string |             |
| unmasked  | number |             |
| maskChar  | string |             |

#### ascent.mask.isCC

Checks if a given string is Valid Credit Card Number

```
ascent.mask.isCC(input: string): boolean;
```

| Parameter | Type   | Description |
| --------- | ------ | ----------- |
| input     | string |             |

ascent.mask.isIMEI

Checks if a given string is a Valid IMEI number.

```
ascent.mask.sIMEI(input: string): boolean;
```

| Parameter | Type   | Description |
| --------- | ------ | ----------- |
| input     | string |             |

ascent.mask.random

Generates a random alpha-numeric string of a given lenght.

```
ascent.mask.random(length: number): string;
```

<table><thead><tr><th width="175">Parameter</th><th width="140.199951171875">Type</th><th>Description</th></tr></thead><tbody><tr><td>lenght</td><td>number</td><td>Length of the alpha-numeric value needed.</td></tr></tbody></table>

#### ascent.mask.crc32

Computes the CRC32 checksum of a string

<pre><code><strong>ascent.mask.crc32(input: string): string;
</strong></code></pre>

| Parameter | Type   | Description |
| --------- | ------ | ----------- |
| input     | string |             |

#### ascent.mask.md5

Computes the MD5 hash of a string

<pre><code><strong>ascent.mask.md5(input: string): string;
</strong></code></pre>

| Parameter | Type   | Description |
| --------- | ------ | ----------- |
| input     | string |             |

#### ascent.mask.sha512

Computes the SHA-512 hash of a string

<pre><code><strong>ascent.mask.sha512(input: string): string;
</strong></code></pre>

| Parameter | Type   | Description |
| --------- | ------ | ----------- |
| input     | string |             |

#### ascent.mask.sha256

Computes the SHA-256 hash of a string

<pre><code><strong>ascent.mask.sha256(input: string): string;
</strong></code></pre>

| Parameter | Type   | Description |
| --------- | ------ | ----------- |
| input     | string |             |

#### ascent.mask.redacted

Constant representing a fully redacted value

<pre><code><strong>ascent.mask.redacted: string = 'REDACTED'
</strong></code></pre>
