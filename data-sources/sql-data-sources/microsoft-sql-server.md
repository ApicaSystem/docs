# Microsoft SQL Server

Apica Ascent lets you connect to the Microsoft SQL Server which is a relational database management system (RDBMS) that supports a wide variety of transaction processing, business intelligence, and analytics applications in corporate IT environments.

With Apica Ascent you can easily query, monitor, and visualize the MS SQL Server data

### Adding MS SQL Server to Apica Ascent

The first step is to create and add MS SQL Server to Apica Ascent and add fill out the below fields and save

* **Name**: Name the data source
* **User**: A user of the MS SQL Server which is in the form: `user@server-name`
* **Password**: The password for the above user
* **Server**: This is your server address without the `.database-windows.net` suffix
* **Port**: The port of the MS SQL Server
* **TDS Version:** TDS Version of your MS SQL Server
* **Character Set:** Character encoding of your MS SQL Server
* **Database name**: The name of the database of the MS SQL Server

Also make sure to Check out [Microsoft’s documentation](https://docs.microsoft.com/en-us/azure/synapse-analytics/sql-data-warehouse/create-data-warehouse-portal#create-a-server-level-firewall-rule) for instructions to whitelist your Apica Ascent IP address when connecting to Synapse.

![Configuring MS SQL Server](<../../.gitbook/assets/Screenshot from 2022-06-29 21-17-37.png>)

That's all, now navigate to the Query Editor to query your data
