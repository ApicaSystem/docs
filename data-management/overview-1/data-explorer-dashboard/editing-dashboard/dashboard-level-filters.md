# Dashboard level filters

Filters play a crucial role in data visualization by allowing you to interactively refine the scope of data displayed based on specific selections or criteria. When you apply a filter, it acts like a spotlight, highlighting only the relevant data points and excluding the rest. This capability ensures that your visualizations are not cluttered and remain focused on the most relevant aspects to your current analysis or reporting needs.

This targeted approach enhances your ability to uncover meaningful patterns and trends and facilitates more effective communication of insights, as the visualizations are tailored to your  requirements.



How **to** Add a Filter

1. **Toggle to Edit Mode:** Ensure you are in the edit mode of your visualization tool to access filter settings.
2. **Locate the Plus Icon:** In the header section of your interface, find and click the plus icon to add a new filter.



**Configuring Filter**

* The modal will contain several fields, including a title and label configuration.
* **For Parameterized Queries:**
  * The title should match the name of the placeholder in your query. For example, if the title is 'customer', structure your query as: `SELECT * FROM {{customer}}`.
*   **For Non-Parameterized Queries:**

    * Ensure the label name in the filter matches the exact title name. For example, in a query like `up{job='node',instance=~'localhost:9100|localhost:9200'}`, the title should match the label (`job` or `instance`) to ensure the selected value is automatically appended to the query.

    By accurately setting up these filters, you can improve your ability to interact with and analyze data efficiently.
* **Choose Filter Type:**
  * **Query-Based Filter:** Use this to apply filters based on specific queries.
  * **Text-Based Filter:** Use this for filters that require text input for criteria.
  * **Dropdown-Based Filter:** Use this to present filter options in a dropdown list.

<figure><img src="../../../../.gitbook/assets/image (547).png" alt=""><figcaption><p>Configuring filter</p></figcaption></figure>

