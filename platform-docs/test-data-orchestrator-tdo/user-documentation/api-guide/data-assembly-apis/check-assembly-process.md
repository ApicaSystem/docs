# Check Assembly Process

If you will be calling data assembly and data download from an automation program, you need to be sure that data assembly is complete prior to starting the data download.  The check assembly process API will provide current status on data assembly.

&#x20;

The API is sent as a URL only (no body) and can be run from an automation program or from a browser window.  The API format is:

&#x20;

http://\<server>:\<port>/core/1.0/API/dataAssemblyProgress/\<worksetID>

&#x20;The workset ID is returned in the first line of the data Assembly API.  The API will return the total progress as a percentage number (100 indicates 100% complete), the number of rows generated, and the total number of rows to be generated.&#x20;

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (39).png" alt=""><figcaption><p>Data assembly API call and results</p></figcaption></figure>
