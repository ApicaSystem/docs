# Project Navigator



The Project Navigator Menu, or "Project Navigator, “offers additional useful functions besides starting and managing load test programs.

First, it is recommended that a simple directory structure be defined, relevant to your projects. It is also often useful for individual application releases, or even daily test programs, to be assigned their own sub-directories.

To create a new sub-directory, select an existing directory (at left), and then click the **Create New Subdirectory** button.



**Note:** new directories can also be created via the Operating System, for example, via File Explorer under Windows or by using a console. The Project Navigator menu has been designed to ensure no discrepancies exist between the menu and the Operating System view.

The new sub-directory can then be selected with a single click on the Project Navigator's left side.

After creating a new sub-directory, an existing load test program, including its recorded web surfing session and Input Files, can be **zipped**, **copied**, **deleted**, or **moved** by marking the corresponding checkboxes then clicking on the action icons.



Where the action is to Copy/Move files, please select the destination/target directory, and the files will be immediately copied/moved to their destination.



#### Renaming/Copying <a href="#projectnavigator-renaming-copying" id="projectnavigator-renaming-copying"></a>

Individual Java load test programs can also be renamed or copied to a new name. This can only be done using the Project Navigator; that is, it cannot be done using the Operating System. This is because the Java program contains references in the source code to its own name. The Project Navigator handles this requirement and automatically makes the appropriate adjustments when copying or renaming a Java load test program.



**Note:** compiled Java programs (\*.class files) can never be renamed; only source files (\*.java) can be renamed.

Note that the Project Navigator will require confirmation when overwriting or deleting files using a red-shaded status row. Whenever a shaded status row appears, you should review the action before approving the no/abort/yes with a confirmation. An example is given below for deleting a file.



#### Display Annotations/Comments <a href="#projectnavigator-displayannotations-comments" id="projectnavigator-displayannotations-comments"></a>



Clicking this button in the Project Navigator will provide a preview of the statistics files measurements, including the description associated with the corresponding test run. The description of the recorded web surfing sessions and the load test programs will also be displayed, if available.

This feature allows you to quickly compare statistics files of different tests, especially when the same load test program was executed several times with the same number of concurrent users.
