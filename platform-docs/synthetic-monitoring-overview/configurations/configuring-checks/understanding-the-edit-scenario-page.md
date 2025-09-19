# Understanding the Edit Scenario Page

Checks can contain a Selenium browser automation scenario. Using scenarios in a Web check allows a user to verify that the site behaves as expected. A user can add and test a scenario directly from the ASM platform via the [Edit Check](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2167570435/Editing+Browser+Checks#Web-Browser) page.



It is possible to mask sensitive information when creating the ASM scenario so that sensitive information (e.g. a password) is not exposed unnecessarily. The sensitive information will be hidden from both the Check Results page and the Edit/Debug scenario page. See How to Mask Sensitive Information Within an ASM Scenario for more details. For example, the text \[ENCRYPTED BY APICA] can be seen in the above screenshot. Here, a value was hidden so that it cannot be seen by users who have [Scenario Admin permissions](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2150498307/Configuring+Users#Understanding-Basic-User-Roles).

Note that it may be necessary for a user to change certain scenario commands when uploading a Selenium IDE file, as certain commands are not supported by ASM Scenarios. See [Comparing Selenium IDE Scripts to ASM Scenarios](broken-reference) for more details surrounding Selenium IDE to ASM conversion, including a chart listing the commands which are supported by ASM Scenarios. If a scenario is uploaded which contains an unsupported command, a user will see a warning dialog and the unsupported command will be highlighted:



## Debugging a Scenario From Within ASM <a href="#understandingtheeditscenariopage-debuggingascenariofromwithinasm" id="understandingtheeditscenariopage-debuggingascenariofromwithinasm"></a>

The Debug Scenario view allows an uploaded scenario to be replaced, edited, or tested:



### Replacing or Renaming an Existing Scenario File <a href="#understandingtheeditscenariopage-replacingorrenaminganexistingscenariofile" id="understandingtheeditscenariopage-replacingorrenaminganexistingscenariofile"></a>

An existing scenario file can be replaced via the “upload new file” button:



1. Click “Upload New File”
2. Browse to the directory where the scenario file is stored
3. Select the appropriate file
4. Click “Open”

If scenario upload is successful, the following confirmation message will be seen:



To rename an existing scenario file, click the “pad and paper” icon to the right of the scenario _file_ name:



If the scenario file name was updated there in the Debug Scenarios page, the updated file name will show in the Edit Check page. This is useful functionality if a user makes a change to the script and would like to save a new version number without exiting the Debug Scenarios page. The new scenario name will also be updated on the “Edit Check” page.



To rename the title of the ASM scenario itself, click the “pad and paper” icon to the right of the _scenario_ name:



This will not change the scenario _file_ name and will only change the title of the scenario itself. It is generally recommended to rename both the scenario file name and the scenario name at the same time in order to maintain consistency.

## Testing a Scenario <a href="#understandingtheeditscenariopage-testingascenario" id="understandingtheeditscenariopage-testingascenario"></a>

Users can test a scenario by clicking the “Test Scenario” button from within the Edit Scenario page:



| **Item**       | **Description**                                                                                                                 |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| URL            | URL to run the scenario towards                                                                                                 |
| Browser        | Browser type and version to use for the test                                                                                    |
| Location       | Location to run the test from                                                                                                   |
| Custom Headers | Additional HTTP Header to send together with each request. Custom headers are often used to purposefully bypass bot protection. |
| Test Scenario  | Run the test                                                                                                                    |

While the test is running, progress is displayed next to the run button.



### Result Summary <a href="#understandingtheeditscenariopage-resultsummary" id="understandingtheeditscenariopage-resultsummary"></a>

A successful test run is indicated in the Result Summary:



If the scenario fails, the step on which the scenario failed and the failure reason is indicated in the Result Summary:



If the scenario is configured to use screenshots, they are displayed as part of the result summary:



## Using Scenario Commands <a href="#understandingtheeditscenariopage-usingscenariocommands" id="understandingtheeditscenariopage-usingscenariocommands"></a>

Commands can be **added** to a new or existing scenario file with the “Add Step” button:



1.  Click “Add Step”


2.  Select a command from the dropdown list


3.  Double-click the blank rows in the Target and Value columns and add the desired values:\



4. Click “Save Scenario”

Existing commands in the list can be **edited** by clicking on the dropdown or double-clicking the rows in the Target and Value fields. Commands in the list can be **deleted** by clicking on the “trash can” icon. Commands in the list can be **reordered** by clicking the command row and dragging the command to a new position. Commands in the list can be **downloaded** by clicking the “Download Scenario” icon. This is useful for backing up an existing scenario before making significant changes.

## Execution Log <a href="#understandingtheeditscenariopage-executionlog" id="understandingtheeditscenariopage-executionlog"></a>

After a test run has ben executed for a scenario, a test execution log becomes available. The execution log is collapsed by default. To show the full execution log, click the button to the right of the “Execution Log” text:



| Column   | Description                                                                                                                                                      |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| #        | Order of execution                                                                                                                                               |
| Name     | The name of the command                                                                                                                                          |
| Target   | The target for the command                                                                                                                                       |
| Value    | The Command value, if any                                                                                                                                        |
| Severity | If the scenario passes, every severity row will have the value “info”. If the scenario fails, the severity row of the failed command will have the value “error” |
| Offset   | Start time                                                                                                                                                       |
| Duration | Execution time                                                                                                                                                   |

In the event of a failed execution, failed commands are also highlighted in the “Commands” section:

