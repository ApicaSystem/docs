# Apica Data Repository Release Notes

## V1.4 Release Notes (Dec 02, 2021) <a href="#apicadatarepositoryreleasenotes-v1.4releasenotes-dec02-2021" id="apicadatarepositoryreleasenotes-v1.4releasenotes-dec02-2021"></a>

* Releasing as a standalone package (before it was delivered along with ZebraTester)
* Tables are saved as encrypted files, means not as plain CSV files
* Supports Search option by a keyword on the created tables

## V1.3 Release Notes (April 22, 2021) <a href="#apicadatarepositoryreleasenotes-v1.3releasenotes-april22-2021" id="apicadatarepositoryreleasenotes-v1.3releasenotes-april22-2021"></a>

* Support for
  * client certificate authentication when communicating to ATS API end points. (refer section 1.2 for more details)
  * Supports new API end point for query table based on column names and values like below example GET url - [http://127.0.0.1:8992?cmd=ats\_retrieve\_row\_by\_column](http://127.0.0.1:8992/?cmd=ats_retrieve_row_by_column) body JSON- { "TableName”: "table\_name", "MatchColumnNames": \["column\_name1",”column\_name2”], "MatchColumnValues" : \["column\_value1","column\_value2"] } This API should also support retrieval based on multiple column names and values. This API also supports an optional input OutputColumnNames, the column names in a row to be retrieved based on the matching column names and values.
  * Supports the user case of not removing the retrieved column value from the table when querying based on the row index.

## V1.2 Release Notes (January 17, 2021) <a href="#apicadatarepositoryreleasenotes-v1.2releasenotes-january17-2021" id="apicadatarepositoryreleasenotes-v1.2releasenotes-january17-2021"></a>

* Support for
  * Authentication using a username and password, Authorization with the help of Users - Groups - Tables relations.
  * Create a New Table option, so that the user can create new tables that will be automatically added to the groups, the user belongs to.
  * Fixed bugs related to intermittent issues - duplicate retrieval and insertion of data.

## V1.1 Release Notes (September 30, 2020) <a href="#apicadatarepositoryreleasenotes-v1.1releasenotes-september30-2020" id="apicadatarepositoryreleasenotes-v1.1releasenotes-september30-2020"></a>

* Support for
  * Column actions like insert value at the start, append a value to the end, insert a column, and delete a column.
  * Row actions like editing a row; modifying the values of the columns inside a row or delete a row.
  * Server-side pagination for the ATS tables, so that table with a huge amount of data will load in milliseconds.
* Enable /Disable API Access
  * If disabled, the APIs supported by ATS won’t be reachable.
* Added a new API call for getting the size of a table on ATS.

## V1.0 Release Notes (July 20, 2020) <a href="#apicadatarepositoryreleasenotes-v1.0releasenotes-july20-2020" id="apicadatarepositoryreleasenotes-v1.0releasenotes-july20-2020"></a>

* Import CSV files
  * Contents of the CSV files will be stored as a table and can be viewed in the ATS GUI.
* Support Multiple tables
  * There’s an available drop-down for selecting a particular table.
* Export the selected table.
* Delete the selected table.
* REST endpoints can Retrieve and Upload data from/to ATS.
