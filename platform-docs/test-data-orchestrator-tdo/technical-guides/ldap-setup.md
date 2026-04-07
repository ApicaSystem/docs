# LDAP and SAML Setup

{% hint style="info" %}
Test Data Orchestrator (TDO) has been re-branded to Wayfinder as of Q1 2026.  These documents are currently being re-written to reflect that change.  Test Data Orchestrator / TDO / Wayfinder all refer to the same product throughout these documents.
{% endhint %}

### SSO Configuration

Wayfinder (TDO) supports SAML, LDAP, and Kurberos authentication. LDAP and SAML integration are discussed below; Kurberos instructions are pending.

### &#x20;LDAP Setup

To set Wayfinder (TDO) up using LDAP, you will need to coordinate with the team(s) in your organization that support LDAP services to obtain the correct inputs for the LDAP screen.  In addition, you may need to provide a document showing how Wayfinder (TDO) is configured.  If this is required, contact the Apica Wayfinder (TDO) support team for assistance in preparing the document.

&#x20;

Before setting up LDAP on Wayfinder (TDO) you should become familiar with your organization’s policies and procedures for managing Active Directory and SAML/SSO.

#### &#x20;Active Directory groups

All users who will be using Wayfinder (TDO) must be set up in an Active Directory group. You should have two groups – TDO\_Admin and TDO\_User (follow your organization’s rules for group naming conventions).

&#x20;

{% hint style="info" %}
Wayfinder (TDO) can support two level group authentication and pass role assignments during the SSO login process.  To enable this function, a high level group (ex: TDO\_Access) should be set up for all active users.  The Admin and User level groups should be set up under this higher level group; Wayfinder (TDO) will use the secondary level group to drive the user access level upon each login.
{% endhint %}

All individuals who will have user access should be in the TDO\_User group, and all individuals with Admin access should be in the TDO\_Admin group.

&#x20;

You will need to work with your organization’s Active Directory team to set these groups up and provide the list of users for each group.  You will also likely be asked to provide the name(s) of individuals who can approve adding new users to these groups.

&#x20;&#x20;

#### LDAP Setup

LDAP is set up from the LDAP Configuration option under the ‘User Maintenance - LDAP’ menu section.  &#x20;

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

·       Create Users Automatically – if you click this box, then when a new user who has been added to the proper Active Directory group logs in for the first time, Wayfinder (TDO) will first complete the authentication process and, if the user authenticates, then the user profile will automatically be added to Wayfinder (TDO) if they do not already have a Wayfinder (TDO) account assigned.

o   Note that they must already be part of the appropriate AD group or authentication will fail.

o   This will reduce the amount of work on the part of your admin team in creating new users.

o   All users created in this way will have USER rights; if the individual should be an ADMIN then those rights will have to be manually granted.

#### &#x20;Deleting users

When a user should no longer have access to Wayfinder (TDO), in addition to removing their access via the User Maintenance screen, a request to remove them from the appropriate AD group should also be submitted.  Note that removing them from the AD group will stop their ability to log in, but they should also be removed from Wayfinder (TDO).

### SAML Setup

SAML setup is done using the settings in the server.json file in the TDO/api/conf/common directory on the Wayfinder (TDO) server and creating an AD group (security group) with the authorized Wayfinder (TDO) users.  SAML will use the Wayfinder (TDO) security group to only allow users who are allowed access to the application to log in.

In order to set up SAML, you will need to set up the AD group and create an entry in your organization's Identity Provider application.  The steps for this are:

1\) Register Wayfinder (TDO) application in your Identity Provider and provide following SAML settings:

•        Single sign-on URL: \<tdo\_application\_url>/callback  (tdo\_application\_url is the server IP address, name, or alias that users will be provided to access the application, for instance 99.99.99.99 or 'server.org.net')

•        Recipient URL: same as Single sign-on URL

•        Destination URL: same as Single sign-on URL

•        Audience URI (SP Entity ID): orson:tdo  \[orson:tdo is a constant value that Wayfinder (TDO) uses to identify itself]

2\) Add attribute statement to the SAML assertion with following properties:

•        Name: tdoUserName  \[tdoUserName is the internal name Wayfinder (TDO) uses to reference the 'user name' variable that is used in the User Profile]

•        Value: provide an expression that will give user name in lower case, without spaces and special characters

3\) Save configuration and download Identity Provider Metadata in XML format (it must contain endpoints and certificate data)

Once the Identity Provider Metadata XML file is available, it must be copied to the TDO/api folder on the Wayfinder (TDO) server and renamed to idp-metadata.xml.  If the file sp-metadata.xml exists in this folder, it must be deleted.

Open the TDO/api/conf/common/server.json file in a text editor, navigate to the authClient  and change it to SAML2Client.  Save the file changes and restart Wayfinder (TDO) for this to take effect.

#### Adding/Deleting Users with SAML

You do not need to enroll users in Wayfinder (TDO) once SAML has been activated.  If an individual is in the AD group for Wayfinder (TDO), then the first time they try to log into the application TDO will create their login profile.  This will reduce the amount of administrative work required to manage users.

All users created using the automated process will be created with USER level privileges.  If they need ADMIN level rights, or Workflow access, that will have to be manually granted in the Wayfinder (TDO) User Maintenance screen by an Admin.

To delete a user's access from Wayfinder (TDO), they must be removed from the AD group that the SAML Identity Provider uses for validation.  Once they are removed from that group, their ID can be removed from Wayfinder (TDO) by and Admin level user. &#x20;

{% hint style="danger" %}
Remember that even though their ability to access Wayfinder (TDO) has been deleted by removing them from the AD group, their login profile will continue to count against the license limit until removed from Wayfinder (TDO).
{% endhint %}
