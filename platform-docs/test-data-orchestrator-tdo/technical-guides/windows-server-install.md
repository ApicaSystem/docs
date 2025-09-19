# Windows Server Install

## ORSON - Test Data Orchestrator

### Windows Install & Configuration Guide&#x20;

You can install TDO on-premises on a fixed server, on your internal cloud, or on any cloud provider.&#x20;

Before beginning the installation, follow the hardware and software requirements guide to make sure that you have the right configuration and software needed for your selected operating system.

### TDO Installation Packages&#x20;

**Download software**

The software can be downloaded from the following location:

TDO:  [https://storage.googleapis.com/ci-pub/tdo-repo.zip](https://storage.googleapis.com/ci-pub/tdo-repo.zip)

Ignite: [https://storage.googleapis.com/ci-pub/ignite.zip](https://storeage.googleapis.com/ci-pub/ignite.zip)

TDX: [https://storage.googleapis.com/data\_extractor/orson-data-extractor.jar](https://storage.googleapis.com/data_extractor/orson-data-extractor.jar)



**Preparation**

Read the installation instructions before beginning installation.

TDO is installed from the windows command line.

Open a cmd or shell window from the windows menu and perform the following actions:

·       Create a directory on the server where the software will reside; this should be either program files/tdo or apps/tdo.  This directory is referred to as ‘appdir’ in the instructions.

·       Start MongoDB following directions in the Mongo online documentation.

&#x20;

Installation Sequence

**Software installation**

&#x20;

·       Move tdo\_repo.exe to ‘appdir’ (created earlier folder where application will be running) &#x20;

·       Extract tdo\_repo.exe to appdir (not to appdir/tdo\_repo)

·       Create a new folder in appdir called ‘Ignite’.

·       Move ignite.zip to the Ignite folder and extract it to that folder.

·       In 'appdir' execute setup.cmd

**File properties**

&#x20;

You will need to modify properties for several files.  To modify the properties, right click on the file name, select ‘Properties’ from the menu, click ‘Unblock’ in the lower right corner, and then click ‘OK’ to save.

&#x20;

<figure><img src="../../../.gitbook/assets/image (348).png" alt=""><figcaption><p>Properties Wwindow</p></figcaption></figure>

&#x20;

The files to be modified are:

·       Appdir/start.cmd

·       Appdir/stop.cmd

·       Appdir/Ignite/bin/ignite.cmd

&#x20;

**Starting the application**

&#x20;

Go to the appdir/Ignite/bin folder and right-click on ‘ignite.cmd’.  Select OPEN to run the file.  This will open a new command window.  Wait for Ignite to start (about 15 seconds).

Navigate back to appdir.  Right-click on start.cmd and select OPEN.  this will open two command windows, for the engine and api.  Wait for both windows to open.

In appdir, right click on stop.cmd and select OPEN.  This should cause the engine and api command windows to close.

Once both windows are closed, run start.cmd again.  Once the engine and api windows are open and running, you are ready to begin working with TDO.

&#x20;

### Initial action&#x20;

You will first need to set up an admin ID to allow initial testing and user maintenance to be done.  Once you have set up your initial users, and have at least one admin ID created for your user base, this initial ID can be deleted on the User maintenance screen.

To create the initial ID, open a new tab in Chrome and go to http://\<IP\_of\_your\_server>:8080/ui/public/signup.

For example, you would enter: [http://52.175.86.43:8080/ui/public/signup](http://35.214.52.73:8080/ui/public/signup).

&#x20;If you have https enabled, then this would be forwarded to port 8443 instead of 8080, and it would look like this: :[https://](https://35.214.52.73/ui/public/signup)[52.175.86.43](http://35.214.52.73:8080/ui/public/signup)[:443/ui/public/signup](https://35.214.52.73/ui/public/signup).

&#x20;If you are running TDO on a remote desktop/virtual server and accessing it from that same server, your url would look like this:  [http://localhost:8080/ui/public/signup](http://localhost:8080/public/signup).

If you are running TDO on a remote desktop/virtual server and accessing it from your desktop, you would use the server name instead of the IP address and your url would look like this: [http://abc2xyz00004025.apica.com:8080/ui/public/signup](http://csc2cxn00004025.apica.com:8080/ui/public/signup) .

&#x20;

·       Fill in the username, password and email and hit the signup button. This will take you to the login screen.  \[Note that any user created using this initial signup screen will be an admin user.]

·       Log in using the ID and password you have created.

·       Once you have logged in, you can create new users in the User Management section of the tool.  See the ‘User Maintenance’ section of this on-line manual for detailed instructions.

·       While TDO can be set up with LDAP authentication, it cannot be done until at least one project is created.  We do not recommend LDAP setup during a Proof of Concept/Proof of Technology evaluation as this process requires coordination with your network, AD, and/or security teams and can take several weeks to complete.

### Upgrade Instructions

Before beginning the upgrade, stop TDO by running the stop.cmd script in the appdir.  Ignite and MongoDB can remain running during the upgrade process.

&#x20;

·       Delete all subdirectories except the Ignite subdirectory.

·       Download the new tdo-repo.zip file and copy it into the appdir.

·       Extract tdo\_repo.exe to appdir (not to appdir/tdo\_repo)

·       In 'appdir' execute setup.cmd&#x20;

**File properties**

You will need to modify properties the same files as during the initial install.  Follow the instructions for this in the initial installation section

&#x20;

**Starting the application**

You will not need to restart Ignite if you did not stop it as part of the uprade.  To restart Ignite,  go to the appdir/Ignite/bin folder and right-click on ‘ignite.cmd’.  Select OPEN to run the file.  This will open a new command window.  Wait for Ignite to start (about 15 seconds).

Navigate back to appdir.  Right-click on start.cmd and select OPEN.  this will open two command windows, for the engine and api.  Wait for both windows to open.

In appdir, right click on stop.cmd and select OPEN.  This should cause the engine and api command windows to close.

Once both windows are closed, run start.cmd again.  Once the engine and api windows are open and running, you are ready to begin working with TDO. &#x20;

### Browser Information

Chrome or Chromium browser is recommended for optimal performance. (Chromium is the opensource analog for Chrome)

_Windows_ (64-bit) download links: &#x20;

* Chromium: [https://chromium.woolyss.com/download/en](https://chromium.woolyss.com/download/en/)[/](https://chromium.woolyss.com/download/en/)[ ](https://chromium.woolyss.com/download/en/)
* Chrome: [https://www.google.com/chrome/browser/desktop/index.htm](https://www.google.com/chrome/browser/desktop/index.html)[l](https://www.google.com/chrome/browser/desktop/index.html)[ ](https://www.google.com/chrome/browser/desktop/index.html)&#x20;
