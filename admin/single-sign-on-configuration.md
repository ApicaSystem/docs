---
description: SSO configuration details.
---

# Single Sign-On with SAML

Apica Ascent can be configured for user login using Single Sign-On (SSO) with SAML by configuring the system as Service Provider (SP) and Okta, Microsoft Entra ID (Azure AD), OneLogin, Google, or any SAML 2.0-compliant identity provider (IDP). This SAML configuration is a two-step process.

## Step 1: Enabling SAML

Login to the platform with your admin credentials. In the top right, click on the `Settings` menu, and then select the **Settings** tab.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FPcDcT3HO81sgeUu3nacq%2FScreenshot%202025-08-27%20at%203.50.46%E2%80%AFPM.png?alt=media&#x26;token=f5f4df3a-ca71-4082-8e3c-9da95a9b0332" alt=""><figcaption></figcaption></figure>

From the Settings tab, set **SAML Enabled** to one of the two enabled modes and fill in the fields for that mode.

### Enabled (dynamic metadata)

Select **Enabled** and provide the **SAML Metadata URL**, **SAML Entity ID**, and **SAML NameID Format**. Apica Ascent downloads the IdP metadata from the URL and extracts the IdP's single sign-on endpoint, issuer, and signing certificate automatically. The metadata is validated when you save the settings — the URL must serve a SAML metadata XML document containing an `IDPSSODescriptor` with an `X509Certificate` and a `SingleSignOnService` endpoint.

