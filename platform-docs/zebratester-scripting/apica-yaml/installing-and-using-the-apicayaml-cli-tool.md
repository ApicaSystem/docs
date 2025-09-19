# Installing and Using the ApicaYAML CLI Tool

* [Installing the ApicaYAML CLI Tool Locally](broken-reference)
  * [Prerequisites](broken-reference)
  * [Installation](broken-reference)
* [Running the ApicaYAML CLI Tool Locally](broken-reference)
  * [A Note on Project Structure](broken-reference)
  * [Step 1: Create a solution to host the .yaml conversion](broken-reference)
    * [Method 1: use the ApicaYAML tool to create your solution](broken-reference)
    * [Method 2: create your solution manually](broken-reference)
  * [Step 2: Place YAML file(s) and/or input file(s) within your solution](broken-reference)
  * [Step 3: Run the ApicaYAML CLI tool](broken-reference)
    * [3a. Run using the CLI with Visual Studio Code](broken-reference)
    * [3b. Run using the CLI as a standalone application](broken-reference)
  * [Additional Parameters](broken-reference)

Users can download a tool which serves to bootstrap an environment suitable for Apica YAML scripting and compile YAML scripts to ZebraTester format.



The purpose of the tool is to convert correctly formatted .yml files into .zip files which can be edited/run in ZebraTester or run from the ASM and ALT platforms.

Using the ASM GUI is the preferred method of creating ApicaYAML scripts and converting them into ZebraTester, as it is much easier than downloading and installing the standalone package! Refer to the article [Create New Apica YAML Script](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2123104570/Create+New+Apica+YAML+Script) for more information on creating, compiling, and running scripts directly from the ASM GUI.

## Installing the ApicaYAML CLI Tool Locally <a href="#installingandusingtheapicayamlclitool-installingtheapicayamlclitoollocally" id="installingandusingtheapicayamlclitool-installingtheapicayamlclitoollocally"></a>

### Prerequisites <a href="#installingandusingtheapicayamlclitool-prerequisites" id="installingandusingtheapicayamlclitool-prerequisites"></a>

Apica YAML comes prepackaged with all dependencies and required components; no further tools are required with the exception of a text editor.

Your OS must support shell scripting.

The Apica YAML package for Linux includes Java 8.

The necessary key needed to run ZT for a debug-run is included in the install package.

### Installation <a href="#installingandusingtheapicayamlclitool-installation" id="installingandusingtheapicayamlclitool-installation"></a>

1. Run the installation file
2. Navigate to the YAML root directory.
3. Open the “conf” folder and open the “configuration.ini” file.
   1. If you are running Windows, the configuration file is called “configuration.ini”.
4. Change the “zebrarootdir” parameter value to the absolute path of your ZebraTester Installation
5. Optionally change the “defdir” parameter value to wherever you want YAML to look for definition files.
   1. If you are running Windows, the folder parameter is called “workingdir”
6. Optionally change the “scriptdir” parameter value to wherever you want YAML to put the final zip files.
   1. If you are running Windows, you will not see this parameter

## Running the ApicaYAML CLI Tool Locally <a href="#installingandusingtheapicayamlclitool-runningtheapicayamlclitoollocally" id="installingandusingtheapicayamlclitool-runningtheapicayamlclitoollocally"></a>

You can run the tool using the CLI within Visual Studio or independently.

The tool will output a .zip file which includes the created .prxdat file, the class file, the .yml files, and other dependent files. This .zip file can be uploaded into ASM and run as a check.

To run the tool, open a Command Prompt window within a Solution directory and run the zebraCLI.bat tool from that directory. The tool will NOT work if you simply click on the zebraCLI.bat tool!

### A Note on Project Structure <a href="#installingandusingtheapicayamlclitool-anoteonprojectstructure" id="installingandusingtheapicayamlclitool-anoteonprojectstructure"></a>

The tool utilizes a folder structure which will be referred to as a “solution”. Every solution should contain 5 directories:\
/input\
/log\
/plugin\
/script\
/YAML



In the above example, the name of the solution is “TicketMonster”.

Before you run the tool to convert a .yaml file to a runnable ZebraTester scenario, it must be placed within a solution. You can either create the above folder structure yourself in order to create a solution, or you can use the “-cs” flag when you run the tool to create your own solution with a name of your choice. The above solution, “TicketMonster”, could be created using the following syntax:

`C:\Users\Administrator\ApicaYAML>C:\Users\Administrator\ApicaYAML\zebracli.bat -cs "TicketMonster"`

See the “Running the Apica YAML tool” section for more information.

### Step 1: Create a solution to host the .yaml conversion <a href="#installingandusingtheapicayamlclitool-step1-createasolutiontohostthe.yamlconversion" id="installingandusingtheapicayamlclitool-step1-createasolutiontohostthe.yamlconversion"></a>

The Apica YAML tool installer creates a folder on the same level as the /ApicaYAML folder called /ZebraCLISolutions. Your solutions will be placed inside this folder. There are two methods of creating a solution - you can create the solution manually or use the tool to create the solution for you.

#### Method 1: use the ApicaYAML tool to create your solution <a href="#installingandusingtheapicayamlclitool-method1-usetheapicayamltooltocreateyoursolution" id="installingandusingtheapicayamlclitool-method1-usetheapicayamltooltocreateyoursolution"></a>

1. CD to the “ApicaYAML” folder and run the following command:\
   `zebracli.bat -cs "NewSolution"`
2.  You should see the following output:


3. CD back one directory and into the /ZebraCLISolutions folder. You should see a new folder called “NewSolution” with the appropriate solutions folder structure inside.

#### Method 2: create your solution manually <a href="#installingandusingtheapicayamlclitool-method2-createyoursolutionmanually" id="installingandusingtheapicayamlclitool-method2-createyoursolutionmanually"></a>

1. Create a subfolder within “ZebraCLISolutions” with the desired name of your solution. In the following example, we will create a folder called “PYTEST”.
2.  Create five subfolders within PYTEST:\
    /input\
    /log\
    /plugin\
    /script\
    /yaml



### Step 2: Place YAML file(s) and/or input file(s) within your solution <a href="#installingandusingtheapicayamlclitool-step2-placeyamlfile-s-and-orinputfile-s-withinyoursolution" id="installingandusingtheapicayamlclitool-step2-placeyamlfile-s-and-orinputfile-s-withinyoursolution"></a>

You must place at least one working .yaml file within the YAML subdirectory before you can run a script successfully. Place one or more of the following files in the /ZebraCLISolutions/{solutionName}/YAML folder as examples. You will use these when executing a script.

