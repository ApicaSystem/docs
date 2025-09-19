# TDO Project Builder User Guide

### Builder Role - Project Creation User Guide

This guide is designed for the person who will fulfill the ‘builder’ role and create projects for end users.&#x20;

{% hint style="info" %}
If you are an end user, please refer to [End User Guide for TDO | Apica Docs](https://docs.apica.io/platform-docs/test-data-orchestrator-tdo/user-documentation/end-user-guide-for-tdo) for instructions on how to use existing projects.
{% endhint %}

This guide is arranged in sequential order of the functions as they should be performed.  Each major section will match an item from the TDO menu tree, even though the sequence does not exactly match the menu tree order. &#x20;

Before you begin, you need to know some basic information about TDO’s data format and naming conventions.

•        All TDO items are named using JSON conventions: lower\_case\_no\_spaces.    This includes imported files and all column headers in those files. This applies to column headers inside all ingested files, but does not apply to data in those files.

•        Coverage matrices must end in \_coverage; worksets must end in \_workset, actions must end in \_action, and data views must end in \_view

•        It is highly recommended that you use a standard prefix (example: the first word of your project name or something similar) to align the objects in your specific test.

•        If you use the same source file in multiple projects (input data or output format) we recommend you give it a different (unique) name each time.

•        Do not use commas in any field names and try to avoid commas in any data fields.  TDO works with data in a .csv format, which interprets the presence of a comma as a field delimiter.  The presence of a comma in a field will cause output data to shift right during output when the comma inside a data field is encountered.
