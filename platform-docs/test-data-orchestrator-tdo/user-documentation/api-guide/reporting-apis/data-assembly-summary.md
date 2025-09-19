# Data Assembly Summary

This call is run as a GET.  It uses the same three parameters as the other reporting API’s but uses two additional ones – projectname and projectversion.  If these parameters are used, you must use both of them.&#x20;

&#x20;This call returns a data assembly summary, including how many rows were generated and how many rows had errors.  If the ‘errors’ indicator is ‘\[ ]’ then there were no errors detected during data assembly.

&#x20;If there were errors, it includes information on the rows that contained errors and the number of errors per row.

&#x20;This result is for the project ‘mug\_test\_project 1.0’ and returned no errors.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (59).png" alt=""><figcaption><p>Data Assembly Summary with no errors in automation tool</p></figcaption></figure>

&#x20;For a data assembly that included errors, the partial return information is shown below.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (60).png" alt=""><figcaption><p>Data Assembly Summary with errors shown in automation tool</p></figcaption></figure>

&#x20;This assembly contained 12 rows with errors.  The error message and resulting data for the first row are also shown (the full error report for this assembly contains the error message for each row in similar detail).
