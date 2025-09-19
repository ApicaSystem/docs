# Build 1.0.2.0-20250213-1458

Items in this release:

* Upload data API can accept a file name/path or file contents.  Details on usage are in the User Guides/API Guide/Data Movement API's/Ingest (Upload) Data Files section of the manuals.
* Fix for data display in the 'Assembled Data' section of TDO.  If the data contains leading spaces, those will be displayed when viewing data in this section.  Prior to this, the leading spaces were stripped when viewing the data in TDO.
* Data Views have been updated so that one data block can now be used for multiple Data Views within a single workset.  Prior to this, you could only use a data block in one Data View within any given workset.  \[A data block can still be used in multiple data views in different worksets.]
* When updating a workset to add a new data view, the name of the associated data block will be autopopulated when the workset is saved.  Prior to this, TDO would populate the data block with 'null' and you were required to manually update it.
* TDO now supports Kuberos for SSO security.  This is in addition to the LDAP and SAML support already present in TDO.
* TDO is available as a Docker/Kubernetes deployment.
