# GitHub Integration Manual V5.4.1





* [1. Overview, Installation, and Configuration](broken-reference)
  * [1.1. GitHub Server Configuration](broken-reference)
  * [1.2. GitHub Initialization](broken-reference)
    * [Scenario 1:](broken-reference)
    * [Scenario 2:](broken-reference)
* [2. Git Operations](broken-reference)
  * [1.1. Git Status](broken-reference)
  * [1.2. Commit](broken-reference)
  * [1.3. Push](broken-reference)
  * [1.4. Pull](broken-reference)
  * [1.5. Fetch](broken-reference)
  * [1.6. Merge](broken-reference)
  * [1.7. Copy](broken-reference)
  * [1.8. Clone](broken-reference)
  * [1.9. Delete](broken-reference)
  * [1.10. History](broken-reference)

## **1. Overview, Installation, and Configuration** <a href="#githubintegrationmanualv5.4.1-1.overview-installation-andconfiguration" id="githubintegrationmanualv5.4.1-1.overview-installation-andconfiguration"></a>

ZebraTester's “Git Integration” allows you to use [Git](https://git-scm.com/), a popular open-sourced distributed version control system. The **GitHub** icon is present in the **Project Navigator** Window and has been supported since ZebraTester version 5.4-E.



### **1.1. GitHub Server Configuration** <a href="#githubintegrationmanualv5.4.1-1.1.githubserverconfiguration" id="githubintegrationmanualv5.4.1-1.1.githubserverconfiguration"></a>

There are several ways to clone repositories available but **ZebraTester** **GitHub-integration** supports **HTTPS** and **SSH**-based connection, and both public and private repositories can be configured to be used with the GitHub integration.

For HTTPS connections, you need an HTTPS clone URL with a username and password. For GitHub specifically, it's very easy to acquire the clone URL.

Under the green Code button on the GitHub repository main page, press the copy icon in the Clone tool to copy that URL.



