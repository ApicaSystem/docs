# REST Endpoint Examples

**1. Retrieve column values from a table**

_GET url -_ [_http://127.0.0.1:8992?cmd=ats\_retrieve\_row_](http://127.0.0.1:8992/?cmd=ats_retrieve_row) _- **Suits performance testing use cases**_\
&#xNAN;_&#x62;ody JSON- {_\
&#x20;   _"TableName”: "table\_name",_\
&#x20;   _"ColumnNames”: \["column\_name1","column\_name2"]_\
&#xNAN;_}_

_This API call will give different column values for each request ,that means once a value is retrieved, it had been marked as retrieved and cannot be retrieved again_



**2. Set values of multiple columns in a table**

_POST url -_ [_http://127.0.0.1:8992?cmd=ats\_send\_row_](http://127.0.0.1:8992/?cmd=ats_send_row)\
&#xNAN;_&#x62;ody JSON - {_\
&#x20;   _"TableName”: "table\_name",_\
&#x20;   _"ColumnNames”: \["column\_name1","column\_name2"],_\
&#x20;   _"ColumnValues”: \["column\_value1","column\_value2"],_\
&#x20;   _"Type”: "ROW"_                                                                \
&#xNAN;_}_

&#x20; _**Type have three values ROW, STACKED and UNIQUE**_



**3. Retrieve a column value from a table -&#x20;**_**Suits performance testing use cases , but can be used for other use cases with the help of RowIndex**_

_GET url -_ [_http://127.0.0.1:8992?cmd=ats\_retrieve\_column_](http://127.0.0.1:8992/?cmd=ats_retrieve_column)\
&#xNAN;_&#x62;ody JSON- {_\
&#x20;   _"TableName”: "table\_name",_\
&#x20;   _"ColumnName”: "column\_name"_\
&#xNAN;_}_

_By default this API call will give different column values for each request ,that means once a value is retrieved, it had been marked as retrieved and cannot be retrieved again. But in some cases if you want to retrieve always the same value , you need to pass the third parameter RowIndex_



**4. Set a column value in a table**

_POST url -_ [_http://127.0.0.1:8992?cmd=ats\_send\_column_](http://127.0.0.1:8992/?cmd=ats_send_column)\
&#xNAN;_&#x62;ody JSON- {_\
&#x20;   _"TableName”: "table\_name",_\
&#x20;   _"ColumnName”: "column\_name",_\
&#x20;   _"ColumnValue”: "column\_value",_\
&#x20;   _"Unique”: true_\
&#xNAN;_}_



**5. Update a column value by row index in a table**

_POST url -_ [_http://127.0.0.1:8992?cmd=ats\_update\_column_](http://127.0.0.1:8992/?cmd=ats_update_column)\
&#x20;   _body JSON - {_\
&#x20;   _"TableName”: "table\_name",_\
&#x20;   _"ColumnName”: "column\_name",_\
&#x20;   _"ColumnValue”: "column\_value”,_\
&#x20; _“Unique”: false,_\
&#x20;   _" RowIndex “: 1_\
&#xNAN;_}_



**6. Get the size of a table or column in a table**

&#x20;    _POST url -_ [_http://127.0.0.1:8992?cmd=ats\_retrieve\_table\_size_](http://127.0.0.1:8992/?cmd=ats_retrieve_table_size)\
&#x20;   _body JSON - {_\
&#x20;   _"TableName”: "table\_name",_\
&#x20;   _"ColumnName”: "column\_name"                                **ColumnName is optional**_\
&#x20;   _}_       &#x20;

**7. Retrieval of rows based on multiple column names and values. This API also supports an optional input OuputColumnNames, the column names in rows to be retrieved based on the matching column names and values**

_GET url -_ [_http://127.0.0.1:8992?cmd=ats\_retrieve\_row\_by\_column_](http://127.0.0.1:8992/?cmd=ats_retrieve_row_by_column)\
&#xNAN;_&#x62;ody JSON- {_\
&#xNAN;_"TableName”: "table\_name",_\
&#xNAN;_"MatchColumnNames": \["column\_name1",”column\_name2”],_\
&#xNAN;_"MatchColumnValues" : \["column\_value1","column\_value2"]_\
&#xNAN;_}_



**8. Save a table after you have called any of the above APIs**

_POST url -_ [http://127.0.0.1:8992?cmd=ats\_save\_table](http://127.0.0.1:8992/?cmd=ats_save_table)\
&#x20;   _body JSON - {_\
&#x20;   _"TableName”: "table\_name"_\
&#x20;   _}_   &#x20;

**9. Retrieve all the records in a particular table**

_GET url -_ [http://127.0.0.1:8992?cmd=ats\_retrieve\_all\_rows](http://127.0.0.1:8992/?cmd=ats_retrieve_all_rows)\
&#x20;   _body JSON - {_\
&#x20;   _"TableName”: "table\_name"_\
&#x20;   _}_   &#x20;
