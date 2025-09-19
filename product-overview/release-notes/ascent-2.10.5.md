# Ascent 2.10.5

## Release 2.10.5 - What's New

We're excited to share the latest improvements in version 2.10.5. This release focuses on making your monitoring and observability experience smoother with bug fixes, enhanced integrations, and better user interface improvements.

### Flow

**New Features**

* **Certificate Management**: You can now upload and delete certificates directly in the Vault, giving you better control over your security credentials
* **Enhanced Rule Creation**: When creating rules, you'll now see helpful RE2 pattern guidance to make rule setup easier and more accurate
* **Improved Documentation**: Updated API documentation with better descriptions and examples for Namespace and Applications APIs

**Fixes**

* Fixed dropdown menus in the pipeline configuration tab that weren't properly connecting to your data flow logs
* Resolved an issue with the Unflatten function in Pipeline Code blocks
* Fixed namespace settings in Kubernetes agent configurations

### Observe

**Improvements**

* **Better Filtering**: Fixed multiple filter issues in Ascent, including problems with check types, browser checks, and search functionality in Check Groups
* **Enhanced Security**: Updated certificate handling to automatically pick up new certificates during deployments

**Bug Fixes**

* Resolved search field issues in Check Groups View
* Fixed filtering problems for browser-based monitoring checks

### Fleet (Agent Management)

**Fixes**

* Resolved installation issues with OpenTelemetry Collector agents on Windows systems
* Fixed Kubernetes agent namespace configuration problems

### Ascent Synthetics&#x20;

**New Integrations**

* **GitLab Integration**: Added support for GitLab as a remote source for repository profiles, making it easier to manage your synthetic checks alongside your code

**Bug Fixes**

* Fixed frequency settings that were incorrectly changing to "Manual" when editing checks
* Resolved connection cleanup issues with Nomad Proxy
* Improved error handling in Postman checks
* Corrected multiple API endpoint issues that were returning error codes
* Improved error handling and filtering in check result endpoints

### ASM Legacy&#x20;

**Fixes**

* Resolved API endpoint issues that were causing 400 and 500 error responses
* Fixed filtering problems in check result and mostrecent API endpoints
* Improved error classification for better troubleshooting.
* Fixed postman check discarding issue that was being caused due to Out of Memory (OOM).

### Other Improvements

**General**

* Fixed admin settings redirect issues in Tech Preview
* Various backend stability improvements and performance optimizations

***

### Component Versions - Ascent v2.10.5

| **Component**                          | **Versions**                                    |
| -------------------------------------- | ----------------------------------------------- |
| Flash                                  | v3.15.8                                         |
| Coffee                                 | v3.16.11                                        |
| ASM                                    | 13.35.0                                         |
| NG Private Agent                       | 1.0.9                                           |
| Check Execution Container: Browser     | fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0 |
| Check Execution Container: Zebratester | zt-7.5a-p0-r-2025.04.02-0-base-1.2.0            |
| Check Execution Container: Runbin      | runbin-2025.04.17-0-base-2.2.1                  |
| Check Execution Container: Postman     | postman-2025.04.17-0-base-1.4.1                 |
| Bnet (Chrome Version)                  | 10.2.1 (Chrome 130)                             |
| Zebratester                            | 7.0B                                            |
| ALT                                    | 6.13.3.240                                      |
| IronDB                                 | 1.5.0                                           |