| [**HTTPS Clone URL Dialog**](https://docs.github.com/en/free-pro-team@latest/github/using-git/which-remote-url-should-i-use#cloning-with-https-urls) | [**SSH Clone URL Dialog**](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/connecting-to-github-with-ssh) |
| ---------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
|                                                                                                                                                      |                                                                                                                                           |

Copy the URL by clicking the button on the right side of the Url, and then fill out the Git integration form accordingly.

| **Clone URL Dialog**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | **Screenshot** |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| **HTTP Connection Details** need what URL you copied from the dialog plus the username and password you want to use.                                                                                                                                                                                                                                                                                                                                                                                                                |                |
| <p>For <strong>SSH</strong>, which is a secure protocol, you need to clone the SSH URL in a similar way, but you must generate an SSH key pair. You can use any existing one if you already have, but GitHub does not allow using any SSH key twice.</p><p>To generate an SSH key and add it to your account, we recommend following the manual provided by GitHub at <a href="https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/connecting-to-github-with-ssh">Connecting to GitHub with SSH</a></p> |                |
| <p>Place these values in your <strong>Apica Git Integration - Git Server Configuration</strong></p><ul><li>Upon completion, press the <strong>Apply Configuration Button >>> Continue</strong>, and the settings will be saved and you will be forwarded to Step two of the configuration.</li></ul>                                                                                                                                                                                                                                |                |

### **1.2. GitHub Initialization** <a href="#githubintegrationmanualv5.4.1-1.2.githubinitialization" id="githubintegrationmanualv5.4.1-1.2.githubinitialization"></a>

There are two scenarios when starting GitHub integration:

#### Scenario 1: <a href="#githubintegrationmanualv5.4.1-scenario1" id="githubintegrationmanualv5.4.1-scenario1"></a>

Having fresh **ZebraTester** installation, nothing important in **My Tests** Folder, and you’re not required to save any data from **My Tests** Folder.

#### Scenario 2: <a href="#githubintegrationmanualv5.4.1-scenario2" id="githubintegrationmanualv5.4.1-scenario2"></a>

The **My Tests** folder that you have is established with prior work saved in it and it’s important to save that data.

When you are in the GitHub Integration window for the first time, you will be asked if you are planning to save the existing data. Please check the option **Save Existing Work**. this will save the existing Data as a local Branch, that you can later push to the GitHub Server.



If you need to rename the Backup Branch you can give it any name of your choice. And then Click **Apply Configuration >>> Continue**.

If you chose to save the existing data you will get this as a branch in the next window, otherwise, you need to clone the remote branch to start working,



## **2. Git Operations** <a href="#githubintegrationmanualv5.4.1-2.gitoperations" id="githubintegrationmanualv5.4.1-2.gitoperations"></a>

If you don't understand what Git is and the fundamentals of how it works, see their [online documentation](https://git-scm.com/doc) for basic knowledge, quick references, and cheat sheets.

| **Operation**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | **Screenshot**                                                                                     |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| In the middle of the window, there are buttons to perform Git related Operations                                                                                                                                                                                                                                                                                                                                                                                                                                                              |                                                                                                    |
| <h3 id="githubintegrationmanualv5.4.1-1.1.gitstatus"><strong>1.1. Git Status</strong></h3><p>This button is equivalent to Git command <strong>git status</strong> and if there will be any files changed since the last commit will be displayed on the left side of the window. Else it will write “<strong>nothing to commit, working directory clean</strong>”.</p>                                                                                                                                                                        |                                                                                                    |
| If there are changed files, you can add them by choosing a few of them or **All Files**.                                                                                                                                                                                                                                                                                                                                                                                                                                                      |                                                                                                    |
| After Adding the selected file, the file will become Staged and will be part of your next commit.                                                                                                                                                                                                                                                                                                                                                                                                                                             |                                                                                                    |
| <h3 id="githubintegrationmanualv5.4.1-1.2.commit"><strong>1.2. Commit</strong></h3><p>After the files are staged, the next step will be to commit them. After pressing the Commit Button, you will be asked to provide Commit Message.</p>                                                                                                                                                                                                                                                                                                    |                                                                                                    |
| A commit message will be added to the commit. It’s OK to leave the box empty, and in this case, the default msg will be added as a commit-msg, which includes the current time and the branch name.                                                                                                                                                                                                                                                                                                                                           | <p>e.g.</p><p><code>„commit msg @ 12_36_53... in refs/heads/my-saved-work-10_23_2015 “.</code></p> |
| <h3 id="githubintegrationmanualv5.4.1-1.3.push"><strong>1.3. Push</strong></h3><p>The next step will be to push the commits to the Git Server. Simply clicking the Push Local Commits Button will push the commits to Server, and if the local branch has no HEAD on the server, a new branch will be created.</p>                                                                                                                                                                                                                            |                                                                                                    |
| The log screen will display the progress of every operation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                                                                                                    |
| <h3 id="githubintegrationmanualv5.4.1-1.4.pull"><strong>1.4. Pull</strong></h3><p>A git pull is what you would do to bring a local branch up-to-date with its remote version and <strong>automatically merges the commits without letting you review them first</strong>. If you don’t closely manage your branches, you may run into frequent conflicts.</p>                                                                                                                                                                                 |                                                                                                    |
| <h3 id="githubintegrationmanualv5.4.1-1.5.fetch"><strong>1.5. Fetch</strong></h3><p>Fetch gathers any commits from the target branch, that do not exist in your current branch and <strong>stores them in your local repository</strong>. However, <strong>it does not merge them with your current branch</strong>. This is particularly useful if you need to keep your repository up to date, but are working on something that might break if you update your files. To integrate the commits into your master branch, you use merge.</p> |                                                                                                    |
| <h3 id="githubintegrationmanualv5.4.1-1.6.merge"><strong>1.6. Merge</strong></h3><p>After you have finished implementing a new feature on a branch, you want to bring that new feature into the main branch, so that everyone can use it. This is achieved by merging the branch. Upon clicking Merge Button you will be asked to choose the branch to merge and the branch to which it will be merged.</p>                                                                                                                                   | <p></p><p></p>                                                                                     |
| <p>A conflict might arise after the merge, and the file that has conflict will be shown in the list of changed files</p><p>And when you open that file using editor, you will see the conflict.</p><p>The solution is to change the file as you actually want it to be, Add to staged, and commit.</p>                                                                                                                                                                                                                                        |                                                                                                    |
| <h3 id="githubintegrationmanualv5.4.1-1.7.copy"><strong>1.7. Copy</strong></h3><p>If you need an exact copy of the branch you are working on, then use this option, it will ask for the name of the new Branch.</p><p>If the parent branch has remote Tracking on the server, the child branch will also take it, and both will point to the same HEAD branch.</p>                                                                                                                                                                            | <p></p><p></p>                                                                                     |
| <h3 id="githubintegrationmanualv5.4.1-1.8.clone"><strong>1.8. Clone</strong></h3><p>Before you can start working locally on a remote branch, you need to have its copy as a local branch, After pressing this button you will be provided with the list of all remote branches, you can choose, and give it some name, or if you already have a copy, and wants to have a new copy with a different name, you are allowed to give any name.</p>                                                                                               | <p></p><p></p>                                                                                     |
| <h3 id="githubintegrationmanualv5.4.1-1.9.delete"><strong>1.9. Delete</strong></h3><p>This will delete the current branch. You have to type the branch name, and for that, you need to have at least one more branch.</p>                                                                                                                                                                                                                                                                                                                     |                                                                                                    |
| <h3 id="githubintegrationmanualv5.4.1-1.10.history"><strong>1.10. History</strong></h3><p>This Utility's function is to display the commit history of the current branch.</p>                                                                                                                                                                                                                                                                                                                                                                 |                                                                                                    |
