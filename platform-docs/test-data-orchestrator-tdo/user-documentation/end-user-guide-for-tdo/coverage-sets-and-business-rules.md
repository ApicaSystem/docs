# Coverage Sets and Business Rules

## Orson – Test Data Orchestrator

End User Guide

### Selecting a Coverage Set

The Coverage section is where you can adjust business rules and create an updated coverage matrix based on those business rules. Your project can have one or more coverage sets; your TDO Builder will let you know which one you should use for your testing.

You begin by selecting your coverage set. From the Coverage Engine section of the menu, select ‘Coverage Sets’. The coverage set page will display. Hover your mouse to the right of the coverage set you want to use and click on the blue box to select it.

Alternatively, you can select your workset from the 'Work Set' sub-page of the 'Projects' section. This will populate the Coverage Set, Scenario, and Work Set in the context section and will also engage the coverage set lock.  If you select this option, the Work Set will not be selectable by any other user until you release the coverage set lock or log out.

Once you select the desired coverage set, the coverage set name will populate in the context box in the upper right corner. Your username will also populate under the ‘Locked by’ column.

The lock prevents another user from selecting this coverage set while you are using it. If the set you want already has a name in the ‘Locked by’ column, you will not be able to select it. Only the user who placed the lock, or a user with Admin rights, can remove the lock. You should contact the user with the lock, or an Admin if that user is not available, to have the lock removed if it is not required.

<figure><img src="../../../../.gitbook/assets/image (366).png" alt=""><figcaption><p>Coverage set selection screen</p></figcaption></figure>

To remove a lock you have placed, hover to the right of the coverage set. You will see an icon that looks like a blue key with a line through it. Click on that icon to remove the lock. Only someone who is authorized to remove the lock will see this icon.

<figure><img src="../../../../.gitbook/assets/image (367).png" alt=""><figcaption><p>Coverage set lock</p></figcaption></figure>

### Creating a New Business Rule

Click on ‘Business Rules’ in the Coverage Engine section of the menu to display the business rules page.

<figure><img src="../../../../.gitbook/assets/image (368).png" alt=""><figcaption><p>Business Rules main screen</p></figcaption></figure>

You will be able to edit existing rules or add a new rule from here. You will not have authority to delete a rule; if that is required the project owner or an Admin user will have to delete it.

To add a new rule, click on the blue plus (‘+’) sign in the lower right corner of the page. The ‘Create Business Rule’ window will open.

<figure><img src="../../../../.gitbook/assets/image (369).png" alt=""><figcaption><p>Create Business Rule window</p></figcaption></figure>

Before we create the rule, let’s review what is on this page.

At the top, you have ‘Occurrences’ which is pre-populated with the value 1. This means that for every row you create in the coverage matrix, you will be able to generate 1 row of test data. If you are going to do multiple rounds of testing, you may want to change the value (to ‘3’, for example). Only do this if you want multiple identical tests, albeit with unique data which matches the same criteria.

Next to that, you have ‘Priorities’. If priorities were assigned to the Determining Attribute values when they were created, this can be used to optimize (reduce according to priority) the number of rows in the coverage matrix. This is generally only used when editing an existing rule, so we will discuss this in that section.

On the left-hand side of the window is the list of determining attributes that have been selected for this coverage matrix. For each attribute, you must select one or more of the available values. You select a value by clicking on that attribute to show the available options. Here is the list for ‘customer\_type’.

<figure><img src="../../../../.gitbook/assets/image (370).png" alt=""><figcaption><p>Example of attribute values</p></figcaption></figure>

We can select one, more than one, or all values in the list. Note that at the top of the list is a blue box that contains ‘SELECT ALL’. If you click on this box, all available values will be populated.

As a general rule, for each attribute, you want to select values for which all of the following selections you make are valid. For example, a customer type of Corporate, would not have an account type of ‘Savings’. If your Determining Attributes have been set up directly from a single Data Source, TDO can auto-filter the available values for each subsequent attribute you select, based on only valid combinations of data.

For this attribute, we only want to select one value (Retail), since each customer type has unique test values. When you click on the value(s) you want to select, they will populate on the right side of the window.

In the picture below, the values for ‘customer\_type’, ‘account\_type’, ‘account\_currency’, ‘amount’, and ‘amount\_currency’ have been selected. The ‘SELECT ALL’ button was used to select all available values for ‘amount\_currency’.

<figure><img src="../../../../.gitbook/assets/image (371).png" alt=""><figcaption><p>Business Rule in progress</p></figcaption></figure>

Once you have finished assigning at least one value to each attribute, scroll to the bottom of the window and click ‘SET’ to save the rule or ‘CANCEL’ to go back to the Business Rules page without creating a new rule.

<figure><img src="../../../../.gitbook/assets/image (372).png" alt=""><figcaption><p>Set / Cancel buttons</p></figcaption></figure>

This is the Business Rule page with the new rule that was just created.

<figure><img src="../../../../.gitbook/assets/image (373).png" alt=""><figcaption><p>New Business Rule added</p></figcaption></figure>

### Editing a Business Rule

