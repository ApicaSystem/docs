# ZebraTester Plugin Repository

## **Custom ZebraTester Plugins** <a href="#zebratesterpluginrepository-customzebratesterplugins" id="zebratesterpluginrepository-customzebratesterplugins"></a>

* [Custom ZebraTester Plugins](broken-reference)
  * [Generic JDBC Plugin](broken-reference)
  * [HTTP2 Plugin](broken-reference)
  * [GWT Serialisation and Deserialisation](broken-reference)
  * [gRPC application execution support](broken-reference)
  * [WebService Security Plugins for SOAP message](broken-reference)
  * [Message Queue Plugin for sending Payloads to the Queue](broken-reference)
  * [Add Request Header](broken-reference)
  * [Add Slash](broken-reference)
  * [AppDynamics Integrations Plugins](broken-reference)
  * [Credentials Manager (Apica version)](broken-reference)
    * [Credentials Manager 2](broken-reference)
    * [Credentials Manager Lite](broken-reference)
  * [Extract Chars From Front Of String](broken-reference)
  * [Extract Substring In Between](broken-reference)
  * [Extract Values From JSON](broken-reference)
  * [Generate GUID](broken-reference)
  * [Generate MD5 Plugin](broken-reference)
  * [Generate SHA1 Plugin](broken-reference)
  * [Generate random characters](broken-reference)
  * [Generate Random Email Address](broken-reference)
  * [Generate Unix Timestamp](broken-reference)
  * [GetPercentOfANumber](broken-reference)
  * [Generate oauth 1.0 signature](broken-reference)
  * [Modify Error Snapshots](broken-reference)
  * [String Joiner](broken-reference)
  * [Trim String](broken-reference)
  * [Day Difference](broken-reference)
  * [Day Difference Reversed](broken-reference)
  * [GET ASM dictionary](broken-reference)
  * [PUT ASM dictionary](broken-reference)
  * [SFTP plugin (upload and download)](broken-reference)
  * [SFTP download file](broken-reference)
  * [SSH and run command](broken-reference)
  * [ActiveMQ Support for ZT](broken-reference)
  * [IBM\_WebsphereMQ for ZT](broken-reference)
  * [Convert Timestamp to Unix](broken-reference)
  * [Upload Custom Integer Value as Response Value in ASM GUI](broken-reference)
  * [Update Kerberos Username & PasswordB64 with input parameters/stand alone variables.](broken-reference)
  * [OTP/MFA Code Generator (Authenticator)](broken-reference)
  * [Apica Data Repository REST API Plugin](broken-reference)

### **Generic JDBC Plugin** <a href="#zebratesterpluginrepository-genericjdbcplugin" id="zebratesterpluginrepository-genericjdbcplugin"></a>

**This JDBC Plugin can connect to any Database and execute queries , the only important thing is the database driver jar file need to be in the class path (Add to external resources)**

* **Sample - contact support**

**Example input parameters to be passed to this plugin ; Db Driver -** com.microsoft.sqlserver.jdbc.SQLServerDriver, **DB Url** - "jdbc:sqlserver://localhost;database=Apica;", **Username** , **Password** and **DB Query** . You can also pass an additional **parameter** for dynamic id or any other things , which is part of the DB Query.

We have support for load testing & ASM with JDBC.

### **HTTP2 Plugin** <a href="#zebratesterpluginrepository-http2plugin" id="zebratesterpluginrepository-http2plugin"></a>

**Latest modification adds support for multiple HTTP response codes.**

* Adds HTTP2 compatibility to ZT using an external HTTP2 compliant HTTP Client.The call should be disabled from the ZT point of view. The plugin will execute the call using the external library okHttp.
* Response data needs to be handled in inline script as the plugin returns **ALL** response data in a single string.
* Assigning request data will however work normally with all the regular assignment methods available in ZT.
* **Sample - contact support**

