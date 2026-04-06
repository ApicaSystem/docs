# 2026 Q1 Release

Items in this release:

#### TDO

* Move work sets under Project and move Actions to Scenario (support changes to scenario creatio
* Ad current TDO user name (current\_user) to wf\_params
* Allow user to select project from context cookies block
* Allow user to change workset from context cookies block and update other objects
* Blocking mode for data assembly API - allow API to complete before moving to next object in workflow
* Handling CSV special characters (1.1 API) - update to not count internal field commas as delimiters]
* Fix workflow inheritance (must inherit child only)
* Data view criteria handling in project import
* Work flow execution progress bar - show current activity and total progress
* Execution timeout for shell commands in work flow - allow user to set timeout for each shell command activity
* Send tdo authentication cookie for rest api calls in workflow - use logged in user credentials vs. asking for user credentials to be manually entered
* Update workflow so only administrators can edit workflow
* Allow to pull 'latest' version of data block content - use 'latest' instead of version number to ensure most current version is always used
* Allow wf\_params, act\_res and extract to be used in rest call headers in workflow activities
* New business rules generation API (full/prioritized) - New API for generating full coverage matrix and prioritized coverage matrix
* New business rule set API (list, save, load) - added to available APIs
* Add workflow execution summary option to workflow page
* Reduce User level workflow options to 'view summary log', 'clear log', and 'run'
* Add business rules mass update feature to business rules page for items with a single value in selected rules
* Apply sorting on search/pagination
* Auto refresh values list immediately when release filters is clicked in Select Determining Attributes pane (Business Rules page)
* Allow user to save business rule set and reload on command (previously Admin only)
* Add shell command parameters parse feature in workflow shell command activity
* Add upload local file API to load file from TDO server vs. from user's desktop
* Add ability to assign tdo role from saml response based on AD group enrollment

#### TDX

* Upload data to source database added as option (ex: where source and target database are the same database)
* Add additional fields (pass through, row number, etc) section to main screen for pass through options (where a value is passed directly from coverage matrix to output file)
* Expand where clause field to multiple rows to improve readability
* Add 'throw error if no data found' option to TDX for output (used primarily for execution via workflow or automation tool where you want execution to stop if no data found)
* Add 'save extract to file' for output option
* Add 'include header' for output option - note that this option applies whether output is going to TDO or to an external file
