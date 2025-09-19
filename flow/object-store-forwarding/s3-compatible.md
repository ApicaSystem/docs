---
description: E.g. AWS S3, GCP Cloud Storage, OCI Buckets, DigitalOcean Spaces etc.
---

# S3 Compatible

### Pre-requisites <a href="#pre-requisites" id="pre-requisites"></a>

* Bucket for storing logs
* IAM access key and secret key which has permissions to upload files to the bucket
* Endpoint for the S3 compatible object store service
* Region setting for the S3 compatible object store service

### Steps for creating S3 Compatible Forwarding <a href="#steps-for-creating-s3-compatible-forwarding" id="steps-for-creating-s3-compatible-forwarding"></a>

* Navigate to `create forwarder` page
* Select S3 compatible
* Click on `Create Forwarder`
* Provide forwarder name
* Provide access key, secret key, region, bucket name and endpoint for the bucket
* Click `Create` button

<figure><img src="../../.gitbook/assets/image (512).png" alt=""><figcaption></figcaption></figure>

The S3 Compatible Forwarder can now be mapped to any data flow. The S3 Compatible forwarder breaks the data into smaller objects based on the object size configuration. The default object size is set to 4MB and can be changed while creating the forwarder.

[\
](https://logflow-docs.logiq.ai/object-store-forwarding/overview)
