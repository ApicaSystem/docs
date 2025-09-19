# JSON Import

### Creating Dashboards&#x20;

* Expand the Create option from the navbar and click on Dashboard. A popup will prompt you to enter the dashboard name.&#x20;
* Click the toggle button on the right corner for the data-explorer dashboard.&#x20;
* Enter a name for the dashboard.&#x20;
* Enter the URL for your JSON Schema.&#x20;
* Click on Save. You will be navigated to the data explorer dashboard.

<figure><img src="../../.gitbook/assets/image (473).png" alt=""><figcaption><p>Create a Dashboard</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (472).png" alt=""><figcaption><p>Toggle to input Data Explorer JSON schema URL</p></figcaption></figure>

### Making a JSON Schema&#x20;

* A JSON schema serves as a structured template for creating monitoring dashboards. Please Refer to this for Example: [Json Schema Template](https://raw.githubusercontent.com/logiqai/logiq-installation/main/schemas/boomi-linux.json) &#x20;
* Here are its components:&#x20;
  * Tabs: Organize widgets into tabs for easy navigation and categorization of metrics and queries.&#x20;
  * Header: Includes options for date-time range selection and dropdown menus for selecting specific atoms (monitored systems or nodes), allowing global control over all widget time ranges (Relative and Absolute).&#x20;
  * Queries List: Each tab contains a list of queries that retrieve specific metric data from the monitoring system. Specifying an alert key automatically creates an alert with defined options.&#x20;

<figure><img src="../../.gitbook/assets/image (474).png" alt=""><figcaption><p>Enter the name and URL of the JSON schema</p></figcaption></figure>

