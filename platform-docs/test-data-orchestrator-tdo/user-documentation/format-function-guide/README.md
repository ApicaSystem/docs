# Format Function Guide

#### Overview

In the assignment rules process in TDO, you can use format functions to create data or format data in specific outputs.  These functions support numbers, strings, and dates.  You can also create randomly generated numbers or dates, in a specific format, within a specified range.

&#x20;When using these functions, you must select ‘Compose Function’ from the drop-down menu in the ‘Operands’ section of the 'Compose Operands' window (accessed during the 'assignment rules' process).

<figure><img src="../../../../.gitbook/assets/image (820).png" alt=""><figcaption><p>Compose Operands window</p></figcaption></figure>

If you fail to select ‘Compose Function’ the output generated will be the format function string and not an assigned value.

#### Syntax

The format function contains a marker, a format, and \[optional] the data to be processed. These sections are separated by pipes ( | ).  The layout is %\<marker>|\<format>|\<data> . For a date format function, %D|YYYYMMdd|09/01/2024  would output 20240901.

&#x20;In the case of date formats, if the optional data is omitted, the output would be the current date.  %D|YYYYMMdd would output the current date in the format specified.

#### Supported Format Types

The table below shows the supported format types and the marker(s) associated with those format types.

<figure><img src="../../../../.gitbook/assets/image (821).png" alt=""><figcaption><p>Supported formats</p></figcaption></figure>
