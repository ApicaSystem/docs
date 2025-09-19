# 3. Parameterization: Input Fields, ADR and Input Files

* [User Input Fields](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/150405482/3+.+Parameterization+Input+Fields+ADR+and+Input+files#User-Input-Fields)
* [Input Fields](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/150405482/3+.+Parameterization+Input+Fields+ADR+and+Input+files#Input-Fields)
  * [More Tips for using User Input Fields](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/150405482/3+.+Parameterization+Input+Fields+ADR+and+Input+files#More-Tips-for-using-User-Input-Fields)
    * [Example - Adjustable User’s Think Time](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/150405482/3+.+Parameterization+Input+Fields+ADR+and+Input+files#Example---Adjustable-User%E2%80%99s-Think-Time)

### User Input Fields <a href="#user-input-fields" id="user-input-fields"></a>

Open image-20210308-205732.png![](blob:https://apica-kb.atlassian.net/5f5ed735-d196-482b-ac77-8607e0c38441#media-blob-url=true\&id=23b6c25c-8e4d-43ee-98a1-e74ca8dbb0db\&collection=contentId-150405482\&contextId=150405482\&width=1590\&height=1286\&alt=)

User Input Fields are load test program options (arbitrary global variables), for which you are prompted at the start of the load test. The user input will be stored inside the corresponding global var. The following example uses a User Input Field to make the hostname of the URL calls variable, in order that the same load test program can be executed against a development system and a test system, without the need to record two web surfing sessions.

After the User Input Field has been defined, it can then be assigned to the hostname (in this example). You can click on any recorded URL in the main menu which contains the "correct“ hostname; that is, the hostname which you want to make variable. Then click the **Var Assigner** button in the HTTP request header:

Open image-20210308-211422.png![](blob:https://apica-kb.atlassian.net/fc705ffc-094d-4e39-8393-ca6dc13a2b56#media-blob-url=true\&id=33f03d9a-2985-4eca-b481-8d9de9817a70\&collection=contentId-150405482\&contextId=150405482\&width=2394\&height=1472\&alt=)

### Input Fields <a href="#input-fields" id="input-fields"></a>

| **Assign to**                                                                                                                                                                                                      | Whether the variable should be assigned to the protocol (HTTP/HTTPS), to the hostname, or to the TCP/IP port. In case you want to make more than one of these items variable, you must create additional User Input Fields. |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Assign from Var**                                                                                                                                                                                                | select the variable which was created when the User Input Field was defined.                                                                                                                                                |
| ![check mark](https://pf-emoji-service--cdn.us-east-1.prod.public.atl-paas.net/standard/caa27a19-fc09-4452-b2b4-a301552fd69c/32x32/2714.png) **Assign var to all requests with the same protocol, host, and port** | when checked, the variable will be assigned to all URL calls which use the same protocol _and_ the same hostname _and_ the same TCP/IP port.                                                                                |

&#x20;

It may be necessary to assign the hostname again to HTTPS requests if you have recorded a session that uses both the HTTP and HTTPS protocols within the same web surfing session.

The User Input Field will be displayed when the load test program is started. A maximum of 12 User Input Fields can be defined.

Open image-20210308-212252.png![](blob:https://apica-kb.atlassian.net/f397343f-20f3-4c72-86c3-c778a7b598d0#media-blob-url=true\&id=4bccdfbb-c21e-4388-a4c7-0139276b2362\&collection=contentId-150405482\&contextId=150405482\&width=864\&height=793\&alt=)

#### More Tips for using User Input Fields <a href="#more-tips-for-using-user-input-fields" id="more-tips-for-using-user-input-fields"></a>

User Input Fields are also often used to vary the “user’s think time". Another example would be the setting of the booking date for financial transactions.

**Note:** if you start a load test job optionally from a script (see Application Reference Manual), you must pass the User Input Field as an additional argument to the load test program. The name of the program argument is the name of the variable which was created when the User Input Field was defined; for example, for a variable named "hostname" the corresponding argument specification would be:

`java PrxJob transmitClusterJob “Cluster 1“ Test01 -u 100 -d 300 -t 60 -nolog -hostname “testsys.ggjhkjg.com“`

***

**Example - Adjustable User’s Think Time**

The following example shows how the user’s think time of the page breaks (web pages) can be dynamically set every time when starting a load test:

Open image-20210308-212705.png![](blob:https://apica-kb.atlassian.net/46b08acf-a26f-4656-a671-b5d2875f110d#media-blob-url=true\&id=2601f08b-b54e-48a2-91fe-e5450a4a72a9\&collection=contentId-150405482\&contextId=150405482\&width=836\&height=494\&alt=)

1. Create a User Input Field and set a default value (in this case in seconds)
2. In the main menu, assign the variable of the User Input Field to the user’s think time of the first-page break by using the option “Apply new user's think time values for all page breaks \[2..n]”
3. After that, you can freely choose the user’s think time of the web pages every time when starting the load test. The value of the User Input Field is also shown in the load test result detail menu (test scenario).

Open image-20210308-213849.png![](blob:https://apica-kb.atlassian.net/d5b6bba8-b989-4b48-a4ce-262ed3902e97#media-blob-url=true\&id=0f8d4ba0-9e2a-4b03-8c1f-9cc2ea57a2a4\&collection=contentId-150405482\&contextId=150405482\&width=1788\&height=926\&alt=)Open image-20210308-215718.png![](blob:https://apica-kb.atlassian.net/c69cc64a-9cf3-49c6-a6f4-11e4884cc9f6#media-blob-url=true\&id=c06cd49f-8b87-42cf-b190-c00b034cd465\&collection=contentId-150405482\&contextId=150405482\&width=2324\&height=1708\&alt=)

## [Parameterization : Input Files](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/152043557/Parameterization+Input+Files)

### Input Files <a href="#parameterization-inputfiles-inputfiles" id="parameterization-inputfiles-inputfiles"></a>

Input Files can be used to extract variables from a text file, such as a username and a password per simulated user, assigned to a login form. However, the functionality of input files is generic, which means that variables for any purpose can be extracted.

Click the **Add Input File…** button inside the Var Handler to define a new Input File and enter a simple file name without a directory path. Please note that this action creates only the input file definition but that it does not create the input file itself on disk. This means that the input file must also exist on disk and that it must be placed inside the same Project Navigator directory where the load test program is stored.

## [Parameterization - ADR](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/2035908857/Parameterization+-+ADR)

[Apica Data Repository (ADR) aka The Apica Table Server](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/953876489/Apica+Data+Repository+ADR+aka+Apica+Table+Server)

\
