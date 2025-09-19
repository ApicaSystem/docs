# Linux Server Install

## ORSON - Test Data Orchestrator

### Linux Install & configuration guide&#x20;

&#x20;Before installing TDO, ensure MongoDB is running (follow the instructions in the online manual to start MongoDB).

Ensure that you are logged in with the TDO admin ID or have run sudo to get admin privileges.

### Setup

Move tdo\_repo.zip to appdir.

Run: _unzip tdo-repo.zip_

Run: _cd appdir/ignite_  (If ignite subdirectory does not exist, create it using the md command and then change to that directory.)

Move ignite.zip to appdir/ignite.

Run: _unzip ignite.zip_

Run: _cd.._ to return to appdir

Run: _chmod -R 775 ./_

Run:  ./setup.sh all

Next, you will need to edit files using the vi command (_vi_ _filename_ to enter edit mode, _:wq!_ to save and exit edit mode).

·       Edit start.sh – remove the first four lines. The file should begin with the line ‘ echo "> Starting ORSON" ‘.&#x20;

·       In line 7, replace ‘ mongo.user=root mongo.pass=root ‘ with ‘null null’.

·       Save file after editing.

<figure><img src="../../../.gitbook/assets/image (349).png" alt=""><figcaption><p>start.sh before editing</p></figcaption></figure>

·       Edit run.sh – remove the first five lines.  The file should now start with the line ‘ echo "killing " $(jps -mlV | grep PropertiesLauncher) ‘.  Save file after editing.

<figure><img src="../../../.gitbook/assets/image (350).png" alt=""><figcaption><p>run.sh before editing</p></figcaption></figure>

·       Run: _cd engine_   to change to the appdir/engine subdirectory.

·       Edit run.sh.  The first line will begin with:

o   java -server -Xms1024m -Xmx2048m

o   the Xmx variable can be increased (in increments of 1024) to increase total memory in use by TDO.

o   This value should never exceed total server memory allocated to TDO.

o   Increasing this value (ex: 16384 for 16GB) will improve TDO’s performance for memory-intensive tasks.

o   If you edit this value, remember to save the file before proceeding.

Ru&#x6E;_: cd .._  to return to appdir

Run: _nohup ./start.sh all &_   to start TDO.  It will take about 30 seconds for the application to fully initialize.&#x20;

To confirm that the application is ready, run _JPS_ at the command line.  When you see 2 jar processes, 1 jps process, and 1 CommandLineStartup process (a total of 4 processes) then the application is ready to use.

&#x20;

### Initial action&#x20;

You will first need to set up an admin ID to allow initial testing and user maintenance to be done.  Once you have set up your initial users, and have at least one admin ID created for your user base, this initial ID can be deleted on the User maintenance screen.

To create the initial ID, open a new tab in Chrome and go to http://\<IP\_of\_your\_server>:8080/ui/public/signup.

For example, you would enter: [http://35.214.52.73:8080/ui/public/signup](http://35.214.52.73:8080/ui/public/signup).

If you have https enabled, then this would be forwarded to port 8443 instead of 8080, and it would look like this: :[https://35.214.52.73:443/ui/public/signup](https://35.214.52.73/ui/public/signup).

&#x20;If you are running TDO on a remote desktop/virtual server and accessing it from that same server, your url would look like this:  [http://localhost:8080/ui/public/signup](http://localhost:8080/public/signup).

&#x20;If you are running TDO on a remote desktop/virtual server and accessing it from your desktop, you would use the server name instead of the IP address and your url would look like this: [http://csc2cxn00004025.apica.com:8080/ui/public/signup](http://csc2cxn00004025.apica.com:8080/ui/public/signup) .

·       A new user screen will appear.  Fill in the username, password and email and hit the signup button. This will take you to the login screen.  \[Note that any user created using this initial signup screen will be an admin user.]

·       Log in using the ID and password you have created.

·       Once you have logged in, you can create new users in the User Management section of the tool.  See the ‘User Maintenance’ section of this on-line manual for detailed instructions.

·       While TDO can be set up with LDAP authentication, it cannot be done until at least one project is created.  We do not recommend LDAP setup during a Proof of Concept/Proof of Technology evaluation as this process requires coordination with your network, AD, and/or security teams and can take several weeks to complete.

&#x20;

### Stopping the application

TDO runs in three layers – the application, Ignite, and MongoDB.

·       Only stop MongoDB for a full server restart.  It can remain running for an upgrade.

·       Only stop Ingite to correct an Ignite error or for a full server restart. It can remain running during an upgrade.

&#x20;To shut down the TDO application:

&#x20;Run: _./stop.sh all_   This will stop the api and engine processes but leave Ignite and MongoDB running.&#x20;

&#x20;To stop Ignite, you will need to know the process ID.  Run _JPS_ and write down the process number at the left of the ‘CommandLineStartup’ process.

&#x20;Run: _kill -9 \<process\_id>_  where \<process\_id> is the value you wrote down in the step above.

### &#x20;Restarting TDO

Run: _nohup ./start.sh all &_   to start TDO.  It will take about 30 seconds for the application to fully initialize.&#x20;

### &#x20;Upgrading TDO

Download the new tdo-repo.zip file from the standard repository location as before.

&#x20;In the appdir, run:  _rm -r !(\*ignite\*)_  this will remove all files except the ignite subdirectory from appdir.

&#x20;Move tdo\_repo.zip to appdir.

Run: _unzip tdo-repo.zip_

Run: _chmod -R 775 ./_

Run:  ./setup.sh all

Next, you will need to edit files using the vi command (_vi_ _filename_ to enter edit mode, _:wq!_ to save and exit edit mode).

·       Edit start.sh – remove the first four lines. The file should begin with the line ‘ echo "> Starting ORSON" ‘.  &#x20;

·       In line 7, replace ‘ mongo.user=root mongo.pass=root ‘ with ‘null null’.

·       Save file after editing.

·       Edit run.sh – remove the first five lines.  The file should now start with the line ‘ echo "killing " $(jps -mlV | grep PropertiesLauncher) ‘.  Save file after editing.

·       Run: _cd engine_   to change to the appdir/engine subdirectory.

·       Edit run.sh.  The first line will begin with:

o   java -server -Xms1024m -Xmx2048m

o   the Xmx variable can be increased (in increments of 1024) to increase total memory in use by TDO.

o   This value should never exceed total server memory.

o   Increasing this value (ex: 16384 for 16GB) will improve TDO’s performance for memory-intensive tasks.

o   If you edit this value, remember to save the file before proceeding.

Ru&#x6E;_: cd .._  to return to appdir

Run: _nohup ./start.sh all &_   to start TDO.  It will take about 30 seconds for the application to fully initialize.&#x20;

To confirm that the application is ready, run _JPS_ at the command line.  When you see 2 jar processes, 1 jps process, and 1 CommandLineStartup process (a total of 4 processes) then the application is ready to use.
