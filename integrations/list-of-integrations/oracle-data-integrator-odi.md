# Oracle Data Integrator (ODI)

This guide is based on Oracle Database 23ai and Oracle Data Integrator (ODI) 14c (14.1.2.0.0) running on Oracle Linux (64-bit).

ODI is a powerful ELT (Extract, Load, Transform) tool, mainly used for data integration and transformation. We will be using ODI to query an Oracle database and ingest the data to Apica Ascent.

## ODI Installation

Download and install ODI from this link https://www.oracle.com/middleware/technologies/data-integrator-downloads.html

## Basic ODI Concepts

Before you dive in, here are a few key terms:

* **Repository:** Where ODI metadata is stored (Master & Work repositories).
* **Topology:** Configuration for your physical and logical data servers.
* **Designer:** Where you define data models, mappings, and procedures.
* **Operator:** Monitor and manage your ETL executions.
* **Agent:** Executes the ODI scenarios or jobs.

## Creating a Repository Connection

1. Start the ODI Studio (GUI):

$ODI\_HOME/odi/studio/odi.sh

<figure><img src="../../.gitbook/assets/image (660).png" alt=""><figcaption></figcaption></figure>

The initial configuration it to create a Master Repository (stores global settings) and Optional Work Repository (stores project-level data like mappings and interfaces):

2. Under ODI UI, go to File -> New -> Create a New ODI Repository LogIn

<figure><img src="../../.gitbook/assets/image (661).png" alt=""><figcaption></figcaption></figure>

3. Enter all the details

<figure><img src="../../.gitbook/assets/image (662).png" alt=""><figcaption></figcaption></figure>

4. Click Test to validate the connection and hit OK on the dialog box

<figure><img src="../../.gitbook/assets/image (663).png" alt=""><figcaption></figcaption></figure>

5. Click OK to Save the connection
6. Once connected to Repository you can switch to Topology and view source and target Data Servers under the Physical Architecture

## Create a Work Repository

1. Navigate to Topology -> Repositories -> Work Repository
2. Right click and select New Work Repository

<figure><img src="../../.gitbook/assets/image (664).png" alt=""><figcaption></figcaption></figure>

3. Fill in the required details at Step 1

<figure><img src="../../.gitbook/assets/image (665).png" alt=""><figcaption></figcaption></figure>

4. At Step 2 enter all the details and click Finish

&#x20;    a. Name: e.g., WORKREP1

&#x20;    b. Password: set one for this Work Repo

&#x20;    c. Type: Development

<figure><img src="../../.gitbook/assets/image (666).png" alt=""><figcaption></figcaption></figure>

At this point, ODI will create the necessary tables in the same database schema (or another one if specified).

## &#x20;Reconnect with the Work Repository

1. Click on Disconnect from Repository icon
2. Reconnect to Repository after selecting Work repository WORKREP1

<figure><img src="../../.gitbook/assets/image (667).png" alt=""><figcaption></figcaption></figure>

## Groovy Script Automation for data ingestion from Oracle DB to Apica Ascent

1. Navigate to Tools -> Groovy -> New Script

{% file src="../../.gitbook/assets/ODI_Groovy_Automation_ApicaAscent.txt" %}

2. A sample script is attached (above) that:

* Connects to an Oracle database
* Retrieves data from the EMPLOYEES table one row at a time
* Builds a JSON payload per row
* Sends each JSON object to Apica Ascent API endpoint using an HTTP POST
* Retries up to 3 times if there's a failure
* Logs any failures (with error reason and payload) into a local file called failed\_rows.log

3. Execute the script

<figure><img src="../../.gitbook/assets/image (668).png" alt=""><figcaption></figcaption></figure>

## Validate that the data is now ingested to Apica Ascent

1. Navigate to Ascent Explore page and verify the data ingested

<figure><img src="../../.gitbook/assets/image (669).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (670).png" alt=""><figcaption></figcaption></figure>

**Tip:** To start polling for new rows from Oracle DB and ingest into Apica Ascent using Oracle Data Integrator (ODI) at regular intervals, you could use Change Data Capture (CDC) or Incremental Load techniques (Using a Timestamp Column). Use ODI Agent to schedule the scenario/package to run at regular intervals.