[https://apica-packages.s3.eu-central-1.amazonaws.com/current/apica-yaml/sample-scripts/ClDemo\_CheckGameService.yml](https://apica-packages.s3.eu-central-1.amazonaws.com/current/apica-yaml/sample-scripts/ClDemo_CheckGameService.yml)

[https://apica-packages.s3.eu-central-1.amazonaws.com/current/apica-yaml/sample-scripts/SNOAuthExample.yml](https://apica-packages.s3.eu-central-1.amazonaws.com/current/apica-yaml/sample-scripts/SNOAuthExample.yml)

[https://apica-packages.s3.eu-central-1.amazonaws.com/current/apica-yaml/sample-scripts/testscriptfull.yml](https://apica-packages.s3.eu-central-1.amazonaws.com/current/apica-yaml/sample-scripts/testscriptfull.yml)

[https://apica-packages.s3.eu-central-1.amazonaws.com/current/apica-yaml/sample-scripts/tm\_order\_tickets\_v2.yml](https://apica-packages.s3.eu-central-1.amazonaws.com/current/apica-yaml/sample-scripts/tm_order_tickets_v2.yml)

[https://apica-packages.s3.eu-central-1.amazonaws.com/current/apica-yaml/sample-scripts/TM\_OrderTickets.yml](https://apica-packages.s3.eu-central-1.amazonaws.com/current/apica-yaml/sample-scripts/TM_OrderTickets.yml)

When you develop your own scripts later, you will place them in this same /YAML subfolder!

If you have any input files, put them in the /input folder so they can be properly referenced when you code your YAML script!

### Step 3: Run the ApicaYAML CLI tool <a href="#installingandusingtheapicayamlclitool-step3-runtheapicayamlclitool" id="installingandusingtheapicayamlclitool-step3-runtheapicayamlclitool"></a>

#### 3a. Run using the CLI with Visual Studio Code <a href="#installingandusingtheapicayamlclitool-3a.runusingthecliwithvisualstudiocode" id="installingandusingtheapicayamlclitool-3a.runusingthecliwithvisualstudiocode"></a>

This section is WIP. You may install VS Code, of course, but you will not be able to find the .exe file referenced here. Please skip this section for now.

To make compilation smoother using the Visual studio code we need to set the default shell to Apica YAML:

1. Open Visual Studio Code
2. Press ctrl-shift-P to open the Command Palette
3. Search for “Terminal: Select Default Profile” (previously “Terminal: Select Default Shell”)
4. Select your preferred shell:



1. Point to the Apica YAML startup script or executable. For Windows, this is typically

```
C:\Users\Administrator\ApicaYAML\ApicaYAML.exe
```

#### 3b. Run using the CLI as a standalone application <a href="#installingandusingtheapicayamlclitool-3b.runusingthecliasastandaloneapplication" id="installingandusingtheapicayamlclitool-3b.runusingthecliasastandaloneapplication"></a>

After you have set up your solution, follow these steps to compile a script using the definition YAML files you downloaded:

1. Open a Command Prompt and navigate to the solutions folder you created earlier, which is in the /ZebraCLISolutions folder. In the below screenshot, the name of our solutions folder is “PYTEST”, which is a child folder of ZebraCLISolutions.
2.  From the /ZebraCLISolutions folder, run the `zebracli.bat` file which is located in ./ApicaYAML (of course, you will need to specify the full path to the `zebracli.bat` file). If your folder structure has been correctly set up and if you have a solution placed in the /ZebraCLISolutions folder, you should see the following output which gives you a list of all of the files which are available to run (that is, a list of the .yaml files which can be converted to .prxdat):


3. Select the yml file to compile to .prxdat by pressing the corresponding key on your keyboard (1, 2, 3, etc)
4.  If you see the following output, your script has been successfully compiled into a runnable ZebraTester script!



### Additional Parameters <a href="#installingandusingtheapicayamlclitool-additionalparameters" id="installingandusingtheapicayamlclitool-additionalparameters"></a>

Besides simply running `zebracli.bat` to translate and package the script, you can pass further parameters to the tool, e.g. `zebracli.bat [options...]`

`--file (or -f) <filename.yml>`

Append this option to the script to manually specify a YAML definition file to run.

`--debug (or -d)`

Append this option to the script to initiate a test run of the scenarios in the YAML file. The test will run with one VU and one iteration. The ZebraTester Debug loops option will be enabled. The output will also be saved in a \<scriptname>.log file.

`--charset (or -c) <charset>`

Append this option to the script to specify a character encoding to use in the request body. Any set supported by Java is supported, e.g. ISO 8859-1 or windows-1252. If omitted, UTF-8 will be used.

`--environment (or -e) <environment variable>`

Append this option to the script to specify an environment to test; see the “Developing YAML Scripts” section for more details. If omitted, the default target will be used.

`-cs "NewSolutionName"`

Append this option to the name of the .bat file and specify a desired name to create a new, blank solution.

You can run the tool using the CLI within Visual Studio or independently.

The tool will output a .zip file which includes the created .prxdat file, the class file, the .yml files, and other dependent files. This .zip file can be uploaded into ASM and run as a check.
