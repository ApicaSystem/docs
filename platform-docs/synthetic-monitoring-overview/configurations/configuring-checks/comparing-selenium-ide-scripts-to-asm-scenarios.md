# Comparing Selenium IDE Scripts to ASM Scenarios

[Selenium IDE](https://www.selenium.dev/selenium-ide/) is a standalone 3rd party tool for creating Selenium test cases. These test cases can be imported as script files into ASM and used within Browser Checks to collect performance metrics for the scenario. In some cases, users must make changes to their Selenium IDE script before it can be used within ASM as a Scenario. This article explains how ASM handles Selenium IDE scripts so you can easily understand how to convert your scripts into Scenarios.

## Supported Selenium IDE Commands <a href="#comparingseleniumidescriptstoasmscenarios-supportedseleniumidecommands" id="comparingseleniumidescriptstoasmscenarios-supportedseleniumidecommands"></a>

Use the following table as a reference when determining whether a certain Selenium IDE command is compatible with your ASM Scenario.

| _**Actions**_         | _**Keyboard &  Mouse interaction**_ | _**Verification and Assertion**_ | _**Waits**_              | _**Scenario Flow**_ | _**JS Execution**_ | _**Stored Variables**_ | _**Custom (ASM Specific) Commands**_ |
| --------------------- | ----------------------------------- | -------------------------------- | ------------------------ | ------------------- | ------------------ | ---------------------- | ------------------------------------ |
| open                  | keyDown                             | assertElementPresent             | waitForVisible           | gotoIf              | fireEvent          | storeTitle             | setPageBreak                         |
| clickAndWait          | keyDownAndWait                      | assertTitle                      | waitForValue             | goto                | runScript          | storeXpathCount        | insertPageBreak                      |
| clickAtAndWait        | keyUp                               | assertLocation                   | waitForAttribute         | label               | runScriptAndWait   | storeCssCount          | takeScreenshot                       |
| clickAndNotWait       | keyUpAndWait                        | assertVisible                    | waitForNotText           | close               | executeScript      | storeValue             | startRecording                       |
| click                 | keyPress                            | assertElementNotPresent          | waitForNotValue          | pause               | getEval            | storeText              | clearRecording                       |
| clickAt               | keyPressAndWait                     | assertNotVisible                 | waitForNotAttribute      | setSpeed            |                    | storeLocation          | stopRecording                        |
| doubleClick           | mouseOver                           | assertAttribute                  | waitForText              | setTimeout          |                    | storeExpression        | getDictionary                        |
| doubleClickAt         |                                     | assertNotAttribute               | waitForTextPresent       | echo                |                    | storeEval              | setLocation                          |
| doubleClickAndWait    |                                     | assertValue                      | waitForTextNotPresent    |                     |                    | storeAttribute         |                                      |
| doubleClickAtAndWait  |                                     | assertNotValue                   | waitForElementPresent    |                     |                    | storeElementPresent    |                                      |
| clickInvisible        |                                     | assertText                       | waitForEditable          |                     |                    | store                  |                                      |
| clickInvisibleAndWait |                                     | assertTextNotPresent             | waitForElementNotPresent |                     |                    | setLocation            |                                      |
| type                  |                                     | assertTextPresent                | waitForNotVisible        |                     |                    |                        |                                      |
| sendKeys              |                                     | assertExpression                 | waitForTitle             |                     |                    |                        |                                      |
| typeKeys              |                                     | assertNextConfirmation           | waitForLocation          |                     |                    |                        |                                      |
| select                |                                     | assertNextAlert                  | waitForAlert             |                     |                    |                        |                                      |
| selectAndWait         |                                     | assertAlert                      | waitForConfirmation      |                     |                    |                        |                                      |
| selectFrame           |                                     | assertConfirmation               | waitForPageToLoad        |                     |                    |                        |                                      |
| selectWindow          |                                     | assertEval                       |                          |                     |                    |                        |                                      |
| submit                |                                     | verifyTitle                      |                          |                     |                    |                        |                                      |
| createCookie          |                                     | verifyLocation                   |                          |                     |                    |                        |                                      |
| deleteCookie          |                                     | verifyElementPresent             |                          |                     |                    |                        |                                      |
|                       |                                     | verifyVisible                    |                          |                     |                    |                        |                                      |
|                       |                                     | verifyElementNotPresent          |                          |                     |                    |                        |                                      |
|                       |                                     | verifyNotVisible                 |                          |                     |                    |                        |                                      |
|                       |                                     | verifyAttribute                  |                          |                     |                    |                        |                                      |
|                       |                                     | verifyNotAttribute               |                          |                     |                    |                        |                                      |
|                       |                                     | verifyValue                      |                          |                     |                    |                        |                                      |
|                       |                                     | verifyNotValue                   |                          |                     |                    |                        |                                      |
|                       |                                     | verifyText                       |                          |                     |                    |                        |                                      |
|                       |                                     | verifyTextNotPresent             |                          |                     |                    |                        |                                      |
|                       |                                     | verifyTextPresent                |                          |                     |                    |                        |                                      |
|                       |                                     | verifyExpression                 |                          |                     |                    |                        |                                      |
|                       |                                     |                                  |                          |                     |                    |                        |                                      |
|                       |                                     |                                  |                          |                     |                    |                        |                                      |
|                       |                                     |                                  |                          |                     |                    |                        |                                      |
|                       |                                     |                                  |                          |                     |                    |                        |                                      |
|                       |                                     |                                  |                          |                     |                    |                        |                                      |
|                       |                                     |                                  |                          |                     |                    |                        |                                      |
|                       |                                     |                                  |                          |                     |                    |                        |                                      |

## Custom ASM Commands <a href="#comparingseleniumidescriptstoasmscenarios-customasmcommands" id="comparingseleniumidescriptstoasmscenarios-customasmcommands"></a>

ASM supports several commands which are not utilized in native Selenium IDE: **insertPageBreak**, **takeScreenshot**, and **getDictionary**.

### setLocation <a href="#comparingseleniumidescriptstoasmscenarios-setlocation" id="comparingseleniumidescriptstoasmscenarios-setlocation"></a>

The setLocation command may be utilized in order to mimic a certain location from within the browser. To use, specify “setLocation” as the command and specify the desired coordinates as the Target:



Accepted syntax for Target coordinates includes:

* `latitude: 59.3259965, longitude: 18.0057939`
* `59.3259965, 18.0057939`

### insertPageBreak <a href="#comparingseleniumidescriptstoasmscenarios-insertpagebreak" id="comparingseleniumidescriptstoasmscenarios-insertpagebreak"></a>

ASM scenarios support a custom command called `insertPageBreak`. This command creates a new [page break](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#Page-Breaks-in-a-Browser-Check-Result) that separates different pages (which typically consist of multiple URL calls) from each other. The command expects one argument - a name - which will be shown on the Result Details page in ASM.

For example, If the login portion of a web page sequence takes place over two or three HTML pages, the manual Page Break could organize the set of HTML pages into a single group before the next logical page navigation - another Page Break. Manual page breaks are helpful when requests triggered by executing multiple different commands all end up as part of the same step, and there is a need to split these requests into multiple steps.

It is possible to disable automatic insertion of page breaks via the [Edit Check](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2167570435/Editing+Browser+Checks#Disable-Automatic-Page-Breaks) settings. See [https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#Page-Breaks-in-a-Browser-Check-Result](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#Page-Breaks-in-a-Browser-Check-Result) for more information on page breaks.

### takeScreenshot <a href="#comparingseleniumidescriptstoasmscenarios-takescreenshot" id="comparingseleniumidescriptstoasmscenarios-takescreenshot"></a>

The command `takeScreenshot` takes a screenshot that will be visible in the [Check Details](broken-reference). The command will insert an additional screenshot onto the page in addition to whatever screenshots have been added in the [Edit Check settings](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2167570435/Editing+Browser+Checks#Screenshots). This command is helpful when troubleshooting scripts as it gives a snapshot of what exactly happens at a particular step.

### getDictionary <a href="#comparingseleniumidescriptstoasmscenarios-getdictionary" id="comparingseleniumidescriptstoasmscenarios-getdictionary"></a>

See [Storing and Retrieving Information Using the ASM Dictionary](broken-reference).

## Limitations of Selenium IDE within ASM Scenarios <a href="#comparingseleniumidescriptstoasmscenarios-limitationsofseleniumidewithinasmscenarios" id="comparingseleniumidescriptstoasmscenarios-limitationsofseleniumidewithinasmscenarios"></a>

### Key Codes <a href="#comparingseleniumidescriptstoasmscenarios-keycodes" id="comparingseleniumidescriptstoasmscenarios-keycodes"></a>

When using sendKeys in Selenium IDE, the key codes `${KEY_ENTER}`, `${KEY_SHIFT}`, and `${KEY_LEFT}` are not valid commands within Selenium IDE. Use `keyPress` or `keyPressAndWait` (if the keystroke triggers a new page load) instead. When entering a keystroke, use the respective ASCII values for the key you want to be pressed. For example, if you want to press Enter within an application, use the command `keyPress` and the value `\13`.

| Command           | Target     | Value |
| ----------------- | ---------- | ----- |
| `keyPressAndWait` | `id=gh-ac` | `\13` |

The “value” of the command corresponds to the ASCII “Oct” value of the key you are trying to press; see [https://www.asciitable.com/](https://www.asciitable.com/) for a full list. Some examples of values which correspond to keys include the following:

\10 corresponds to “backspace”

\9 corresponds to “tab”

### JavaScript Execution <a href="#comparingseleniumidescriptstoasmscenarios-javascriptexecution" id="comparingseleniumidescriptstoasmscenarios-javascriptexecution"></a>

Selenium WebDriver’s `JavascriptExecutor` will wrap all JavaScript and evaluate it as an anonymous expression. Therefore, the “return” keyword must be used when executing JavaScript within the “Target” field in an ASM scenario. For example, the command `browserbot.getCurrentWindow().document.title` in Selenium becomes `return document.title;` in an ASM Scenario.

If your Selenium IDE looks like the following:

| Command      | Target              | Value  |
| ------------ | ------------------- | ------ |
| `assertEval` | `${stored_var} > 0` | `true` |

Add a “return” keyword to the target so it looks like the following:

| Command      | Target                     | Value  |
| ------------ | -------------------------- | ------ |
| `assertEval` | `return ${stored_var} > 0` | `true` |

The following commands result in javascript evaluation or expect a javascript snippet as an argument. Therefore, they also require the use of “return”:

`GotoIf`

`RunScript`

`RunScriptAndWait`

`GetEval`

`StoreEval`

`StoreExpression`

### Type & sendKeys <a href="#comparingseleniumidescriptstoasmscenarios-type-and-sendkeys" id="comparingseleniumidescriptstoasmscenarios-type-and-sendkeys"></a>

Even though the `type` command works in most cases, Apica strongly recommends using `sendKeys` instead of `type`. The `type` command edits the HTML format of the code, while the `sendKeys` command attempts to simulate actual typing and is therefore able to trigger javascript code in fields.

### Incrementing a Stored Numeric Value <a href="#comparingseleniumidescriptstoasmscenarios-incrementingastorednumericvalue" id="comparingseleniumidescriptstoasmscenarios-incrementingastorednumericvalue"></a>

It is currently not possible to change the value of a variable from within a JavaScript snippet. This Selenium IDE code will change the value of `$counter`:

| **Command**  | **Target**                         | **Value** |
| ------------ | ---------------------------------- | --------- |
|  `storeEval` | `return (storedVars'counter' + 1)` | `counter` |

The following command will _not_ change the value of `$counter`:

| **Command**  | **Target**                  | **Value**    |
| ------------ | --------------------------- | ------------ |
|  `runScript` | `storedVars'counter' += 1;` | `counterTwo` |



Knowing how to increment a value is useful when running through a loop in an ASM script!

### Usage Assertion Modes <a href="#comparingseleniumidescriptstoasmscenarios-usageassertionmodes" id="comparingseleniumidescriptstoasmscenarios-usageassertionmodes"></a>

In order to assert a command within Selenium IDE, you can use the `assert`, `verify`, or `waitFor` commands; the `assert` command will stop the Selenium IDE script if the expected condition is not met, while the `verify` command will log an error message but not stop the script. ASM scenarios, by contrast, treat the `assert` and `verify` commands the same way - if the expected condition is not met, both commands will result in a failure of the scenario.

By contrast, the behavior of the `waitFor` command is the same within Selenium IDE and ASM Scenarios. Within both tools, the `waitFor` command will wait for a specified element and will result in a script failure if the element is not found within the specified timeframe. The default timeframe is 30 seconds and can be changed with “setTimeout”.
