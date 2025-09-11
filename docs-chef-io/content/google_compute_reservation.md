+++
title = "google_compute_reservation resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_reservation"
identifier = "inspec/resources/gcp/google_compute_reservation resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_reservation` InSpec audit resource to to test a Google Cloud Reservation resource.

## Examples

```ruby
describe google_compute_reservation(project: 'chef-gcp-inspec', name: ' value_name', zone: ' value_zone') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('zone') { should cmp 'value_zone' }
	its('description') { should cmp 'value_description' }
	its('name') { should cmp 'value_name' }
	its('commitment') { should cmp 'value_commitment' }
	its('status') { should cmp 'value_status' }
	its('delete_at_time') { should cmp 'value_deleteattime' }

end

describe google_compute_reservation(project: 'chef-gcp-inspec', name: "does_not_exit", zone: ' value_zone') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_reservation` resource:


  * `kind`: [Output Only] Type of the resource. Always compute#reservations for reservations.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `self_link`: [Output Only] Server-defined fully-qualified URL for this resource.

  * `self_link_with_id`: [Output Only] Server-defined URL for this resource with the resource id.

  * `zone`: Zone in which the reservation resides. A zone must be provided if the reservation is created within a commitment.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `name`: The name of the resource, provided by the client when initially creating the resource. The resource name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `specific_reservation`: This reservation type allows to pre allocate specific instance configuration. Next ID: 6

    * `instance_properties`: Properties of the SKU instances being reserved. Next ID: 9

      * `machine_type`: Specifies type of machine (name only) which has fixed number of vCPUs and fixed amount of memory. This also includes specifying custom machine type following custom-NUMBER_OF_CPUS-AMOUNT_OF_MEMORY pattern.

      * `guest_accelerators`: Specifies accelerator type and count.

        * `accelerator_type`: Full or partial URL of the accelerator type resource to attach to this instance. For example: projects/my-project/zones/us-central1-c/acceleratorTypes/nvidia-tesla-p100 If you are creating an instance template, specify only the accelerator name. See GPUs on Compute Engine for a full list of accelerator types.

        * `accelerator_count`: The number of the guest accelerator cards exposed to this instance.

      * `min_cpu_platform`: Minimum cpu platform the reservation.

      * `local_ssds`: Specifies amount of local ssd to reserve with each instance. The type of disk is local-ssd.

        * `disk_size_gb`: Specifies the size of the disk in base-2 GB.

        * `interface`: Specifies the disk interface to use for attaching this disk, which is either SCSI or NVME. The default is SCSI. For performance characteristics of SCSI over NVMe, see Local SSD performance.
        Possible values:
          * NVDIMM
          * NVME
          * SCSI

      * `maintenance_freeze_duration_hours`: Specifies the number of hours after reservation creation where instances using the reservation won't be scheduled for maintenance.

      * `location_hint`: An opaque location hint used to place the allocation close to other resources. This field is for use by internal tools that use the public API.

      * `maintenance_interval`: Specifies the frequency of planned maintenance events. The accepted values are: `PERIODIC`.
      Possible values:
        * AS_NEEDED
        * PERIODIC
        * RECURRENT

    * `count`: Specifies the number of resources that are allocated.

    * `in_use_count`: [Output Only] Indicates how many instances are in use.

    * `assured_count`: [Output Only] Indicates how many instances are actually usable currently.

    * `source_instance_template`: Specifies the instance template to create the reservation. If you use this field, you must exclude the instanceProperties field. This field is optional, and it can be a full or partial URL. For example, the following are all valid URLs to an instance template: - https://www.googleapis.com/compute/v1/projects/project /global/instanceTemplates/instanceTemplate - projects/project/global/instanceTemplates/instanceTemplate - global/instanceTemplates/instanceTemplate 

  * `aggregate_reservation`: This reservation type is specified by total resource amounts (e.g. total count of CPUs) and can account for multiple instance SKUs. In other words, one can create instances of varying shapes against this reservation.

    * `vm_family`: The VM family that all instances scheduled against this reservation must belong to.
    Possible values:
      * VM_FAMILY_CLOUD_TPU_LITE_DEVICE_CT5L
      * VM_FAMILY_CLOUD_TPU_LITE_POD_SLICE_CT5LP
      * VM_FAMILY_CLOUD_TPU_POD_SLICE_CT4P

    * `reserved_resources`: List of reserved resources (CPUs, memory, accelerators).

      * `accelerator`: 

        * `accelerator_count`: Number of accelerators of specified type.

        * `accelerator_type`: Full or partial URL to accelerator type. e.g. "projects/{PROJECT}/zones/{ZONE}/acceleratorTypes/ct4l"

    * `in_use_resources`: [Output only] List of resources currently in use.

      * `accelerator`: 

        * `accelerator_count`: Number of accelerators of specified type.

        * `accelerator_type`: Full or partial URL to accelerator type. e.g. "projects/{PROJECT}/zones/{ZONE}/acceleratorTypes/ct4l"

    * `workload_type`: The workload type of the instances that will target this reservation.
    Possible values:
      * BATCH
      * SERVING
      * UNSPECIFIED

  * `commitment`: [Output Only] Full or partial URL to a parent commitment. This field displays for reservations that are tied to a commitment.

  * `specific_reservation_required`: Indicates whether the reservation can be consumed by VMs with affinity for "any" reservation. If the field is set, then only VMs that target the reservation by name can consume from this reservation.

  * `status`: [Output Only] The status of the reservation.
  Possible values:
    * CREATING
    * DELETING
    * INVALID
    * READY
    * UPDATING

  * `share_settings`: The share setting for reservations and sole tenancy node groups.

    * `share_type`: Type of sharing for this shared-reservation
    Possible values:
      * DIRECT_PROJECTS_UNDER_SPECIFIC_FOLDERS
      * LOCAL
      * ORGANIZATION
      * SHARE_TYPE_UNSPECIFIED
      * SPECIFIC_PROJECTS

    * `projects`: A List of Project names to specify consumer projects for this shared-reservation. This is only valid when share_type's value is SPECIFIC_PROJECTS.

    * `project_map`: A map of project id and project config. This is only valid when share_type's value is SPECIFIC_PROJECTS.

      * `additional_properties`: Config for each project in the share settings.

    * `folder_map`: A map of folder id and folder config to specify consumer projects for this shared-reservation. This is only valid when share_type's value is DIRECT_PROJECTS_UNDER_SPECIFIC_FOLDERS. Folder id should be a string of number, and without "folders/" prefix.

      * `additional_properties`: Config for each folder in the share settings.

  * `satisfies_pzs`: [Output Only] Reserved for future use.

  * `resource_policies`: Resource policies to be added to this reservation. The key is defined by user, and the value is resource policy url. This is to define placement policy with reservation.

    * `additional_properties`: 

  * `resource_status`: [Output Only] Contains output only fields.

    * `specific_sku_allocation`: Contains Properties set for the reservation.

      * `source_instance_template_id`: ID of the instance template used to populate reservation properties.

  * `delete_at_time`: Absolute time in future when the reservation will be auto-deleted by Compute Engine. Timestamp is represented in RFC3339 text format.

  * `delete_after_duration`: A Duration represents a fixed-length span of time represented as a count of seconds and fractions of seconds at nanosecond resolution. It is independent of any calendar and concepts like "day" or "month". Range is approximately 10,000 years.

    * `seconds`: Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years

    * `nanos`: Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
