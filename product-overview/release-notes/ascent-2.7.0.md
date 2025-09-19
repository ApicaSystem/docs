# Ascent 2.7.0

### **ASM** <a href="#adf" id="adf"></a>

**New Features & Enhancements:**

1. **ASM Private Location Management:**
   * Introduced the ability for Customer Administrators to **Add, Edit, and Delete** private locations and private repositories, giving more control over location and data management.
   * Added a **"Private Locations"** section in the UI, allowing easy navigation and management of these locations.
   * Implemented endpoints to **Enable/Disable Private Locations**, retrieve lists of private locations and repositories, and associate repositories with specific private locations.
   * Included a **Timezone selection** feature for URL V2 endpoints, enhancing configuration flexibility for global deployments.
   * New options for managing **Private Agents** with functionalities such as Adding, Editing, and Deleting agents, as well as Reissuing Certificates for enhanced security.
2. **Check Management Enhancements:**
   * Integrated **ZebraTester** within Check Management, improving performance testing capabilities.
   * Enhanced the **Check Analytics** screen for a smoother experience, including a redesigned Schedule and Severity Handling screen supporting Dark Theme.
3. **Improved API & Documentation:**
   * **Refined API Endpoints**: Added support for handling advanced configuration for missing checks, private agent solutions, and new fields in the SSL Certificate Expiration Check.
   * **Documentation Improvements**: Updated ASM API documentation to include better descriptions, missing fields, and request/response formats for enhanced usability.
4. **Canary Release Support:**
   * Extended Deployment APIs to support **Canary Releases**, ensuring more robust testing and rollouts.
5. **Performance Optimization:**
   * Implemented pre-fetching of access groups to reduce database calls and improve the performance of core endpoints.
   * Optimized **Sampling Interval** for tables based on time duration to reduce load times.
6. **Agent Status Monitoring:**
   * Added visual indicators for the **Enable/Disable Status** of private locations, improving overall monitoring and management.

**Bug Fixes:**

1. **Check Management:**
   * Fixed inconsistencies in the **Check Results Graph** to ensure linear representation of data on the X-axis.
   * Addressed issues with **timestamp formatting** when clicked from different parts of the graph, which led to parsing errors.
2. **Fleet Management:**
   * Corrected the behavior of agent ID and customer GUIDs during initial state setup.
   * Resolved problems causing memory issues in multi-cluster environments.
3. **UI & Visual Fixes:**
   * Eliminated scroll issues when hovering over charts.
   * Adjusted the **Date Picker** to revert to its previous version for consistency and usability.
4. **Multi-Cluster Stability:**
   * Fixed degradation issues occurring when one of the single tenants in a multi-cluster environment was down.
   * Ensured smoother data loading and resolved UI lock-up issues when handling larger datasets.
5. **Certificate Management:**
   * Added validation checks and improved error handling for operations like adding, editing, and deleting SSL certificates and repositories.

### **Ascent** <a href="#adf" id="adf"></a>

#### **New Features & Enhancements** <a href="#new-features-and-enhancements" id="new-features-and-enhancements"></a>

1. **Fleet Management Improvements:**
   * **Fleet UI Enhancements:** Redesigned Fleet management screens, including Agents and Configuration, with consolidated controls for improved usability and support for Dark Theme.
   * [**Kubernetes Environment Support**](https://docs.apica.io/fleet-management/list-of-agents/opentelemetry-kubernetes)**:** Introduced support for Kubernetes environments in Fleet, enabling better agent management and installation flexibility.
   * **Fleet Agent Support for** [**OpenTelemetry Collectors**](https://docs.apica.io/fleet-management/list-of-agents/opentelemetry-collector)**,** [**Datadog**](https://docs.apica.io/fleet-management/list-of-agents/datadog-agent) **and** [**Grafana Alloy**](https://docs.apica.io/fleet-management/list-of-agents/grafana-alloy): Expanded the ecosystem of supported agents with compatibility for OpenTelemetry Collector, Datadog and Grafana Alloy agents.
   * [**Agent Liveness Status Metrics**](https://docs.apica.io/fleet-management/overview)**:** Implemented new metrics to monitor the liveness status of each Fleet agent, ensuring better visibility and alerting.
   * **Advanced Search for Fleet:** Enhanced search capabilities with a new advanced search feature, making it easier to locate specific data and agents.
2. [**Data Explorer**](https://docs.apica.io/data-management/overview-1/creating-json-schema) **Enhancements:**
   * **Y-Axis Multi-Column Plotting:** Enhanced Y-axis plotting, allowing for the selection and visualization of multiple columns, making complex data analysis simpler.
   * **Time Range in Headers:** Added time range indicators in the header, improving context and navigation during data exploration.
   * **Custom Chart Integration:** New customizable charts, such as Counters, are available for Data Explorer, providing enhanced visualization options.
   *   **Color Selection for Widgets:** Users can now customize the colors of rendered data inside each widget on the Data Explorer page, making it easier to personalize and distinguish visual components.\


       **Performance & Optimization:**

       * **Lazy Loading Implementation:** Optimized data explorer dashboards by implementing lazy loading, improving initial load times, and reducing resource consumption.
       * **Custom Hooks for Skipping Component Mount Calls:** Enhanced performance by introducing custom React hooks to skip unnecessary component mounts, minimizing UI lag.
3. **UI/UX Improvements:**
   * **Dark Mode Icons & Design Adjustments:** Optimized icon sets and UI components for a more consistent experience in dark mode.
   * **New Toggle & Theme Options:** Added a toggle for switching between Dark and Light modes in the navbar, giving users more control over their viewing experience.
4. **Integration & API Updates:**
   * [**Gitbook AI Powered Search**](https://docs.apica.io/logiq-events/ai-powered-search)**:** Users can now ask questions directly in the search bar using Gitbook AI and receive answers instantly, enhancing accessibility to documentation and support. :brain:
   * **Grafana Integration:** Implemented a converter to transform Grafana JSON into Data Explorer JSON format, simplifying the migration of dashboards.&#x20;
5. **User Onboarding:**
   * **Improved Onboarding Experience:** A dedicated onboarding screen for new users has been added to streamline the setup process and introduce key features.

#### **Bug Fixes** <a href="#bug-fixes" id="bug-fixes"></a>

1. **Fleet Management:**
   * Fixed issues where disconnected Fleet agents could not be deleted.
   * Resolved problems with log collection on Windows machines.
   * Addressed duplicate agent entries when reinstalling Fleet agents.
2. **Data Explorer:**
   * Corrected data inconsistency issues when switching between dashboards.
   * Fixed bugs related to alert tabs being incorrectly linked across dashboards.
   * Resolved intermittent behavior where data from one dashboard was erroneously stored in another.
3. **ALIVE:**
   * Improved the alignment and visualization of PS compare graphs and log comparisons.
   * Added zoom-in and enlarge options for better graph analysis.
   * Enhanced visual feedback for log loading during comparisons.
4. **UI Bug Fixes:**
   * Resolved AI button shadow and sizing issues for a more polished interface.
   * Corrected modal rendering in header dropdowns for persistent selections across tabs.
