# Lookups

What are Lookups?

Lookups are also **key-value pairs**, similar to Variables, but are often used for slightly different purposes, potentially involving **larger sets of data** or data where you might want to check for the existence of the key separately from retrieving the actual value. A single Lookup entry in Vault (identified by its ID) can contain multiple internal key-value pairs.

* **Key (ID/Name):** A unique identifier for the entire lookup entry in Vault (e.g., `customer-tier-config`, `region-mapping-europe`).
* **Value:** The data associated with the lookup ID. This might be a larger block of text, a JSON structure, or other configuration data.

The distinction often lies in how the data is accessed and its potential size or complexity compared to a simple Variable. The system allows retrieving specific parts of the lookup data using an internal key.



> Lookups only support CSV Files for now.&#x20;
>
> Single maximum of 10Mb.

#### When to Use Lookups?

Use Lookups for storing:

* Configuration blocks (e.g., a CSV object defining settings for a specific feature).
* Mapping tables (e.g., mapping user IDs to subscription tiers).
* Larger text-based configuration files or scripts where you need to extract specific parts.
* Data where you frequently need to know _if_ an entry exists before deciding whether to fetch its (potentially large) value.

Lookups provide flexibility for managing structured or larger configuration data tied to a specific key, and like Variables and Certificates, their values can be integrated into code rules.

#### Using Lookups

You can retrieve a specific value from within a Lookup entry stored in Vault using the `ascent.lookups.get()` function. You need the ID of the Lookup entry and the specific internal key whose value you want.

**1. Retrieve Value from Lookup**

Call `ascent.lookups.get()` with the Lookup ID and the internal key.

```javascript
// Assume 'region-mapping-europe' is the ID of a Lookup entry in Vault
// Assume this Lookup contains internal keys like 'UK', 'DE', 'FR' with corresponding values

// Get the value associated with the internal key 'DE' from the 'region-mapping-europe' lookup
const germanyRegionCode = ascent.lookups.get("region-mapping-europe", "DE");

// germanyRegionCode now holds the value associated with 'DE' within that lookup
console.log(germanyRegionCode); // Example output might be "eu-central-1" or similar
```
