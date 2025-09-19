# Postman Check

The following documentation provide details for the setup and configuration of the Apica Postman Check.

## Setting Up a Postman Check <a href="#postmancheck-settingupapostmancheck" id="postmancheck-settingupapostmancheck"></a>

| **Step**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | **Screenshot** |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| <p><strong>Step 1: Name, Description, and Tags</strong></p><p>Select a check type from the API Tools Check section. In this example, we will use Postman as the check type. Give the check a name and description and assign Tags to it if desired.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |                |
| <p><strong>Step 2a: Select/Add/Delete Repository Profile</strong></p><p>This step directs you to select/add/delete a Repository Profile. Select an existing Repository Profile. If there is no existing profile, press the green “+” icon to add a new Repository Profile (of any supported type). Click the Edit Icon to Edit/Modify/Delete an existing Repository Profile.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |                |
| <p><strong>Step 2b: Specify Repository Paths</strong></p><p><strong>File path:</strong> Add the path/filename to the collection file relative to the root repository address. For example, if the URL address of your GitHub repository is <code>https://github.com/user/newCheckTypes</code> (see screenshot in step 2a) and the URL address of your file is <code>https://github.com/user/newCheckTypes/tree/main/subfolder/myCollection.json</code>, enter <code>/subfolder/myCollection.json</code> as the File path.</p><p><strong>Environment Variables:</strong> if your script utilizes environment variables, add them to the “Environment Variables” field as a comma-separated list in the form of name=value. Having the option to specify Environment Variables from the ASM GUI allows you to easily change certain variables which are used in the script. For example, by defining an environment variable called “ID” (see screenshot), you can clone the Check after it has been created and easily create multiple checks with different “ID” variables.</p><p><strong>Decrypt Key (optional):</strong> a Decrypt Key can be specified if you wish to encrypt sensitive data within your script. Technically, sensitive data should always be encrypted within a hosting repository, but it is up to you whether you wish to encrypt the data or not. Encryption of sensitive data is done via the Cryptify library. For directions on how to implement encryption within your Scripted check, refer to How to Mask Sensitive Data When Using Postman Checks.</p><p><strong>Data Directory</strong> <strong>(optional):</strong> If your script relies on data which is stored in another file, that file can be placed in a “data directory” and referenced from the “data directory” field. For example, if your script utilizes a set of 500 key/value pair combinations, the data would best be placed in a separate .json file and put within the /data subdirectory within your base repository. Then, when /data is specified as the Data Directory, that subfolder will be recognized when the check runs.</p> |                |
| <p><strong>Step 3 Interval, Thresholds &#x26; Monitor Groups</strong></p><p>This is the same as other ASM checks. Set the frequencies needed, desired thresholds, and the Monitoring Groups the check should be organized under.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |                |

## The Postman Check Runner <a href="#postmancheck-thepostmancheckrunner" id="postmancheck-thepostmancheckrunner"></a>

**Note: npm Documentation Source**

The latest version of the ASM Postman Check Runner documentation is found here and is authoritative:

