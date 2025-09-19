# Configuring SSO Within ASM

Customers who have adopted a centralized SAML 2.0-compatible Identity Provider (IdP) can utilize SSO to sign into the ASM portal and to manage and administer user accounts.

## Overview <a href="#configuringssowithinasm-overview" id="configuringssowithinasm-overview"></a>

Read this section before attempting an SSO setup. It contains important information which will help you understand the configuration you will be performing! If you have already read the Overview or otherwise wish to proceed to SSO setup from within the ASM Portal, see the section [https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2150498502/Configuring+SSO+Within+ASM#Step-2%3A-Configure-ASM-to-Utilize-SSO](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2150498502/Configuring+SSO+Within+ASM#Step-2%3A-Configure-ASM-to-Utilize-SSO).

### Understanding the Roles of Identity and Service Providers in Relation to ASM <a href="#configuringssowithinasm-understandingtherolesofidentityandserviceprovidersinrelationtoasm" id="configuringssowithinasm-understandingtherolesofidentityandserviceprovidersinrelationtoasm"></a>

SAML 2.0 is an XML-based protocol that uses security tokens containing assertions to pass information about an end-user between an **identity provider (IdP)** and a **service provider (SP)**. SAML 2.0 enables web-based authentication and authorization scenarios including cross-domain SSO, which helps reduce the administrative overhead of distributing multiple authentication tokens to the user.

The Single Sign-On screen allows you to enable and configure settings for SSO IdPs such as:

* Centrify
* Okta
* CA SSO (formerly CA Siteminder)
* Azure and ADFS
* OpenAM
* Symantec/Broadcom VIP Access Manager

#### Comparing SP-initiated and IdP-initiated Authentication <a href="#configuringssowithinasm-comparingsp-initiatedandidp-initiatedauthentication" id="configuringssowithinasm-comparingsp-initiatedandidp-initiatedauthentication"></a>

The ASM portal is capable of accepting SSO configurations which utilize either SP or IdP-initiated authentication flows.

In a _**SP-initiated authentication flow**_, the end user browser sends an authentication request to the SP login URL (in this case, ASM/ALT is the SP).  The SP responds to the browser with a redirect to the IdP for authentication with a SAML request that includes a RelayState token/value.  When the browser sends the request to the IdP (e.g. Okta, Centrify, Azure AD., etc.), the IdP authenticates the user and responds with a browser redirect that includes a SAML message with a SAML assertion and the unmodified RelayState.  When the browser sends the SAML response with the unmodified RelayState to the SP, the SP uses the RelayState to validate the that the assertion is the result of a request originating from the SP.Once SSO configuration is complete in ASM/ALT, SP-initiated authentication is supported by default.  Although it is generally accepted that IdP-initiated authentication is less secure because the SP is unaware of an authentication request when it receives the SAML message/assertion and therefore cannot detect if the message/assertion was stolen or replayed, IdP-initiated authentication can be supported with appropriate configuration on the IdP.

Apica utilizes SP-initiated authentication flow by default!

In an _**IdP-initiated authentication flow**_, the end user navigates to the IdP URL, is prompted for authentication and is presented with a link to the SP (in this case, ASM/ALT is the SP).  A set of predetermined additional attributes associated with the authenticated user and the SP will be populated in the SAML response sent to the browser (customerName (required), RelayState (optional?), etc.), with a redirect to the SP.  The browser then POSTs the SAML message/assertion to the SP.  For Apica, this login flow can include RelayState to indicate what URL Apica should redirect to after a successful SAML assertion.

When this flow is utilized, the end user logs into their IdP (e.g. Okta, Centrify, Azure AD., etc.) and clicks on a link to ASM from there. Then, the IdP sends the browser a `customerName` and `RelayState` attribute in the SAML response, which will redirect the user to the ASM dashboard.

#### Understanding SP-initiated Authentication as it Relates to Apica SSO Login <a href="#configuringssowithinasm-understandingsp-initiatedauthenticationasitrelatestoapicassologin" id="configuringssowithinasm-understandingsp-initiatedauthenticationasitrelatestoapicassologin"></a>

The following diagram further explains the roles of the SP, User-Agent, and IdP in the ASM SSO login process when _**SP-initiated authentication**_ is used. Here, of course, Apica is the SP and configures the target assets.

These target assets have no access controls on them (just an association to ASM), so the access controls and rules are set on the IdP side.

* **User Role**: List of User Roles in ASM to associate with the Identity Provider Role.
* **Monitoring Groups:** List of Monitor Groups in ASM to associate with the Identity Provider Role.
* **Co-Owned Monitoring Groups**: List of Monitor Groups for the Customer’s Power User Role to associate as co-owner with the Identity Provider role.

The browser (an HTTP user agent) is the User-Agent.

The IdP identifies the IdP Role / Group and the levels of access/permissions they are allowed.

Their relationship and their communications are illustrated here (This illustration is an annotated excerpt from the [SAML 2.0 Wikipedia Article](https://en.wikipedia.org/wiki/SAML_2.0)):



This is the first, most common, use case, where the IdP is queried to provide access to the asset that is being requested. It could be any asset, like a video, an image, document, but for Apica Synthetic Monitoring it will access to the ASM Portal.

<table data-header-hidden><thead><tr><th></th><th></th></tr></thead><tbody><tr><td><strong>Step</strong></td><td><strong>Technical Detail</strong></td></tr><tr><td><ol start="1"><li><p>Request the target resource at the Service Provider (SP).</p><ol start="1"><li>In this case, the address in the User Agent/Browser is the login page at <a href="https://wpm.apicasystem.com/">https://wpm.apicasystem.com/</a> and the Service Provider is the ASM service</li></ol></li></ol><p><em>User-Agent/Browser: “I want to log in/get access to an ASM resource using my SSO.”</em></p></td><td><p>The principal (via an HTTP user agent, the browser) requests a target resource at the service provider:</p><pre><code> https://sp.example.com/myresource
</code></pre><p>The service provider performs a security check on behalf of the target resource. If a valid security context at the service provider already exists, skip steps 2–7.</p><p>The service provider may use any kind of mechanism to discover the identity provider that will be used, e.g., ask the user, use a preconfigured IdP, etc.</p></td></tr><tr><td><ol start="1"><li>The service provider (ASM) returns a redirect to the browser with a SAML request).</li></ol><p>The UA/Browser follows the redirect to the IdP (e.g. Centrify, Okta, CA Siteminder, Azure, ADFS, etc.)</p><p><em>ASM: “Please check with your Identity Provider.”</em></p></td><td><p>The service provider generates an appropriate SAMLRequest (and <strong>RelayState,</strong> if any), then redirects the browser to the IdP SSO Service using a standard <a href="https://en.wikipedia.org/wiki/HTTP_302">HTTP 302</a> redirect.</p><pre><code>302 Redirect
Location: https://idp.example.org/SAML2/SSO/Redirect?SAMLRequest=request&#x26;RelayState=token
</code></pre><p>The <code>RelayState</code> token is an opaque reference to state information maintained at the service provider. The value of the <code>SAMLRequest</code> parameter is a deflated, base64-encoded and URL-encoded value of an <code>&#x3C;samlp:AuthnRequest></code> element:</p><pre><code>  &#x3C;samlp:AuthnRequest
    xmlns:samlp="urn:oasis:names:tc:SAML:2.0:protocol"
    xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion"
    ID="identifier_1"
    Version="2.0"
    IssueInstant="2004-12-05T09:21:59Z"
    AssertionConsumerServiceIndex="0">
    &#x3C;saml:Issuer>https://sp.example.com/SAML2&#x3C;/saml:Issuer>
    &#x3C;samlp:NameIDPolicy
      AllowCreate="true"
      Format="urn:oasis:names:tc:SAML:2.0:nameid-format:transient"/>
  &#x3C;/samlp:AuthnRequest>
</code></pre><p>The SAMLRequest may be signed using the SP signing key. Typically, however, this is not necessary.</p></td></tr><tr><td><ol start="1"><li>The UA/browser requests the SSO Service at the IdP.</li></ol><p><em>UA/Browser to IdP: “Here’s my SSO request to gain access to a ASM resource (login/asset).”</em></p><p>The IdP authenticates the user.</p></td><td><p>The user agent issues a GET request to the SSO service at the identity provider:</p><pre><code>GET /SAML2/SSO/Redirect?SAMLRequest=request&#x26;RelayState=token HTTP/1.1
Host: idp.example.org
</code></pre><p>where the values of the <code>SAMLRequest</code> and <code>RelayState</code> parameters are the same as those provided in the redirect. The SSO Service at the identity provider processes the <code>&#x3C;samlp:AuthnRequest></code> element (by URL-decoding, base64-decoding and inflating the request, in that order) and performs a security check. If the user does not have a valid security context, the identity provider identifies the user with any mechanism.</p></td></tr><tr><td><ol start="1"><li>IdP responds with an XHTML form.</li></ol><p>The identity provider returns an authentication form most commonly a login page but could utilize a 2-factor authentication.</p><p><em>IdP to UA/Browser: “Here are your authorization details in this form.”</em></p></td><td><p>The SSO Service validates the request and responds with a document containing an XHTML form:</p><pre><code>  &#x3C;form method="post" action="https://sp.example.com/SAML2/SSO/POST" ...>
    &#x3C;input type="hidden" name="SAMLResponse" value="response" />
    &#x3C;input type="hidden" name="RelayState" value="token" />
    ...
    &#x3C;input type="submit" value="Submit" />
  &#x3C;/form>
</code></pre><p>The value of the <code>RelayState</code> parameter has been preserved from step 3. The value of the <code>SAMLResponse</code> parameter is the base64 encoding of the following <code>&#x3C;samlp:Response></code> element:</p><pre><code>  &#x3C;samlp:Response
    xmlns:samlp="urn:oasis:names:tc:SAML:2.0:protocol"
    xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion"
    ID="identifier_2"
    InResponseTo="identifier_1"
    Version="2.0"
    IssueInstant="2004-12-05T09:22:05Z"
    Destination="https://sp.example.com/SAML2/SSO/POST">
    &#x3C;saml:Issuer>https://idp.example.org/SAML2&#x3C;/saml:Issuer>
    &#x3C;samlp:Status>
      &#x3C;samlp:StatusCode
        Value="urn:oasis:names:tc:SAML:2.0:status:Success"/>
    &#x3C;/samlp:Status>
    &#x3C;saml:Assertion
      xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion"
      ID="identifier_3"
      Version="2.0"
      IssueInstant="2004-12-05T09:22:05Z">
      &#x3C;saml:Issuer>https://idp.example.org/SAML2&#x3C;/saml:Issuer>
      &#x3C;!-- a POSTed assertion MUST be signed -->
      &#x3C;ds:Signature
        xmlns:ds="http://www.w3.org/2000/09/xmldsig#">...&#x3C;/ds:Signature>
      &#x3C;saml:Subject>
        &#x3C;saml:NameID
          Format="urn:oasis:names:tc:SAML:2.0:nameid-format:transient">
          3f7b3dcf-1674-4ecd-92c8-1544f346baf8
        &#x3C;/saml:NameID>
        &#x3C;saml:SubjectConfirmation
          Method="urn:oasis:names:tc:SAML:2.0:cm:bearer">
          &#x3C;saml:SubjectConfirmationData
            InResponseTo="identifier_1"
            Recipient="https://sp.example.com/SAML2/SSO/POST"
            NotOnOrAfter="2004-12-05T09:27:05Z"/>
        &#x3C;/saml:SubjectConfirmation>
      &#x3C;/saml:Subject>
      &#x3C;saml:Conditions
        NotBefore="2004-12-05T09:17:05Z"
        NotOnOrAfter="2004-12-05T09:27:05Z">
        &#x3C;saml:AudienceRestriction>
          &#x3C;saml:Audience>https://sp.example.com/SAML2&#x3C;/saml:Audience>
        &#x3C;/saml:AudienceRestriction>
      &#x3C;/saml:Conditions>
      &#x3C;saml:AuthnStatement
        AuthnInstant="2004-12-05T09:22:00Z"
        SessionIndex="identifier_3">
        &#x3C;saml:AuthnContext>
          &#x3C;saml:AuthnContextClassRef>
            urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport
         &#x3C;/saml:AuthnContextClassRef>
        &#x3C;/saml:AuthnContext>
      &#x3C;/saml:AuthnStatement>
    &#x3C;/saml:Assertion>
  &#x3C;/samlp:Response>
</code></pre></td></tr><tr><td><ol start="1"><li>UA/Browser requests the Assertion Consumer Service at the SP/ASM.</li></ol><p><em>UA/Browser to ASM: “Here’s my IdP information that grants me this set of privileges/rights.”</em></p></td><td><p>The user agent issues a POST request to the Assertion Consumer Service at the service provider:</p><pre><code>POST /SAML2/SSO/POST HTTP/1.1
Host: sp.example.com
Content-Type: application/x-www-form-urlencoded
Content-Length: nnn
 
SAMLResponse=response&#x26;RelayState=token
</code></pre><p>where the values of the <code>SAMLResponse</code> and <code>RelayState</code> parameters are taken from the XHTML form at step 4.</p></td></tr><tr><td><ol start="1"><li>ASM redirects the response to the target resource</li></ol><p><em>ASM: “Thank you. With those privileges, please request that resource again with your access rights.”</em></p></td><td>The assertion consumer service processes the response, creates a security context at the service provider and redirects the user agent to the target resource.</td></tr><tr><td><ol start="1"><li>UA/Browser requests the target resource at the ASM again</li></ol><p><em>UA/Browser: “Please login/get an ASM Asset/Resource with these rights.”</em></p></td><td><p>The user agent requests the target resource at the service provider (again):</p><pre><code> https://sp.example.com/myresource
</code></pre></td></tr><tr><td><ol start="1"><li>ASM responds with the requested resource to the UA/Browser which is a redirect to the target landing page within Apica WPM. i.e. Apica WPM returns the landing page.</li></ol><p><em>ASM: “You are cleared/logged in/able to get the resource you requested. Here’s your content.”</em></p></td><td>Since a security context exists, the service provider returns the resource to the user agent.</td></tr></tbody></table>

### Understanding Single-Sign-On Flow <a href="#configuringssowithinasm-understandingsingle-sign-onflow" id="configuringssowithinasm-understandingsingle-sign-onflow"></a>

When Single sign-on is used, the user primarily interacts with Synthetic Monitoring, and is redirected as needed to the Identity Provider configured for their Customer account.



1. The user directs the browser to to ASM.
2. The browser accesses the ASM SSO login.
3. ASM returns a Identity Provider redirect with a SAML request.
4. The browser contacts the Identity Provider.
5. The identity provider returns an authentication form.
6. The form is shown to the user.
7. The user submits the form.
8. The identity provider authenticates the user.
9. The identity store provides the user authentication.
10. The identity provider returns a a SAML response including the user attributes and roles.
11. The browser sends SAML response to ASM for validation.
12. ASM returns a redirect to the landing page.
13. The browser requests the landing page.
14. ASM returns the landing page.

## Setting up SSO From the ASM Portal <a href="#configuringssowithinasm-settingupssofromtheasmportal" id="configuringssowithinasm-settingupssofromtheasmportal"></a>

Before you begin, make sure you meet the following prerequisites:

1. SSO must be **enabled** by Apica for your Customer Account. Apica will perform this step for you.
2. SSO must be **configured** for your user account. This step must be performed by your organization.

The workflow to get SSO working in Synthetic Monitoring consists of two major steps:

1: Set up the Identity Provider - setting up users and user roles in the identity provider

2: Configure Synthetic Monitoring - setting up connection and mapping user roles between the systems

In the security model deployed to the Apica WPM API, there is a static access token issued per user. SSO users will not have access to this static token because it could be used to authenticate and access the API _after_ a user's access has been revoked within the IdP. Therefore, SSO users can only utilize their API tokens while logged in and for 15 minutes after they have logged out. As such, it is generally beneficial to create a static user whose API key you can use for static automations.

### Step 1: Set Up Identity Provider <a href="#configuringssowithinasm-step1-setupidentityprovider" id="configuringssowithinasm-step1-setupidentityprovider"></a>

For information about how to set up accounts in your Identity Provider, see that provider's documentation. You will need some information about the SAML setup for the Synthetic Monitoring configuration.

### Step 2: Configure ASM to Utilize SSO <a href="#configuringssowithinasm-step2-configureasmtoutilizesso" id="configuringssowithinasm-step2-configureasmtoutilizesso"></a>

After the Identity Provider and Service Provider has been setup the Administrators will need to map the user roles in the Identity Provider with the available Roles (Synthetic Monitoring User).

All available user roles in ASM can be mapped to any user role that the customer might have within their Identity Provider.

#### Step 2a: Navigate to Single Sign On Page <a href="#configuringssowithinasm-step2a-navigatetosinglesignonpage" id="configuringssowithinasm-step2a-navigatetosinglesignonpage"></a>

The **Single Sign-On** view allows you to enable and configure settings for Single Sign-On. First, navigate to the “Settings” page from the dropdown under your username in the top right of the ASM screen:



Next, click the “Single Sign-On (SAML 2.0)” button to access the Single Sign-On Configuration Page.



The “Single Sign-On (SAML 2.0)” button is only available to users with the Customer Admin role!



#### Step 2b: Configure Details in Single Sign-on (SAML 2.0) Page <a href="#configuringssowithinasm-step2b-configuredetailsinsinglesign-on-saml2.0-page" id="configuringssowithinasm-step2b-configuredetailsinsinglesign-on-saml2.0-page"></a>

The SSO view contains all settings needed to connect a user account with a SAML provider account. Configure this page with IdP-specific details as instructed in the following screenshot:



### Step 3: Log in to ASM Using SSO <a href="#configuringssowithinasm-step3-logintoasmusingsso" id="configuringssowithinasm-step3-logintoasmusingsso"></a>

| **Step**                                                                                                                                                                                                       | **Screenshot** |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| Open the [Apica Synthetic Monitoring login page](https://wpm.apicasystem.com/Account/Login)                                                                                                                    |                |
| Click **Sign In using SSO**                                                                                                                                                                                    |                |
| <p>The SSO login dialog is shown.</p><ul><li>Enter your Customer name</li><li>Click Continue</li></ul>                                                                                                         |                |
| If you have not Enabled your Customer Account for SSO, you will get a error to contact your Account Administrator. If you are unsure how to proceed at this point, [contact support](mailto:support@apica.io). |                |
