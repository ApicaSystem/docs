# 2026 Q2 Release

Items in this release:

#### TDO

* \[Fix] Allow use of workflow parameters (wf\_params), act\_res, and extract in Rest API headers as part of workflow setup
* \[Feature] Allow use of 'latest' instead of version number for pulling data blocks in API calls
* \[Fix] Only allow ADMIN level users to edit workflow
* \[Feature]Create checkbox to send TDO authentication cookie (logged in user ID/password) in Rest API calls versus requiring them to be sent in the context section of the API body
* \[Feature] Create a workflow execution progress bar that shows the workflow step being executed and the current progress against overall step total
* \[Feature] Include ability to set a timeout feature for Shell commands in workflow; default is 600 seconds and can be modified by workflow editors.
* \[Fix] Data View criteria handling in project Import process corrected to set attributes properly
* \[Fix] Modify Workflow inheritance to always inherit child entity
* \[Fix] Modify handling of CSV special characters (1.1 API download) so that commas included in a field are not handled as delimiters
* \[Fix] Update blocking mode for Data Assembly API to block manual run of same data assembly process when API is running
* \[Feature] Allow selection of session objects (scenario and coverage set) upon selecting work set
* \[Feature] Add current user name (current\_user) to default wf\_params
* \[Feature] Move Work Sets from ‘Data Assembly’ to ‘Projects’ section on main menu
* \[Feature] Move Actions from Projects section of main menu to sub-page under Scenarios
* \[Feature] Add navigation buttons to Scenario and Action pages (to/from)
* \[Feature} add Work Set API summary to ‘Assembled Data’ page
* \[Fix] Allow ‘copy to clipboard’ in the API summary for non-https deployment
* \[Fix] Allow non-ADMIN users to delete business rules on Business Rules page
* \[Fix] Automatically unlock coverage set 60 minutes after it is set if it has not been removed otherwise
* \[Feature] Add ‘default value’ and ‘Is Null’ flag for attributes on ‘Assignment Rules’ page
* \[Fix] correct Drag and Drop feature in data views table on Work Set page and in steps table on Scenarios page
* \[Fix] Trim determining attributes numeric values to defined field format assigned to that output field in the format function
* \[Feature] Add One-to-Many support in Data Assembly. Initial implementation: if lookup table has multiple rows for this data, allow user to select ‘include all rows’ in output table
* \[Fix] Pass correct workset ID for data view hierarchy
* \[Fix] Correct project import process to prevent data corruption due to java version differences
* \[Feature] Synchronize Data View criteria and Primary Source with the latest Coverage View; remove need to manually update
* \[Fix] Retrieve all step targets in assignment rules instead of only retrieving the first ten targets

#### TDX

No updates to TDX in this quarter's release







