# How to Configure a ZebraTester Script to Fetch Credentials from CyberArk

This process can only be implemented in On Premise environments.

The following process of enabling CyberArk within ZebraTester below _will be overridden_ by NTLM CyberArk entries in the ASM UI above. In other words, the ASM Recompile scenario will always supersede what was previously set in ZebraTester.

To use CyberArk in a ZebraTester check:

1. Create or Edit a ZebraTester check.
   1. Within ZebraTester, ensure that you have the NTLM Authentication Checked and put the CyberArk Command/API URL in the scenario.
   2.  Any password you may enter for a username will be ignored (and the EPV will be preferred) if there is a CyberArk Command/API URL in that field.


2. **In ZebraTester**, enter the correct Username for NTLM access (i.e. the username to be used when running the ZebraTester scenario)
   1.

       Check the "NTLM" Authentication box (see below) to access the NTLM authentication options
   2. Leave the Password field blank.
   3. In the CyberArk Command/API URL field, enter a valid Password Vault API or SDK Command for accessing CyberArk NTLM credentials (which will depend on the specific CyberArk instance)
      1. This will cause the ZebraTester scenario to fetch the specified password
      2. NOTE: Any password entered into the "Password" field will be ignored if the "CyberArk" field is filled in
3. Compile the ZT scenario.

### Post-Compilation Result <a href="#howtoconfigureazebratesterscripttofetchcredentialsfromcyberark-post-compilationresult" id="howtoconfigureazebratesterscripttofetchcredentialsfromcyberark-post-compilationresult"></a>

* Any checks configured to use the modified scenario that will now use CyberArk to fetch the NTLM password.
* If additional checks should use the same scenario and settings, those checks can simply be edited to use the same scenario as above.
* The settings are compiled into the ZebraTester scenario, so the scenario does not need to be modified again.
