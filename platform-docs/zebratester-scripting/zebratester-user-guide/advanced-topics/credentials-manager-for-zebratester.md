# Credentials Manager for ZebraTester

## Function <a href="#credentialsmanagerforzebratester-function" id="credentialsmanagerforzebratester-function"></a>

Credentials Manager is an [Apica ZebraTester plugin](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/148865368/ZebraTester+Plug-in+Handbooks#%22Load-Test-Plug-In%22-Developer-Handbook) that extends the functionality of secure storage and retrieval of credentials or passwords using Apica’s ASM API.

* It’s using, but is not limited to, a combination of [AES/ECB/](https://www.baeldung.com/java-cipher-class)[PKCS5Padding](http://www.herongyang.com/Cryptography/DES-JDK-What-Is-PKCS5Padding.html) and [RSA 512bit Key Pair](https://en.wikipedia.org/wiki/RSA_\(cryptosystem\)) as its current encryption algorithm.

The transformation _AES/ECB/PKCS5Padding_ tells the _getInstance_ method to instantiate the _Cipher_ object as an [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard) cipher with ECB [mode of operation](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation) and PKCS5 [padding scheme](https://en.wikipedia.org/wiki/Padding_\(cryptography\)).

* It can support different types of encryption algorithms.

After retrieving the encrypted username/password from API, the plugin will decrypt data to be used in the ZebraTester script.

_To store the username/password to the Apica ASM servers_, run the JAR plugin from the command line and pass the necessary parameters as we’ll describe below.&#x20;

## Use Cases <a href="#credentialsmanagerforzebratester-usecases" id="credentialsmanagerforzebratester-usecases"></a>

Use Credentials Manager when:

* You are doing ASM monitoring and
* You need to pass username/password (or any key/value combinations) in the script but do not want the text string to be stored and transmitted in cleartext.

This plug-in is not intended for Load Testing scenarios.

#### CyberArk or Credentials Manager? <a href="#credentialsmanagerforzebratester-cyberarkorcredentialsmanager" id="credentialsmanagerforzebratester-cyberarkorcredentialsmanager"></a>

Some companies use **CyberArk** to store and fetch their credentials. But if not using a CyberArk Enterprise Password Vault for this purpose, the Credentials Manager can be used to establish login monitoring, with **test** monitoring usernames and passwords to reasonably obfuscate the passwords.

## Components <a href="#credentialsmanagerforzebratester-components" id="credentialsmanagerforzebratester-components"></a>

* ZebraTester V5.5F or later
* CredentialsManager2UtilityTool\_vXX.jar
* CredentialsManager2.class
* [Apica Synthetic Monitoring API](https://api-asm1.apica.io/v3/Help)
  * A Custom Dictionary is where this information is sent to/from.

| **Method** | **Route**                                                                                                                                                         | **Description**                                                                                                                                                                             |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **POST**   | [/scenarios/proxysniffer/dictionaries](https://api-wpm.apicasystem.com/v3/Help/Route/POST-scenarios-proxysniffer-dictionaries)                                    | Adds the ZebraTester scenario custom dictionary.                                                                                                                                            |
| **GET**    | [/scenarios/proxysniffer/dictionaries/{dictionary\_key}](https://api-wpm.apicasystem.com/v3/Help/Route/GET-scenarios-proxysniffer-dictionaries-dictionary_key)    | Gets a ZebraTester scenario custom dictionary by **dictionary key**. A custom dictionary can contain any data used by Proxy Sniffer scripts that need to be stored separately from scripts. |
| **PUT**    | [/scenarios/proxysniffer/dictionaries/{dictionary\_key}](https://api-wpm.apicasystem.com/v3/Help/Route/PUT-scenarios-proxysniffer-dictionaries-dictionary_key)    | Replaces ZebraTester scenario custom dictionary. **NOTE** that this will replace any existing data already in the dictionary!                                                               |
| **DELETE** | [/scenarios/proxysniffer/dictionaries/{dictionary\_key}](https://api-wpm.apicasystem.com/v3/Help/Route/DELETE-scenarios-proxysniffer-dictionaries-dictionary_key) | Delete a Proxy Sniffer scenario custom dictionary by dictionary key.                                                                                                                        |

***

### &#x20;Downloads: <a href="#credentialsmanagerforzebratester-downloads" id="credentialsmanagerforzebratester-downloads"></a>

The files you’ll need are available here:

* [Credentials Manager Utility – desktop utility for managing ASM Dictionary entries](https://apica-packages.s3.eu-central-1.amazonaws.com/current/zebratester/plugins/CredentialsManager2/CredentialsManager2UtilityTool_v10.jar) (openjdk11 or above is required)
* [Credentials Manager 2 ZebraTester Plugin – class file for including with ZT scripts](https://apica-packages.s3.eu-central-1.amazonaws.com/current/zebratester/plugins/CredentialsManager2/CredentialsManager2.class)

***

### Credentials Manager Process Flow: <a href="#credentialsmanagerforzebratester-credentialsmanagerprocessflow" id="credentialsmanagerforzebratester-credentialsmanagerprocessflow"></a>

During ZebraTester script execution, this plugin will run and retrieve the encrypted credentials using Apica’s ASM API, which is encrypted at rest and during transport. The plugin will decrypt the credentials using the specified encryption algorithm and preset, unique, symmetric key (assigned or designated by the customer) and only stored in the memory during the session.



Installing the Credentials Manager Plugin

<table data-header-hidden><thead><tr><th></th><th></th></tr></thead><tbody><tr><td><strong>Step</strong></td><td><strong>Information</strong></td></tr><tr><td><h4 id="credentialsmanagerforzebratester-1.mandatory-createanentry-anewcustomdictionary">1. Mandatory: Create an Entry (a new custom dictionary)</h4></td><td><p>First, create the encrypted credentials entry into Apica’s ASM API by running the jar version of the plugin from a command line to open GUI.</p><pre><code>java -jar CredentialsManager2UtilityTool_vXX.jar
</code></pre><p></p><p>Key:Value pair(s) will be created as a result.</p><p>Up to 50 key:value pairs can be used for a single dictionary_key as long as the value doesn’t exceed 1000 characters. Credentials Manager 2 also supports long values over 1000 characters (e.g., private keys or certs) but will reduce the number of keys:value pairs that can be stored to around 5 entries.</p></td></tr><tr><td><h4 id="credentialsmanagerforzebratester-2.addthecredentialsmanagerpluginintozebratester">2. Add the Credentials Manager plugin into ZebraTester</h4></td><td>By adding the .class as a plugin to your ZebraTester Script and then passing in the ASM_API_Url, ASM_API_AuthTicket, dictionary_key, shared_secret, and key as an index parameter, you can fetch the encrypted value, which the plugin will decrypt at execution rather than having that value hard-coded into the script as plaintext.</td></tr></tbody></table>

***

### Usage & Syntax: <a href="#credentialsmanagerforzebratester-usage-and-syntax" id="credentialsmanagerforzebratester-usage-and-syntax"></a>

#### To retrieve encrypted credentials and decrypt to be used in the ZebraTester script. <a href="#credentialsmanagerforzebratester-toretrieveencryptedcredentialsanddecrypttobeusedinthezebratesterscr" id="credentialsmanagerforzebratester-toretrieveencryptedcredentialsanddecrypttobeusedinthezebratesterscr"></a>

| **Input Parameter**                                                 |                                |                |                 |
| ------------------------------------------------------------------- | ------------------------------ | -------------- | --------------- |
| **Number**                                                          | **Name**                       | **Mandatory?** | **Assign From** |
| <h4 id="credentialsmanagerforzebratester-1"><strong>1</strong></h4> | Apica ASM API URL              | Yes            | variable        |
| **2**                                                               | Apica ASM API Auth Ticket      | Yes            | variable        |
| **3**                                                               | Dictionary Key                 | Yes            | variable        |
| **4**                                                               | Shared Secret Key              | Yes            | variable        |
| **5**                                                               | Key (of value)                 | Yes            | variable        |
| **6**                                                               | Proxy settings (if applicable) | No             | variable        |
| **Output Parameter**                                                |                                |                |                 |
| **Number**                                                          | **Name**                       | **Mandatory?** | **Extract To**  |
| **1**                                                               | Value (of Key)                 | Yes            | \[variable]     |

***

### CredentialsManager2UtilityTool\_vXX.jar (Used from the GUI) <a href="#credentialsmanagerforzebratester-credentialsmanager2utilitytool_vxx.jar-usedfromthegui" id="credentialsmanagerforzebratester-credentialsmanager2utilitytool_vxx.jar-usedfromthegui"></a>

| **Function**                                             | **Set-up Instructions**                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Encrypt** key/value pairs like Username and Password   | <ul><li>A successful execution of this will result in <code>Created</code></li><li>To verify it would be using the API command with the above username as the dictionary_key as an example:</li><li><p><code>https://api-asm1.apica.io/v3/scenarios/proxysniffer/dictionaries/SampleKey?auth_ticket=[authticket]</code></p><ul><li>It would return the json entry of the encrypted value(s) for the key, <code>SampleKey</code></li></ul></li></ul><p></p> |
| **Update** key/value pairs like Username and Password    |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| **Overwrite** key/value pairs like Username and Password |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| **Decrypt/Retrieve** keys like Password                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |

### Example: <a href="#credentialsmanagerforzebratester-example" id="credentialsmanagerforzebratester-example"></a>

1. CD to a Java /bin location (we’ve used ZebraTester 7B’s java /bin directory)
2. Download current version of “Credentials Manager” jar (as of writing it is CredentialsManager2UtilityTool\_v09.jar) and move to the /bin location you CD’ed to
3.  Run this command:

    ```
    java -jar CredentialsManager2UtilityTool_vXX.jar
    ```

Note that Apica ASM API Url ( [https://api-asm1.apica.io](https://api-asm1.apica.io)) is the base URL only (no path like v3/scenarios/proxysniffer/dictionaries/)



More information about ZebraTester Plugins can be found in the

[https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/148865368/ZebraTester+Plug-in+Handbooks#%22Load-Test-Plug-In%22-Developer-Handbook](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/148865368/ZebraTester+Plug-in+Handbooks#%22Load-Test-Plug-In%22-Developer-Handbook)

### Related articles <a href="#credentialsmanagerforzebratester-relatedarticles" id="credentialsmanagerforzebratester-relatedarticles"></a>

* Page:Credentials Manager for ZebraTester
* Page:ZebraTester How-to articles
