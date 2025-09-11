+++
title = "google_filestore_instance resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_filestore_instance"
identifier = "inspec/resources/gcp/google_filestore_instance resource"
parent = "inspec/resources/gcp"
+++

## Syntax

A `google_filestore_instance` is used to test a Google Instance resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource.

## Examples

```ruby
describe google_filestore_instance(project: 'chef-gcp-inspec', zone: 'us-central1-b', name: 'inspecgcp') do
  it { should exist }
  its('tier') { should cmp 'PREMIUM' }
  its('file_shares.count') { should cmp 1 }
  its('file_shares.first.capacity_gb') { should cmp '2660' }
  its('file_shares.first.name') { should cmp 'inspecgcp' }
  its('networks.count') { should cmp 1 }
  its('networks.first.network') { should cmp 'default' }
  its('networks.first.modes') { should include 'MODE_IPV4' }
end

describe google_filestore_instance(project: 'chef-gcp-inspec', zone: 'us-central1-b', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_filestore_instance` resource:


  * `name`: The resource name of the instance.

  * `description`: A description of the instance.

  * `create_time`: Creation timestamp in RFC3339 text format.

  * `tier`: The service tier of the instance.
  Possible values:
    * TIER_UNSPECIFIED
    * STANDARD
    * PREMIUM
    * BASIC_HDD
    * BASIC_SSD
    * HIGH_SCALE_SSD

  * `labels`: Resource labels to represent user-provided metadata.

  * `file_shares`: File system shares on the instance. For this version, only a single file share is supported.

    * `name`: The name of the fileshare (16 characters or less)

    * `capacity_gb`: File share capacity in GiB. This must be at least 1024 GiB for the standard tier, or 2560 GiB for the premium tier.

    * `nfs_export_options`: (Beta only) Nfs Export Options. There is a limit of 10 export options per file share.

      * `ip_ranges`: List of either IPv4 addresses, or ranges in CIDR notation which may mount the file share. Overlapping IP ranges are not allowed, both within and across NfsExportOptions. An error will be returned. The limit is 64 IP ranges/addresses for each FileShareConfig among all NfsExportOptions.

      * `access_mode`: Either READ_ONLY, for allowing only read requests on the exported directory, or READ_WRITE, for allowing both read and write requests. The default is READ_WRITE.
      Possible values:
        * READ_ONLY
        * READ_WRITE

      * `squash_mode`: Either NO_ROOT_SQUASH, for allowing root access on the exported directory, or ROOT_SQUASH, for not allowing root access. The default is NO_ROOT_SQUASH.
      Possible values:
        * NO_ROOT_SQUASH
        * ROOT_SQUASH

      * `anon_uid`: An integer representing the anonymous user id with a default value of 65534. Anon_uid may only be set with squashMode of ROOT_SQUASH. An error will be returned if this field is specified for other squashMode settings.

      * `anon_gid`: An integer representing the anonymous group id with a default value of 65534. Anon_gid may only be set with squashMode of ROOT_SQUASH. An error will be returned if this field is specified for other squashMode settings.

  * `networks`: VPC networks to which the instance is connected. For this version, only a single network is supported.

    * `network`: The name of the GCE VPC network to which the instance is connected.

    * `modes`: IP versions for which the instance has IP addresses assigned.

    * `reserved_ip_range`: A /29 CIDR block that identifies the range of IP addresses reserved for this instance.

    * `ip_addresses`: A list of IPv4 or IPv6 addresses.

  * `etag`: Server-specified ETag for the instance resource to prevent simultaneous updates from overwriting each other.

  * `zone`: The name of the Filestore zone of the instance.


## GCP permissions