* [**@apica-io/asm-pm-runner - npm (npmjs.com)**](https://www.npmjs.com/package/@apica-io/asm-pm-runner#installation)

## 1. Introduction <a href="#postmancheck-1.introduction" id="postmancheck-1.introduction"></a>

The asm-pm-runner runs Postman collections and exports results to Apica’s Check Results Service (CRS) format.

&#x20;The command-line tool is based on the standard Postman [Newman utility](https://www.npmjs.com/package/newman) (Newman is a command-line collection runner for Postman.)

&#x20;The primary enhancement to Newman is supporting the data decryption files and certificates. Encryption/decryption is based on the [cryptify](https://www.npmjs.com/package/cryptify) npm module.

## 2. Why Use a Postman Check? <a href="#postmancheck-2.whyuseapostmancheck" id="postmancheck-2.whyuseapostmancheck"></a>

ASM users who have Postman collections can now run them, without conversion, as long-term monitoring checks from a global perspective. This allows you to expand testing from a single location to measuring and comparing multiple performance results from any Apica agent over time.

## 3. The ASM Postman Check <a href="#postmancheck-3.theasmpostmancheck" id="postmancheck-3.theasmpostmancheck"></a>

Apica ASM can run Postman checks based on asm-pm-runner. This feature runs a Postman collection in Apica ASM and reports the results to Apica’s Check Reporting Service.

**Running the Postman Runner Solution**

The solution depends on [Installing npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm), which allows you to run your Postman Collections from the command line using the Apica Synthetic Monitoring Postman Runner (ASM PM Runner)

At a Terminal window, type the following to install npm:

`npm install -g npm`

**Installing the ASM Postman Check Runner Solution**

Solution Link: [Link to the ASM Postman Check Runner Solution](https://www.npmjs.com/package/@apica-io/asm-pm-runner#installation)

At a Terminal window, type the following to install the ASM Postman Runner

`npm install -g @apica-io/asm-pm-runner`

**ASM PM Runner Syntax**

`asm-pm-runner [options] <collection>`

[**Command-line Options**](https://www.npmjs.com/package/@apica-io/asm-pm-runner#command-line-options) (as of Version 1.3.5)

To get the options available for your version of the ASM-PM-Runner, at the command line/Terminal, enter:

`asm-pm-runner -h`

**Which will return the following help with options**\
`Usage: asm-pm-runner [options] <collection>`

`Options:`\
`-e, --environment <path> Environment JSON file`\
`-dk, --decryptKey <decryptKey> Decrypt key`\
`-ev, --envVars [envVars...] Environment variables. Format name=value format`\
`-v, --verbose Print collection information on stdout (default: false)`\
`-r, --resultDir <dir> The result directory`\
`-dd, --dataDir <dir> The data directory for certificates and test data`\
`-l, --logLevel <logLevel> Log level in log4js (default: "info")`\
`--sslClientCert <path> Specify the path to a client certificate (PEM)`\
`--sslClientKey <path> Specify the path to a client certificate private key`\
`--sslClientPassphrase <passphrase> Specify the client certificate passphrase (for protected key)`\
`-V, --version output the version number`\
`-h, --help display help for command`

### Manage Repository Files <a href="#postmancheck-managerepositoryfiles" id="postmancheck-managerepositoryfiles"></a>

Please set up a **Repository Profile** for using URL-XI, Postman, or Scripted Checks.\
These scripts and collections are not uploaded to the Apica Platform but are managed through a repository.

URL-XI, Postman, and Scripted Checks use repositories to store their scripts/collections, so the first step is to create a new Repository Profile in the ASM Portal. Please go to the Manage Repository Files page for steps in setting this up.

## 4. [Samples](https://www.npmjs.com/package/@apica-io/asm-pm-runner#samples) <a href="#postmancheck-4.samples" id="postmancheck-4.samples"></a>

You will find some runnable examples in the installation directory under samples. See the [folder structures used by npm](https://docs.npmjs.com/cli/v7/configuring-npm/folders) in the [npm documentation](https://docs.npmjs.com/cli/v7/configuring-npm/folders) about where you can find the global npm directory.

The package.json file contains scripts for running the samples with correct parameter settings.

[**Example 1 - Running some http requests on http-bin**](https://www.npmjs.com/package/@apica-io/asm-pm-runner#example-1---running-some-http-requests-on-http-bin)

`$ asm-pm-runner samples/HTTP-Bin-Requests.postman_collection.json -v -ev username=foo password=bar`

[**Example 2 - Testing certificate on https://badssl.com**](https://www.npmjs.com/package/@apica-io/asm-pm-runner#example-2---testing-certificate-on-httpsbadsslcom)

This sample uses encrypted certificates.

[The command line](https://www.npmjs.com/package/@apica-io/asm-pm-runner#the-command-line):

`$ asm-pm-runner -l debug -dk Encrypt.4.ssl --sslClientCert file.cert.pem --sslClientKey file.key.pem --dataDir samples/ec_badssl_certs -r results/ -v samples/BadSSL.postman_collection.json`

[**Follow this npm link to see the full console output from the command above**](https://www.npmjs.com/package/@apica-io/asm-pm-runner#the-console-output-from-the-command)

***

## 5. [Result Reports](https://www.npmjs.com/package/@apica-io/asm-pm-runner#reporting-of-result) <a href="#postmancheck-5.resultreports" id="postmancheck-5.resultreports"></a>

The JSON report is stored in the results directory. The format is complaint with Check Result Service in Apica ASM.

[**Steps and requests in the report**](https://www.npmjs.com/package/@apica-io/asm-pm-runner#steps-and-requests-in-the-report)

The JSON report is divided into one or more steps.

* A step contains requests from the postman collection.
* The default is only one step, with all requests generated.
* Several steps will be generated if the collection contains _folders_.
  * One step for each folder will be generated.
  * The step name corresponds to the folder name.
* Only one level of steps is supported.
  * Folders in folders will be named folder/subfolder.
    * Example _root folder/subfolder 1/subfolder 2_

[**Returning a custom value as the result**](https://www.npmjs.com/package/@apica-io/asm-pm-runner#returning-a-custom-value-as-the-result)

**asm-pm-runner** can return a custom value as the return value when running a collection. This functionality is often used in ASM when you want to return something else than the total response time as the main result of the check run. In the collection, use two special collection parameters and assign them values in a JavaScript test.

| **Collection Variable** | **Description**                                        |
| ----------------------- | ------------------------------------------------------ |
| `_Apica_ReturnValue`    | A numeric value used as the check value (return value) |
| `_Apica_ReturnUnit`     | The unit of the customized return value                |

`pm.test("Status code is 200", function () { pm.response.to.have.status(200); }); let eventCount =pm.response.json().length; pm.collectionVariables.set("_Apica_ReturnValue",eventCount) pm.collectionVariables.set("_Apica_ReturnUnit","events")`

[**Returning variables in the result**](https://www.npmjs.com/package/@apica-io/asm-pm-runner#returning-variables-in-the-result)

You can also return variable values in the result report. If you want to suppress a variable from being included in the result report use a name starting with the "\_" character. Collection and Environment variables not changed during the run of the collection will be typed as input variables.

`let json =pm.response.json(); pm.collectionVariables.set("eventName",json.name) pm.collectionVariables.set("category",json?.category?.description|| "") pm.collectionVariables.set("mediaLink",json?.mediaItem?.url|| "")`

**Key Links:**

&#x20;[**Follow this npm link for how Variables are reported in the JSON result report**](https://www.npmjs.com/package/@apica-io/asm-pm-runner#reporting-variables-in-json-result-report)

&#x20;[**Follow this npm link for the generated JSON report**](https://www.npmjs.com/package/@apica-io/asm-pm-runner#the-generated-json-report)

***

## 6. “cryptify” Package Details <a href="#postmancheck-6.-cryptify-packagedetails" id="postmancheck-6.-cryptify-packagedetails"></a>

To encrypt and decrypt files in a project, you can use the NPM package [cryptify](https://www.npmjs.com/package/cryptify), simple file-based encryption (FBE) utility for Node.js. The following file types support encryption/decryption:

* certificates
* data files

shared variables

You must supply a decryption key with the -dk option. The file must be encrypted with the key using the command-line version of cryptify.6.1.1 Install cryptify

**Install cryptify**

`$ npm install -g cryptify`

**Encrypt with cryptify**

`$ cryptify`

`Usage: cryptify [options] [command]`

`Options:`

`-v, --version Display the current version`

`-l, --list List available ciphers`

`-h, --help Display help for the command`

**Commands**

`encrypt [options] <file...> Encrypt files(s)`

`decrypt [options] <file...> Decrypt files(s)`

`help <command> Display help for the command`

**cryptify Syntax Example**

`$ cryptify encrypt file.txt -p 'Secret123!'`

`$ cryptify decrypt file.txt -p 'Secret123!'`

**Password Requirements:**

1\. Must contain at least 8 characters

2\. Must contain at least 1 special character

3\. Must contain at least 1 numeric character

4\. Must contain a combination of uppercase and lowercase

[**npm example of encrypting a file with cryptify**](https://www.npmjs.com/package/@apica-io/asm-pm-runner#example-of-encrypt-a-file)

`$ cryptify encrypt common_vars.json --password URL-XI.4.data`

[**npm example with encrypted postman\_environment**](https://www.npmjs.com/package/@apica-io/asm-pm-runner#example-with-encrypted-postman_environment)

`$ asm-pm-runner samples/HTTP-Bin-Requests.postman_collection.json -r results -l debug -v -e samples/ec_env/Http_bin_environment.postman_environment.json -dk Encrypt.4.ssl`

PDF Version here:

