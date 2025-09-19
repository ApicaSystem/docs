# Create a Coverage Matrix

A Coverage Matrix is the generated output of your Business Rules. Each row in the Coverage Matrix is a unique set of values as defined in your Business Rules. The Coverage Matrix is what drives your tests and your test data selection criteria.

Once your business rules are created, you can generate your Coverage Matrix.  In the upper right corner of the business rules page there is a small blue box with a white grid in it.  Click on this box to generate the Coverage Matrix.

<figure><img src="../../../../.gitbook/assets/image (857).png" alt=""><figcaption><p>Business rules page with Coverage Matrix button</p></figcaption></figure>

When you click on this button, you will get a message telling you what TDO is about to create.  Here, TDO is letting you know that you have 8 determining attributes in your rules, and you will create 16 unique tests in your coverage matrix.  Click 'OK' to create the coverage matrix.

<figure><img src="../../../../.gitbook/assets/image (858).png" alt=""><figcaption><p>Coverage Matrix cofirmation message</p></figcaption></figure>

Once you click OK, the coverage matrix will be created.  On the menu, select 'Coverage Matrix' from the 'Coverage Engine' section of the menu to view your coverage matrix.

<figure><img src="../../../../.gitbook/assets/image (859).png" alt=""><figcaption><p>Coverage Matrix</p></figcaption></figure>

Each row is identified by the rule that it was generated to match.  Note that TDO has created one row for each unique combination of data.  The first rule (Corporate accounts) has two account currencies, two payment currencies, and two payment amounts - this has created 8 unique rows.  Each row represents both a unique test case as well as a unique test data requirement.

When you create a coverage matrix, it builds a data block that contains the values shown on the coverage matrix screen.  The data block has the same name as the coverage set, the source is shown as 'Coverage', and the coverage set that was used is shown under the 'Objects' column.

<figure><img src="../../../../.gitbook/assets/image (860).png" alt=""><figcaption><p>Data blocks list showing coverage matrices </p></figcaption></figure>

If you set the 'Occurrences' to a value higher than '1', you will see the impact here.  In the screen print below, the first rule has been set to an 'Occurences' value of 5.  In the confirmation message, TDO is showing that 48 rows will be generated (versus 16 in the original rules with no multiple occurrences).

<figure><img src="../../../../.gitbook/assets/image (861).png" alt=""><figcaption><p>Confirmation message with higher volumes</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/image (862).png" alt=""><figcaption><p>Coverage matrix with additional tests added by setting multiple occurrences</p></figcaption></figure>

A Coverage Matrix must be created before you can build Data Views and Work Sets.
