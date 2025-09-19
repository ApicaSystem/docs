# Wildcard Edition

Availability   : Within Recorder Plug-Ins

Name          : Boundary Based Auto Correlator - Wildcard Edition

Class Name  : WildCardBoundaryBasedAutoCorrelator

&#x20;

**Description**:

This plugin can do multiple extractions from all HTTP response. In order to properly identify each extraction the left or right boundary needs to contain a wildcard. The wildcard is used to capture a section of the left and right boundary that differentiates that extractor from the other extractors.

**Example:**

* Variable name: DynamicVar
* Left boundary: {"name":"@@@,"csrf":"
* Right boundary: "}
* Identifier Wildcard: @@@

&#x20;

**Use**: This plugin can be used where a dynamic string is present within the Left boundary, and a static right boundary.

&#x20;

**Algorithm**:

1. Based on the above example, the plugin will search all the responses and will try to find the pattern with LB as _{"name":"@@@,"csrf":"_ and RB as _"}_ where _@@@_ is a dynamic string.
2. Next, plugin will save all the occurrence and create variables as DynamicVar\_1, DynamicVar\_2 and so on.
3. Then plugin will search for the extracted values in the request contents and will replace it with the respective variable names.
4. Finally, the unused Variables will be deleted.

_Note: All the steps mentioned above will happen once user clicks on ‘Execute Plug-In’._

&#x20;

\*\*\*End of document\*\*\*
