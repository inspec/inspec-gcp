+++
title = "google_compute_license_code resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_license_code"
identifier = "inspec/resources/gcp/google_compute_license_code Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_license_code` InSpec audit resource to to test a Google Cloud LicenseCode resource.

## Examples

```ruby
describe google_compute_license_code(project: 'chef-gcp-inspec', name: 'akl-zone1-1353') do
  it { should exist }
end

describe google_compute_license_code(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_license_code` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.This field is deprecated.

  * `description`: An optional textual description of the resource.

  * `id`: The unique identifier for the resource.

  * `name`: Name of the resource.

  * `transferable`: If true, the license will remain attached when creating images or snapshots from disks.Otherwise, the license is not transferred.

  * `state`: Current state of this License Code.

  * `license_alias`: URL and description aliases of Licenses with the same License Code.

    * `self_link`: Server-defined, fully qualified URL for this resource.

    * `description`: Description of this License Code.


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
