# JSON Import

### Creating Dashboards

* Expand the Create option from the navbar and click on Dashboard. A popup will prompt you to enter the dashboard name.
* Click the toggle button on the right corner for the data-explorer dashboard.
* Enter a name for the dashboard.
* Enter the URL for your JSON Schema.
* Click on Save. You will be navigated to the data explorer dashboard.

<figure><img src="../../.gitbook/assets/image (618).png" alt=""><figcaption><p>Create a Dashboard</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (617).png" alt=""><figcaption><p>Toggle to input Data Explorer JSON schema URL</p></figcaption></figure>

### Making a JSON Schema

* A JSON schema serves as a structured template for creating monitoring dashboards. Please Refer to this for Example: [Json Schema Template](https://raw.githubusercontent.com/ApicaSystem/apica-installation/main/schemas/boomi-linux.json)
* Here are its components:
  * Tabs: Organize widgets into tabs for easy navigation and categorization of metrics and queries.
  * Header: Includes options for date-time range selection and dropdown menus for selecting specific atoms (monitored systems or nodes), allowing global control over all widget time ranges (Relative and Absolute).
  * Queries List: Each tab contains a list of queries that retrieve specific metric data from the monitoring system. Specifying an alert key automatically creates an alert with defined options.

<figure><img src="../../.gitbook/assets/image (619).png" alt=""><figcaption><p>Enter the name and URL of the JSON schema</p></figcaption></figure>
