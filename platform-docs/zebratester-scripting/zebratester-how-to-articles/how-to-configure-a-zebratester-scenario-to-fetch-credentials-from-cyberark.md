# How to Configure a ZebraTester Scenario to Fetch Credentials from CyberArk

If you are a CyberArk user, you are doing so to protect confidential or personally identifiable information. So storing passwords securely also means not having them stored in potentially insecure scripts or files. Instead, they can be placed in an Enterprise Password Vault that can be securely queried by an authenticated client for that password.

The ZebraTester scenarios that need to authenticate via a password can now allow CyberArk customers to pull passwords for use in NTLM authentication in ZT checks from their CyberArk installation instead of putting those passwords in the ZebraTester file itself.

This new feature uses Windows authentication between the ZebraTester agent and the CyberArk instance to verify that it's safe to access the password.

This means that the feature ONLY works with Private/On-Prem Windows-based ZebraTester Agents because (1) the CyberArk client software must be installed on the Agent and (2) a valid Windows Username/Password must be used on the Agent that the CyberArk instance trusts.

### Prerequisites <a href="#howtoconfigureazebratesterscenariotofetchcredentialsfromcyberark-prerequisites" id="howtoconfigureazebratesterscenariotofetchcredentialsfromcyberark-prerequisites"></a>

* **Apica must enable the customer account for the CyberArk NTLM Support feature**
* The customer must have at least one Windows-based ZT _**Private**_ Agent running ZT 5.5F patch 25 or newer, with the CyberArk client software installed, and valid Windows UN/PW configured for access to the customer's CyberArk instance.

### ASM ZebraTester CyberArk Process <a href="#howtoconfigureazebratesterscenariotofetchcredentialsfromcyberark-asmzebratestercyberarkprocess" id="howtoconfigureazebratesterscenariotofetchcredentialsfromcyberark-asmzebratestercyberarkprocess"></a>

**Summary**: Add a new ZebraTester scenario OR edit an existing ZebraTester scenario. Enter your CyberArk credentials to fetch the NTLM password and click _**Re-Compile**_ _**Scenario**_ to compile the CyberArk Command/API URL into the check.



Note that the text input field “Get password from CyberArk vault” above will not be displayed under the “password” field unless the necessary steps are taken on the back end by an Apica engineer. See “**Apica must enable the customer account for the CyberArk NTLM Support feature**“ in the “Prerequisites” section.

#### ASM Process Steps <a href="#howtoconfigureazebratesterscenariotofetchcredentialsfromcyberark-asmprocesssteps" id="howtoconfigureazebratesterscenariotofetchcredentialsfromcyberark-asmprocesssteps"></a>

1. Create, upload, or Edit a ZebraTester check.
2. Check NTLM Authentication
3. Enter the correct Username for NTLM access (i.e. the username to be used when running the ZebraTester scenario)
4. Leave the Password field blank.
5. Enter a valid Password Vault API or SDK Command for accessing CyberArk NTLM credentials (which will depend on the specific CyberArk instance) in the “Get password from CyberArk vault” field.
   1. This will cause the ZebraTester scenario check to fetch the specified password from the Enterprise Password Vault.
   2. _Notice the hover-over dialog that recommends double-checking the CyberArk settings before proceeding to the next step: Recompiling_.
   3. _Any Password you may enter for a username will be **ignored** (and the EPV will be preferred) if there is a CyberArk Command/API URL in that field._
6. Compile the ZT scenario

### Post-Compilation Result <a href="#howtoconfigureazebratesterscenariotofetchcredentialsfromcyberark-post-compilationresult" id="howtoconfigureazebratesterscenariotofetchcredentialsfromcyberark-post-compilationresult"></a>

* Any checks configured to use the modified scenario that will now use CyberArk to fetch the NTLM password.
* If additional checks should use the same scenario and settings, those checks can simply be edited to use the same scenario as above.
* The settings are compiled into the ZebraTester scenario, so the scenario does not need to be modified again.
