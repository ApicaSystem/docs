# Downloading Data

## Orson – Test Data Orchestrator

End User Guide

### Downloading Assembled Data

Data is downloaded via a Rest API call.

The API call is found on the Assembled Data screen in the URL column. Copy this and paste it to a new browser tab. Hit enter to download the file.

<figure><img src="../../../../.gitbook/assets/image (385).png" alt=""><figcaption><p>Data dowload URL copied to new browser tab</p></figcaption></figure>

Once Chrome notifies you that the file is downloaded, you can open it to view the data.

<figure><img src="../../../../.gitbook/assets/image (386).png" alt=""><figcaption><p>Downloaded data available</p></figcaption></figure>

Files can be downloaded in multiple formats:

· Html (for use in automation tools such as Postman)

· csv (opens as an Excel spreadsheet)

· tab delimited (used by some automation programs)

· pipe delimited (for use with Cucumber or similar programs)

· tab delimited with sequence numbers (for use with Siebel automation)

· industry-specific message formats

The link provided in TDO downloads the .csv format. This is the full API:

[http://99.99.99.99:8080/core/1.1/API/project/payments\_demo/1.0/datablocks/pmt\_t\_output\_step/1.0/](http://35.214.71.106:8080/core/1.1/API/project/payments_demo/1.0/datablocks/pmt_t_output_step/1.0/)

· [http://99.99.99.99:8080/](http://35.214.71.106:8080/) defines the server and port.

· core/1.1/api/ is the API version and format.

· project/payments\_demo/1.0/ is the project and version that the data was created under in TDO.

· datablocks/pmt\_t\_output\_step/1.0/ is the name and version of the file holding the assembled data.

By changing the 1.1 in the core/1.1/API part of the message you can change the output format:

· html – 1.0

· csv – 1.1

· tab delimited – 1.2

· pipe delimited – 1.3

· tab delimited with sequence numbers – 1.4

· EDI 834 format (industry specific) – 1.5

You can embed the API in other programs and call the file directly from TDO without manually downloading it. This can be done from any program or tool that supports APIs.

More information on the data download API can be found at [this link.](https://docs.apica.io/platform-docs/test-data-orchestrator-tdo/user-documentation/api-guide/data-movement-apis/download-data-files)
