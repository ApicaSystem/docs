# Ascent 3.0.2

This release adds OneLogin as a supported single sign-on identity provider and fixes a SAML login failure affecting some identity provider certificate formats.

This release applies to both cloud and on‑prem deployments where this version is available.

### Flow

#### New Features

* **OneLogin single sign-on:** Added support for OneLogin as an identity provider for single sign-on, giving organizations another option for centralized authentication when signing in to Ascent.

### Vanguard

#### Bug Fixes

* Fixed an issue where SAML-based single sign-on could fail for some identity providers due to how their signing certificates were formatted, which had been blocking login.

***

### Component Version 3.0.2

| Component                              | Version                                         |
| -------------------------------------- | ----------------------------------------------- |
| Flash                                  | v4.0.1                                          |
| Coffee                                 | v4.0.1                                          |
| ASM                                    | 13.40.2                                         |
| NG Private Agent                       | 1.0.9                                           |
| Check Execution Container: Browser     | fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0 |
| Check Execution Container: Zebratester | zt-7.5a-p0-r-2025.04.02-0-base-1.2.0            |
| Check Execution Container: Runbin      | runbin-2025.04.17-0-base-2.2.1                  |
| Check Execution Container: Postman     | postman-2025.04.17-0-base-1.4.1                 |
| Bnet (Chrome Version)                  | 10.2.2 (Chrome 130)                             |
| Zebratester                            | 7.5A                                            |
| ALT                                    | 6.13.3.240                                      |
| IronDB                                 | 1.5.1                                           |
