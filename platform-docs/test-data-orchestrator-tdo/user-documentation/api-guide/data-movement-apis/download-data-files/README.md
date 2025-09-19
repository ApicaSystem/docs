# Download Data Files

Data can be exported in multiple formats, controlled by the API version.

·       1.0 = html

·       1.1 = csv

·       1.2 = comma delimited with sequence numbers (output as .txt format)

·       1.3 = pipe delimited

·       1.4 = tab delimited with sequence numbers

·       1.5 = EDI X12 834 message format

·       1.6 = SQLlite database

·       1.7 = ALIGHT file format (health insurance enrollments)

&#x20;

The format of the download API for methods 1.0 through 1.4 and 1.6 is  http://\<server:port>/core/\<api\_version>/API/project/\<project\_name>/\<project\_version>/datablocks/\<data\_block\_name>/\<data\_block\_version>/

&#x20;

Methods 1.5 and 1.7 have their own download format which will be covered in the applicable section.

&#x20;

These files can be requested manually by placing the API call in a browser window, or using automation programs.  The examples below show the output in a viewable editor format, but these files can be pulled into an automation program instead of viewing them manually.
