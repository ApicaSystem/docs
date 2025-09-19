# Using the Apica Panels Dashboards

The **Panel Widgets** allow you to populate your Grafana dashboards with data visualizations from your Synthetic Monitoring according to your needs.



## Add Dashboard <a href="#usingtheapicapanelsdashboards-adddashboard" id="usingtheapicapanelsdashboards-adddashboard"></a>

You can create new dashboards directly from the **Dashboard Search** menu.

To add a new dashboard:



* Click the **Dashboard Search**



* Click **New Dashboard**

A new empty dashboard called `New Dashboard` is added:



You can now go on to add Panel Widgets and/or Configure Dashboard the dashboard settings.

## Configure Dashboards <a href="#usingtheapicapanelsdashboards-configuredashboards" id="usingtheapicapanelsdashboards-configuredashboards"></a>

All configurations for dashboards are available from the dashboard configuration menu.

**Edit Panel Widget**

To edit a panel widget:



* Click **configuration** to open the menu



Select the configuration option you want to work with.

### Annotations <a href="#usingtheapicapanelsdashboards-annotations" id="usingtheapicapanelsdashboards-annotations"></a>

With **Annotations**, you can add events to your graphs, either in Grafana itself, or through queries from supporting Data Source.



#### Add Annotation <a href="#usingtheapicapanelsdashboards-addannotation" id="usingtheapicapanelsdashboards-addannotation"></a>

Annotations can be added directly in the graph.



#### Display Annotation Events <a href="#usingtheapicapanelsdashboards-displayannotationevents" id="usingtheapicapanelsdashboards-displayannotationevents"></a>

Annotation events are displayed as icons and vertical lines and icons on graph panels.



Hovering over annotations will display details about the event. The dashboard configuration allows you to filter which annotations to display.



