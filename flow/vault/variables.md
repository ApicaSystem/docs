# Variables

What are Variables?

Variables are the most straightforward form of configuration storage in Vault. They are general-purpose **key-value pairs**. Think of them like secure environment variables or general secrets storage.

* **Key:** A unique name you use to identify the variable (e.g., `STRIPE_API_KEY`, `DB_CONNECTION_STRING`).
* **Value:** The actual secret or configuration data associated with the key (e.g., `sk_live_...`, `postgres://user:pass@host:port/db`).

#### When to Use Variables?

Use Variables for storing individual pieces of sensitive information or configuration settings, such as:

* API keys for third-party services
* Database passwords or connection strings
* Secret keys used for signing (if not managed elsewhere)
* Simple configuration flags

Variables are ideal when you need direct access to a specific, distinct value identified by its name, including within code rules where supported.

#### Using Variables

You can retrieve the value of a variable stored in Vault using the `ascent.variables.get()` function. You need to know the unique name (ID) of the variable you want to access.

**1. Retrieve Variable Value**

Call `ascent.variables.get()` with the name of the variable.

```javascript
// Get the value of the variable named 'STRIPE_API_KEY' from Vault
const apiKey = ascent.variables.get("STRIPE_API_KEY");

// apiKey now holds the secret value stored in the Vault variable
console.log(apiKey); // Example output: "sk_live_..."
```