Hover your mouse to the right of the business rule you want to edit and a blue pencil icon will appear. Click on this icon to edit the rule and the Create Business Rule will open, showing the values currently assigned to that rule.

<figure><img src="../../../../.gitbook/assets/image (374).png" alt=""><figcaption><p>Create Business Rule screen in Edit mode</p></figcaption></figure>

To remove a value from an existing rule, click on the value in the right-hand column and it will be removed. For example, to remove Euros from our currencies to be tested, click on ‘amount\_currency: EUR’ and it will be removed from the ‘Selected’ list. To add a new value to the rule, click on the determining attribute on the left that you want to add the value from, and then click on the value(s) you want to add to put them in the ‘Selected List’.

In the example below, we’ve added Canadian Dollars to the ‘amount\_currency’ attribute in place of Euros.

If you need to reduce the number of rows in the coverage matrix quickly, and priorities were assigned to the determining attributes by the Builder, you can do this quickly by entering one or more priorities (i.e., “1,2” or “1”) and clicking the ‘Reduce’ button. This will remove all values for determining attributes that have priorities set that do not match the values you entered. If no priorities were set for a determining attribute, it will not be reduced. This is useful when you need to reduce the number of tests to be run but want to ensure that the highest priority tests are all covered.

Note that values are shown in the ‘Selected’ column in the order in which they were added to the list.

Click on ‘SET’ to save your changes.

<figure><img src="../../../../.gitbook/assets/image (375).png" alt=""><figcaption><p>Saving edited business rule</p></figcaption></figure>

### Creating and Using a Business Rule Set

Once you have created a set of business rules, you have the option of saving them for future use.  This makes it easy for you to re-use common rules.

To save a business rule set, select the blue 'floppy disc' icon in the upper right corner of the business rules section.

<figure><img src="../../../../.gitbook/assets/image (24).png" alt=""><figcaption><p>Save Business Rule Set icon on rules page</p></figcaption></figure>

This will open the 'Save Rule Set' popup.  You must assign a name to the business rule set.  The 'Description' block is optional, but it is recommended that you enter a rule set description to make re-use easier.  Click 'Save' to save the rule set.

<figure><img src="../../../../.gitbook/assets/image (64).png" alt=""><figcaption><p>Save Rule Set popup window</p></figcaption></figure>

To use the business rule set, select the 'Business Rule Set' sub-item from the 'Coverage Engine' menu section.

<figure><img src="../../../../.gitbook/assets/image (158).png" alt=""><figcaption><p>Selecting a Business Rule Set</p></figcaption></figure>

This will open the saved Business Rule Sets page.  Note that you will be able to see all of the saved business rule sets associated with this Coverage Set, regardless of who has saved them. &#x20;

Click on the blue page/arrow icon to the right of the desired rule set to load it.

<figure><img src="../../../../.gitbook/assets/image (159).png" alt=""><figcaption><p>Selecting a business rule set</p></figcaption></figure>

This will open a dialog box with 3 options. &#x20;

* Yes - this will replace the current rules on the business rules page with the rules in the selected business rule set.
* No - this will add the rules from the selected business rule set to the already existing rules on the business rules page.
* Cancel - this will take no action to change or modify the existing business rules.

<figure><img src="../../../../.gitbook/assets/image (162).png" alt=""><figcaption><p>Business Rule Set dialog box</p></figcaption></figure>

After selecting your option, you can return to the Business Rules page and use them as-is, modify them, add more rules, and delete rules you don't want to use.

### Generate the Coverage Matrix

The next step is to generate the Coverage Matrix. This is a list of all the unique combinations of the values selected in each rule.

In the upper right corner of the Business Rules screen there are three boxes.  If you have the AI enabled software option, all three boxes will be blue.  Otherwise, the lefhand box will be blue with white dots, and the other two will remain greyed out (unselectable).

<figure><img src="../../../../.gitbook/assets/image (168).png" alt=""><figcaption><p>Matrix generation options</p></figcaption></figure>

Click on the blue box to generate the Coverage Matrix. You will get a message telling you how many rows will be in your coverage matrix and asking you if you want to proceed.

<figure><img src="../../../../.gitbook/assets/image (132).png" alt=""><figcaption><p>Coverage Matrix dialog box</p></figcaption></figure>

In this case, our three Business Rules will generate 37 tests with unique combinations of determining attributes. Click ‘OK’ to generate the matrix. If you want to go back and edit the rules to increase or decrease the number of unique combinations, click ‘Cancel’.

Each row in the Coverage Matrix represents a unique test combination (customer type, account type, payment amount, account currency, amount currency, etc.). It also represents the data required to execute the test. TDO will assemble the test data for each row that meets these unique requirements so that the tests can be executed (manually or via automation).

In the ‘Coverage Engine’ section of the menu, click on Coverage Matrix to see the full list. Each row shows which rule the row was generated to meet, and also the unique values assigned to that row. Rule 1 had two account types (Checking and Savings) and three currencies (GBP, EUR, and USD). The first six rows are generated for Rule 1 – three for Savings (one for each currency) and three for Checking.

<figure><img src="../../../../.gitbook/assets/image (378).png" alt=""><figcaption><p>View Coverage Matrix screen</p></figcaption></figure>
