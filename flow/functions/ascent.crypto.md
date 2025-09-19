---
description: Encryption and Decryption methods for Ascent
---

# ascent.crypto

## Usage

To encrypt or decrypt data, create an AES cipher instance using a specific key available as a certificate in the vault. This ensures that your encryption is secure and tied to your predetermined security protocols. The `ascent.crypto.aes()` function facilitates the setup of this encrypted communication.

## **ascent.crypto.aes()**

Create an AES cipher instance

```
ascent.crypto.aes(cipher: string): 
```

<table><thead><tr><th width="129.79998779296875">Parameter</th><th width="136.39996337890625">Type</th><th>Description</th></tr></thead><tbody><tr><td>cipher</td><td>string</td><td>The AES Key (These are certificate names available in Vault)</td></tr></tbody></table>

Returns an instance of the AES Cipher

\---&#x20;



## ascent.crypto.aes().encrypt()

```javascript
ascent.crypto.aes(cipher: string).encrypt(input: any): string
```

<table><thead><tr><th width="129.79998779296875">Parameter</th><th width="136.39996337890625">Type</th><th>Description</th></tr></thead><tbody><tr><td>input</td><td>any</td><td>the data to encrypt</td></tr></tbody></table>

Returns the encrypted data



## ascent.crypto.aes().decrypt()

```javascript
ascent.crypto.aes(cipher: string).decrypt(input: string): string
```

<table><thead><tr><th width="129.79998779296875">Parameter</th><th width="136.39996337890625">Type</th><th>Description</th></tr></thead><tbody><tr><td>input</td><td>any</td><td>the data to decrypt</td></tr></tbody></table>

Return the decrupted data
