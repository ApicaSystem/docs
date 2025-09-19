---
description: >-
  The Vault system provides a centralized and secure location for managing
  sensitive configuration data required by applications and infrastructure.
  Instead of scattering secrets like API keys, database
---

# Vault

### Vault manages three primary types of configuration items:

1. **Variables**
2. **Certificates**
3. **Lookups**



> **Integration with Code Rules:**
>
> A key benefit of using Vault is that the stored **Variables, Certificates, and Lookups can be directly referenced and utilized within 'code rules'**. This allows you to dynamically inject secrets, certificate data, or lookup values into your logic wherever code rules are supported.
>
> _For specific details on which functions, processes, or system areas support the execution of code rules and how to reference Vault items within them, please consult the relevant_ [_**code function documentation**_](https://app.gitbook.com/o/-LmzGjHypGkPBzYc0fF0/s/-LmzGprckLqwd5v6bs6m/~/changes/1496/flow/rules/code/functions)_._

***

## Variables

#### What are Variables?

Variables are the simplest form of configuration storage in Vault. They are straightforward **key-value pairs**. Think of them like secure environment variables.

* **Key:** A unique name you use to identify the variable (e.g., `STRIPE_API_KEY`, `DB_CONNECTION_STRING`).
* **Value:** The actual secret or configuration data associated with the key (e.g., `sk_live_...`, `postgres://user:pass@host:port/db`).

#### When to Use Variables?

Use Variables for storing individual pieces of sensitive information or configuration settings, such as:

* API keys for third-party services
* Database passwords or connection strings
* Secret keys used for encryption or signing
* Simple configuration flags

Variables are ideal when you need direct access to a specific, distinct value identified by its name.

***



## Certificates (for Data Encryption/Decryption)

#### What are Certificates?

Within this Vault system, the items managed under 'Certificates' currently function as stored symmetric keys used **solely for the purpose of encrypting and decrypting data directly**. They provide the specific key material needed to protect data payloads and later unprotect them.

Unlike standard X.509 certificates used for authentication or TLS/HTTPS, these "Certificates" in Vault are focused purely on symmetric data protection operations.

#### When to Use Certificates?

Use the 'Certificates' feature in this Vault, when you need to:

* Directly **encrypt** sensitive data elements before storing them (e.g., specific fields in a database, sensitive values within configuration files).
* **Decrypt** data that was previously encrypted using the corresponding key stored here.
* Protect data payloads at the application level before transmission or storage, assuming the recipient or reading process also has access to the same key via Vault.
* Utilize AES encryption/decryption capabilities managed centrally within Vault, referencing the key via code rules where applicable.

Vault acts as a central repository, making it easier to distribute the correct certificates to the services that need them.

***

### Lookups

#### What are Lookups?

Lookups are also **key-value pairs**, similar to Variables, but are often used for slightly different purposes, potentially involving **larger sets of data** or data where you might want to check for the existence of the key separately from retrieving the actual value.

* **Key (ID/Name):** A unique identifier for the lookup item (e.g., `customer-tier-config`, `region-mapping-europe`).
* **Value:** The data associated with the key. This might be a larger block of text, a JSON structure, or other configuration data that isn't just a single simple secret. Right now, we support uploading on CSV Files.

The distinction often lies in how the data is accessed and its potential size or complexity compared to a simple Variable. The system might be optimized to retrieve just the metadata (like the name and ID) separately from the potentially large value itself.

#### When to Use Lookups?

Use Lookups for storing:

* Larger text-based configuration files or scripts.
* Data where you frequently need to know _if_ an entry exists before deciding whether to fetch its (potentially large) value.

Lookups provide flexibility for managing structured or larger configuration data tied to a specific key.

***

In summary, Vault provides specialized tools for managing different kinds of configuration data: simple **Variables** for secrets, **Certificates** for securing communications, and **Lookups** for potentially larger or more structured configuration data. Using Vault helps keep your sensitive information secure and your application configurations manageable.
