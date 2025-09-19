---
description: >-
  Explore how to seamlessly ingest data from any S3 compatible object storage
  into Apica Ascent
---

# Object Store (S3 Compatible)

Apica Ascent can ingest data directly from any S3-compatible object storage. Head over to the Source Extensions to create an object importer app extension.

You can find **Source Extensions** under the Integrations menu.

Once inside the Source Extension menu, select **New Source Extension** and then **AWS S3/Compatible Object store**:

<figure><img src="../../.gitbook/assets/Picture1 (1).png" alt=""><figcaption></figcaption></figure>

Create the extension and provide the settings for accessing your object store bucket. The settings menu provides options that allow customization that is specific to vendor object store implementations.

<figure><img src="../../.gitbook/assets/Screen Shot 2023-01-02 at 1.58.53 PM.png" alt=""><figcaption><p>Configuring access to the bucket</p></figcaption></figure>

And that is all you need. Your data from the Object store bucket will show up as a flow in the Apica Ascent platform

<figure><img src="../../.gitbook/assets/Screen Shot 2023-01-02 at 2.05.18 PM.png" alt=""><figcaption><p>Viewing the object store data import in "Explore" as a Flow</p></figcaption></figure>

### Persisting data in the Object store after processing

By default, the s3 compat ingest plugin will pull all your files under the prefix you mentioned, push it to Apica Ascent, and it will remove the files which are processed. This section will help you to take a backup of your files.

S3 Compat will push all your files to a separate bucket before deleting them from the source bucket. To configure a bucket for taking a backup, you should provide the name of the bucket in the **destination bucket** form field in the input plugin modal. The files will be stored with the structure used in the source bucket.\\

<figure><img src="../../.gitbook/assets/image (308).png" alt=""><figcaption><p>Taking backup logs in a separate bucket</p></figcaption></figure>