| <p>Instructions:<br>Attach this plugin to any request where you want to use HTTP/2. You need to disable the request in order for the plugin to work properly.</p><p>Input parameters:<br>Verify HTTP Status Code: The HTTP status code you want the response to have - an empty string will disable this check<br>Multiple HTTP Status Codes(2) in the form of comma separated list (200,302) for example<br>Verify Header: A response header value you want the response to have - an empty string will disable this check<br>Verify Text: A text string to look for in the response - an empty string will disable this check</p><p>Output parameters<br>Response Status Code: The response status code from the HTTP/2 response<br>Response Headers: The response headers from the HTTP/2 response - the headers will all be returned as one string connected using three semicolons (;;;)<br>Response Content: The response content from the HTTP/2 response</p><p>Limitations:<br>When an error occurs two error snapshots will appear. This is unfortunately not something that I can change.<br>The implementation currently does not allow for us to check the content type of the response<br>The plugin heavily utilizes reflection which means that performance is much worse than normal. Running loadtests with this plugin is not recommended.</p> |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

### **GWT Serialisation and Deserialisation** <a href="#zebratesterpluginrepository-gwtserialisationanddeserialisation" id="zebratesterpluginrepository-gwtserialisationanddeserialisation"></a>

**Both recording / load test plugins - Created for B2B Automation use case**

* **Sample - contact support**

### **gRPC application execution support** <a href="#zebratesterpluginrepository-grpcapplicationexecutionsupport" id="zebratesterpluginrepository-grpcapplicationexecutionsupport"></a>

* **Sample - contact support**

### **WebService Security Plugins for SOAP message** <a href="#zebratesterpluginrepository-webservicesecuritypluginsforsoapmessage" id="zebratesterpluginrepository-webservicesecuritypluginsforsoapmessage"></a>

Sign and Encrypt Plugin for Request Content

* **Sample - contact support**

Decrypt and Content Verify Plugin for Response Content

* **Sample - contact support**

Dependencies jars

* **Sample - contact support**

### **Message Queue Plugin for sending Payloads to the Queue** <a href="#zebratesterpluginrepository-messagequeuepluginforsendingpayloadstothequeue" id="zebratesterpluginrepository-messagequeuepluginforsendingpayloadstothequeue"></a>

* **Sample - contact support**

Dependencies jars

* **Sample - contact support**

### **Add Request Header** <a href="#zebratesterpluginrepository-addrequestheader" id="zebratesterpluginrepository-addrequestheader"></a>

adds custom request header to url requests

* **Sample - contact support**

### **Add Slash** <a href="#zebratesterpluginrepository-addslash" id="zebratesterpluginrepository-addslash"></a>

adds slash in between last and second to the last character of a string.

* **Sample - contact support**

### **AppDynamics Integrations Plugins** <a href="#zebratesterpluginrepository-appdynamicsintegrationsplugins" id="zebratesterpluginrepository-appdynamicsintegrationsplugins"></a>

**AppdynamicsIntegrationV1**

Adds two headers to each call that forces appdynamics to trigger a snapshot of that transaction and tags it with a unique GUID. This allows one to track the transactions inside appdynamics by searching for the Header-ApicaGUID and the GUID associated with that loop among the transaction snapshots in the appdynamics controller. To search for a specific series of snapshots associated with that loop you go to the controller and click on the application that's being targeted > Transaction Snapshot > All snapshots and click Show Filters. In the Search Criteria you expand the Data Collector Data and enter Header-ApicaGUID in the name field and the GUID in the value field. This will bring up all snapshots associated with that loop.

* **Sample - contact support**

**AppdynamicsIntegrationV2**

Works in the same way as the V1 but it adds one input field that is set to false by default. False will give the trigger snapshot header the value false and will not trigger a snapshot wile true will force a snapshot. To use this plugin in WPM you need to add the following line to the Additional Options field in the check setup: -vTriggerSnapshot true. if -vTriggerSnapshot true or false is not added to the check setup the check will not run.&#x20;

* **Sample - contact support**

**AppdynamicsIntegrationV3**

Works in the same way as the V2 but generates a 13 long alphanumeric value as ApicaGUID.

* **Sample - contact support**

**AppdynamicsIntegrationV4**

