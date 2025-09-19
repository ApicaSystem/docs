# Certificates

## What are Certificates?

Within this Vault system, the items managed under 'Certificates' currently function as stored symmetric keys used **solely for the purpose of encrypting and decrypting data directly**. They provide the specific key material needed to protect data payloads and later unprotect them.



### When to Use Certificates?

Use the 'Certificates' feature in this Vault (in its current implementation) when you need to:

* Directly **encrypt** sensitive data elements before storing them (e.g., specific fields in a database, sensitive values within configuration files).
* **Decrypt** data that was previously encrypted using the corresponding key stored here.
* Protect data payloads at the application level before transmission or storage, assuming the recipient or reading process also has access to the same key via Vault.
* Utilize AES encryption/decryption capabilities managed centrally within Vault, referencing the key via code rules where applicable.

#### Using Keys for Encryption and Decryption

You can easily encrypt and decrypt data using the AES keys stored as "Certificates" in your Vault. This involves three main steps:

**1. Select Your Encryption Key**

First, identify the name of the "Certificate" in Vault that holds the specific AES key you want to use. Then, initialize the encryption tool using `ascent.crypto.aes()`, passing in that name:

```javascript
// Get the tool configured for your specific key
const cipherTool = ascent.crypto.aes("your-certificate-key-name-in-vault");

const dataToProtect = { sensitiveInfo: "secret value", id: 123 };

// Encrypt the data
const encryptedString = cipherTool.encrypt(dataToProtect);

// encryptedString now holds the secure, encrypted version of your data
console.log(encryptedString); // Example output: "U2FsdGVkX1..."


const decryptedString = cipherTool.decrypt(encryptedString);

// decryptedString now holds the original data, represented as a string
console.log(decryptedString); // Example output: '{"sensitiveInfo":"secret value","id":123}'

```
