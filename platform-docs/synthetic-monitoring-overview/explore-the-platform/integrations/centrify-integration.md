# Centrify Integration

Caveat: the following directions were based on a Centrify UI when it was written. The UI may change by the time you read this and so Centrify UI updates are beyond the scope of this article. Please go to [Centrify](https://www.centrify.com) for their latest information on web applications and other integrations.

## The Centrify Application <a href="#centrifyintegration-thecentrifyapplication" id="centrifyintegration-thecentrifyapplication"></a>



[Centrify](https://www.centrify.com) provides an identity provider service that has its users and roles management.

These external users can be integrated with Synthetic Monitoring, allowing Log in Single Sign-On as a login method.

### Integration Requirements <a href="#centrifyintegration-integrationrequirements" id="centrifyintegration-integrationrequirements"></a>

#### Centrify Management Access <a href="#centrifyintegration-centrifymanagementaccess" id="centrifyintegration-centrifymanagementaccess"></a>

* To complete the integration, you need access to the Centrify Management Console, set up Synthetic Monitoring as a service provider, and add roles and users.
* You must log in with a Centrify user with a System Administrator role.

#### Synthetic Monitoring as Centrify Application <a href="#centrifyintegration-syntheticmonitoringascentrifyapplication" id="centrifyintegration-syntheticmonitoringascentrifyapplication"></a>

* The integration requires you to set up Synthetic Monitoring as a Centrify custom application.

***

## Centrify SSO Overview & Setup <a href="#centrifyintegration-centrifyssooverview-and-setup" id="centrifyintegration-centrifyssooverview-and-setup"></a>

### Preparation <a href="#centrifyintegration-preparation" id="centrifyintegration-preparation"></a>

The integration setup consists of multiple steps. Configuration consists of two major parts:

**A. Configuring the Centrify Application.**

**B. Configuring Apica Synthetic Monitoring for Single Sign on.**

_To perform the integration, you must copy information to and from Synthetic Monitoring._

**Since you will be going back and forth, opening both applications before starting is a good idea.**

#### → **Centrify** ← <a href="#centrifyintegration-centrify" id="centrifyintegration-centrify"></a>

* Go to Centrify management (for example, [https://xyz0999.my.centrify.com/manage\\](https://xyz0999.my.centrify.com/manage))
* Log in with a Centrify **System Administrator** role user
* **Leave the window open**

#### → **Synthetic Monitoring** ← <a href="#centrifyintegration-syntheticmonitoring" id="centrifyintegration-syntheticmonitoring"></a>

* Open Synthetic Monitoring
* Open Centrify SSO Centrify
* Turn on the Centrify SSO Enable setting
* **Leave the window open**

### A. Configure the **Centrify** Application for SAML <a href="#centrifyintegration-a.configurethecentrifyapplicationforsaml" id="centrifyintegration-a.configurethecentrifyapplicationforsaml"></a>

## Step 1: Configure SAML in Centrify <a href="#centrifyintegration-step1-configuresamlincentrify" id="centrifyintegration-step1-configuresamlincentrify"></a>

* Add the SAML Web Application in Centrify
* Add Synthetic Monitoring to Centrify as a custom web application.



* Click **Apps** in the menu



*   Click **Add Web Apps**


* Click **Custom**
*
* Find **SAML** in the list



* Click **Add**



## Step 2: Configure ASM in Centrify <a href="#centrifyintegration-step2-configureasmincentrify" id="centrifyintegration-step2-configureasmincentrify"></a>

* Add the Centrify SSO Service Provider information from your ASM
* Add Synthetic Monitoring to Centrify as a custom web application.

#### Application Settings <a href="#centrifyintegration-applicationsettings" id="centrifyintegration-applicationsettings"></a>

Before Synthetic Monitoring can be used with Centrify, it must be configured.

**Configure**



* Click the application in the list to edit it



**Settings from Synthetic Monitoring**

The application settings are taken from Synthetic Monitoring. You can find your values in the Centrify SSO Service Provider section of the Single Sign-On account settings.



| Option                         | Use ASM value                    |
| ------------------------------ | -------------------------------- |
| Assertion Consumer Service URL | Assertation Consumer Service URL |
| Issuer                         | Issuer                           |

**Note:** The URLs should be `HTTPS` URLs.

**Values for Synthetic Monitoring**

Certain values need to be copied from Centrify and pasted into the Centrify SSO Identity Provider section of the Single Sign-On account settings.



| Value                                | Apply to          |
| ------------------------------------ | ----------------- |
| Identity Provider SAML Meta data URL | SAML Metadata URL |

* Click **Save**

## Script <a href="#centrifyintegration-script" id="centrifyintegration-script"></a>

Add a script to generate the SAML assertion for the application.

### 1. Add Script <a href="#centrifyintegration-1.addscript" id="centrifyintegration-1.addscript"></a>



### 2. Click **Advanced** <a href="#centrifyintegration-2.clickadvanced" id="centrifyintegration-2.clickadvanced"></a>



### 3. Delete all the contents of the Script field <a href="#centrifyintegration-3.deleteallthecontentsofthescriptfield" id="centrifyintegration-3.deleteallthecontentsofthescriptfield"></a>



### 4. Copy the following script <a href="#centrifyintegration-4.copythefollowingscript" id="centrifyintegration-4.copythefollowingscript"></a>

```
setIssuer(Issuer);
setSubjectName(UserIdentifier);
setAudience('<https://synthetic.apicasystem.com/AuthServices>');
setRecipient(ServiceUrl);
setHttpDestination(ServiceUrl);
setSignatureType('Response');
setAttribute('Username', LoginUser.Username);
setAttribute('Fullname', LoginUser.DisplayName);
setAttribute('Email', LoginUser.Email);
setAttributeArray('Roles', LoginUser.RoleNames);
```

### 5. Paste the script into the script field <a href="#centrifyintegration-5.pastethescriptintothescriptfield" id="centrifyintegration-5.pastethescriptintothescriptfield"></a>



### 6. Click **Save** <a href="#centrifyintegration-6.clicksave" id="centrifyintegration-6.clicksave"></a>

## Description <a href="#centrifyintegration-description" id="centrifyintegration-description"></a>

Add a description to distinguish the application in the interface.

### 1. Add Description <a href="#centrifyintegration-1.adddescription" id="centrifyintegration-1.adddescription"></a>



### 2. Click **Description** <a href="#centrifyintegration-2.clickdescription" id="centrifyintegration-2.clickdescription"></a>



| **Item**                | **Description**                        |
| ----------------------- | -------------------------------------- |
| Application Name        | Display name.                          |
| Application Description | Description                            |
| Category                | Sorting category for the app selector. |
| Logo                    | Display logo.                          |

### 3. Enter information as needed. <a href="#centrifyintegration-3.enterinformationasneeded" id="centrifyintegration-3.enterinformationasneeded"></a>

### 4. Upload a suitable logo <a href="#centrifyintegration-4.uploadasuitablelogo" id="centrifyintegration-4.uploadasuitablelogo"></a>

### 5. Click **Save** <a href="#centrifyintegration-5.clicksave" id="centrifyintegration-5.clicksave"></a>

***

## Configuring ASM for SAML and Centrify <a href="#centrifyintegration-configuringasmforsamlandcentrify" id="centrifyintegration-configuringasmforsamlandcentrify"></a>

The configuration of Synthetic Monitoring for https://www.centrify.com/ follows the general process.

To access the SSO settings in ASM, click the button in the top right corner of the User view.



The SSO view contains all settings needed to connect a user account with a SAML provider account.



***

### Configuration <a href="#centrifyintegration-configuration" id="centrifyintegration-configuration"></a>

#### 1. Enable <a href="#centrifyintegration-1.enable" id="centrifyintegration-1.enable"></a>



The **Enabled** section contains a setting for enabling or disabling Single Sign-On for the account and applies to the current account only.

#### 2. Identity Provider <a href="#centrifyintegration-2.identityprovider" id="centrifyintegration-2.identityprovider"></a>



The **Identity Provider** section contains settings for connection to the SAML provider.

**2.a. Use SAML Metadata URL**

If the SAML provider has a SAML metadata URL, you can use that. The needed login URL and certificate will be extracted automatically.

| Item                    | Description                                            |
| ----------------------- | ------------------------------------------------------ |
| Defaul Regional Setting | Standard timezone to use for accounts in the customer. |
| Default Time Zone       | Standard timezone to use for accounts in the customer. |

**2.b. Specify Settings**



_For other SAML providers, you may need to specify settings manually._

| Item                | Description              | Comment                                           |
| ------------------- | ------------------------ | ------------------------------------------------- |
| Sign-Up URL         | Provider Login URL.      | Can be found in the provider's settings.          |
| Signing Certificate | Certificate for sign-in. | Can be downloaded from the provider app settings. |
