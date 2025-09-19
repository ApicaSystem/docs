# Dashboards

The **Dashboard** provides a collected view of all your defined checks for the account. It is the main panel which you see when you log in to the ASM platform. It is also accessible by pressing the “Overview” dropdown in the ASM top menu bar and selecting “Dashboard”.



The dashboard provides a high level overview of every check you are authorized to view.

## Main Options <a href="#dashboards-mainoptions" id="dashboards-mainoptions"></a>

At the top of the dashboard are a number of options that affect the whole dashboard display.

**View**



Filter: You can type in the main Filter field to filter your checks by name.

**Status Colors:**

Status Colors: Enables Monitor Groups to change to the color of the highest alert severity it contains.&#x20;



**Auto-Refresh:**

Refreshes the page periodically. Be aware that refreshes of this view takes some time, if it contains many checks.



**Note:** The Dashboard groups and subgroups are created in the Manage Checks view. In the Dashboard, you only select display options.

## Understanding Checks on the Dashboard <a href="#dashboards-understandingchecksonthedashboard" id="dashboards-understandingchecksonthedashboard"></a>

Each check is displayed on the Dashboard in a frame corresponding to the group and subgroup it belongs to.



Taken together, this information can provide a good overview of the situation.

Check Information

For each check a number of data points are shown.

* The most recent status:



* Country of origin for the check:



* Check Type:



* Target URL for the check:



Click on the name of the check or the response time to view details about a check. This will add Details Bookmarks Access & Bookmarks at the top of the window and take you to the [Understanding the "Result Details" View](broken-reference) view.

* Latest response time and when the check was run:



* Check history over the last 24 hours:



* Current SLA% value:



## Dashboard Groups <a href="#dashboards-dashboardgroups" id="dashboards-dashboardgroups"></a>

#### Groups <a href="#dashboards-groups" id="dashboards-groups"></a>

At the group level is a summary for the contained subgroups.

**View**



The top bar for the group contains a number of buttons to change the view frame.

| Icon | Name              | Description                                                                |
| ---- | ----------------- | -------------------------------------------------------------------------- |
|  /   | Expand / Collapse | Shows or hides more details for the group/subgroup.                        |
|      | List View         | Switches the frame to Views.                                               |
|      | Split View        | Switches the frame to Views.                                               |
|      | Grid View         | Switches the frame to Views.                                               |
|      | Check Status      | Displays a summary of statuses for checks in the group.                    |
|      | Move Frame        | Button to [Move Group Frame](broken-reference) the frame in the dashboard. |

**Subgroups**

Groups can be expanded to show the contained subgroups.



**Checks In Subgroups**

Subgroups can be expanded to show more details about the contained checks.



## Move Group Frame <a href="#dashboards-movegroupframe" id="dashboards-movegroupframe"></a>

The drag button in the top hand right corner of each frame allows you to move the frames around on the dashboard.

**Move Button**



To move a frame in the dashboard:

* Click the drag button and hold
* Drag the frame to a new position
* Release the mouse button

## Save Layout <a href="#dashboards-savelayout" id="dashboards-savelayout"></a>

Whenever you do any changes to the dashboard, the **Save Layout** button becomes available.

**Save Button**

The **Save Layout** button is at the top of the dashboard.



To make the Dashboard retain its current appearance:

* Click **Save Layout**  &#x20;

The layout is saved.

## Frame Modes and Views <a href="#dashboards-framemodesandviews" id="dashboards-framemodesandviews"></a>

## Modes <a href="#dashboards-modes" id="dashboards-modes"></a>

The frame modes are changed with the button on the top left hand side of a frame or group:

**Actions**

| **Button** | **Name** | **Description**          |
| ---------- | -------- | ------------------------ |
|            | Collapse | Hide the details.        |
|            | Expand   | Show the group contents. |

The mode buttons in the top hand right corner of each frame lets you define the view for the frames.

**Collapsed Group**

In collapsed mode, only the header bar is shown for the Monitor Groups:



**Expanded Group**

In expanded mode, more details are shown about the group is shown. For a main group, the subgroups are shown:



**Expanded Subgroup**

Expanding the subgroup will show the checks that are part of the subgroup.



## Views <a href="#dashboards-views" id="dashboards-views"></a>

The view buttons in the top hand right corner of each frame lets you define the view for the frames.

**Actions**

| Button | Name       | Description                                                      |
| ------ | ---------- | ---------------------------------------------------------------- |
|        | List View  | Switches the frame to [Frame Modes And Views](broken-reference). |
|        | Split View | Switches the frame to [Frame Modes And Views](broken-reference). |
|        | Grid View  | Switches the frame to [Frame Modes And Views](broken-reference). |

**List View**

The List View expands the frame full browser width.



**Split View**

The Split View expands the frame half browser width.



**Grid View**

The **Grid** view shows all the checks in the group in a grid.



## Operations View <a href="#dashboards-operationsview" id="dashboards-operationsview"></a>

The **Operations** view shows all checks as a grid and arranges them in order of alert severity.

**Menu**



The **Operations** view shows all Manage Alerts in order of decreasing Severity.



Fatal alerts are at the top left, followed by Errors, Warnings, and Information.&#x20;

### Grid Items <a href="#dashboards-griditems" id="dashboards-griditems"></a>



Each item in the grid shows information about a check.

For each check, a number of data points are shown as icons.



#### View Details <a href="#dashboards-viewdetails" id="dashboards-viewdetails"></a>

To view details about a check:

* Click the desired item in the grid

This will add an Access & Bookmarks at the top of the window and take you to the Check Details view.