Plugin to insert custom request headers that can be used with AppDynamics to correlate data with Apica.\
Headers: ApicaGUID: (some GUID), ApicaPageName: (Page Break's name/Transaction name)\
Set vTriggerSnapshot to true to enable plugin, otherwise false

* **Sample - contact support**

### **Credentials Manager (Apica version)** <a href="#zebratesterpluginrepository-credentialsmanager-apicaversion" id="zebratesterpluginrepository-credentialsmanager-apicaversion"></a>

Retrieve encrypted username/password from API then plugin will decrypt data to be used in the proxysniffer script. To store username/password to server run plugin from command line and pass necessary parameters. Batch process encrypting/updating password. BEFORE USING: Replace the value for "KEY" with some password key and "AUTH\_TICKET\_PROD" with customer's own API auth\_ticket.

* **Sample - contact support**

Usage:

TO ADD A NEW RECORD\
\-------------------\
Argument\[0] = "encrypt"\
Argument\[1] = (username)\
Argument\[2] = (password)\
Argument\[3] = (environment - possible value:\[dev,uat,prod])

&#x20;

TO UPDATE EXISTING RECORD\
\-------------------------\
Argument\[0] = "update"\
Argument\[1] = (username)\
Argument\[2] = (password)\
Argument\[3] = (environment - possible value:\[dev,uat,prod])

&#x20;

TO TEST IF THE RECORD HAS BEEN WRITTEN AND CONTAINS THE PROPER DATA\
\-------------------------------------------------------------------\
Argument\[0] = "decrypt"\
Argument\[1] = (username)\
Argument\[2] = "\<passkey-string>" (pass the same value as SYMMETRIC\_KEY)\
Argument\[3] = (environment - possible value:\[dev,uat,prod])

&#x20;

TO PROCESS MULTIPLE ID/PASSWORD BY EITHER ADDING OR UPDATING\
\------------------------------------------------------------\
Argument\[0] = "batch"\
Argument\[1] = (file name including full path of .txt file in csv format \[action,username,password])\
Argument\[2] = "\<passkey-string>" (pass the same value as SYMMETRIC\_KEY)\
Argument\[3] = (environment - possible value:\[dev,uat,prod])

#### **Credentials Manager 2** <a href="#zebratesterpluginrepository-credentialsmanager2" id="zebratesterpluginrepository-credentialsmanager2"></a>

Retrieve encrypted text like credentials from ASM API to be decrypted on the fly and used in a ZebraTester script. Use the separate GUI to manage credentials. Additional documentation available in Confluence and KB.

* **Sample - contact support**

#### **Credentials Manager Lite** <a href="#zebratesterpluginrepository-credentialsmanagerlite" id="zebratesterpluginrepository-credentialsmanagerlite"></a>

Simplified version of Credentials Manager where passing in shared secret key and encrypted text will output decrypted text.

* **Sample - contact support**

### **Extract Chars From Front Of String** <a href="#zebratesterpluginrepository-extractcharsfromfrontofstring" id="zebratesterpluginrepository-extractcharsfromfrontofstring"></a>

Plugin to extract certain number of characters from front of input string.

* **Sample - contact support**

### **Extract Substring In Between**  <a href="#zebratesterpluginrepository-extractsubstringinbetween" id="zebratesterpluginrepository-extractsubstringinbetween"></a>

Extracts a substring in between two given strings

* **Sample - contact support**

### **Extract Values From JSON**  <a href="#zebratesterpluginrepository-extractvaluesfromjson" id="zebratesterpluginrepository-extractvaluesfromjson"></a>

Plugin to extract specific values from a JSON string input. Pass the array name and node name to extract.

* **Sample - contact support**

### **Generate GUID**  <a href="#zebratesterpluginrepository-generateguid" id="zebratesterpluginrepository-generateguid"></a>

Plugin to generate globally unique ID. Replaces x with random hex digit so you can set a static value instead of x.

* **Sample - contact support**

### **Generate MD5 Plugin** <a href="#zebratesterpluginrepository-generatemd5plugin" id="zebratesterpluginrepository-generatemd5plugin"></a>

Generates a MD5 hash from an input value. require a var populated by a value either extracted or predefined as a stand alone var then hashes that value and populate the output var with that value.

* **Sample - contact support**

### **Generate SHA1 Plugin** <a href="#zebratesterpluginrepository-generatesha1plugin" id="zebratesterpluginrepository-generatesha1plugin"></a>

Generates a SHA1 hash from tre values (uri\_string, token\_string and salt) to generate a SHA1 hash. require the tre vars to be populated by values either extracted or predefined as a stand alone var then hashes them and populate the output var with that value.

* **Sample - contact support**

### **Generate random characters** <a href="#zebratesterpluginrepository-generaterandomcharacters" id="zebratesterpluginrepository-generaterandomcharacters"></a>

Generates a string of random characters with a specified length based on the value in the specified var. this works just as the generate random numbers plugin thats in ProxySniffer by default.

* **Sample - contact support**

### **Generate Random Email Address** <a href="#zebratesterpluginrepository-generaterandomemailaddress" id="zebratesterpluginrepository-generaterandomemailaddress"></a>

Generate random email address with a specified length (number of characters) as email name and adss a custom domain.

* **Sample - contact support**

### **Generate Unix Timestamp** <a href="#zebratesterpluginrepository-generateunixtimestamp" id="zebratesterpluginrepository-generateunixtimestamp"></a>

Generates current unix timestamp 10 digits long.

* **Sample - contact support**

### **GetPercentOfANumber** <a href="#zebratesterpluginrepository-getpercentofanumber" id="zebratesterpluginrepository-getpercentofanumber"></a>

Plugin to return the percent of a number. First input is the number to get percent from and second number is the percent.

* **Sample - contact support**

### **Generate oauth 1.0 signature** <a href="#zebratesterpluginrepository-generateoauth1.0signature" id="zebratesterpluginrepository-generateoauth1.0signature"></a>

Generates an oauth 1.0 signature, timestamp and nonce.\
User can pass in values for oauth\_key, oauth\_secret, realm and optional values for oauth\_timestamp, oauth\_nonce,oauth\_signature\_method, oauth\_token and oauth\_token\_secret. Plugin will generate values for oauth\_signature, timestamp and nonce.

* **Sample - contact support**

### **Modify Error Snapshots** <a href="#zebratesterpluginrepository-modifyerrorsnapshots" id="zebratesterpluginrepository-modifyerrorsnapshots"></a>

Used to mask password from output logs and error snapshots. Pass in username as parameter (optional parameters: proxy host and proxy port). Used in conjunction with CredentialsMgrApica plugin. (note: this was created separately since this plugin runs after url execution versus pre url execution for Credentials Manager).

* **Sample - contact support**

### **String Joiner**  <a href="#zebratesterpluginrepository-stringjoiner" id="zebratesterpluginrepository-stringjoiner"></a>

Combines two or more strings together (concatenate) into one.

* **Sample - contact support**

### **Trim String** <a href="#zebratesterpluginrepository-trimstring" id="zebratesterpluginrepository-trimstring"></a>

plugin to trim a string from the front and back with user specified length as integer.

* **Sample - contact support**

### **Day Difference** <a href="#zebratesterpluginrepository-daydifference" id="zebratesterpluginrepository-daydifference"></a>

Used to compare a date towards todays date. Must be a date which is in the future.

* **Sample - contact support**

### **Day Difference Reversed** <a href="#zebratesterpluginrepository-daydifferencereversed" id="zebratesterpluginrepository-daydifferencereversed"></a>

Used to compare a date towards todays date. Must be a date which is in the past.

* **Sample - contact support**

### **GET ASM dictionary** <a href="#zebratesterpluginrepository-getasmdictionary" id="zebratesterpluginrepository-getasmdictionary"></a>

Uses the GET-request from the ASM (Zebratester) API to get the request outside of ZebraTester to not affect the overall timings. Might need to manually change silo in the plugin code.

* **Sample - contact support**

### **PUT ASM dictionary** <a href="#zebratesterpluginrepository-putasmdictionary" id="zebratesterpluginrepository-putasmdictionary"></a>

Running the ASM API Dictionary PUT HTTP Request outside of ZebraTester to not affect the overall timings. Might need to manually change silo in the plugin code.

* **Sample - contact support**

### **SFTP plugin (upload and download)** <a href="#zebratesterpluginrepository-sftpplugin-uploadanddownload" id="zebratesterpluginrepository-sftpplugin-uploadanddownload"></a>

Plugin to download or upload file using SFTP and displays metrics using transactions. Modify execute method to download and/or upload from SFTP server. Uses built-in jsch from prxsniff.jar.

* **Sample - contact support**

### **SFTP download file** <a href="#zebratesterpluginrepository-sftpdownloadfile" id="zebratesterpluginrepository-sftpdownloadfile"></a>

This plugin connects to a sftp host, downloads a file and returns the file size and download time. Requires jar.

* **Sample - contact support**

### **SSH and run command** <a href="#zebratesterpluginrepository-sshandruncommand" id="zebratesterpluginrepository-sshandruncommand"></a>

This plugin connects to a remote host, runs a terminal command and returns the output. Requires jar.

* **Sample - contact support**

### **ActiveMQ Support for ZT** <a href="#zebratesterpluginrepository-activemqsupportforzt" id="zebratesterpluginrepository-activemqsupportforzt"></a>

Adds support for ActiveMQ within ZT. Requires a base64 encoded string containing the following settings: "Host Port Message Keystore Queue"

Requires the following libraries:

* **Sample - contact support**

No Class added as Plugin needs Customer Customization.

* **Sample - contact support**

### **IBM\_WebsphereMQ** **for ZT** <a href="#zebratesterpluginrepository-ibm_webspheremqforzt" id="zebratesterpluginrepository-ibm_webspheremqforzt"></a>

Adds support for IBM\_WebsphereMQ within ZT. Requires a base64 encoded string containing the following settings.

### **Convert Timestamp to Unix** <a href="#zebratesterpluginrepository-converttimestamptounix" id="zebratesterpluginrepository-converttimestamptounix"></a>

Using the format "yyyy-mm-dd hh:mm:ss" does also support "yyyy-mm-ddThh:mm:ss:MMM"\
Converts into Unix seconds

* **Sample - contact support**

### **Upload Custom Integer Value as Response Value in ASM GUI** <a href="#zebratesterpluginrepository-uploadcustomintegervalueasresponsevalueinasmgui" id="zebratesterpluginrepository-uploadcustomintegervalueasresponsevalueinasmgui"></a>

Allows for upload of a custom integer value which is calculated in ZebraTester to the "Value" column of the Check Details view in ASM (replaces response time, etc)

* **Sample - contact support**

### **Update Kerberos Username & PasswordB64 with input parameters/stand alone variables.** <a href="#zebratesterpluginrepository-updatekerberosusername-and-passwordb64withinputparameters-standalonevari" id="zebratesterpluginrepository-updatekerberosusername-and-passwordb64withinputparameters-standalonevari"></a>

Allows for changing Kerberos credentials using raw strings (Password will be encoded in the plugin).&#x20;

* **Sample - contact support**

### **OTP/MFA Code Generator (Authenticator)** <a href="#zebratesterpluginrepository-otp-mfacodegenerator-authenticator" id="zebratesterpluginrepository-otp-mfacodegenerator-authenticator"></a>

Generate one-time password by passing in secret key to the plugin.

* **Sample - contact support**

### Apica Data Repository REST API Plugin <a href="#zebratesterpluginrepository-apicadatarepositoryrestapiplugin" id="zebratesterpluginrepository-apicadatarepositoryrestapiplugin"></a>

The ADR REST API plugin allows for interaction with the Apica Data Repository REST API endpoints from a ZebraTester script. See How to Utilize Apica Data Repository From ZT - API Plugin Version for an example implementation.

* **Sample - contact support**
