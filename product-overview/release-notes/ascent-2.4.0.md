# Ascent 2.4.0

Discover the latest advancements and improvements of the Apica Ascent platform. This is your go-to destination for updates on platform enhancements and new features. Explore what's new to optimize your observability and data management strategies.\
\


### **Synthetic Monitoring (ASM 13.26.0) - SaaS**

**Features**

*   **NG Private Locations/Agents**: New check-type agnostic Private Agents can be grouped into Private Locations with full self-serve functionality in the ASM UI portal.\
    \*ASM API support for full self-server ability will be added during Q3.

    Features include the creation and management of Private Location and Agent along with Private Container Repositories for Private Agent use.\
    Private Agent install packages (.rpm and .deb) will be available with support for RHEL v8+ and Debian v10+. Private locations can be set up to use either Docker or Podman driver for check execution.
* New Browser checks will automatically accept dialogs/modals that can pop up during a test such as alert/confirmation/prompts.
* New Browser checks will attach and include control of new tabs created by the target site.\
  I.e. the chrome WebDriver will automatically attach to new tabs that are opened during check execution of a Browser check.
* Added SAN/SNI options to SSL Cert Expiration and Fingerprint Validation for URL checks.
* Compound check is available on NG locations.
* Extended the ability to append the custom message specified in `_Apica_Message` collection variable to Postman check result messages in case the Postman script fails.

**Bug Fixes**

* Screenshots for Browser checks were not working in new tabs or windows created by the check. This is fixed as part of the above feature that include control of created tabs and windows by the target site.
* Debug scenario of Browser checks from the Edit Check page will use the same location as the check does.
* Fixed the issue where ASM UI was throwing a 500 error from Ajax while adding target value for newly created Selenium scenarios.
* Fixed the sporadic non-availability of agents in the Stockholm location issue when debugging a Selenium scenario.
* Enhanced `encryptapica` feature in Scenarios for Browser checks. The target value of `encryptapica` prefixed store commands used in Selenium scenarios will be masked across all scenario commands in the Browser check results in case the specified target value appears in any other scenario commands (eg. echo command).

&#x20;

### **Synthetic Monitoring (ASM 13H.5) - OnPrem**

**Features**

* The display response body for failed URL calls in a ZebraTester checks the result, if available, to enable the identification of what error messages or content might be returned.
* Added support for PUT API request to add or update URL v1 checks through ASM API.

&#x20;

### **Apica Data Fabric (ADF v3.9)**

#### **Features**

* **Dark Mode:** A new dark mode option is now available, providing a dark-themed interface for users who prefer it.
* **Code Rule Preview:** Users can preview and compare the data after the code rule is applied.
* [**apicactl**](https://github.com/ApicaSystem/apicactl)**:** Introduced a new command-line tool in Apica Github for API management.
* **Bookmark date range:** Users can now bookmark specific date ranges for quick access and reference.
* **Data Explorer API endpoint:** A new API endpoint has been added to support data explorer for Boomi OEM.
* **Tabs are now scrollable:** Improved usability by making the Tabs scrollable, ensuring better navigation and access.
* **Pipeline tab inside search view:** This enhances the search view and the user can see the pipeline of the selected flow.
* **Pipeline application filter:** While creating a new pipeline, users can filter which application to show in the pipeline view.
* Enhanced the **Fleet agent manager** installation.

#### **Bug Fixes**

* **Inconsistent time range when moving from ALIVE to Facet Search page:** Fixed the issue where the time range was inconsistent when moving from the ALIVE to the Facet Search page.
* **Orphan tab from ALIVE:** Resolved the issue of orphan tabs appearing from ALIVE.
* **Alert page issue showing undefined value:** Corrected the problem where the Alert view page was showing undefined values.