Use this mode whenever your IdP publishes a metadata URL (Okta, Microsoft Entra ID/Azure AD, and OneLogin all do). If your IdP only provides a downloadable metadata file — Google Workspace, for example — you can still use this mode: host the downloaded file at an HTTPS location reachable from your Apica Ascent deployment (such as an S3 bucket) and use that location as the **SAML Metadata URL**, as shown in the [Google GSuite walkthrough](single-sign-on-configuration.md#google-gsuite-configuration) below.

{% hint style="info" %}
The metadata URL is re-read each time the SAML settings are saved. If your IdP rotates its signing certificate or changes its SSO endpoint, re-save the SAML settings so Apica Ascent picks up the new values. If you host the metadata file yourself, upload the new file first.
{% endhint %}

### Enabled (Static)

Select **Enabled (Static)** when your IdP does not publish a metadata URL, or the metadata URL is not reachable from your Apica Ascent deployment. In this mode you enter the IdP details manually:

* **SAML Single Sign-on URL** — the IdP's SSO/login endpoint
* **SAML Issuer URL** — the IdP's entity ID (issuer)
* **SAML x509 cert** — the IdP's signing certificate, uploaded as a file or pasted in

The following x509 certificate formats are supported:

* `.pem`
* `.crt`
* `.cer` (Base64/PEM encoded)
* `.cer` (raw binary/DER)

{% hint style="warning" %}
Static values are manual and frozen: if the IdP rotates its signing certificate or changes its SSO endpoint, SAML login stops working until you update the certificate and URLs here by hand. Prefer the dynamic metadata mode when a metadata URL is available.
{% endhint %}

### Group and role mapping

In both modes, you can control how IdP groups and roles map to Apica Ascent:

* **SAML Group Attribute Name** — the SAML assertion attribute that carries the user's groups (for example `groups`, or `ApicaAscentGroups` as used in the walkthroughs below)
* **SAML Group Mappings** — maps a group name sent by the IdP to one or more Apica Ascent groups
* **SAML Role Attribute Name** and **SAML Role Mappings** — the same, for roles

If user-groups are configured on the IDP side, create the identical user groups in Apica Ascent. This can be done by clicking on the "_Settings"_ menu, selecting the IAM tab, and going to the Groups menu on the right side. This example shows creating the "NonAdmin" user group.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FSXaJPIxR9sdlIUuCqGtE%2FScreenshot%202025-08-27%20at%204.05.18%E2%80%AFPM.png?alt=media&#x26;token=03be9544-6ecc-4ba8-8931-a6ffcae25700" alt=""><figcaption></figcaption></figure>

\
This concludes the Apica Ascent side configuration. Check below for step 2 - the specific [actions for your Identity Provider (IdP)](single-sign-on-configuration.md#step-2-idp-configuration).

Logout as Apica Ascent admin. On the login screen, the "SAML Login" Button should be available to login with the user's SSO credentials. By clicking the button browser is redirected to the IDP screen where the user can log in using its IDP credentials.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FYTOvQ97Gd8WUX9UJwcBf%2FScreenshot%202025-08-27%20at%204.11.48%E2%80%AFPM.png?alt=media&#x26;token=59e37e7b-dc73-47c3-ac58-25a250952c05" alt=""><figcaption></figcaption></figure>

## Step 2: IDP Configuration

This step provides detailed information to configure OKTA and Google as Identity providers. For other identity providers, please refer to identity providers' documentation. In your IDP application, provide the SAML Assertion Consumer Service (ACS) URL for your Apica Ascent environment and attribute mappings

The following attributes are required. The Apica Ascent mappings for each of the attributes are in brackets. Please use the correct attribute name otherwise Apica Ascent will not be able to recognize the SAML assertion

* First name (FirstName) and Last name (LastName)
* Group name (ApicaAscentGroups)

Use following SAML Assertion Consumer Service (ACS) URL

{% hint style="info" %}
_https://**\<Apica Ascent UI IP/Domain>**/saml/callback?org\_slug=default_
{% endhint %}

With this, you should be able to access a SAML metadata URL or SAML metadata file.

### Okta Configuration

This section describes the Okta configuration in detail. Users should assume the Okta admin role and start in the Okta control panel by clicking the button to add a new application. The sign-on method is **SAML 2.0**.

![Create a New App](https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FbGUYHmrlUQR5VNpFlgQ5%2Fsaml-4.png?alt=media\&token=6acd7b6d-0e40-499a-aea3-7b2b046fb030)

On the next screen, OKTA has fields for a few URLs:

* Single Sign-On URL
* Recipient URL
* Destination URL
* Audience Restriction

Use your Apica Ascent endpoint url in following format:\
https://\<apica-ascent-domain-name>/saml/callback?org\_slug=default\
\
Set Name ID format: **EmailAddress**\
Application username: **Email**

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FctLkPfI6Vl2fgQLXpdr2%2Fimage.png?alt=media&#x26;token=0812802f-6617-4c93-a979-bd466fd06e55" alt=""><figcaption></figcaption></figure>

**Configure Attribute statements:**

| **Name**  | **Name Format** | **Value**      |
| --------- | --------------- | -------------- |
| FirstName | Unspecified     | user.firstName |
| LastName  | Unspecified     | user.lastName  |

By default, any user that is created with SAML/SSO will join the default user-group in Apica Ascent. It is possible to configure OKTA to pass groups the user should join by setting the **`ApicaAscentGroups`** parameter with the intended group name. For example, if the SAML user is a member of the NonAdmin group in Okta, at the user login, the user will be authenticated and added to "NonAdmin" group.

{% hint style="danger" %}
The `default` group in Apica Ascent has access to all data sources. It is highly recommended to create a group assignment for your users and configure `ApicaAscentGroups` as described above. This allows RBAC policies and limits access to what data a user can access.
{% endhint %}

\
**Configure Attribute statements:**

| **Group Name**        | **Name Format** | **Value**        |
| --------------------- | --------------- | ---------------- |
| **ApicaAscentGroups** | Basic           | Equals: NonAdmin |

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FVzkYFuOqp3i0Jw4zPgai%2Fimage.png?alt=media&#x26;token=80286a42-a6ac-4c3f-8a82-08ad3ac5d506" alt=""><figcaption></figcaption></figure>

Continue to create the application as guided by OKTA instructions. Once the application is successfully created, the page will navigate to the **Sign On** tab.

![Sign On tab](https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2F53aRBdyocwRR5nyUIBjj%2Fsaml-7.png?alt=media\&token=6b86de73-ab61-4b07-9fcf-7314b6f6bd10)

Here choose the **SHA-2** certificate and click on the **Actions** button and choose the **View IdP metadata** option.

![](https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2F1iolqUsK5SkBUeGUdxvR%2Fsaml-8.png?alt=media\&token=19eb9a58-52cb-4c66-b583-8e14c0bb168e)

This will open a new tab. Here take note of the following information. This is **needed to configure Apica Ascent.**

1. **SAML Metadata URL**: "Identity Provider Metadata" URL depicted below in blue can be copied as a SAML metadata URL or the whole contents of the page can be stored somewhere on the cloud and the path to that file can be used as SAML metadata URL

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FygyLH3mBn7U59VaHejry%2Fimage.png?alt=media&#x26;token=35eb58dd-7254-44b4-bcc4-5fb80f8cf3e4" alt=""><figcaption></figcaption></figure>

2\. **Entity ID**: On the same page shown in the above snapshot, You can find Entity ID.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FoMgeqfi5O5zc6mQS4vLA%2Fimage.png?alt=media&#x26;token=8c7a766d-06c4-4ae1-ad38-ad3325aa4f5f" alt=""><figcaption></figcaption></figure>

3\. **NameIDFormat**: NameID can be found in the SAML metadata by searching NameIDFormat, shown as selected blue text in the picture below.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FOwpHkKawOiwxM2MBHSnz%2Fimage.png?alt=media&#x26;token=2afde906-f9cf-4dfd-9e4e-e79ba9f32edc" alt=""><figcaption></figcaption></figure>

Navigate back to the app and edit "**Audience Restriction**" and set it with the IDP issuer described in #2 above.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FVXz6qeyZXkDyqZOwKGZh%2Fimage.png?alt=media&#x26;token=c783e3a4-5ff2-4179-938e-dec7bc02b65b" alt=""><figcaption></figcaption></figure>

If already not there, create users and user groups such as`NonAdmin` in this example. Users and user groups can also be brought in with inbound federation with ADFS or other identity providers.\
Assign the users to the Application or group such as `NonAdmin` in this example to the Application. This concludes the IDP side configuration.

### Google GSuite Configuration

Navigate to Admin Console and go to the "Web and mobile apps" section

![](https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FtwdR0zoM21e1wbkT31J7%2Fimage.png?alt=media\&token=9575e2ff-bca7-458a-b4e5-1545cad1a97c)

Click on "Add custom SAML app"

![](https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2F2oC5I5hGWZIRoEWYYRAn%2Fimage.png?alt=media\&token=a60397e2-d479-4753-bc3e-b2d7d839f0b4)

Fill in the "App details"

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2Fnwh1tSdfbefveBE1y3uj%2Fimage.png?alt=media&#x26;token=8c7f66d3-5342-4765-b709-a250f82df886" alt=""><figcaption></figcaption></figure>

Download the Idp Metadata file and host the file in a publicly accessible location like AWS S3. The URL of this hosted file is what you will enter as the **SAML Metadata URL** in Apica Ascent (see [Enabled (dynamic metadata)](single-sign-on-configuration.md#enabled-dynamic-metadata) above); Google does not publish a hosted metadata URL for custom SAML apps.

![](https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FoF6oqzgX4oGlEoHmos9a%2Fsaml.png?alt=media\&token=13b4fb83-e884-4f0e-b0e8-142f4fe0eee8)

Enter the service provider details

* ACS URL is the Apica Ascent domain assigned to you appended with **`/saml/callback?org_slug=default`**
* Choose Name ID format as `EMAIL`
* Name ID as `First name`

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FHCLTqBHGaP6mgcZcWUl1%2Fimage.png?alt=media&#x26;token=fb9e5b0d-ea43-4706-9450-7bccf30d76a1" alt=""><figcaption></figcaption></figure>

In the attributes section, either map a "Google Directory attributes" or Group membership to `ApicaAscentGroups`.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2Fg8Pk1TvNAzJBAd4CoYpS%2Fimage.png?alt=media&#x26;token=04d0c102-ba3b-41e2-8347-16a475f1f8d9" alt=""><figcaption></figcaption></figure>

SAML app by default is disabled in Google, enable it and wait for a few minutes and try logging in.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FD2DkyirlBJ7tMRge73lA%2Fimage.png?alt=media&#x26;token=73446b23-f8c7-4ee1-849c-8b5970b210b6" alt=""><figcaption></figcaption></figure>

Next head over to the Apica Ascent SAML configuration screen in the settings. Select "SAML Enabled", and fill in the details.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FlKGbBKBXTbPDu3IyYtQw%2Fimage.png?alt=media&#x26;token=653ebcca-2fdd-4db3-b9ab-1e1aa23fb90f" alt=""><figcaption></figcaption></figure>

Now you are ready to use SAML Login, Logout, and log back in using the SAML Login option.
