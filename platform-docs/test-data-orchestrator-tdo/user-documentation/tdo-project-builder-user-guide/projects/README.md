# Projects

The first step you will need to take is to create a project. The project acts as a container in the TDO database to hold all artifacts that are related to the work you are doing.  Artifacts within a project can be shared inside that project but are not visible to other projects in TDO.

Projects are your shared workspaces where related TDO items are grouped. You may choose to set projects by release, by sprint, by application, by function, or by any other logical attribute. Commonality of data and reuse of assets are important considerations in making these choices.

&#x20;Projects should be arranged in a logical order or sequence – by application being tested, by test cycle, or by some other structure that matches your work assignments.  Because artifacts are only shareable within a project, you should take some time to develop a logical project structure before building.

Projects can be cloned.  This is often useful when you need to create a new project, but it will share significant assets with an existing project; this process makes it easy to bring over the shared assets and then add the new features with significantly less work.

{% hint style="warning" %}
If you are cloning a project as a 'quick start' option, the design specification is even more critical.  Please ensure that you understand what you are deleting, what you are re-using, and what you are adding prior to starting the cloning process.
{% endhint %}

TDO uses MongoDB as the underlying database.  There are some Mongo size restrictions, so it is recommended that you keep your projects under 18MB total size.  One of the ways of doing this is by cloning projects for similar work.  Cloning a project creates a complete copy, with a slightly different name, that can be used independently from the original project.&#x20;

You will have access to any project you have created.  You must be granted access to any other projects via the ‘User Management -> Project Access’ section of the menu.  Only the Admin role can grant project access.

User management is covered in the User Maintenance ([https://docs.apica.io/platform-docs/test-data-orchestrator-tdo/technical-guides/user-maintenance](https://docs.apica.io/platform-docs/test-data-orchestrator-tdo/technical-guides/user-maintenance)) section of the documents and is generally assigned to a team that provides Admin support for the application.
