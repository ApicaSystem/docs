# ZebraTester Plug-in Handbooks

Plug-Ins have the primary characteristic of being re-usable.

Once developed, a Plug-In can be re-used in every Load Test program.

Similarly, Recorder Plug-Ins can be re-used and applied for every new recorded session.

## **"Load Test Plug-In" Developer Handbook** <a href="#zebratesterplug-inhandbooks-loadtestplug-in-developerhandbook" id="zebratesterplug-inhandbooks-loadtestplug-in-developerhandbook"></a>

### **Introduction** <a href="#zebratesterplug-inhandbooks-introduction" id="zebratesterplug-inhandbooks-introduction"></a>

ZebraTester Load Test Plug-Ins are Extension Modules to the ZebraTester product. Load Test Plug-Ins are configured using the GUI and are executed during a Load Test.

In addition to the pre-defined Load Test Plug-Ins delivered with the ZebraTester product, additional user-defined Plug-Ins can be developed to provide extra functionality to meet specific needs.

The basic framework of a Load Test Plug-In can be easily created by using the Wizard; however, completing the finished Plug-in - coding the necessary functionality - requires the ability to program in Java. Then, once the Plug-In has been developed, configuring it for use with a Load Test program does not require programming knowledge; the Plug-In configuration is done with a few mouse-clicks GUI.

The execution of a Plug-In takes place on the same machine running the Exec-Agent, and the Load Test program itself. When a Load Test is started, the relevant Plug-In is automatically transmitted to the Exec-Agent with the Load Test program - no additional prior configuration of the Plug-In is necessary.



## **"Recorder Plug-In" Developer Handbook** <a href="#zebratesterplug-inhandbooks-recorderplug-in-developerhandbook" id="zebratesterplug-inhandbooks-recorderplug-in-developerhandbook"></a>

### **Introduction** <a href="#zebratesterplug-inhandbooks-introduction.1" id="zebratesterplug-inhandbooks-introduction.1"></a>

ZebraTester “Recorder Plug-ins” are Extension Modules to the ZebraTester product and can be automatically executed during the recording of a Web-surfing session. Furthermore, “Recorder Plug-ins” can also manually called from the Web Admin GUI or called from the Proxy Recorder REST API.

Such Recorder Plug-Ins have direct access to the recorded session data and also to the internal “Var Handler,” which means that such Plug-Ins can modify HTTP Request and Response data before, during, and after the recording, and that such Plug-Ins can also create variables, variable extractors, and variable assigners. Furthermore, such plug-ins can also reconfigure the HTTP response “content test” settings of URL calls.

The primary purpose of using Recorder Plug-Ins is to automate some parts of the post-processing steps – after a session has been recorded. Another objective is to modify HTTP request data during recording on the fly – just before they are sent to the Web server.

Recorder Plug-Ins are supported starting from ZebraTester version 5.2-L.



## **"Web Socket Plug-In" Developer Handbook** <a href="#zebratesterplug-inhandbooks-websocketplug-in-developerhandbook" id="zebratesterplug-inhandbooks-websocketplug-in-developerhandbook"></a>

### **Introduction** <a href="#zebratesterplug-inhandbooks-introduction.2" id="zebratesterplug-inhandbooks-introduction.2"></a>



ZebraTester WebSocket Plug-Ins are Extension Modules to the ZebraTester product. They are configured using the GUI and are executed during a web socket communication while running a Load Test.

The creation of a new Web Socket plugin is easy and can be done from GUI; however, completing the finished Plug-in - coding the necessary functionality - requires the ability to program in Java. Then, once the Plug-In has been developed, configuring it for use with a Load Test program does not require programming knowledge; the Plug-In configuration is done with a few mouse-clicks in the GUI.

The execution of a Plug-In takes place on the same machine which is running the Exec-Agent, and the Load Test program itself. When a Load Test is started, the relevant Plug-In is automatically transmitted to the Exec-Agent with the Load Test program - no additional prior configuration of the Plug-In is necessary.

