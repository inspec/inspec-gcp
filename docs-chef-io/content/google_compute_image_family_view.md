+++
title = "google_compute_image_family_view resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_image_family_view"
identifier = "inspec/resources/gcp/google_compute_image_family_view resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_image_family_view` InSpec audit resource to to test a Google Cloud ImageFamilyView resource.

## Examples

```ruby


describe google_compute_image_family_view(project: 'chef-gcp-inspec', zone: 'us-central1-c', name: 'test') do
  it { should exist }
  its('image_name') { should eq 'image-1' }
  its('image_source_type') { should eq 'RAW' }
  its('image_family') { should eq 'test' }
end

```

## Properties

Properties that can be accessed from the `google_compute_image_family_view` resource:


  * `image`: The latest image that is part of the specified image family in the requested location, and that is not deprecated.

    * `creation_timestamp`: Creation timestamp in RFC3339 text format.This field is deprecated.

    * `description`: An optional description of this resource. Provide this property when you create the resource.

    * `id`: The unique identifier for the resource. This identifier is defined by the server.

    * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

    * `source_type`: The type of the image used to create this disk. The default and only value is RAW
    Possible values:
      * RAW

    * `deprecated`: The deprecation status associated with this disk type.

      * `deleted`: An optional RFC3339 timestamp on or after which the deprecation state of this resource will be changed to DELETED.

      * `deprecated`: An optional RFC3339 timestamp on or after which the deprecation state of this resource will be changed to DEPRECATED.

      * `obsolete`: An optional RFC3339 timestamp on or after which the deprecation state of this resource will be changed to OBSOLETE.

      * `replacement`: The URL of the suggested replacement for a deprecated resource. The suggested replacement resource must be the same kind of resource as the deprecated resource.

      * `state`: The deprecation state of this resource. This can be DEPRECATED, OBSOLETE, or DELETED. Operations which create a new resource using a DEPRECATED resource will return successfully, but with a warning indicating the deprecated resource and recommending its replacement. Operations which use OBSOLETE or DELETED resources will be rejected and result in an error.
      Possible values:
        * DEPRECATED
        * OBSOLETE
        * DELETED

    * `raw_disk`: The parameters of the raw disk image.

      * `source`: The full Google Cloud Storage URL where the raw disk image archive is stored. The following are valid formats for the URL: https://storage.googleapis.com/bucketName/image_archive_name https://storage.googleapis.com/bucketName/folder_name/image_archive_name In order to create an image, you must provide the full or partial URL of one of the following: The rawDisk.source URL The sourceDisk URL The sourceImage URL The sourceSnapshot URL

      * `sha1_checksum`: [Deprecated] This field is deprecated. An optional SHA1 checksum of the disk image before unpackaging provided by the client when the disk image is created.

      * `container_type`: The format used to encode and transmit the block device, which should be TAR. This is just a container and transmission format and not a runtime format. Provided by the client when the disk image is created.
      Possible values:
        * TAR
        * UNDEFINED_CONTAINER_TYPE

    * `status`: The status of the image. An image can be used to create other resources, such as instances, only after the image has been successfully created and the status is set to * READY * FAILED * PENDING
    Possible values:
      * FAILED
      * PENDING
      * READY

    * `archive_size_bytes`: Size of the image tar.gz archive stored in Google Cloud Storage (in bytes).

    * `disk_size_gb`: Size of the image tar.gz archive stored in Google Cloud Storage (in bytes).

    * `source_disk`: URL of the source disk used to create this image. For example, the following are valid values: https://www.googleapis.com/compute/v1/projects/project/zones/zone/disks/disk projects/project/zones/zone/disks/disk zones/zone/disks/disk In order to create an image, you must provide the full or partial URL of one of the following: The rawDisk.source URL The sourceDisk URL The sourceImage URL The sourceSnapshot URL

    * `source_disk_id`: The ID value of the disk used to create this image. This value may be used to determine whether the image was taken from the current or a previous instance of a given disk name.

    * `licenses`: Any applicable license URI.

    * `storage_locations`: Any applicable license URI.

    * `family`: The name of the image family to which this image belongs. You can create disks by specifying an image family instead of a specific image name. The image family always returns its latest image that is not deprecated. The name of the image family must comply with RFC1035.

    * `image_encryption_key`: The deprecation status associated with this disk type.

      * `sha256`: The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.

      * `kms_key_service_account`: The service account being used for the encryption request for the given KMS key. If absent, the Compute Engine default service account is used. For example: "kmsKeyServiceAccount": "name@ projectId.iam.gserviceaccount.com/

      * `raw_key`: Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. You can provide either the rawKey or the rsaEncryptedKey. For example: "rawKey": "SGVsbG8gZnJvbSBHb29nbGUgQ2xvdWQgUGxhdGZvcm0="

      * `rsa_encrypted_key`: Specifies an RFC 4648 base64 encoded, RSA-wrapped 2048-bit customer-supplied encryption key to either encrypt or decrypt this resource. You can provide either the rawKey or the rsaEncryptedKey. For example: "rsaEncryptedKey": "ieCx/NcW06PcT7Ep1X6LUTc/hLvUDYyzSZPPVCVPTVEohpeHASqC8uw5TzyO9U+Fka9JFH z0mBibXUInrC/jEk014kCK/NPjYgEMOyssZ4ZINPKxlUh2zn1bV+MCaTICrdmuSBTWlUUiFoD D6PYznLwh8ZNdaheCeZ8ewEXgFQ8V+sDroLaN3Xs3MDTXQEMMoNUXMCZEIpg9Vtp9x2oe==" The key must meet the following requirements before you can provide it to Compute Engine: The key is wrapped using a RSA public key certificate provided by Google. After being wrapped, the key must be encoded in RFC 4648 base64 encoding. Gets the RSA public key certificate provided by Google at: https://cloud-certs.storage.googleapis.com/google-cloud-csek-ingress.pem

      * `kms_key_name`: The name of the encryption key that is stored in Google Cloud KMS. For example: "kmsKeyName": "projects/ kms_project_id/locations/ region/keyRings/key_region/cryptoKeys/key

    * `source_disk_encryption_key`: Encrypts the image using a customer-supplied encryption key. After you encrypt an image with a customer-supplied key, you must provide the same key if you use the image later (e.g. to create a disk from the image). Customer-supplied encryption keys do not protect access to metadata of the disk. If you do not provide an encryption key when creating the image, then the disk will be encrypted using an automatically generated key and you do not need to provide a key to use the image later.

      * `sha256`: Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. You can provide either the rawKey or the rsaEncryptedKey. For example: "rawKey": "SGVsbG8gZnJvbSBHb29nbGUgQ2xvdWQgUGxhdGZvcm0="

      * `kms_key_service_account`: The service account being used for the encryption request for the given KMS key. If absent, the Compute Engine default service account is used. For example: "kmsKeyServiceAccount": "name@ projectId.iam.gserviceaccount.com/

      * `raw_key`: Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. You can provide either the rawKey or the rsaEncryptedKey. For example: "rawKey": "SGVsbG8gZnJvbSBHb29nbGUgQ2xvdWQgUGxhdGZvcm0="

      * `rsa_encrypted_key`: Specifies an RFC 4648 base64 encoded, RSA-wrapped 2048-bit customer-supplied encryption key to either encrypt or decrypt this resource. You can provide either the rawKey or the rsaEncryptedKey. For example: "rsaEncryptedKey": "ieCx/NcW06PcT7Ep1X6LUTc/hLvUDYyzSZPPVCVPTVEohpeHASqC8uw5TzyO9U+Fka9JFH z0mBibXUInrC/jEk014kCK/NPjYgEMOyssZ4ZINPKxlUh2zn1bV+MCaTICrdmuSBTWlUUiFoD D6PYznLwh8ZNdaheCeZ8ewEXgFQ8V+sDroLaN3Xs3MDTXQEMMoNUXMCZEIpg9Vtp9x2oe==" The key must meet the following requirements before you can provide it to Compute Engine: The key is wrapped using a RSA public key certificate provided by Google. After being wrapped, the key must be encoded in RFC 4648 base64 encoding. Gets the RSA public key certificate provided by Google at: https://cloud-certs.storage.googleapis.com/google-cloud-csek-ingress.pem

      * `kms_key_name`: The name of the encryption key that is stored in Google Cloud KMS. For example: "kmsKeyName": "projects/ kms_project_id/locations/ region/keyRings/key_region/cryptoKeys/key

    * `source_snapshot_encryption_key`: The deprecation status associated with this disk type.

      * `pk`: The Platform Key (PK).

        * `content`: The raw content in the secure keys file. A base64-encoded string.

        * `file_type`: The file type of source file.

      * `keks`: The Key Database (db).

        * `content`: The raw content in the secure keys file. A base64-encoded string.

        * `file_type`: The file type of source file.

      * `dbs`: The Key Database (db).

        * `content`: The raw content in the secure keys file. A base64-encoded string.

        * `file_type`: The file type of source file.

      * `dbxs`: The forbidden key database (dbx).

        * `content`: The raw content in the secure keys file. A base64-encoded string.

        * `file_type`: The file type of source file.


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
