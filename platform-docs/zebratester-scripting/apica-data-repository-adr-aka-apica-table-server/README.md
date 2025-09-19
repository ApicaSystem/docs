# Apica Data Repository (ADR) aka Apica Table Server

The Apica Data Repository application matches the functionality up to and beyond the former “HP Virtual Table server.“ The ADR tool provides shared data tables that can be accessed by multiple scripts during the execution to manage data (C.R.U.D. operations). ADR will help accomplish the data sharing across the scripts during the execution, eliminating the need to attach data to the script before the execution to manage data.

ADR can be used in any use case where the script execution requires dynamic data, like feeding script with credentials, feeding script with security tokens, sharing data across different microservices scripts in the same application, etc. So basically, customers can save time by using the ADR tool, so it is apt for cost savings and flexibility. To communicate with ADR for data retrieval and feeding, ZebraTester now includes new inline functions.

Pros over the “HP Virtual Table Server”:

1. Ease of use (Has a Rich GUI)
2. Security (both in the GUI and API)
3. Low Resource consumption
4. Rich APIs support
5. Scalability
6. Better performance

***

## Release Notes Pages <a href="#release-notes-pages" id="release-notes-pages"></a>

[https://apica-packages.s3.eu-central-1.amazonaws.com/stable/adr/1.4/ApicaTableServer.pdf](https://apica-packages.s3.eu-central-1.amazonaws.com/stable/adr/1.4/ApicaTableServer.pdf)

&#x20;

&#x20;

## V1.4 Release Notes (Dec 02, 2021) <a href="#v1.4-release-notes-dec-02-2021" id="v1.4-release-notes-dec-02-2021"></a>

* Releasing as a standalone package (before it was delivered along with ZebraTester)
* Tables are saved as encrypted files, means not as plain CSV files
* Supports Search option by a keyword on the created tables

## V1.3 Release Notes (April 22, 2021) <a href="#v1.3-release-notes-april-22-2021" id="v1.3-release-notes-april-22-2021"></a>

* Support for
  * client certificate authentication when communicating to ATS API end points. (refer section 1.2 for more details)
  * Supports new API end point for query table based on column names and values like below example GET url - [http://127.0.0.1:8992?cmd=ats\_retrieve\_row\_by\_column](http://127.0.0.1:8992/?cmd=ats_retrieve_row_by_column) body JSON- { "TableName”: "table\_name", "MatchColumnNames": \["column\_name1",”column\_name2”], "MatchColumnValues" : \["column\_value1","column\_value2"] } This API should also support retrieval based on multiple column names and values. This API also supports an optional input OutputColumnNames, the column names in a row to be retrieved based on the matching column names and values.
  * Supports the user case of not removing the retrieved column value from the table when querying based on the row index.

## V1.2 Release Notes (January 17, 2021) <a href="#v1.2-release-notes-january-17-2021" id="v1.2-release-notes-january-17-2021"></a>

* Support for
  * Authentication using a username and password, Authorization with the help of Users - Groups - Tables relations.
  * Create a New Table option, so that the user can create new tables that will be automatically added to the groups, the user belongs to.
  * Fixed bugs related to intermittent issues - duplicate retrieval and insertion of data.

## V1.1 Release Notes (September 30, 2020) <a href="#v1.1-release-notes-september-30-2020" id="v1.1-release-notes-september-30-2020"></a>

* Support for
  * Column actions like insert value at the start, append a value to the end, insert a column, and delete a column.
  * Row actions like editing a row; modifying the values of the columns inside a row or delete a row.
  * Server-side pagination for the ATS tables, so that table with a huge amount of data will load in milliseconds.
* Enable /Disable API Access
  * If disabled, the APIs supported by ATS won’t be reachable.
* Added a new API call for getting the size of a table on ATS.

## V1.0 Release Notes (July 20, 2020) <a href="#v1.0-release-notes-july-20-2020" id="v1.0-release-notes-july-20-2020"></a>

* Import CSV files
  * Contents of the CSV files will be stored as a table and can be viewed in the ATS GUI.
* Support Multiple tables
  * There’s an available drop-down for selecting a particular table.
* Export the selected table.
* Delete the selected table.
* REST endpoints can Retrieve and Upload data from/to ATS.

***

## Installation of ADR <a href="#installation-of-adr" id="installation-of-adr"></a>

**Include Page**

Edit to setup

***

***

## [Accessing the ADR with Inline Scripts](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/953876633) <a href="#accessing-the-adr-with-inline-scripts" id="accessing-the-adr-with-inline-scripts"></a>

| **getTableColumn(tableName, columnName)**                                                  | <p>Retrieves the first row in that column, there is an optional parameter row index you can pass as well when you need to have value from a particular row index</p><p><em>country = getTableColumn("100_Sales_Records", "Country", 1)</em></p><p>By default this function will give different column values for each request , but if you want to get always the same value , you need to pass the third parameter row index</p><p><em>team = getTableColumn("TeamDetails", "teamName", 2)</em></p>                                                                    |
| ------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **getTableRow(tableName, columnNames)**                                                    | <p>Retrieves the first row of each column given. columnNames separated by semicolon . Next call will give the second row and so on.</p><p><em>getTableRow("100_Sales_Records", "Country;Region")</em></p>                                                                                                                                                                                                                                                                                                                                                               |
| **getTableRowByColumn(tableName, matchColumnNames, matchColumnValues, outputColumnNames)** | <p>Retrieves the first row of column values that matches given column names and values. User can also supply the output columns to be retrieved , but it is optional . In case of multiple input, the values of matchColumnNames, matchColumnValues and outputColumnNames should be separated by a semicolon</p><p>This function will always give the values of the columns consistently, means you can have the same set of values for every call based on the criteria</p><p><em>getTableRowByColumn(“100_Sales_Records”, “Region;Country”, “Europe;Russia”)</em></p> |
| **setTableColumn(tableName, columnName, columnValue, uniqueFlag)**                         | <p>Set a value to a single column of the table. Value of uniqueFlag can be 0 or 1</p><p><em>setTableColumn("100_Sales_Records", "Country","USA", "0")</em></p>                                                                                                                                                                                                                                                                                                                                                                                                          |
| **setTableRow(tableName, columnNames, columnValues, type)**                                | <p>Set the values of a row in a table(columnNames and columnValues separated by semicolon). Value of type can be ROW or UNIQUE or STACKED</p><p><em>setTableRow("100_Sales_Records", "Country;Region", "Japan;Nagasaki", "ROW")</em></p>                                                                                                                                                                                                                                                                                                                                |
| **updateTableColumn(tableName, columnName, columnValue, uniqueFlag, rowIndex)**            | <p>Update a value to a single column of the table by row index. Value of uniqueFlag can be 0 or 1</p><p><em>updateTableColumn("100_Sales_Records", "Country","India", "0", "1")</em></p>                                                                                                                                                                                                                                                                                                                                                                                |

&#x20;

&#x20;

***

## ADR REST Endpoints <a href="#adr-rest-endpoints" id="adr-rest-endpoints"></a>

**1. Retrieve column values from a table**

_GET url -_ [_http://127.0.0.1:8992?cmd=ats\_retrieve\_row_](http://127.0.0.1:8992/?cmd=ats_retrieve_row) _- **Suits performance testing use cases**_\
&#xNAN;_&#x62;ody JSON- {_\
&#x20;   _"TableName”: "table\_name",_\
&#x20;   _"ColumnNames”: \["column\_name1","column\_name2"]_\
&#xNAN;_}_

_This API call will give different column values for each request ,that means once a value is retrieved, it had been marked as retrieved and cannot be retrieved again_

OpenPreview unavailable

&#x20;

**2. Set values of multiple columns in a table**

_POST url -_ [_http://127.0.0.1:8992?cmd=ats\_send\_row_](http://127.0.0.1:8992/?cmd=ats_send_row)\
&#xNAN;_&#x62;ody JSON - {_\
&#x20;   _"TableName”: "table\_name",_\
&#x20;   _"ColumnNames”: \["column\_name1","column\_name2"],_\
&#x20;   _"ColumnValues”: \["column\_value1","column\_value2"],_\
&#x20;   _"Type”: "ROW"_                                                                \
&#xNAN;_}_

&#x20; _**Type have three values ROW, STACKED and UNIQUE**_

OpenPreview unavailable

&#x20;

**3. Retrieve a column value from a table -&#x20;**_**Suits performance testing use cases , but can be used for other use cases with the help of RowIndex**_

_GET url -_ [_http://127.0.0.1:8992?cmd=ats\_retrieve\_column_](http://127.0.0.1:8992/?cmd=ats_retrieve_column)\
&#xNAN;_&#x62;ody JSON- {_\
&#x20;   _"TableName”: "table\_name",_\
&#x20;   _"ColumnName”: "column\_name"_\
&#xNAN;_}_

_By default this API call will give different column values for each request ,that means once a value is retrieved, it had been marked as retrieved and cannot be retrieved again. But in some cases if you want to retrieve always the same value , you need to pass the third parameter RowIndex_

OpenPreview unavailable

&#x20;

**4. Set a column value in a table**

_POST url -_ [_http://127.0.0.1:8992?cmd=ats\_send\_column_](http://127.0.0.1:8992/?cmd=ats_send_column)\
&#xNAN;_&#x62;ody JSON- {_\
&#x20;   _"TableName”: "table\_name",_\
&#x20;   _"ColumnName”: "column\_name",_\
&#x20;   _"ColumnValue”: "column\_value",_\
&#x20;   _"Unique”: true_\
&#xNAN;_}_

OpenPreview unavailable

&#x20;

**5. Update a column value by row index in a table**

_POST url -_ [_http://127.0.0.1:8992?cmd=ats\_update\_column_](http://127.0.0.1:8992/?cmd=ats_update_column)\
&#x20;   _body JSON - {_\
&#x20;   _"TableName”: "table\_name",_\
&#x20;   _"ColumnName”: "column\_name",_\
&#x20;   _"ColumnValue”: "column\_value”,_\
&#x20; _“Unique”: false,_\
&#x20;   _" RowIndex “: 1_\
&#xNAN;_}_

OpenPreview unavailable

&#x20;

**6. Get the size of a table or column in a table**

&#x20;    _POST url -_ [_http://127.0.0.1:8992?cmd=ats\_retrieve\_table\_size_](http://127.0.0.1:8992/?cmd=ats_retrieve_table_size)\
&#x20;   _body JSON - {_\
&#x20;   _"TableName”: "table\_name",_\
&#x20;   _"ColumnName”: "column\_name"                                **ColumnName is optional**_\
&#x20;   _}_       &#x20;

&#x20;

**7. Retrieval of rows based on multiple column names and values. This API also supports an optional input OuputColumnNames, the column names in rows to be retrieved based on the matching column names and values**

_GET url -_ [_http://127.0.0.1:8992?cmd=ats\_retrieve\_row\_by\_column_](http://127.0.0.1:8992/?cmd=ats_retrieve_row_by_column)\
&#xNAN;_&#x62;ody JSON- {_\
&#xNAN;_"TableName”: "table\_name",_\
&#xNAN;_"MatchColumnNames": \["column\_name1",”column\_name2”],_\
&#xNAN;_"MatchColumnValues" : \["column\_value1","column\_value2"]_\
&#xNAN;_}_

OpenPreview unavailable

&#x20;

**8. Save a table after you have called any of the above APIs**

_POST url -_ [http://127.0.0.1:8992?cmd=ats\_save\_table](http://127.0.0.1:8992/?cmd=ats_save_table)\
&#x20;   _body JSON - {_\
&#x20;   _"TableName”: "table\_name"_\
&#x20;   _}_   &#x20;

&#x20;

**9. Retrieve all the records in a particular table**

_GET url -_ [http://127.0.0.1:8992?cmd=ats\_retrieve\_all\_rows](http://127.0.0.1:8992/?cmd=ats_retrieve_all_rows)\
&#x20;   _body JSON - {_\
&#x20;   _"TableName”: "table\_name"_\
&#x20;   _}_   &#x20;
