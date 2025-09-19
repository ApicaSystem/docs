# Configuration of the Project Navigator Main Directory

ZebraTester can be configured to have its Project Navigator Main Directory on a shared disk or a shared directory, given all members of a team the same view of the data. On Windows, a directory "Share" must already exist. On Unix systems, the shared directory must be already mounted using NFS or mounted via Samba.

### Windows systems <a href="#configurationoftheprojectnavigatormaindirectory-windowssystems" id="configurationoftheprojectnavigatormaindirectory-windowssystems"></a>

In Windows, the ZebraTester `mytests.dat` configuration file must be edited using a text editor such as Notepad. The entry in this file must point to the directory share. This directory shared must be created using Windows before the ZebraTester configuration file is edited. The `mytests.dat` is located in the ZebraTester installation directory.

### Unix systems <a href="#configurationoftheprojectnavigatormaindirectory-unixsystems" id="configurationoftheprojectnavigatormaindirectory-unixsystems"></a>

On Unix systems, the `mytests.dat` configuration file must be manually created in the ZebraTester installation directory using a text editor such as **vi**, The **only entry** in this file should be the path to the new main directory. **Note:** on Unix

systems that have only an Exec Agent started, this file is not necessary.

After setting the new Project Navigator main directory, the ZebraTester application must be closed. In addition, **all cookies in your Web Browser must be deleted** because the old main directory is also stored in a browser cookie. After that ZebraTester can then be re-started, and the new main directory will be active.

Further information about ZebraTester configuration files can be found in the "Application Reference Manual", Chapter 7.
