# Reporting API's

There are 5 reporting API’s available.  The table below shows the API’s and the associated parameters.

&#x20;

| <p> </p><p>API URL</p><p> </p>                     | <p> </p><p>Parameters</p><p> </p>                                                                                                      | <p> </p><p>Notes</p><p> </p>                                                                                                                                                              |
| -------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <p> </p><p>/core/1.0/API/sessionEvents</p><p> </p> | <p>startdate – date in YYYY-MM-DD format, inclusive<br>enddate – date in YYYY-MM-DD format, exclusive<br>user – username to search</p> | <p>Returns sessions information (user name, ip address, login date time, duration).<br>Active sessions will not be shown if enddate parameter passed (they have no enddate obviously)</p> |
| /core/1.0/API/filterRuleEvents                     | <p> </p><p>Same as session events API</p><p> </p>                                                                                      | <p> </p><p>Returns business rules changes – create, update, delete. Includes user, ip, coverage set details</p><p> </p>                                                                   |
| /core/1.0/API/calculateCoverageEvents              | Same as session events API                                                                                                             | Shows who and when ran calculate coverage operation                                                                                                                                       |
| /core/1.0/API/datablockContentRetrieveEvents       | Same as session events API                                                                                                             | Shows who and when retrieved data through TDO Integration API                                                                                                                             |
| /core/1.0/API/dataAssemblyEvents                   | <p>Same as session event API +<br>projectname - project name to filter<br>projectversion - project version to filter</p>               | <p>Returns data assembly summary – how many records were generated, how many rows with errors<br>(error means field wasn’t populated), rows with errors and errors per row.</p>           |

&#x20;This API can be sent from an automation tool, such as Postman, or can be run directly in a browser window.

&#x20;The API format contains the server/port/api information, followed by a question mark and then the parameters.

&#x20;https://_\<server>:\<port>_/_\<api\_url>?parameter1=\<value>\&parameter2=\<value>_

&#x20;As an example, if we were to use the first one, Session events, and wanted to specify a start date of 9/1/24 and for user ‘pvl’ we would format it as follows:

&#x20;[http://99.99.99.99:8080/core/1.0/API/sessionEvents?startdate=2024-09-01\&user=pvl](http://99.99.99.99:8080/core/1.0/API/sessionEvents?startdate=2024-09-01\&user=pvl)

&#x20;The parameters are optional; if you do not use them you get all events in that category on that server.  Parameters allow for filtering the results to the information date range/user range that is desired for reporting.
