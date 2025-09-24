# LDAP Setup

## ORSON - Test Data Orchestrator

### LDAP Configuration

TDO supports SAML and SSO authentication when the LDAP option for user authentication is used.  Kurberos is also supported.  In the instructions below, 'LDAP' is used as the generic term for all of these methods.

&#x20;

To set TDO up using LDAP, you will need to coordinate with the team(s) in your organization that support LDAP services to obtain the correct inputs for the LDAP screen.  In addition, you may need to provide a document showing how TDO is configured.  If this is required, contact the Apica Orson TDO support team for assistance in preparing the document.

&#x20;

Before setting up LDAP on TDO you should become familiar with your organization’s policies and procedures for managing Active Directory and SAML/SSO.

### &#x20;Active Directory groups

All users who will be using TDO must be set up in an Active Directory group. You should have two groups – TDO\_Admin and TDO\_User (follow your organization’s rules for group naming conventions).

&#x20;

All individuals who will have user access should be in the TDO\_User group, and all individuals with Admin access should be in the TDO\_Admin group.

&#x20;

You will need to work with your organization’s Active Directory team to set these groups up and provide the list of users for each group.  You will also likely be asked to provide the name(s) of individuals who can approve adding new users to these groups.

&#x20;&#x20;

### LDAP Setup

LDAP is set up from the LDAP Configuration option under the ‘User Maintenance + LDAP’ menu section.   The screen shot below shows LDAP; Kurberos will be slightly different.

&#x20;

Only ADMIN users can see this menu option.

&#x20;

The screen looks like this:

&#x20;

<figure><img src="../../../.gitbook/assets/image (358).png" alt=""><figcaption><p>LDAP Setup Window</p></figcaption></figure>

&#x20;

The values for each of these lines will be provided by the team owning LDAP in your organization.&#x20;

&#x20;

There are 3 checkboxes across the top of the screen:

·       Enable LDAP Authentication – only check this box when you are turning LDAP on.  If this box is checked, all user authentication requests will be sent via the routing information entered.&#x20;

·       Enable TSL/SSL – the state for this box (checked or unchecked) should be provided by the team that owns LDAP/SSO in your organization.

·       Create Users Automatically – if you click this box, then when a new user who has been added to the proper Active Directory group logs in for the first time, TDO will first complete the authentication process and, if the user authenticates, then the user profile will automatically be added to TDO if they do not already have a TDO account assigned.

o   Note that they must already be part of the appropriate AD group or authentication will fail.

o   This will reduce the amount of work on the part of your admin team in creating new users.

o   All users created in this way will have USER rights; if the individual should be an ADMIN then those rights will have to be manually granted.

&#x20;

### Deleting users

When a user should no longer have access to TDO, in addition to removing their access via the User Maintenance screen, a request to remove them from the appropriate AD group should also be submitted.  Note that removing them from the AD group will stop their ability to log in, but they should also be removed from TDO.
