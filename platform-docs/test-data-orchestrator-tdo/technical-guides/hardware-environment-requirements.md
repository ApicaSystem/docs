# Hardware / Environment Requirements

## Overview

These requirements are the minimum requirements for a Proof of Concept/Proof of Technology install. You should evaluate your estimated usage and license count and adjust as needed.

&#x20;TDO can be installed on a fixed server or in the cloud; the requirements remain the same.

### &#x20;TDO Platform Architecture

TDO features a microservices event driven architecture.

&#x20;

<figure><img src="../../../.gitbook/assets/image (413).png" alt=""><figcaption><p>TDO Architecture</p></figcaption></figure>

&#x20;

Interactions

1\.     Extract/update/profile from Data Sources via JDBC connectors

2\.     Upload / Ingest via API for files & feeds – including Test Tools, Test Data Sheets

3\.     Outputs Coverage Matrices (Data Requests) as SQLite files for Data Subsetting

4\.     Interacts with Optim TDM & DP via REST API

5\.     Consumers (Testers, Dev, Business, SMEs) get data from TDO via REST API

6\.     Manual Testers can access the data via REST API in their browser of choice

## System Requirements

### Hardware:

#### Windows / Linux / Unix

·       16 vCPUs (x86\_64/amd64)

·       32 GB of RAM

·       200 GB of free disk space for the OS and TDO binaries&#x20;

·       400 GB of free disk space for the database&#x20;

·       A static IP address

#### &#x20;AWS

* Proof of Concept: EC2 - t3 - large
* Pilot: EC2 - t4g - xlarge

#### Azure

* B series
* 16GB RAM
* 2 - 3 VCPU
* 100 - 200 GB SSD

### Operating System

#### Linux:

·       RedHat 7.2.x and greater

·       CentOS 7.2.x and greater

·       Ubuntu 16.04 and greater

·       SUSE Enterprise 12.0 and greater

&#x20;Windows:

·       Windows Server 2022 64-bit

·       Windows Server 2019 64-bit

·       Windows 11 64-bit

### Software

#### JDK Java

Both the IBM and Oracle version of Java are compatible with TDO. Java 1.8.x JDK must be installed on the server (not JRE). Both JAVA\_HOME and PATH must be set correctly.

#### &#x20;MongoDB

&#x20;TDO uses MongoDB version 7 as its underlying database.

&#x20;MongoDB is available in both a Community Server (free) and Enterprise (paid) version. TDO is set up using the Community Server version. In addition, MongoDB is available using a fully cloud-based hosted version (Atlas) as well as a local installation. For now, the local installation must be used.&#x20;

&#x20;If you have a MongoDB enterprise license, you do not need to install the Community version; you can simply set up a MongoDB instance on the TDO server.  Note that this still must be version 7.

&#x20;If you do not have a MongoDB enterprise license, MongoDB Community Server version 7 must be installed on the server.  It can be downloaded from [https://www.mongodb.com/try/download/community](https://www.mongodb.com/try/download/community).   For all installs, select version 7.0 in the version section. For a Windows install, select 'Windows x64' in the platform section and 'msi' in the package section.  For a Linux/Unix install, select your specific \*nix name and version in the platform section and 'server' in the package section.

Read the installation instructions in the setup manual at [Install MongoDB Community Edition - MongoDB Manual](https://www.mongodb.com/docs/manual/administration/install-community/)  (make sure that you are accessing the instructions for MongoDB version 7 and your specific server operating system) and then follow the setup instructions in the "Mongo DB Setup" section of this guide. &#x20;

&#x20;You do not require MongoDB skills within your organization in order to install and use TDO. MongoDB is the application database for TDO. As such it is supported by Apica as part of the application. Please also note that the MongoDB instance allocated to TDO should be dedicated to TDO only, as the configuration and set up of MongoDB is specific to TDO.

#### Browser Requirements

It is recommended that you use Chrome to run TDO.  If your organization does not support Chrome or Chromium as browser options, we will work with you to ensure your choice of browser is supported.

### BEFORE YOU BEGIN THE INSTALLATION

#### On Linux:

·       Application User – create a user which will control all aspects of TDO (eg: tdo). This can be a domain user or a local user (referred to as ‘appuser’ in the installation instructions).

·       Application Directory – create a directory for TDO (eg: /opt/tdo) and give full ownership to the application user (referred to as appdir in the installation instructions).

·       File System Partitioning – it is recommended that the data files for Mongo be on an xfs partitioned drive.

·       Placement of Installation Packages – it is suggested that the TDO and Mongo packages be placed just below the application directory.

·       iptables – enable port forwarding from 80/443 to 8080/8443. Instructions are found at [https://docs.apica.io/product-overview/test-data-orchestrator-tdo/technical-guides/ip-forwarding-instructions-linux](https://docs.apica.io/product-overview/test-data-orchestrator-tdo/technical-guides/ip-forwarding-instructions-linux) .

#### &#x20;On Windows:

·       JAVA\_HOME and PATH – make sure these variables are set correctly.

·       File ownership and permissions – ensure that the user installing TDO is the owner of all files involved (the Mongo package and the TDO installer itself)&#x20;

·       Set environmental variables – ensure that JAVA\_HOME/bin is added to PATH

#### &#x20;HTTPS certificate

If you are installing TDO using the built-in authentication, you will need to create a self-signed certificate using the tool distributed with JDK.

If you are installing TDO using LDAP/SAML single sign-on, your organization will need to provide a certificate.

&#x20;The certificate must be stored in tdo/api/keystore.jks  (ie, in the api subdirectory under the tdo directory/subdirectory on the server).
