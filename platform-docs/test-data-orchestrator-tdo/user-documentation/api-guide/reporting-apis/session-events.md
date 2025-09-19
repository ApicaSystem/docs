# Session Events

This API can be filtered on a start date and/or an end date and on a specific username, if desired.  Data is returned in html format if run in a browser and json if run in an automation program.

&#x20;Run in a browser tab, with only a start date parameter, it will return information as follows.

&#x20;&#x20;

<figure><img src="../../../../../.gitbook/assets/image (54).png" alt=""><figcaption><p>Session Events API in a browser tab</p></figcaption></figure>

&#x20; If run from Postman or a similar program, it is sent as a GET call.  There is no body, only the URL is needed to run this.  The date returns in the results section.

&#x20;&#x20;

<figure><img src="../../../../../.gitbook/assets/image (55).png" alt=""><figcaption><p>Session Events results in an automation tool</p></figcaption></figure>

&#x20; With either option, this shows the TDO ID for the session, the user name, the IP address that was used for access, the date/time for login and logout, whether the session is still active (‘true’) or not (‘false’), and the duration the session was/is active for.

&#x20;Note that startdate is an inclusive parameter (include sessions starting on this date) but end date is an exclusive parameter (only include sessions ending prior to this date).
