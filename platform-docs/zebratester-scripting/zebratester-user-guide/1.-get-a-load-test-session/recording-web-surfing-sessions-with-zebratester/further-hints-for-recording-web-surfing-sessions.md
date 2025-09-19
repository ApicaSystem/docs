# Further Hints for Recording Web Surfing Sessions

* [Support for Technical Client Programs and Web Services (SOAP/XML, JSON and Google Protobuf over HTTP/S)](broken-reference)
* [Proxy Recorder Settings and GUI Settings (Personal Settings Menu)](broken-reference)
  * [Connect to Next Proxy (Proxy Recorder)](broken-reference)
* [Input Fields](broken-reference)
  * [HTTPS Settings (Proxy Recorder)](broken-reference)
* [Input Fields](broken-reference)
* [HTTPS Client Certificate Authentication - PKCS# 12 Files (Proxy Recorder)](broken-reference)
* [HTTPS Client Certificate Authentication - DER or PEM encoded Files (Proxy Recorder)](broken-reference)
  * [HTTPS Client Certificate Authentication - PKCS# 11 Device (Proxy Recorder)](broken-reference)
* [NTLM Authentication (Proxy Recorder)](broken-reference)
* [Input Fields](broken-reference)
* [GUI Settings](broken-reference)
  * [Input Fields](broken-reference)
* [Replay Settings](broken-reference)
  * [Input Fields](broken-reference)

Recording can also be done on web surfing sessions of client programs.

#### Support for Technical Client Programs and Web Services (SOAP/XML, JSON and Google Protobuf over HTTP/S) <a href="#furtherhintsforrecordingwebsurfingsessions-supportfortechnicalclientprogramsandwebservices-soap-xml" id="furtherhintsforrecordingwebsurfingsessions-supportfortechnicalclientprogramsandwebservices-soap-xml"></a>

A Web browser is only required in order to use the Web Admin GUI. This means that you can also record web surfing sessions of (non-Web browser-based) technical client programs that exchange ASCII, SOAP/XML, JSON or Google Protobuf data with the Web server by using the HTTP/S protocol. Please note that you have to configure the **proxy settings** of the technical client program to record web surfing sessions. In case if the technical Web client uses encrypted HTTPS connections, you have also to **import your CA Root Certificate** into the technical Web client (see Installation Guide).

Furthermore, it's also supported to create manually a text file by using any text editor which contains definitions of SOAP and/or XML requests. Such a file can then be converted to a Web-surfing session by using the **import** functionality of the **Session Cutter**.

#### Proxy Recorder Settings and GUI Settings (Personal Settings Menu) <a href="#furtherhintsforrecordingwebsurfingsessions-proxyrecordersettingsandguisettings-personalsettingsmenu" id="furtherhintsforrecordingwebsurfingsessions-proxyrecordersettingsandguisettings-personalsettingsmenu"></a>



The “Personal Settings” menu allows you to configure non-form-based authentication methods (**NTLM, PKCS# 11, PKCS# 12 and DER/PEM based client certificates**) and some SSL options for the proxy recorder which may be necessary in order to successfully record a Web-surfing session. **Furthermore, cascading the proxy recorder with another (outbound) proxy server of your company is also supported**.



Note 1: The credentials for **Basic and Digest authentication** are directly requested by the Web browser during recoding of a Web-surfing session. This means that no special configuration is required for these two authentication methods inside this menu.

Note 2: The authentication credentials entered in this menu can also be transferred into the generated load test programs. **The allocation of individual credentials per simulated user can be selected when generating the HTTP(S) Load Test Programs**

The “Web GUI” part of the menu allows you to set the **default time zone**, and the **default number format**, which will be used by the GUI and by the load test programs.

Additionally, also **Alert Notifications** can be configured which are sent during the execution of a job as **Emails or as SMS messages**

**Connect to Next Proxy (Proxy Recorder)**

**Checkbox in Title**: if checked, ZebraTester cascades the proxy recorder with another, "next", outbound proxy server of your company.

**Note:** To execute a load test through a proxy server, you must also enable the option **Load Test over HTTP(S) Proxy** in the [**Generate HTTP(S) Load Test Program**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620870/Generate+HTTP+S+Load+Test+Program) menu.

#### Input Fields <a href="#furtherhintsforrecordingwebsurfingsessions-inputfields" id="furtherhintsforrecordingwebsurfingsessions-inputfields"></a>

| `Next Proxy HTTP Host`           | (DNS) hostname or TCP/IP address of the next proxy server (for unencrypted connections).                                                                     |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Next Proxy HTTP Port`           | HTTP TCP/IP port number of the next proxy server (for unencrypted connections).                                                                              |
| `Next Proxy HTTP Cache disabled` | if checked, request the next proxy server to disable its internal cache.                                                                                     |
| `Next Proxy HTTPS Host`          | (DNS) hostname or TCP/IP address of the next proxy server (for encrypted connections).                                                                       |
| `Next Proxy HTTPS Port`          | HTTPS (secure) TCP/IP port number of the next proxy server (for encrypted connections).                                                                      |
| `Next Proxy Auth Username`       | basic-authentication username, used for proxy authentication on the next proxy server.                                                                       |
| `Next Proxy Auth Password`       | basic-authentication password, used for proxy authentication on the next proxy server.                                                                       |
| `No Next Proxy for Host/Domain`  | allows you to set a list of hosts, or domain names, for which the proxy settings must not be applied. The entries must be separated by commas or semicolons. |

**Proxy Auto-Config (PAC) Settings PAC Settings   (Proxy Recorder):**



**If the Title Checkbox is** **checked**, this enables PAC support against web servers during the recording of web surfing sessions. ZebraTester cascades the proxy recorder with another, "next", outbound proxy server of your company. If the PAC file is at a specific URL, please enter the **URL of the PAC file**.

**HTTPS Settings (Proxy Recorder)**

It allows you to adjust the HTTPS settings of the proxy recorder (used when recording encrypted network connections).

#### Input Fields <a href="#furtherhintsforrecordingwebsurfingsessions-inputfields.1" id="furtherhintsforrecordingwebsurfingsessions-inputfields.1"></a>

| `SSL Version`                 | It allows you to select the SSL protocol version.                                                                                                                                                                      |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `HTTPS Response Timeout`      | Response timeout per HTTPS URL call. If this timeout expires, the corresponding HTTPS URL call will be aborted.                                                                                                        |
| `SSL Session Cache enabled`   | If checked, enables the SSL session cache (keeping the same SSL session ID over multiple Web pages).                                                                                                                   |
| `SSL Session Cache Timeout`   | The lifetime of the SSL sessions within the session cache.                                                                                                                                                             |
| `Allow Legacy Renegotiation`  | If checked, SSL legacy renegotiation without using the Renegotiation Indication Extension (RFC 5746) is supported.                                                                                                     |
| `Support Elliptic Curves`     | If checked, also rarely used encryption algorithms like ECC are enabled. This means that all available encryption algorithms are enabled (inclusive very weak and very strong algorithms).                             |
| `SNI enabled`                 | If checked, Server Name Indication (SNI) information about the target hostname is sent to the Web server(s) during the SSL handshake (RFC 3546).                                                                       |
| `SNI critical`                | If checked and SNI is enabled, SSL handshakes are aborted if the target Web server(s) doesn't support Server Name Indication (SNI). The corresponding HTTP requests will fail in such a case and no data are recorded. |
| `Enhanced Compatibility Mode` | If checked, enables workarounds to support poorly-implemented SSL server libraries.                                                                                                                                    |
| `Debug Handshakes`            | If checked, debug information about SSL/TLS Handshakes are written to stdout or to the ZebraTester Console.                                                                                                            |

#### HTTPS Client Certificate Authentication - PKCS# 12 Files (Proxy Recorder) <a href="#furtherhintsforrecordingwebsurfingsessions-httpsclientcertificateauthentication-pkcs-12files-proxyre" id="furtherhintsforrecordingwebsurfingsessions-httpsclientcertificateauthentication-pkcs-12files-proxyre"></a>

Allows you to load X509 SSL/TLS _client_ certificates, in PKCS# 12 file-format, into the proxy recorder. Because the proxy recorder operates like a **man in the middle** between the Web browser and the Web server, the client certificate must be loaded and activated before a Web-surfing session requiring such a certificate can be recorded.

**Note:** Normal HTTPS sessions do not require client certificates.

The PKCS# 12 file must first be loaded by using the Personal Settings menu. Also, ensure that the certificate is active by clicking inside the red bar on the certificate. The red bar will change to a green checkmark when the certificate is properly active.



**Note:** To execute a load test that uses client certificates, you must also enable the option [**PKCS# 12 Client Certificates** in the **Generate Load Test Program**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620870/Generate+HTTP+S+Load+Test+Program) menu. The allocation of individual client certificates _per simulated user_ is supported when generating load **test programs.**

**From the Load Test Program Dialog:**



#### HTTPS Client Certificate Authentication - DER or PEM encoded Files (Proxy Recorder) <a href="#furtherhintsforrecordingwebsurfingsessions-httpsclientcertificateauthentication-derorpemencodedfiles" id="furtherhintsforrecordingwebsurfingsessions-httpsclientcertificateauthentication-derorpemencodedfiles"></a>

Allows to load X509 SSL/TLS DER or PEM encoded client certificates into the proxy recorder. Based on the fact that the proxy recorder operates as "man in the middle" between the Web browser and the Web server, the client certificate must be loaded and activated before a Web-surfing session which requires such a certificate can be recorded.

Therefore, the file containing the DER or PEM encoded client certificate first be loaded by using the personal settings menu. Also, ensure that the certificate is activated by clicking inside the red bar on the certificate which turns this bar to a green checkmark.

**Note**: To execute a load test that uses client certificates you have also to enable the option [**DER/PEM Client Certificates**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620870/Generate+HTTP+S+Load+Test+Program) when generating the Load Test Program (see above screenshot). The allocation of individual client certificates _per simulated user_ is supported and can be selected when generating the load test programs.

**HTTPS Client Certificate Authentication - PKCS# 11 Device (Proxy Recorder)**



Allows you to use in Proxy Recorder X509 SSL/TLS client certificates which are embedded in PKCS# 11 Security Devices (support for HSMs and smart cards).

**Note:** Normal HTTPS sessions do not require client certificates.

Because the proxy recorder operates like a **man in the middle** between the Web browser and the Web server, the client certificate must be loaded and activated before a Web-surfing session requiring such a certificate can be recorded.

#### NTLM Authentication (Proxy Recorder) <a href="#furtherhintsforrecordingwebsurfingsessions-ntlmauthentication-proxyrecorder" id="furtherhintsforrecordingwebsurfingsessions-ntlmauthentication-proxyrecorder"></a>

**Checkbox in Title**: If checked, enables NTLM authentication against Web servers during recording.

**Note:** To execute a load test that uses NTLM authentication, you must also enable the option (see above screenshot) [**NTLM Authentication** in the **Generate Load Test Program** menu](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620870/Generate+HTTP+S+Load+Test+Program). The allocation of individual NTLM accounts _per simulated user_ is supported when generating load test programs.

#### Input Fields <a href="#furtherhintsforrecordingwebsurfingsessions-inputfields.2" id="furtherhintsforrecordingwebsurfingsessions-inputfields.2"></a>

| `Domain`   | Windows domain name.              |
| ---------- | --------------------------------- |
| `Username` | Username of a domain account.     |
| `Password` | The password of a domain account. |

### GUI Settings <a href="#furtherhintsforrecordingwebsurfingsessions-guisettings" id="furtherhintsforrecordingwebsurfingsessions-guisettings"></a>

#### Input Fields <a href="#furtherhintsforrecordingwebsurfingsessions-inputfields.3" id="furtherhintsforrecordingwebsurfingsessions-inputfields.3"></a>

| `Time Zone`        | ¹ Allows you to set the default time zone to be used by the load test programs, and by the GUI.                         |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| `Number Format`    | ¹ Allows you to set the default decimal grouping separator character for numbers; for example 123’456.00 or 123,456.00. |
| `Background Color` | Allows you to choose your desired background color for all windows.                                                     |

¹ only temporarily applied until program termination - for Windows, Mac OS X, and Linux systems: Modify the startup settings file **prxsniff.dat** to change these values permanently. For other Unix-like systems: Set the program arguments -tz and -dgs to the corresponding values.

### Replay Settings <a href="#furtherhintsforrecordingwebsurfingsessions-replaysettings" id="furtherhintsforrecordingwebsurfingsessions-replaysettings"></a>



#### Input Fields <a href="#furtherhintsforrecordingwebsurfingsessions-inputfields.4" id="furtherhintsforrecordingwebsurfingsessions-inputfields.4"></a>

* **Number of loops**: Allows you to set the number of loops that load test program run during the replay.
* **Character Encoding**: Defines which character set is used to search strings within the received content and for data which are read from input files. Usually, you can use the default option UTF-8. However, if you execute some tests which contain ISO characters, it is recommended that you use the character set ISO-8859-1 to avoid problems with special characters
* **Strip Referrer Header Field:** The HTTP referrer header field is not commonly used by web applications, and also often dropped by (local) internet security tools. Enabling this option reduces the data transfer and makes the load test program smaller.
* **Strip Accept Header Field to \*/\*:** The HTTP Accept header field is not commonly used by web applications but contains a long text string. Setting the accept header field to \*/\* reduces the data transfer and makes the load test program smaller.
* **Additional Options:** Several additional options for executing the replay can be combined by adding a blank char between each of the options
* **Browser Emulation:** User Agents and Caching\
  &#x20;1\. User-Agent Selection: This option is used either to create a custom user agent string or select a user agent from the available list.\
  &#x20;2\. Browser Cache: This option emulates the cache setting of a real browser.
  * Check for newer versions of stored pages every time: when enabled, ZebraTester will check for later versions of the specified URL than those stored in the cache

¹ only temporarily applied until program termination - for Windows, Mac OS X and Linux systems: Modify the startup settings file **prxsniff.dat** to change these values permanently. For other Unix-like systems: Set the program arguments **-tz** and -**dgs** to the corresponding values (see Application Reference Manual).
