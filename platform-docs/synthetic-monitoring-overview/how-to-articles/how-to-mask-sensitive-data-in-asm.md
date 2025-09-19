# How To Mask Sensitive Data in ASM

Users who wish to mask sensitive information within the ASM front end have several options:

1. Store and retrieve credentials from an [ASM Dictionary](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2179006473)
2. Encrypt credentials using the “encryptapica” string
3. Mask credentials using the “maskapica” string

Options 1 and 2 hide information from both the Check Results and Edit Scenario pages. Option 3 hides information from the Check Results page alone and is useful for hiding credentials from users who have permission to view Check Results but not edit Checks.

## Encrypt credentials using the “encryptapica” string <a href="#howtomasksensitivedatainasm-encryptcredentialsusingthe-encryptapica-string" id="howtomasksensitivedatainasm-encryptcredentialsusingthe-encryptapica-string"></a>

Utilizing this method of masking will hide sensitive credentials from both the Check Results view and the Edit Scenario view!

This feature must be enabled per customer account. If you are interested in encrypting Selenium variables within your Scenarios, please contact your Technical Account Manager or [Support](mailto:support@apica.io).



ASM offers the option to encrypt sensitive Scenario data as an alternative to storing and fetching sensitive data from a Dictionary. Any data stored in an encrypted variable is only accessible when the script is being run. To add an encrypted variable to your scenario, add a variable using the Selenium "store" command, and start the name of the sensitive variable with “encryptapica". You can use that stored variable anywhere in the scenario:



It is possible to specify any string in the “Value” field for variable encryption as long as it starts with the string “encryptapica”. This string invokes the crypto service which is responsible for encrypting the provided value.

| Step                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Screenshot |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| Step 1: Edit a Check which contains a Scenario and click the Debug Scenario icon.                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |            |
| Step 2: Identify the sensitive information to be encrypted.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |            |
| <p>Step 3: Store the value as an encrypted value by adding a new variable which will hold the encrypted value.</p><ol start="1"><li>At the top of the scenario, add a new step with the “Store” Command in the dropdown box.</li><li>Add a string which begins with “encryptapica” to the “Value” field. In the example, the value is “encryptapicapassword”.</li><li>When the “encryptapica” value is added, a warning icon will appear to the right of the step. Once a target is added, the triangle icon will be replaced by a green lock icon.</li></ol> |            |
| <p>Step 4: Enter the original Target value.</p><ol start="1"><li>Double-click in the Target field.</li><li>A new dialog box entitled “Update Encrypted Value” will appear. Enter the value to encrypt.</li><li>Click the Update &#x26; Encrypt to begin the encryption.</li></ol><p>Make sure a backup of the value exists elsewhere; Apica does not have the ability to retrieve this value!</p>                                                                                                                                                             |            |
| Step 5: After the encryption has been completed, the green lock will appear, and the words “\[ENCRYPTED BY APICA]” will be present in the Target field.                                                                                                                                                                                                                                                                                                                                                                                                       |            |
| Step 6: In the step where the password originally appeared, replace the plaintext password with the stored variable name specified earlier. In this case, in step 25, the variable ‘encryptapicapassword’ will be entered as $(variable\_name) or $(encryptapicapassword).                                                                                                                                                                                                                                                                                    |            |
| Step 7: Test the scenario to ensure it passes the encrypted values to the intended application and click “Save scenario”.                                                                                                                                                                                                                                                                                                                                                                                                                                     |            |

The below video tutorial provides a visual demonstration of the process of encrypting and adding a scenario.

## Mask credentials using the “maskapica” string <a href="#howtomasksensitivedatainasm-maskcredentialsusingthe-maskapica-string" id="howtomasksensitivedatainasm-maskcredentialsusingthe-maskapica-string"></a>

Utilizing this method of masking will hide sensitive credentials from the Check Results view, but not the Edit Scenario view.

Command values can be masked using an Apica-specific prefix when they contain sensitive information. Assume a scenario contains the following commands:

| Command      | Target                  | Value            |
| ------------ | ----------------------- | ---------------- |
| open         | `/`                     |                  |
| selectWindow | `null`                  |                  |
| type         | `id=username`           | `user1`          |
| type         | `id=password`           | `secretPa$$word` |
| clickAndWait | `_input@value='Log in'` |                  |

It is possible to mask the value `secretPa$$word` in the Check Result page by adding the `Store` command to store the password as a variable with the prefix `maskapica` and then using that variable in the actual command which uses the password. The scenario will contain the following commands after the value `secretPa$$word` is masked:

| Command      | Target                  | Value                          |
| ------------ | ----------------------- | ------------------------------ |
| store        | `secretPa$$word`        | `maskapicaPassword`            |
| open         | `/`                     |                                |
| selectWindow | `null`                  |                                |
| type         | `id=username`           | `user1`                        |
| type         | `id=password`           | `\{\{${maskapicaPassword}\}\}` |
| clickAndWait | `_input@value='Log in'` |                                |

The command’s target will be masked on the Check Results page when the check is run:

| Command      | Target                   | Value                          |
| ------------ | ------------------------ | ------------------------------ |
| store        | `*******`                | `maskapicaPassword`            |
| open         | `/`                      |                                |
| selectWindow | `null`                   |                                |
| type         | `id=username`            | `user1`                        |
| type         | `id=password`            | `\{\{${maskapicaPassword}\}\}` |
| clickAndWait | `//input@value='Log in'` |                                |
