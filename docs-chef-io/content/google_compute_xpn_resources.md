+++
title = "google_compute_xpn_resources resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_xpn_resources"
identifier = "inspec/resources/gcp/google_compute_xpn_resources resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_xpn_resources` InSpec audit resource to to test a Google Cloud Project resource.

## Examples

```ruby
  describe google_compute_xpn_resources(project: 'chef-gcp-inspec') do
    it { should exist }
    its('ids') { should include xpn_resources['id']}
    its('types') { should include xpn_resources['type']}
  end
```

## Properties

Properties that can be accessed from the `google_compute_xpn_resources` resource:

See [google_compute_xpn_resources](google_compute_xpn_resources) for more detailed information.

  * `kind`: Type of resource. Always compute#projectsGetXpnResources for lists of service resources (a.k.a service projects)
  * `resources[]`: Service resources (a.k.a service projects) attached to this project as their shared VPC host.
  * `resources[].type`: The type of the service resource.
  * `resources[].id`: The ID of the service resource. In the case of projects, this field supports project id (e.g., my-project-123) and project number (e.g. 12345678).


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
