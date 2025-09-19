# How to Mask Sensitive Data When Using Postman Checks

The following method will allow you to utilize the built-in Cryptify package in order to decrypt an environment file at runtime which holds secrets for your check. This provides the following layers of security:

1. Secrets are not stored in your hosting repository
2. Secrets are not viewable from the “Edit Check” dialog in ASM

This how-to tutorial describes how to implement credential masking for Postman checks. However, Cryptify can be used to encrypt credentials for all Scripted check types. If you wish to encrypt credentials using Cryptify for a different kind of Scripted check (Python, Java, etc.), the process is similar to the process followed here: create an environment file with your credentials stored in it, export the environment file to the private agent responsible for running the scripted checks, use Cryptify to encrypt the environment file, and then upload the environment file along with your script to the repository where you are storing the checks.

When the process is followed, secrets can be accessed via Environment Variables and the code on your hosting repository will look like this:



Furthermore, the Edit Check settings page will look like this:



## Step 1: Add Existing Credentials to Postman Environment <a href="#howtomasksensitivedatawhenusingpostmanchecks-step1-addexistingcredentialstopostmanenvironment" id="howtomasksensitivedatawhenusingpostmanchecks-step1-addexistingcredentialstopostmanenvironment"></a>

Postman environments allow for the storage of secrets/keys so that they can be re-used/hidden in Postman. By moving your credentials to the Postman environment, you are allowing them to be exported into a format which the Postman check runner will able to read. Here is an example of an Environment we set up in Postman which will store our repository credentials, in this case our ASM API key:



You will reference the “variable” in your script as an environment variable. For example, this script uses \{{apiKey\}} since the variable is apiKey.

## Step 2: Export Postman Environment to File <a href="#howtomasksensitivedatawhenusingpostmanchecks-step2-exportpostmanenvironmenttofile" id="howtomasksensitivedatawhenusingpostmanchecks-step2-exportpostmanenvironmenttofile"></a>



Click the Meatballs Menu (three dots positioned horizontally) and select “Export”. Export using the latest JSON schema version.

## Step 3: Edit Your Original Postman Collection to Substitute Secrets for Environment Variables <a href="#howtomasksensitivedatawhenusingpostmanchecks-step3-edityouroriginalpostmancollectiontosubstitutesecr" id="howtomasksensitivedatawhenusingpostmanchecks-step3-edityouroriginalpostmancollectiontosubstitutesecr"></a>

Open your Postman collection file. It will look similar to this:



Replace your secrets (e.g. Username and Password) with the environment variables you defined in your Postman collection in the previous step. See \{{username\}} and {password\}} substitutions in the above screenshot.

## Step 4: Encrypt Your Postman Environment File <a href="#howtomasksensitivedatawhenusingpostmanchecks-step4-encryptyourpostmanenvironmentfile" id="howtomasksensitivedatawhenusingpostmanchecks-step4-encryptyourpostmanenvironmentfile"></a>

First, install Cryptify onto the private agent which is running your Postman checks using NPM:

```
npm install -g cryptify
```

The private agent referenced here is also known as the Apica Browser Agent; Browser Agents are also responsible for running Postman checks.

Move the Postman environment file you exported in Step 2 onto your private agent and navigate to that directory. Use Cryptify to encrypt your Postman file by issuing the following command:

```
cryptify encrypt file.txt -p 'Secret123!'
```

Of course it is mandatory to replace “file.txt” with your file name and Secret123 with your password. Now, try to open up the Postman environment file. It should look garbled and unreadable. That means the encryption worked. Move the encrypted file back onto your machine so you can upload it to your hosting repository.

## Step 4: Upload Files to Your Hosting Repository and Populate Fields in ASM Edit Check Settings <a href="#howtomasksensitivedatawhenusingpostmanchecks-step4-uploadfilestoyourhostingrepositoryandpopulatefiel" id="howtomasksensitivedatawhenusingpostmanchecks-step4-uploadfilestoyourhostingrepositoryandpopulatefiel"></a>

The Postman environment file and the Postman file itself should be stored in the same directory. In our example, we stored our Postman collection in /postman relative to my Repository Root which we defined in our Repository Profile:



The value of “Decrypt Key” should be the password that you used to encrypt your file with Cryptify. The password essentially works as an encryption/decryption key within Cryptify - and since the Postman check runner uses Cryptify, it will know how to decrypt the environment file using your password (the “decrypt key”).

## Step 5: Test the check <a href="#howtomasksensitivedatawhenusingpostmanchecks-step5-testthecheck" id="howtomasksensitivedatawhenusingpostmanchecks-step5-testthecheck"></a>

Run the check in ASM and ensure that all credentials are hidden as expected. If the check fails, submit any error logs to [Support](mailto:support@apica.io) with a brief explanation of the issue.
