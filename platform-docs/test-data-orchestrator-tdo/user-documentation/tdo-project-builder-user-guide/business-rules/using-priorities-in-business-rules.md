# Using Priorities in Business Rules

Priorities are set when creating determining attributes.  In the business rules, they are used to quickly reduce the number of individual tests that are created in the coverage matrix.  This comes in handy when you need to quickly reduce the scope of testing and want to focus on, for instance, high priority tests only.

To use the priorities, click on the pencil to the right of the rule to open the 'Create Business Rule' window.  At the top of the window is a line that is labeled 'Priorities'.  Type the priorities you want to test onto this line. &#x20;

<figure><img src="../../../../../.gitbook/assets/image (938).png" alt=""><figcaption><p>Setting priorities to test</p></figcaption></figure>

The priorities are set in the determining attributes. &#x20;

For this use case, we have priorities set on both 'currency' and 'pmt\_currency' attributes, and we have set currencies to priorities 1, 2, and 3. &#x20;

You can enter one number (1) or multiple numbers separated by commas (1,2).  Once you have entered the priorities to test, click the 'Reduce' button.

<figure><img src="../../../../../.gitbook/assets/image (939).png" alt=""><figcaption><p>Business rule with selected attribute values reduced</p></figcaption></figure>

TDO has removed all currency values that are not set to priority 1.  Click the 'Set' button at the bottom of the window to save the edit.

You must set priorities in each rule separately.  Editing one rule will not change any other rule on the page.

<figure><img src="../../../../../.gitbook/assets/image (940).png" alt=""><figcaption><p>Business rules reduced using priorities</p></figcaption></figure>
