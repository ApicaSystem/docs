# Setting up a Shell Script/Batch File

TDO can execute shell scripts / batch files. &#x20;

{% hint style="info" %}
TDO can execute shell scripts / batch files from both Linux and Windows servers.  The examples shown below are Linux.
{% endhint %}

### Executing files on the TDO server

In the example below, TDO will execute the 'ping.sh' shell script located in the opt/scripts directory on the TDO server.

<figure><img src="../../../../.gitbook/assets/image (1044).png" alt=""><figcaption><p>Basic shell script setup</p></figcaption></figure>

Because this is on the TDO server, and the user has access to this directory, no arguements are needed.  And because the path of the shell script is defined on the top line, nothing is needed in the 'working directory' line.  When executed, this is the result of that script:

<figure><img src="../../../../.gitbook/assets/image (1045).png" alt=""><figcaption><p>Executed shell script</p></figcaption></figure>

### Executing files on a different server

If you want to execute a file located on a server other than the TDO server, you will need to set up SSH (Secure Shell) protocal on the target server where the file is located.  This should be a remote desktop (RDC) server.  As part of this you will generate a key file that will be located on the target server.  When you use this method, the setup looks like the example below.

<figure><img src="../../../../.gitbook/assets/image (1046).png" alt=""><figcaption><p>Executing a file on a remote desktop using SSH</p></figcaption></figure>

The program is identified as 'pwsh' (ie, powershell). the arguements contain  the IP host name of the target server, the user name of the ID executing the command, the path for the SSH key file, and then the information on the script to be executed.  The script to be executed could be a simple script or a complex batch file running a series of remote jobs for the remote server.

Again, the 'Working Directory' line is not used here since directory information is included in the 'Arguements' line.

When the workflow is run and the script executes, the script results are shown in the execution log.  The log contains all of the information the script returned in the command window (see first screen print above).

<figure><img src="../../../../.gitbook/assets/image (1047).png" alt=""><figcaption><p>Execution Log</p></figcaption></figure>
