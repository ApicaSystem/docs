# EDI X12 834 Download

This message is used exclusively in the Health Insurance arena.  Message formats currently exist for all states using the federal platform ( as well as the state based exchanges for CA, CO, GA, and WA.

&#x20;The API format for 834 files is 1.5.  Also important to note is that while you must end the URL with a “/” for the standard output formats, you must not use a terminal slash on this version.

&#x20;http://\<server:port>/core/1.5/API/project/\<project\_name>/\<project\_version>/datablocks/\<datablock\_name>/\<datablock\_version>/\<template>/\<record\_output>&#x20;

&#x20;For this call, there are two additional items to know.

·       \<template> - this identifies which state template to use.

o   or = any state on the federal platform

o   ca = California

o   co = Colorado

o   ga = Georgia

o   wa = Washington

·       \<record\_output> - you can choose to output only a specific row or you can ouput the entire file

o   -1 = output entire file

o   0 = output row 1

o   1 = output row 2

o  n = output row n-1&#x20;

&#x20;To output a full file for Georgia (this project is specifically designed to generate Georgia 834 enrollment files) the URL is:

&#x20;[http://99.99.99.99:8080/core/1.5/API/project/gga\_834\_project/1.0/datablocks/gga\_or\_fam\_834/1.1/ga/-1](http://99.99.99.99:8080/core/1.5/API/project/gga_834_project/1.0/datablocks/gga_or_fam_834/1.1/ga/-1)

&#x20;The browser download manager may identify this as an insecure file type; you will manually have to click ‘Keep’ in the download manager to get the file.

&#x20;&#x20;

<figure><img src="../../../../../../.gitbook/assets/image (50).png" alt=""><figcaption><p>834 format output with browser download manager message</p></figcaption></figure>

&#x20;This is a sample of the file output by TDO:

&#x20;

<figure><img src="../../../../../../.gitbook/assets/image (51).png" alt=""><figcaption><p>Sample EDI X12 834 output</p></figcaption></figure>
