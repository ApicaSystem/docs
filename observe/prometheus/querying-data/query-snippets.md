# Query Snippets

Copying and reusing code is an essential part of creating database queries, especially for common operations like JOIN statements or complex CASE expressions. Query Snippets streamline this process by enabling your team to create reusable query segments that can be shared and triggered directly from the query editor.

<figure><img src="../../../.gitbook/assets/image (561).png" alt=""><figcaption><p>Query Snippets page in Settings</p></figcaption></figure>

### What Are Query Snippets?

Query Snippets are predefined pieces of SQL code that your team can use to simplify writing queries. They can include:

* Frequently used JOIN statements
* Complex clauses like WITH or CASE
* Conditional formatting expressions

By leveraging Query Snippets, you can reduce redundancy and improve consistency across queries.

### Creating Query Snippets

To create a Query Snippet in Apica:

1. Navigate to **Settings** > **Query Snippets**.
2. Click on **+ New Snippet**.
3. Fill in the details:
   * **Trigger Word**: A keyword to invoke the snippet in the query editor.
   * **Description**: A brief explanation of the snippet.
   * **Snippet**: The SQL code to be reused, including optional placeholders for customization.
4. Save the snippet.

### Using Placeholders

Placeholders allow you to customize parts of the snippet at runtime. They are defined using the format `${n:placeholder}`, where:

* **n** is the tab order for cycling through placeholders.
* **placeholder** is optional and provides default text to guide the user.

#### Example Snippet

```
JOIN departments dept ON dept.department_id = ${1:table}.dept_id
```

In this example, `${1:table}` is a placeholder. When you insert the snippet, the word "table" will be highlighted for replacement. Press **Tab** to move to the next placeholder.

#### Advanced Example

```
AND (orders.processed IS NULL OR orders.processed <> '${2}')
AND (orders.rejected IS NULL OR orders.rejected <> '${1}')
AND (orders.updated IS NULL OR orders.updated_date <> '${0: current_date}')
```

* **${2}**: The cursor starts here.
* **${1}**: Press **Tab** to jump to this placeholder.
* **${0: this\_date}**: This is the last placeholder in the sequence.

### Inserting Query Snippets

You can insert snippets directly into your queries:

* **With Live Auto Complete Enabled**: Type the trigger word, and the snippet will appear in the suggestions.
* **Without Live Auto Complete**: Press **CTRL + Space** and type the trigger word to invoke the snippet manually.

> **Note:** If your schema exceeds 5000 tokens, Live Auto Complete may be disabled.

### Benefits of Query Snippets

* **Efficiency**: Reuse common patterns to save time.
* **Consistency**: Ensure uniformity in queries across the team.
* **Ease of Use**: Customizable placeholders simplify query customization.

### Examples of Query Snippets

Here are some ideas for snippets you can create:

* Frequently used JOIN statements:

```
JOIN employees e ON e.employee_id = ${1:table}.emp_id
```

* Complex CASE expressions:

```
CASE
  WHEN ${1:status_condition} THEN ${2:outcome_value}
  WHEN ${3:alternate_condition} THEN ${4:alternate_outcome}
  ELSE ${5:default_outcome}
END
```

* Conditional formatting:

```
WHERE ${1:field_name} = '${2:input_value}' AND ${3:another_field} <> '${4:exclude_value}'
```

Start using Query Snippets in Apica today to make your query writing faster, more efficient, and more collaborative!
