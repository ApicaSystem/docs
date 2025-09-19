# Storing and Retrieving Information Using the ASM Dictionary

An ASM “Dictionary” is a repository for storing user names, passwords, internal access URLs, and other sensitive data. Dictionaries can be used to reuse data in multiple environments or to hide access information during monitoring. This allows users to utilize passwords in scenarios without displaying them in cleartext or to reuse a single URL in several different scenarios without manually coding it. Information can be stored and retrieved using [dedicated API commands](https://api-wpm.apicasystem.com/v3/Help#href-Dictionaries).

The Apica custom Selenium scripting command `getDictionary` allows users to access a user-defined dictionary from inside a check scenario script. The `getDictionary` fetches the entire Dictionary (with all key/value pairs) and stores it locally for when the script executes.&#x20;

## Using the getDictionary Command <a href="#storingandretrievinginformationusingtheasmdictionary-usingthegetdictionarycommand" id="storingandretrievinginformationusingtheasmdictionary-usingthegetdictionarycommand"></a>

### Step 1: Create the Dictionary <a href="#storingandretrievinginformationusingtheasmdictionary-step1-createthedictionary" id="storingandretrievinginformationusingtheasmdictionary-step1-createthedictionary"></a>

1. Create/Add a Dictionary using an [API POST command](https://api-wpm.apicasystem.com/v3/Help/Route/POST-scenarios-proxysniffer-dictionaries)
2. Name the _Dictionary Key_ that will be used to access this dictionary:
   1. `"dictionary_key": "ExampleApicaKey","dictionary" {Name:value pairs}`
   2. `"dictionary_key": "ApicaKey","dictionary" {Name:value pairs}`
   3. You will also provide string-pair values in the form of `“targetstring1”: “targetvalue1”` that will form the _Keys_ that access the values needed:
      * `“firstname”: “Doug”`
      * `“lastname”: “Smith”`
      * `“cardnumber”: “1234-1234-1234-1234”`
      * `“expdate”: “12/25”`
3. You must also provide a _Description_:
   1. e.g. `"description": "Test Dictionary"`
4. In this example, the POST command is:
   1. POST scenarios/proxysniffer/dictionaries
5. The POST body for one of the examples above is:

```
{
  "dictionary_key": "DougApicaKey",   
  "dictionary": {
     “firstname”: “Doug”,
     "lastname”: “Smith”,
     "cardnumber”: “1234-1234-1234-1234"
  },
"description": "Test Dictionary"
}
```

### Step 2: Retrieve the Dictionary <a href="#storingandretrievinginformationusingtheasmdictionary-step2-retrievethedictionary" id="storingandretrievinginformationusingtheasmdictionary-step2-retrievethedictionary"></a>

Once the above dictionary has been defined, the Selenium scripting command `getDictionary` allows access to the dictionary information from inside a check scenario script. The `getDictionary` command fetches the **entire** **Dictionary** (with **all** key/value pairs) and stores it locally for when the script executes. It uses the [Apica Dictionaries GET API](https://api-wpm.apicasystem.com/v3/help#href-Dictionaries) to get these dictionary values. The GET call will be in the form of

`https://api-asm1.apica.io/v3/scenarios/proxysniffer/dictionaries/{dictionary_key}?auth_ticket={auth ticket value}`

The `getDictionary` command then turns these key values into ASM variable names for use in the ASM script.

### Example: Using the getDictionary Command within a Selenium Scenario <a href="#storingandretrievinginformationusingtheasmdictionary-example-usingthegetdictionarycommandwithinasele" id="storingandretrievinginformationusingtheasmdictionary-example-usingthegetdictionarycommandwithinasele"></a>

The `getDictionary` command expects two arguments when it fetches predefined variables from a dictionary:

1. **Target**: The user’s API Token/Authorization Ticket
2. **Value:** The dictionary URL `https://api-asm-eu1.apica.io/v3/scenarios/proxysniffer/dictionaries/{dictionary_key}`

The following screenshot provides an example of `getDictionary` usage within a Selenium script:



| **Command**     | **Target**                | **Value**                |
| --------------- | ------------------------- | ------------------------ |
| `getDictionary` | `63F6E******************` | `{API URL}/DougApicaKey` |

| Step                                                                                                                                                                                                                                                                                                                             | Screenshot |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| This screenshot provides an example of the API GET command for the dictionary “DougApicaKey”.                                                                                                                                                                                                                                    |            |
| This screenshot provides another example of the API GET command for the dictionary “ApicaKey”. Note how each dictionary has different defined key-value pairs.                                                                                                                                                                   |            |
| **Selenium Example 1**: The Dictionary Key "DougApicaKey" has 3 key values (excluding the sample value) that are used in the scenario.                                                                                                                                                                                           |            |
| <p><strong>Selenium Example 2</strong>: The Dictionary Key "Apicakey" has 2 key values (excluding the sampleKey value) that are used in this scenario.</p><p>In this case, the username and password values, from the dictionary will be used in the Selenium scenario. These values will not be hard-coded into the script.</p> |            |
