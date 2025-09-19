# Analyzing Data Patterns

## Orson Test Data Orchestrator

### Test Data Extractor (TDX) User Guide

### About TDX Data Patterns Profiling

The purpose of Data Profiling using TDX is to identify statistical patterns in your source data. This information can then be used to more accurately inform or prioritize your test coverage, or to inform or drive the creation of synthetic data which matches or closely resembles these patterns. You can use TDO to generate the synthetic data or you can feed the TDX profile as criteria to a synthetic data generation tool you are already using, providing it has the ability to read a JSON output file, which most tools can do.

&#x20;

TDX allows you to profile the data in one or more fields prior to setting up your extract.  You can profile any field in the ‘Attributes to Select’ section, on either the available (left) or selected (right) side.  Profiling can only be done on one side at a time.  To combine a profile, move the fields you want to profile to one side or the other.

&#x20;

First, use the mouse and the \<shift> (if the fields are contiguous) or \<Ctrl> (if the fields are separated) key to select the field(s) you want to profile.  Right click over any of the selected fields.&#x20;

If only one field is selected for profiling, you will only see ‘Create profiling data block for _database\_name.table\_name.field\_name_.  If two or more fields are selected, you will have the option to create individual profiles for each field or to create a single profile with information on all highlighted fields.

&#x20;

<figure><img src="../../../../.gitbook/assets/image (405).png" alt=""><figcaption><p>Data profiling pop-up</p></figcaption></figure>

&#x20;

Select the profiling option you want to use; for this example, we are using a consolidated profiling block.  The profiling window will appear.

&#x20;

You can remove an attribute from the profile by removing the blue check on the left.  The ‘precision’ column is used to define the number of decimal points to be profiled for numerical fields (balance in this example).

&#x20;

<figure><img src="../../../../.gitbook/assets/image (406).png" alt=""><figcaption><p>Profiling conditions window</p></figcaption></figure>

The ‘Range’ column will populate with NA for non-numerical fields and will have ‘Range’ for numerical fields.  Click on ‘Range’ in that column to define the range.

&#x20;

The ‘Range setup’ window will open.  You can automatically generate a range (recommended for the first time you profile) by using the up arrow in the leftmost box to define how many levels you want in your range (here it is set to 6) and then click the ‘Generate Ranges’ button.  TDX will analyse the data and define ranges that are roughly equal in size.

&#x20;

<figure><img src="../../../../.gitbook/assets/image (407).png" alt=""><figcaption><p>Range setup - auto generated</p></figcaption></figure>

&#x20;

If you want to create ranges that are more specific you can manually define the ranges.  Click the ‘Add’ button to create an empty line and enter the values for the first range in that line.  Continue to add lines and values until your ranges are defined.

&#x20;

To speed up manual range creation, you can save a range by clicking the ‘Save’ button at the bottom of the screen.  Name the range and save it.  To load a saved range, click the ‘Load’ button at the bottom of the screen and select the range you want to load.

&#x20;

Once the range is defined, either automatically or manually, click the ‘OK’ button to return to your profiling page.  Click the ‘Cancel’ button to return to the profiling page without defining a range.

&#x20;

Note that you must define a range for each numerical field before beginning the profiling process.

&#x20;

<figure><img src="../../../../.gitbook/assets/image (408).png" alt=""><figcaption><p>Range setup - manually defined or loaded from saved profile</p></figcaption></figure>

&#x20;

There are four more columns in the profiling screen:  Group by, Min. count, Max count, and Expression.

&#x20;

·       Group by allows you to further define your profile by creating sub-groups.  In the profiling window screen print, above, account\_type is grouped by currency and customer type is grouped by has\_app and has\_online.  This will break the profiles down within each of the values in the Group by column.  Note that you can only group by values in the same table.

·       Min. count sets a lower limit for profiling.  For instance, if you only want to profile data that has 3 or more occurrences in the table for a specific field, you would set this to 3.

·       Max count sets an upper limit for profiling.  Entering a value into this field (ex.: 100) limits the number of rows analyzed to that value.  Generally speaking, min. count and max count are used together to speed up analysis on large tables.

·       Expression allows you to enter a SQL expression that can be further used to define or analyze the data.

&#x20;

Once your profile is ready to use, you can either have the profile uploaded to TDO as a new data block (recommended if you want to work with it in Excel) or can save it as a JSON file (recommended if you want to ingest it into another program).

&#x20;

To save as a data block in TDO, click the ‘OK’ button.  To save as a JSON file, click the ‘Save JSON Profile’ button.  You will be prompted to name the file and click ‘OK’ when done.

&#x20;

TDX will show a progress window while the profile is being processed.

&#x20;

In TDO, the profile can be viewed as a data block and can be downloaded to a .csv file using the Rest API for extraction (see end user guide  "Downloading Data" for instructions).

If you select saving as a JSON file, you can navigate to the file in file explorer and view it with any text editor.  Your profile will look like this:

&#x20;

<figure><img src="../../../../.gitbook/assets/image (409).png" alt=""><figcaption><p>JSON profile output</p></figcaption></figure>

&#x20;

Profiling is useful for when you need to know what values are present in the tables prior to extracting test data.  If you are not sure if the data you need is present (for example, I need to test Suspense accounts that use Euros as their base currency) this profile tells me that I have 4 in the database available for selection.  If I need more accounts, I can either create them or modify other suspense accounts from a different base currency to Euros.
