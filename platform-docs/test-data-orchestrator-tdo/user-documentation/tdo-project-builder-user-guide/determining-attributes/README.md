# Determining Attributes

A Determining Attribute is a key field that is used as part of a coverage set to build Business Rules: for example, Region, Gender, Payment Amount, or Account Type. Determining Attributes are selected on the basis that variation of the values for these attributes impacts either source data selection criteria or meaningfully impacts the outcome of tests.

Determining attributes can be created in three ways: when validting a file, by manually inputting the data, or by importing values from a field in an already ingested file \[data block].

Determining attributes can have priorities assigned to them, and they can be filtered to only allow valid data combinations to be presented during business rule creation.

{% hint style="info" %}
Determining Attribute filtering will only be available for values in the same source data block.  You cannot filter a value in one data block by a value in a different data block.
{% endhint %}

#### File Verification

How to create a determining attribute during the file validation process is explained in the ‘Working with Source Files -> Data Blocks -> Create a Determining Sttribute’ section of this manual.&#x20;

From the menu, select ‘Determining Attributes’ from the ‘Coverage Engine’ section of the menu.  You will see all of the determining attributes that you created during the file validation process.

<figure><img src="../../../../../.gitbook/assets/image (886).png" alt=""><figcaption><p>List of determining attributes created during file validation process</p></figcaption></figure>

Any determining attributes not created during the validation process will need to be manually created.
