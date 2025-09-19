# Install a new ZT version on Windows Server

* Uninstall the existing ZT exec agent service using the script **UninstallExecAgentServiceWin64**.bat . Run files **UninstallZebraTesterServiceWin64**.bat in case you also have the GUI/Controller installed.
* Then go to the ZT installation folder and run the **Change ZebraTester Installation** exe file under the folder **\_ZebraTester\_installation** , this will uninstall the existing ZT version.
* Restart is not a must after the uninstallation , but if you don't do restart please wait for a couple of seconds so that the uninstallation will clean up all the files , that have been copied as the part of the existing installation. Uninstallation won't delete any files that application created , for example .prxdat files or any config .dat files.
* Now please start installing the new 64bit ZT exe or msi package.
* After the installation is finished , install the services using the files **installExecAgentServiceWin64**.bat , **InstallZebraTesterServiceWin64**.bat

If you are installing ZebraTester 5.5F on Windows Server, you must add the following entry to your Windows environment variables:

`JAVA_TOOL_OPTIONS="-Dos.name=Windows 7"`

Otherwise the installation will fail with the message “Windows DLL Failed to Load”.
