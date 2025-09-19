# How to Use a Custom DNS Host File Within a ZebraTester Script

It is possible to utilize a custom host file when running a ZebraTester script rather than using the default hosts file. For example, you may need to utilize a custom hosts file in order to allow the script to access a staging environment. It is possible to either link the hosts.txt file to the script as an external resource or to specify the hosts.txt file as a custom host file when specifying additional options for the compiled script. When you specify a custom host file in this way, the host file of the underlying operating system will be ignored.

Follow these steps to include such a custom host file.

## 1. Create and populate a custom host.txt file in the same directory as your ZebraTester script <a href="#howtouseacustomdnshostfilewithinazebratesterscript-1.createandpopulateacustomhost.txtfileinthesamedi" id="howtouseacustomdnshostfilewithinazebratesterscript-1.createandpopulateacustomhost.txtfileinthesamedi"></a>

Populate the file as you would a regular host file.

Note that the hosts file _must_ have the extension .txt!

## 2. Link the hosts.txt file to the script as an external resource (optional) <a href="#howtouseacustomdnshostfilewithinazebratesterscript-2.linkthehosts.txtfiletothescriptasanexternalreso" id="howtouseacustomdnshostfilewithinazebratesterscript-2.linkthehosts.txtfiletothescriptasanexternalreso"></a>

If you perform this step, step 4 is not necessary.

If you choose to add the script as an external resource, it must be added before [compiling your script](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620870/Generate+HTTP+S+Load+Test+Program).

Open the “URL Details / Var Handler” page by clicking on any of the URLs in your script. Then, click the folder icon in the “var handler” section to the right:



In the “Config External Resource” box which pops up, click “Browse and Select Files”:



A popup box will list all of the files which are in the same directory as your current script:



Check the box to the left of the “hosts.txt” file and click “Apply”. Then close out of the “Config External Resource” box. The folder icon will turn blue to indicate that an external resource has been added.



## 3. Zip the hosts.txt file to compiled .class file <a href="#howtouseacustomdnshostfilewithinazebratesterscript-3.zipthehosts.txtfiletocompiled.classfile" id="howtouseacustomdnshostfilewithinazebratesterscript-3.zipthehosts.txtfiletocompiled.classfile"></a>

[Compile the ZebraTester file](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620870/Generate+HTTP+S+Load+Test+Program) as you would a normal .prxdat file. Zip the hosts.txt and .class file together within the Project Navigator:



## 4. Specify the additional option -dnshosts hosts.txt when running the load test (optional) <a href="#howtouseacustomdnshostfilewithinazebratesterscript-4.specifytheadditionaloption-dnshostshosts.txtwhe" id="howtouseacustomdnshostfilewithinazebratesterscript-4.specifytheadditionaloption-dnshostshosts.txtwhe"></a>

This step is not necessary if you performed step 2 and declared the hosts file as an external resource.



The compiled load test script will now utilize the custom host file when resolving the addresses specified in the file.
