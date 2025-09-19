# Integrating ZebraTester with GIT

* [GIT Integration with ZebraTester](broken-reference)
  * [Introduction](broken-reference)
  * [Connecting to a GitHub Repo](broken-reference)

## GIT Integration with ZebraTester <a href="#integratingzebratesterwithgit-gitintegrationwithzebratester" id="integratingzebratesterwithgit-gitintegrationwithzebratester"></a>



### Introduction <a href="#integratingzebratesterwithgit-introduction" id="integratingzebratesterwithgit-introduction"></a>

By using the GitHub integration you can manage all of your recorded sessions and all of your load test results with a remote revision control system. This allows you to have multiple branches of the MyTests directory tree, and to track changes/modifications of any file. Furthermore, the content of old, overwritten files can also be restored.

**Server Configuration:**\
GitHub-integration supports HTTPS and ssh based connections, and both public and private repositories can be configured to be used with the GitHub integration.

Please refer to the attached **GitHub Integration Manual** for a complete guide on setting up the connection.



**Supported Operations:**

* **Git Status:** This will list down all the changed files. Beneath the list, there is an option to make the files staged.
* **Commit:** After providing the Commit Message the files will be committed.
* **Push:** All the committed changes will be pushed to the Git Server.
* **Fetch:** Fetch gathers any commits from the target branch, that do not exist in your current branch and stores them in your local repository. However, it does not merge them with your current branch.
* **Pull:** This will make the local branch up-to-date with its remote version, and automatically merges the commits without letting you review them first.\
  &#xNAN;_&#x50;lease closely manage your branches, you might run into frequent conflicts otherwise._
* **Merge:** Join two development histories together. "Might Lead to Conflicts, Please refer to [Git Documentation](https://git-scm.com/doc) ".
* **Copy:** For making a copy of the current Branch.
* **Clone:** This will make a copy of the Remote Branch, and it's possible to have a different name from the parent remote branch.
* **Delete:** This will delete the branch from the local repository only.
* **History:** A utility function to display the commit history of the current branch.

### Connecting to a GitHub Repo <a href="#integratingzebratesterwithgit-connectingtoagithubrepo" id="integratingzebratesterwithgit-connectingtoagithubrepo"></a>

| **Step**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | **Screenshot** |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| Open the Project Manager from the Main ZT Screen                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                |
| <p>Click the GitHub Icon</p><p></p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |                |
| <p>Fill in the means your organization uses to connect to your Github Server.</p><ol start="1"><li><p><strong>HTTPS</strong></p><ol start="1"><li>Git Repository HTTPS Path</li><li>User Name</li><li>Password</li></ol></li><li><p><strong>SSH Connection</strong></p><ol start="1"><li>Git Repository</li><li>SSH key</li><li>Passphrase</li></ol></li><li><p><strong>Proxy Settings</strong></p><ol start="1"><li><p>Check the box if Using an Outbound HTTP(S) Proxy for accessing the GIT Server</p><ol start="1"><li>Proxy Host  </li><li>Proxy Port  </li><li>Proxy User Name  </li><li>Proxy Password</li></ol></li></ol></li></ol> |                |
