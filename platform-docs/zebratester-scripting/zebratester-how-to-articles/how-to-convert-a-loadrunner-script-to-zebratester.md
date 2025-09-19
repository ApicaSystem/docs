# How to Convert a LoadRunner Script to ZebraTester

## LoadRunner Conversion to ZebraTester <a href="#howtoconvertaloadrunnerscripttozebratester-loadrunnerconversiontozebratester" id="howtoconvertaloadrunnerscripttozebratester-loadrunnerconversiontozebratester"></a>

You can import any LoadRunner script (\*.c file) or multiple LoadRunner scripts in a ZIP file into ZebraTester by performing the following steps:

1. Open "Project Navigator"
2. Upload the LoadRunner script
3. Click on the LoadRunner script file icon
4. Click on "yes" when you are asked to convert the LoadRunner script file to a ZebraTester session file (\*.prxdat)
5. Click on the converted ZebraTester session file
6. Click on the "Refresh Display" icon in the Main Menu

***

## Introduction <a href="#howtoconvertaloadrunnerscripttozebratester-introduction" id="howtoconvertaloadrunnerscripttozebratester-introduction"></a>

In ZebraTester we can convert a recorded LoadRunner script to the ZebraTester recorded session.

### The conversion will handle <a href="#howtoconvertaloadrunnerscripttozebratester-theconversionwillhandle" id="howtoconvertaloadrunnerscripttozebratester-theconversionwillhandle"></a>

* Automatic Page break creation (“Think time” in LoadRunner)
* Transaction creation( “Transaction” in LoadRunner)
* Content verification (“Text check” in LoadRunner)
* Handling of extraction and assigning of dynamic variables (“Correlation” in LoadRunner)
* External parameters
* Weblinks
* Redirection
* Loops

### The conversion supports the following LoadRunner criteria <a href="#howtoconvertaloadrunnerscripttozebratester-theconversionsupportsthefollowingloadrunnercriteria" id="howtoconvertaloadrunnerscripttozebratester-theconversionsupportsthefollowingloadrunnercriteria"></a>

* Web HTTP/HTML recordings (Also REST/ SOAP)
* Both HTML based and URL based scripts.
* Script language C
* Both Single and Multiple script files(like vuser\_init, Actions, and vuser\_end)
* It will work in both new and older versions  ( 11.x and 12.x)&#x20;

### The conversion does not currently support the following LoadRunner features <a href="#howtoconvertaloadrunnerscripttozebratester-theconversiondoesnotcurrentlysupportthefollowingloadrunne" id="howtoconvertaloadrunnerscripttozebratester-theconversiondoesnotcurrentlysupportthefollowingloadrunne"></a>

* web\_reg\_async\_attributes
* Include other files
* Preprocessor conditionals are not supported like #if defined
* Dynamic left and right boundaries for extraction

### Conversion supports the following types of extractors <a href="#howtoconvertaloadrunnerscripttozebratester-conversionsupportsthefollowingtypesofextractors" id="howtoconvertaloadrunnerscripttozebratester-conversionsupportsthefollowingtypesofextractors"></a>

* Left and Right Boundary Based Variable Extractor
* RegExp Based Variable Extractor
* XPath Based Variable Extractor
* Form-based Variable Extractor&#x20;

### There are 2 ways of conversions supported by ZebraTester <a href="#howtoconvertaloadrunnerscripttozebratester-thereare2waysofconversionssupportedbyzebratester" id="howtoconvertaloadrunnerscripttozebratester-thereare2waysofconversionssupportedbyzebratester"></a>

1. Uploading a single file (.c file) or multiple files (.zip file) via the GUI
2. Calling the standalone **LRToProxyDataDump** class with program arguments (pass –help for getting the argument details)

## Example LoadRunner Conversion via a ZIP file <a href="#howtoconvertaloadrunnerscripttozebratester-exampleloadrunnerconversionviaazipfile" id="howtoconvertaloadrunnerscripttozebratester-exampleloadrunnerconversionviaazipfile"></a>

| **Step**                                                                                                                                                                                                                   | **Screenshot**                                                                                                                                                                                                                    |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <h4 id="howtoconvertaloadrunnerscripttozebratester-uploadloadrunnerrecordedfiles">Upload LoadRunner recorded files</h4>                                                                                                    | <p></p><ol start="1"><li><p>Upload a LoadRunner File</p><ol start="1"><li>In this example, the LoadRunner Scripts were organized into a separate subdirectory, “LRscripts.”</li></ol></li><li>Click the Conversion Icon</li></ol> |
| <h3 id="howtoconvertaloadrunnerscripttozebratester-conversionstarted">Conversion Started</h3><p>You will be prompted to confirm/stop the conversion:</p>                                                                   |                                                                                                                                                                                                                                   |
| <h3 id="howtoconvertaloadrunnerscripttozebratester-conversiondone">Conversion Done</h3><p>Once the conversion is finished, you will see a new file with a PRXDAT file extension.</p>                                       |                                                                                                                                                                                                                                   |
| <h3 id="howtoconvertaloadrunnerscripttozebratester-convertedsession">Converted Session</h3><p>Once the LoadRunner session is converted, click on it on the Project Navigator so it can be displayed in the Main Menu: </p> |                                                                                                                                                                                                                                   |

### Var Extractors & Assigners <a href="#howtoconvertaloadrunnerscripttozebratester-varextractors-and-assigners" id="howtoconvertaloadrunnerscripttozebratester-varextractors-and-assigners"></a>



Clicking on the line Hyperlinks allows you to access the Request and Response Details and Var Handler



It’s the Var Handler where you can assign and extract Variables from the recorded responses. Please see the [Session Parameters page](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/28147864/Session+Parameters) for more information on the Var Handler.
