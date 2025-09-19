# Ascent 2.11.1

### Observe <a href="#observe" id="observe"></a>

**New Features & Improvements**

* Notification destinations can now only be viewed by authorized users, providing improved access control and clarity.
* When a resource is deleted, its associated entries are properly removed from permissions management, aiding data consistency.
* User sessions are now more reliably managed, and inactivity correctly results in logouts across all application pages for enhanced security.

**General Changes**

* Policy management navigation now works smoothly without breadcrumb issues.
* Further optimizations enhance dashboard load performance.

**Bug Fixes**

* Resolved an issue where newly added widgets appeared locked after saving a dashboard. Widgets are now functional and accessible upon dashboard creation.
* Users can now successfully upload and save scenarios in Scenario Management.

### Flow <a href="#flow" id="flow"></a>

**Bug Fixes**

* Searching in the alerts tab within the pipelines dashboard responds correctly, enabling more efficient issue tracking.
* Log extraction rules now function as intended, ensuring extracted values are visible and rules work consistently - not just during preview.

### Ascent Synthetics <a href="#ascent-synthetics" id="ascent-synthetics"></a>

**Bug Fixes**

* The Groups View and Manage Groups tab in Check Analytics now consistently show all monitor groups.
* Duplicate check names no longer appear in Manage Groups, ensuring a clear, accurate listing of checks.
* Check details opened from the operations view now display the correct location information, rather than “unknown.”

***

### Component Versions - Ascent v2.11.1

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.16.3</td></tr><tr><td>Coffee</td><td>v3.17.7</td></tr><tr><td>ASM</td><td>13.36.3</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.2 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.5A</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.0</td></tr></tbody></table>