| Item        | Description                            |                                                                                                          |
| ----------- | -------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| Name        | Display name for the filter.           |                                                                                                          |
| Data Source | Source for the annotations.            | `Grafana` / Dashboard [data source](http://confluence.teamsinspace.com:8090/display/ASMDOCS/Data+Source) |
| Enabled     | Show annotations.                      |                                                                                                          |
| Hidden      | Hide the filter from the dashboard.    |                                                                                                          |
| Color       | Display color for the indicator lines. |                                                                                                          |

**Query**

| Item      | Description                               |                      |
| --------- | ----------------------------------------- | -------------------- |
| Filter By | Filter method.                            | `Dashboard` / `Tags` |
| Max Limit | Maximum number of annotations to display. |                      |

**Filter Method**



Filtering by `Tags` will display only the annotations that match any of the tags in the list.



With `Dashboard` filtering, all annotations are displayed on their originating panel widget.

### Configure Dash History <a href="#usingtheapicapanelsdashboards-configuredashhistory" id="usingtheapicapanelsdashboards-configuredashhistory"></a>

In the **Version History**, you can see a list of all saved versions of the dashboard.



### Compare Dashboards <a href="#usingtheapicapanelsdashboards-comparedashboards" id="usingtheapicapanelsdashboards-comparedashboards"></a>

With the **Compare** feature, you can see the differences between two versions of a dashboard.



The view shows all differences in the JSON between the selected versions.

### Restore <a href="#usingtheapicapanelsdashboards-restore" id="usingtheapicapanelsdashboards-restore"></a>

You can **Restore** previous versions of the dashboard. This will replace the latest version with the selected version. The restore button is available from two places:

1. on the right-hand side in the History:



At the top of the Compare:



**Dialog**



## View JSON <a href="#usingtheapicapanelsdashboards-viewjson" id="usingtheapicapanelsdashboards-viewjson"></a>

The **View JSON** menu option opens a panel displaying the JSON for the current dashboard.

**Menu**



**Dialog**



You can select and copy the JSON code from the panel, but not edit and save it in place.

## Save As <a href="#usingtheapicapanelsdashboards-saveas" id="usingtheapicapanelsdashboards-saveas"></a>

The **Save As** menu option allows you to save a complete copy of the current dashboard under a different name.

**Menu**



**Dialog**



## Configure Dash Settings <a href="#usingtheapicapanelsdashboards-configuredashsettings" id="usingtheapicapanelsdashboards-configuredashsettings"></a>

The Dashboard **Settings** allow you to configure options and parameters for the dashboard.



## Edit Settings <a href="#usingtheapicapanelsdashboards-editsettings" id="usingtheapicapanelsdashboards-editsettings"></a>

#### Edit <a href="#usingtheapicapanelsdashboards-edit" id="usingtheapicapanelsdashboards-edit"></a>

All settings for a panel widget are available from the panel widget **settings** dialog.

**Edit Settings**

To edit Dashboard Settings:



* Click **configuration** to open the menu



* Click **Settings**



You can now select the appropriate settings tab to work with.

## “General” Settings Tab <a href="#usingtheapicapanelsdashboards-general-settingstab" id="usingtheapicapanelsdashboards-general-settingstab"></a>

#### General <a href="#usingtheapicapanelsdashboards-general" id="usingtheapicapanelsdashboards-general"></a>

The **General** tab covers settings relating to the dashboard display.

**View**



| Item        | Description                                           |                                      |
| ----------- | ----------------------------------------------------- | ------------------------------------ |
| Name        | Identifier/title for the dashboard.                   |                                      |
| Description | Longer description of the dashboard.                  |                                      |
| Tags        | Dashboard tags for filering, search and organization. |                                      |
| Timezone    | Timezone to use for display.                          | `Default`/`Local browser time`/`UTC` |

Toggles

In the **Toggles** section you can set parameters relating to

| Item          | Description                          |                                           |
| ------------- | ------------------------------------ | ----------------------------------------- |
| Editable      | Turn dashboard editing on or off.    | Dahsboard must be saved to apply changes. |
| Hide Controls | Show or hide the dashboard controls. | `ctrl-H`/`command-H`                      |

Panel Options

The **Panel Options** governs the default Graph Tooltips behavior for the panel widgets in the dashboard.

| Item          | Description |                                |
| ------------- | ----------- | ------------------------------ |
| Graph Tooltip |             | `Default`/`Crosshair`/`Shared` |

The default behavior is single mode.

You can also toogle between behaviors by pressing `ctrl-o`/`command-o` while working in the dashboard.

**Hide Controls**

The dashboard controls - the **row menu** and the **add row** button, can be hidden from the display.

Controls on:



Controls off:



## Links Tab <a href="#usingtheapicapanelsdashboards-linkstab" id="usingtheapicapanelsdashboards-linkstab"></a>

In the **Links** tab you can create links to web pages or other dashboards.

**View**



**Add Link**

To add more than one link:

* Click the **Add Link** button

#### Dashboard <a href="#usingtheapicapanelsdashboards-dashboard" id="usingtheapicapanelsdashboards-dashboard"></a>

In the **Links** tab you can create links to web pages or other dashboards. optionally based on a tag filter.

**View**



| Item            |                 | Description                                                              | Comment                  |   |
| --------------- | --------------- | ------------------------------------------------------------------------ | ------------------------ | - |
| Type            |                 | Type of link.                                                            | `dashboard`/`link` (web) |   |
| Wit Tags        |                 | Filter for dashboard Settings General.                                   |                          |   |
| As Dropdown     |                 | Show the filtered list as dropdown menu to select individual dashboards. |                          |   |
| Title           |                 | Title for the link.                                                      |                          |   |
| Include         |                 |                                                                          |                          |   |
|                 | Time Range      | Apply the current Time Range to the linked dashboard view.               |                          |   |
|                 | Variable Values | Apply any current Templates to the linked dashboard view.                |                          |   |
| Open In New Tab |                 | Link will open in separate browser tab.                                  |                          |   |

**Dashboard Display**



## Creating Links to Web Pages <a href="#usingtheapicapanelsdashboards-creatinglinkstowebpages" id="usingtheapicapanelsdashboards-creatinglinkstowebpages"></a>

In the **Links** tab you can create links to web pages or other dashboards. optionally based on a tag filter.

### View <a href="#usingtheapicapanelsdashboards-view.3" id="usingtheapicapanelsdashboards-view.3"></a>



| Item            |                                                 | Description                                                                    | Comment |   |
| --------------- | ----------------------------------------------- | ------------------------------------------------------------------------------ | ------- | - |
| Type            | Type of link.                                   | `dashboard`/`link` (web)                                                       |         |   |
| Url             | External link to access.                        |                                                                                |         |   |
| Title           | Title for the link.                             |                                                                                |         |   |
| Tooltip         | Tooltip to display when hovering over the link. |                                                                                |         |   |
| Icon            | Icon to display before the link.                |  `external link`/  `dashboard`/  `question`/ `info`/  `bolt`/  `doc`/  `cloud` |         |   |
| Include         |                                                 |                                                                                |         |   |
|                 | Time Range                                      | n/a                                                                            |         |   |
|                 | Variable Values                                 | n/a                                                                            |         |   |
| Open In New Tab | Link will open in separate browser tab.         |                                                                                |         |   |

### Dashboard Display <a href="#usingtheapicapanelsdashboards-dashboarddisplay.1" id="usingtheapicapanelsdashboards-dashboarddisplay.1"></a>



#### Metadata <a href="#usingtheapicapanelsdashboards-metadata" id="usingtheapicapanelsdashboards-metadata"></a>

The \***Metadata** tab shows administrative information about the dashboard.

**View**



| Item            | Description                     | Commment                              |
| --------------- | ------------------------------- | ------------------------------------- |
| Last Updated At | Timestamp for last change.      |                                       |
| Last Updated By | User that did the last change.  |                                       |
| Created At      | Dashboard creation timestamp.   |                                       |
| Created By      | User who created the dashboard. |                                       |
| Current Version | Version of dashboard.           | Corresponds to number of times saved. |

## Rows <a href="#usingtheapicapanelsdashboards-rows" id="usingtheapicapanelsdashboards-rows"></a>

In the **Rows** tab, you can configure individual settings for the rows in the dashboard.

**View**

This feature is useful if you want provide the row with a title, when multiple panel widgets are related to the same theme.



The

| Icon | Item       | Description                                       |   |
| ---- | ---------- | ------------------------------------------------- | - |
|      | Title      | Title to display for the row.                     |   |
|      | Show Title | Turn title display on or off.                     |   |
|      | Move Up    | Change display order in the dashboard.            |   |
|      | Move Down  | Changes display order in the dashboard.           |   |
|      | Delete     | Remove the row and all panel widgets it contains. |   |

**Dashboard Display**



## Time Picker <a href="#usingtheapicapanelsdashboards-timepicker" id="usingtheapicapanelsdashboards-timepicker"></a>

With the **Time Picker** tab, you can configure how often the dashboard should be refreshed and define `now` for relative time calculations.

**View**

The **Timepicker** settings apply **per Dashboard**.



|               | Item                                                                   | Description                              | Comment |
| ------------- | ---------------------------------------------------------------------- | ---------------------------------------- | ------- |
|  Auto-Refresh |  Interval between automatic reloads and data refresh in the dashboard. |                                          |         |
|  Now Delay    |  Add delay to `now` value.                                             |  Gives extra time for data aggregation.  |         |

## Shortcuts <a href="#usingtheapicapanelsdashboards-shortcuts" id="usingtheapicapanelsdashboards-shortcuts"></a>

The **Shortcuts** view provides a list of keyboard shortcuts for Grafana.

**Menu**



**Dialog**



## Templates <a href="#usingtheapicapanelsdashboards-templates" id="usingtheapicapanelsdashboards-templates"></a>

Dashboard **templates** allows you to create more dynamic dashboards, by providing dropdown menus where you can select what to display based on predefined **variables**.

**Menu**



**View**



## Add Variable <a href="#usingtheapicapanelsdashboards-addvariable" id="usingtheapicapanelsdashboards-addvariable"></a>

You can add multiple variables of different types as needed.

**View**



* Click the **New** button

The **New** tab opens



* Select the **type** of variable you want to add



* Add settings according to the variable type



* Click the **Add** button

The variable is added to the list.



## Template Ad Hoc <a href="#usingtheapicapanelsdashboards-templateadhoc" id="usingtheapicapanelsdashboards-templateadhoc"></a>

#### Ad Hoc <a href="#usingtheapicapanelsdashboards-adhoc" id="usingtheapicapanelsdashboards-adhoc"></a>

**Ad Hoc** filters are currently not supported by The Synthetic Monitoring data source.

**View**



Ad hoc filters allows you to add `key/value` filters that will automatically be added to all metric queries that use the specified data source.

## Constant <a href="#usingtheapicapanelsdashboards-constant" id="usingtheapicapanelsdashboards-constant"></a>

#### Constant <a href="#usingtheapicapanelsdashboards-constant.1" id="usingtheapicapanelsdashboards-constant.1"></a>

A **Constant** can be used as a defined as a metric path prefixes for shared dashboards.

**View**

When the dashboard is ExportImport, constant variables are concerted to import options.

**Variable**



| Item  | Description                 | Comment            |
| ----- | --------------------------- | ------------------ |
| Name  | Name of the variable.       |                    |
| Label | Display label in dashboard. |                    |
| Type  | Type of variable.           |                    |
| Hide  | Display elements to hide.   | `Label`/`Variable` |

**Constant Options**



| Item  | Description            | Comment |
| ----- | ---------------------- | ------- |
| Value | Constant value to use. |         |

**Preview**



List of values that will be displayed in the dropdown.

## Template Custom <a href="#usingtheapicapanelsdashboards-templatecustom" id="usingtheapicapanelsdashboards-templatecustom"></a>

In **Custom** variables, you provide a manually defined list of values .

### View <a href="#usingtheapicapanelsdashboards-view.11" id="usingtheapicapanelsdashboards-view.11"></a>

#### Variable <a href="#usingtheapicapanelsdashboards-variable.1" id="usingtheapicapanelsdashboards-variable.1"></a>



| Item  | Description                 | Comment            |
| ----- | --------------------------- | ------------------ |
| Name  | Name of the variable.       |                    |
| Label | Display label in dashboard. |                    |
| Type  | Type of variable.           |                    |
| Hide  | Display elements to hide.   | `Label`/`Variable` |

#### Custom Options <a href="#usingtheapicapanelsdashboards-customoptions" id="usingtheapicapanelsdashboards-customoptions"></a>



| Item   | Description    | Comment               |
| ------ | -------------- | --------------------- |
| Values | Values to use. | Comma-separated list. |

#### Selection Options <a href="#usingtheapicapanelsdashboards-selectionoptions" id="usingtheapicapanelsdashboards-selectionoptions"></a>



| Item               | Description                                         | Comment                                                 |
| ------------------ | --------------------------------------------------- | ------------------------------------------------------- |
| Multi-value        | Allow selection of multiple values in the dropdown. |                                                         |
| Include All Option | Add `All` option to dropdown.                       | Will include all values in a combined query expression. |
| Custom All Value   | Query expression to use as `All` value.             |                                                         |

**Custom All Value**

The standard `All` value combines all options, which can result in a very long expression and possibly affect performance.

It may therefore be better to provide a custom expression more suitable for your data source, for example a [Regular Expression](http://confluence.teamsinspace.com:8090/display/ASMDOCS/Regular+Expression).

**Note:** Characters in the expression are not escaped.

#### Preview <a href="#usingtheapicapanelsdashboards-preview.1" id="usingtheapicapanelsdashboards-preview.1"></a>



List of values that will be displayed in the dropdown.

#### Interval <a href="#usingtheapicapanelsdashboards-interval" id="usingtheapicapanelsdashboards-interval"></a>

With the **Interval** variable you can provide a selector for different time spans to apply to the dashboard.

**View**

**Variable**



| Item  | Description                 | Comment            |
| ----- | --------------------------- | ------------------ |
| Name  | Name of the variable.       |                    |
| Label | Display label in dashboard. |                    |
| Type  | Type of variable.           |                    |
| Hide  | Display elements to hide.   | `Label`/`Variable` |

**Interval Options**



| Item         | Description                                                     | Comment |
| ------------ | --------------------------------------------------------------- | ------- |
| Values       | Time values to include in the list.                             |         |
| Auto Option  | Generate the list automatically based on the current time span. |         |
| Step Count   | Number times to divide the current time span.                   |         |
| Min Interval | Lowest value in the list.                                       |         |

**Preview**



List of values that will be displayed in the dropdown.

## Query <a href="#usingtheapicapanelsdashboards-query.1" id="usingtheapicapanelsdashboards-query.1"></a>

#### Query <a href="#usingtheapicapanelsdashboards-query.2" id="usingtheapicapanelsdashboards-query.2"></a>

The **Query** variable type uses a Data Source query to return a list of values.

**View**

**Variable**



| Item  | Description                 | Comment            |
| ----- | --------------------------- | ------------------ |
| Name  | Name of the variable.       |                    |
| Label | Display label in dashboard. |                    |
| Type  | Type of variable.           |                    |
| Hide  | Display elements to hide.   | `Label`/`Variable` |

**Query Options**



| Item        | Description                                                 | Comment                                                                                        |
| ----------- | ----------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| Data source | The Data Source used by the query.                          |                                                                                                |
| Refresh     | Controls when to update the variable option list.           | `Never`/ `On Dashboard Load` / `On Time Range Change`                                          |
| Query       | Query expression.                                           | Each data source has a specific query.                                                         |
| Regex       | Optional Regular Expression for filtering of query results. |                                                                                                |
| Sort        | Sort order to use instead of the one returned by the query. | `Disabled` / `Alphabetical` (ascending or descending) / `Numerical`(ascending or descending) . |

**Selection Options**



| Item               | Description                                         | Comment                                                 |
| ------------------ | --------------------------------------------------- | ------------------------------------------------------- |
| Multi-value        | Allow selection of multiple values in the dropdown. |                                                         |
| Include All Option | Add `All` option to dropdown.                       | Will include all values in a combined query expression. |
| Custom All Value   | Query expression to use as `All` value.             |                                                         |

Custom All Value

The standard `All` value combines all options, which can result in a very long expression and possibly affect performance.

It may therefore be better to provide a custom expression more suitable for your data source, for example a Regular Expression.

**Note:** Characters in the expression are not escaped.

## Template Source Data Source <a href="#usingtheapicapanelsdashboards-templatesourcedatasource" id="usingtheapicapanelsdashboards-templatesourcedatasource"></a>

#### Data Source <a href="#usingtheapicapanelsdashboards-datasource" id="usingtheapicapanelsdashboards-datasource"></a>

The **Datasource** variable lets you create a dropdown containing multiple Data Source.

**View**

With the **Datasource** variable, you can quickly change the data source for an entire Dashboard. This is useful if you have multiple data source instances for different environments.

**Variable**



| Item  | Description                 | Comment            |
| ----- | --------------------------- | ------------------ |
| Name  | Name of the variable.       |                    |
| Label | Display label in dashboard. |                    |
| Type  | Type of variable.           |                    |
| Hide  | Display elements to hide.   | `Label`/`Variable` |

**Data Source Options**



| Item                 | Description                                                         | Comment |
| -------------------- | ------------------------------------------------------------------- | ------- |
| Data source          | The Data Source type to display.                                    |         |
| Instance Name Filter | Optional Regular Expression for filtering of data source instances. |         |

**Preview**



List of values that will be displayed in the dropdown.

## Export/Import/Format <a href="#usingtheapicapanelsdashboards-export-import-format" id="usingtheapicapanelsdashboards-export-import-format"></a>

#### Export/Import <a href="#usingtheapicapanelsdashboards-export-import" id="usingtheapicapanelsdashboards-export-import"></a>

Dashboards can be exported as JSON files, modified as text files, and imported.

## Export <a href="#usingtheapicapanelsdashboards-export" id="usingtheapicapanelsdashboards-export"></a>

An existing dashboard can be exported as a JSON file. The exported file contains everything needed to create a dashboard.

**Export Dashboard**

To save the dashboard as a JSON file:



* Click the **Share**
* Select **Export**

The **Export** tab in the **Share** dialog is shown:



* Click **Save to file**

The file is saved to your default download location.

## Import <a href="#usingtheapicapanelsdashboards-import" id="usingtheapicapanelsdashboards-import"></a>

There are multiple ways to import an existing or previously used dashboard to an organization.

**Process**

The import consist of three steps:

* Verify that you have an appropriate Data Source for the dashboard
* Start import
* Add JSON code
* Save the new dashboard

When the dashboard is imported, you can can perform additional configuration.

## File <a href="#usingtheapicapanelsdashboards-file" id="usingtheapicapanelsdashboards-file"></a>

#### File <a href="#usingtheapicapanelsdashboards-file.1" id="usingtheapicapanelsdashboards-file.1"></a>

A previously exported dashboard JSON file can be imported to create a new dashboard.

**Import Dashboard File**



* Click the **Dashboard Search**



* Click **Import Dashboard**

The **Import Dashboard** dialog is shown:



* Click **Upload .JSON File**



* Browse to the `.JSON` file
* Click **Open**



* Enter a **Name** for the new dashboard
* Select a **DataSource** for the new dashboard



* Click **Import**

The dashboard is created and added to the organization.



## Paste JSON <a href="#usingtheapicapanelsdashboards-pastejson" id="usingtheapicapanelsdashboards-pastejson"></a>

If you have JSON code copied from somewhere else, you can paste it into the import dialog.

**Create Dashboard From JSON**

* Make sure that the code you want to paste is available and correct.



* Click the **Dashboard Search**



* Click **Import Dashboard**

The **Import Dashboard** dialog is shown:



* Copy the JSON code and paste it into the **Paste JSON** box.
* Click **Load**



* Enter a **Name** for the new dashboard
* Select a **DataSource** for the new dashboard



* Click **Import**

The dashboard is created and added to the organization.



## Format <a href="#usingtheapicapanelsdashboards-format" id="usingtheapicapanelsdashboards-format"></a>

The format is a standard JSON object containing the dashboard description and settings.

A dashboard in Grafana is represented by a JSON object, which stores metadata of its dashboard. Dashboard metadata includes dashboard properties, metadata from rows, panels, template variables, panel queries, and so on.

**View JSON**

To view the JSON for a dashboard:



* Click on **Manage**
* Select **View JSON**

The JSON for the current dashboard is shown in a separate frame:



**More Information**

For more information, see the [http://docs.grafana.org/reference/dashboard/](http://docs.grafana.org/reference/dashboard/)

## Sharing Grafana Links <a href="#usingtheapicapanelsdashboards-sharinggrafanalinks" id="usingtheapicapanelsdashboards-sharinggrafanalinks"></a>

With **Dashboard links**, you can share a dashboard through a direct link. The link will show the dashboard according to the settings you provide, so the view can be different from the current state.

**Note:** This requires access to Grafana for whomever is supposed to see the dashboard.

**View**



| Item               | Description           | Comment                  |
| ------------------ | --------------------- | ------------------------ |
| Current Time Range | Time Time Range.      |                          |
| Template Variables | Templating Templates. |                          |
| Theme              | Display UI Theme.     | `current`/`dark`/`light` |

**Note:** Make sure that any changes you made to the dashboard has been saved before creating the link.

## Create a Shareable Link <a href="#usingtheapicapanelsdashboards-createashareablelink" id="usingtheapicapanelsdashboards-createashareablelink"></a>

#### Create Link <a href="#usingtheapicapanelsdashboards-createlink" id="usingtheapicapanelsdashboards-createlink"></a>

**Dashboard links** can be created from the **Share** menu.

**Create Dashboard Link**

To create a dashboard link:



* Click the **Share**
* Select **Link To Dashboard**

The **Link** tab in the **Share** dialog is shown:



* Select options as desired:
* Time range
* Variables
* Theme
* Click **Copy**

You can now paste the link wherever you need it.

## Time Range <a href="#usingtheapicapanelsdashboards-timerange" id="usingtheapicapanelsdashboards-timerange"></a>

#### Time Range <a href="#usingtheapicapanelsdashboards-timerange.1" id="usingtheapicapanelsdashboards-timerange.1"></a>

The dashboards display data according to the **Time Range** settings.

**Add Grafana Dashboard**

The current setting is shown in the top right corner:



Clicking the time range will open the configuration dialog.



#### Dashboard <a href="#usingtheapicapanelsdashboards-dashboard.1" id="usingtheapicapanelsdashboards-dashboard.1"></a>

The Dashboard time range settings apply to all Panel widgets in the Dashboard, except panels with Time Range Time Override.

**Configuration**



Time Range

The time range section allows you to mix both explicit and relative ranges.

| Item             | Description                             |
| ---------------- | --------------------------------------- |
| From             | Start time period.                      |
| To               | End time period.                        |
| Refreshing every | Reload the dashboard at this frequency. |

Quick Ranges

Quick ranges are a list of preset values that you can choose from to select a predefined relative time.

**Explicit Time Range**

The explicit time range format is `YYYY-MM-DD HH:MM:SS`.

**Relative Time Range**

Relative time ranges are created by using time formatting:

| Units    | Description                |
| -------- | -------------------------- |
| `now`    | Current time at viewing.   |
| `s`      | Seconds                    |
| `m`      | Minutes                    |
| `h`      | Hours                      |
| `d`      | Days                       |
| `w`      | Weeks                      |
| `M`      | Months                     |
| `y`      | Years                      |
| `/$unit` | Adds the time period unit. |
| `-`      | Relative from `now`.       |

**Examples**

| From:      | To:        | Meaning        |
| ---------- | ---------- | -------------- |
| `now-5m`   | `now`      | Last 5 minutes |
| `now/d`    | `now`      | The day so far |
| `now/w`    | `now/w`    | This week      |
| `now/w`    | `now`      | Week to date   |
| `now-1M/M` | `now-1M/M` | Previous Month |

#### Time Override <a href="#usingtheapicapanelsdashboards-timeoverride" id="usingtheapicapanelsdashboards-timeoverride"></a>

If you want **individual panel widgets** to display metrics from different time periods in the same dashboard, you can override the relative time range for individual panel widgets

**View**



| Item                    | Description                                                    |
| ----------------------- | -------------------------------------------------------------- |
| Override Relative Time  | Start time period.                                             |
| Add Time Shift          | End time period.                                               |
| Hide Time Override Info | Hides override info text shown in the upper right of a widget. |

**Feature Notes**

**Note:** Only relative time ranges can be used for panel widget time override.

Some considerations to keep in mind when using time overrides in panel widgets:

* The panel relative time override is only active when the dashboard time is also relative.
* The panel timeshift override is always active, even when the dashboard time is absolute.
* If the dashboard time range is manually selected (zoomed), all panel widget overrides will be disabled.
*

### Graph Tooltips <a href="#usingtheapicapanelsdashboards-graphtooltips" id="usingtheapicapanelsdashboards-graphtooltips"></a>

When viewing panel widgets, you can hover the mouse pointer over various sections to get detailed information in tooltips.

The tooltip hover can work in **crosshair** (single) or **shared** (multiple) mode.

**Crosshair**

In **crosshair/single** mode, only one panel widget at a time is affected.



**Shared**

In **shared/multiple** mode, the crosshair is shown on multiple widgets and tooltip contains information for all affected panel widgets.



**Configuration**

The default behavior can be changed from the Settings General.

You can also toogle between behaviors by pressing `ctrl-o`/`command-o`.

## Kiosk Mode <a href="#usingtheapicapanelsdashboards-kioskmode" id="usingtheapicapanelsdashboards-kioskmode"></a>

Displaying a dashboard in **kiosk mode** provides a cleaner view without the toolbar is visible at the top of the window.

Typical uses for this is to show the dashboard on a office TV or other public display.



## Apica Link <a href="#usingtheapicapanelsdashboards-apicalink" id="usingtheapicapanelsdashboards-apicalink"></a>

In order to provide access to the kiosk dashboard through your Apica account, you need to create a special link to the kiosk mode.

### Create External Link <a href="#usingtheapicapanelsdashboards-createexternallink" id="usingtheapicapanelsdashboards-createexternallink"></a>

The external link for a dashboard looks something like this:

`https://wpm.apicasystem.com/Account/Login?returnUrl=`{returnUrl}`&authToken=`{authToken}`&onAuth=setApic aDashboardToken`

| Part                                        | Description                              |
| ------------------------------------------- | ---------------------------------------- |
| `https://wpm.apicasystem.com/Account/Login` | Base access URL.                         |
| `?returnUrl=`                               | The returnUrl property name.             |
| {returnUrl}                                 | URL encoded link to the Panel.           |
| `&authToken=`                               | The authToken property name.             |
| {authToken}                                 | Base64 and url encoded access token.     |
| `&onAuth=setApicaDashboardToken`            | Instructions to server to use the token. |

Replace the {strings} with the values relevant for your panel.

**Dashboard URL - returnURL**

The returnURL string is a URL encoded link to the Panel.

| String                                                     | URL Encoding                                                                |
| ---------------------------------------------------------- | --------------------------------------------------------------------------- |
| `https://panels.apicasystem.com/dashboard/db/asm?orgId=27` |  `https%3A%2F%2Fpanels.apicasystem.com%2Fdashboard%2Fdb%2Fasm%3ForgId%3D27` |

**Access Token - authToken**

&#x20;**Note:** For security purposes, the user **must** be a dedicated read-only user created specifically for this purpose. Make sure that the use has **no user role** assigned to it.

The authToken string is a base64 **and** url encoded string containing your login and password:

| Login             | Password   | String                    | Base64                            | URL encoded                      |
| ----------------- | ---------- | ------------------------- | --------------------------------- | -------------------------------- |
| `login`           | `password` |  `login:password`         |  `bG9naW46cGFzc3dvcmQ=`           |  `bG9naW46cGFzc3dvcmQ%3D`        |
| `username@domain` | `t_!as7`   |  `username@domain:t_!as7` |  `dXNlcm5hbWVAZG9tYWluOnRfIWFzNw` | `dXNlcm5hbWVAZG9tYWluOnRfIWFzNw` |

&#x20;**Note:** the string must include the `:` colon separator.

&#x20;**Note:** This is **not** the API _auth\_ticket_ , but a base64 encoding of a string consisting of your _login_ and _password_.

## Grafana Setup <a href="#usingtheapicapanelsdashboards-grafanasetup" id="usingtheapicapanelsdashboards-grafanasetup"></a>

#### Grafana Setup <a href="#usingtheapicapanelsdashboards-grafanasetup.1" id="usingtheapicapanelsdashboards-grafanasetup.1"></a>

Creating a kiosk mode link in Grafana is done by adding a modifier at the end of the [Share Link Grafana Link](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=Share%20Link%20Grafana%20Link\&linkCreation=true\&fromPageId=2133756074).

**Enabling Kiosk Mode**



* Click the **Share**
* Select **Link To Dashboard**

The **Link** tab in the **Share** dialog is shown:



* Select link Share Link Grafana Link as desired:
* Time range
* Variables
* Theme



* Add `&kiosk` at the end of the link:
* Click **Copy**

You can now paste the external link wherever you need it.

**Browser Fullscreen**

In addition to using the kiosk mode link, you may want to set the browser to fullscreen mode.

Example: Google Chrome



* Open the **view** menu
* Select **Enter Fullscreen** (or use the keyboard command for your OS)

With kiosk mode and browser fullscreen, nothing but the dashboard is shown:



## UI Theme <a href="#usingtheapicapanelsdashboards-uitheme" id="usingtheapicapanelsdashboards-uitheme"></a>

You can select different **UI Themes** for display purposes.

**Overview**

The theme can either be a user profile setting and affect the entire interface, or as an option for the display Share Link Grafana Link, for example in Kiosk Mode mode.

## Theme Link <a href="#usingtheapicapanelsdashboards-themelink" id="usingtheapicapanelsdashboards-themelink"></a>

#### Link <a href="#usingtheapicapanelsdashboards-link" id="usingtheapicapanelsdashboards-link"></a>

Using a theme in links is simply a matter of adding the theme name at the end of the link.

**Examples**

**Dark**

**Dark** is the default theme.



**Note:** If you set the profile default theme **Light**, you cannot currently override it in links.

Currently the

**Light**

**Light** is the the inverse of the **Dark** theme.



To use it in links, add `&theme=light` to the end of the link.

**Profile**

The UI Theme can be set for the whole interface from the user profile. For more information, see the Preferences section.

## User Profile <a href="#usingtheapicapanelsdashboards-userprofile" id="usingtheapicapanelsdashboards-userprofile"></a>

In the user profile, you can change configurations for your account and view associated organizations.

**Menu**



## Panels User Information <a href="#usingtheapicapanelsdashboards-panelsuserinformation" id="usingtheapicapanelsdashboards-panelsuserinformation"></a>

The **information** section covers settings relating to the account itself.

**View**



| Item     | Description                   |                               |
| -------- | ----------------------------- | ----------------------------- |
| Name     | Display name for the account. |                               |
| Email    | User login password.          | Not editable in Apica Panels. |
| Username | User login user name.         | Not editable in Apica Panels. |

## User Password <a href="#usingtheapicapanelsdashboards-userpassword" id="usingtheapicapanelsdashboards-userpassword"></a>

### Password <a href="#usingtheapicapanelsdashboards-password" id="usingtheapicapanelsdashboards-password"></a>

With Apica Panels, the user password can not be changed from the profile, since the access is handled from Synthetic Monitoring.



## Preferences <a href="#usingtheapicapanelsdashboards-preferences" id="usingtheapicapanelsdashboards-preferences"></a>

In the **Preferences** section, you can configure various interface settings for the account.

**View**



| Item           | Description                                      | Comment                                           |
| -------------- | ------------------------------------------------ | ------------------------------------------------- |
| UI Theme       | UI UI Theme to use for the account.              |                                                   |
| Home Dashboard | Primary Apica Panels Dashboards for the account. | The list can be populated by Starring dashboards. |
| Timezone       | Timezone to use in dashboards.                   |                                                   |

## Starring <a href="#usingtheapicapanelsdashboards-starring" id="usingtheapicapanelsdashboards-starring"></a>

Starring a dashboard marks it as a favorite, and allows you to set it as the home dashboard for your account. You can star dashboards directly from the main page. The star button is at the top right next to the dashboard name.



* Click the **Star** button

The star is filled in:



A notification is also shown:



The dashboard is not available in the profile **Home Dashboard** dropdown list.



## Playlist <a href="#usingtheapicapanelsdashboards-playlist" id="usingtheapicapanelsdashboards-playlist"></a>

You can create a **Playlist** to display multiple dashboards in sequence as a slideshow.



The playlist displays each dashboard for a defined amount of time and then goes on to the next.

**Note:** The playlist view can currently not be combined with [Kiosk Mode](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=Kiosk%20Mode\&linkCreation=true\&fromPageId=2133757090) mode.

### Add Playlist <a href="#usingtheapicapanelsdashboards-addplaylist" id="usingtheapicapanelsdashboards-addplaylist"></a>

You can create a **Playlist** to display multiple dashboards in sequence as a slideshow.

### Create New Playlist <a href="#usingtheapicapanelsdashboards-createnewplaylist" id="usingtheapicapanelsdashboards-createnewplaylist"></a>



* Click **New Playlist**

A blank playlist is created



* Provide a **Name** for the playlist



* Set a display time **Interval** for each dashboard



* Search for dashboards by name in the freetext search for\
  **Available** dashboards
* Click **Add To Playlist** for each dashboard to include



* Click **Create New Playlist**

The playlist is created and added to the **saved playlists** table:



The playlist can be accessed by adding the **Start URL** to the base address `panels.apicasystem.com`, or played with the **play** button.

### Playlist Control <a href="#usingtheapicapanelsdashboards-playlistcontrol" id="usingtheapicapanelsdashboards-playlistcontrol"></a>

When the playlist is running, playback buttons are available at the top of the dashboard view.



| Button | Action                   |
| ------ | ------------------------ |
|        | Play previous dashboard. |
|        | Stop playback.           |
|        | Play next dashboard.     |
