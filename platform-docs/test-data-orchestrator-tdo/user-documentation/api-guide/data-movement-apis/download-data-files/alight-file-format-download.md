# Alight File Format Download

This message is used exclusively in the Health Insurance arena, generally for employer provided insurance.  Alight supports both a 2500 byte and a 1500 byte file; currently only the 2500 byte file format is available in TDO.

&#x20;The API format for this  Alight file is 1.7.  Also important to note is that while you must end the URL with a “/” for most of the versions above, you must not use a terminal slash on this version.  Also, this is the only data assembly call where you use the workset name and not the datablock name to identify the source.

&#x20;The URL format is http://\<server:port>/core/1.7/API/project/\<project\_name>/\<project\_version>/\<workset\_name>/\<workset\_version

&#x20;One of the main differences between the 834 format and the Alight format is that in the 834, each subscriber/family is a single set while in the Alight format each individual is a record; subscribers and family members are differentiated by the record type indicator.  Because of this each family member is set up in a different step in TDO. So the data assembly processes the entire workset (all steps) in one call and determines which family members to include based on their record indicator type.

&#x20;To output a file for employer ‘ACME INC’ the URL would look like this:

&#x20;[http://99.99.99.99:8080/core/1.7/API/project/alight\_project/1.0/t\_enroll1\_workset/1.0](http://99.99.99.99:8080/core/1.7/API/project/t_moccommercial_alight_project/1.0/t_enroll1_workset/1.0)

&#x20;

TDO assigns the file name based on the employer name and processing date.  The output from this file is shown below.

&#x20;

<figure><img src="../../../../../../.gitbook/assets/image (53).png" alt=""><figcaption><p>Sample of Alight 2500 byte file output</p></figcaption></figure>
