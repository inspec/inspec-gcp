+++
title = "google_compute_resource_policy resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_compute_resource_policy"
identifier = "inspec/resources/gcp/google_compute_resource_policy Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_compute_resource_policy` is used to test a Google ResourcePolicy resource

## Examples
```
describe google_compute_resource_policy(project: 'chef-gcp-inspec', region: 'value_region', name: 'value_name') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('region') { should cmp 'value_region' }
	its('description') { should cmp 'value_description' }
	its('name') { should cmp 'value_name' }
	its('status') { should cmp 'value_status' }
end

describe google_compute_resource_policy(project: 'chef-gcp-inspec', region: ' value_region', name: 'value_name') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_resource_policy` resource:


  * `kind`: [Output Only] Type of the resource. Always compute#resource_policies for resource policies.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `self_link`: [Output Only] Server-defined fully-qualified URL for this resource.

  * `self_link_with_id`: [Output Only] Server-defined URL for this resource with the resource id.

  * `region`:

  * `description`:

  * `name`: The name of the resource, provided by the client when initially creating the resource. The resource name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `vm_maintenance_policy`:

    * `maintenance_window`: A maintenance window for VMs. When set, we restrict our maintenance operations to this window.

      * `daily_maintenance_window`: Time window specified for daily operations.

        * `days_in_cycle`: Defines a schedule with units measured in days. The value determines how many days pass between the start of each cycle.

        * `start_time`: Start time of the window. This must be in UTC format that resolves to one of 00:00, 04:00, 08:00, 12:00, 16:00, or 20:00. For example, both 13:00-5 and 08:00 are valid.

        * `duration`: [Output only] A predetermined duration for the window, automatically chosen to be the smallest possible in the given scenario.

    * `concurrency_control_group`: A concurrency control configuration. Defines a group config that, when attached to an instance, recognizes that instance as part of a group of instances where only up the concurrency_limit of instances in that group can undergo simultaneous maintenance. For more information: go/concurrency-control-design-doc

      * `concurrency_limit`:

  * `snapshot_schedule_policy`: A snapshot schedule policy specifies when and how frequently snapshots are to be created for the target disk. Also specifies how many and how long these scheduled snapshots should be retained.

    * `schedule`: A schedule for disks where the schedueled operations are performed.

      * `hourly_schedule`: Time window specified for hourly operations.

        * `hours_in_cycle`: Defines a schedule with units measured in hours. The value determines how many hours pass between the start of each cycle.

        * `start_time`: Time within the window to start the operations. It must be in format "HH:MM", where HH : [00-23] and MM : [00-00] GMT.

        * `duration`: [Output only] Duration of the time window, automatically chosen to be smallest possible in the given scenario.

      * `daily_schedule`: Time window specified for daily operations.

        * `days_in_cycle`: Defines a schedule with units measured in days. The value determines how many days pass between the start of each cycle.

        * `start_time`: Start time of the window. This must be in UTC format that resolves to one of 00:00, 04:00, 08:00, 12:00, 16:00, or 20:00. For example, both 13:00-5 and 08:00 are valid.

        * `duration`: [Output only] A predetermined duration for the window, automatically chosen to be the smallest possible in the given scenario.

      * `weekly_schedule`: Time window specified for weekly operations.

        * `day_of_weeks`: Up to 7 intervals/windows, one for each day of the week.

          * `day`: Defines a schedule that runs on specific days of the week. Specify one or more days. The following options are available: MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY.
          Possible values:
            * FRIDAY
            * INVALID
            * MONDAY
            * SATURDAY
            * SUNDAY
            * THURSDAY
            * TUESDAY
            * WEDNESDAY

          * `start_time`: Time within the window to start the operations. It must be in format "HH:MM", where HH : [00-23] and MM : [00-00] GMT.

          * `duration`: [Output only] Duration of the time window, automatically chosen to be smallest possible in the given scenario.

    * `retention_policy`: Policy for retention of scheduled snapshots.

      * `max_retention_days`: Maximum age of the snapshot that is allowed to be kept.

      * `on_policy_switch`:
      Possible values:
        * DO_NOT_RETROACTIVELY_APPLY
        * RETROACTIVELY_APPLY
        * UNSPECIFIED_ON_POLICY_SWITCH

      * `on_source_disk_delete`: Specifies the behavior to apply to scheduled snapshots when the source disk is deleted.
      Possible values:
        * APPLY_RETENTION_POLICY
        * KEEP_AUTO_SNAPSHOTS
        * UNSPECIFIED_ON_SOURCE_DISK_DELETE

    * `snapshot_properties`: Specified snapshot properties for scheduled snapshots created by this policy.

      * `labels`: Labels to apply to scheduled snapshots. These can be later modified by the setLabels method. Label values may be empty.

        * `additional_properties`:

      * `storage_locations`: Cloud Storage bucket storage location of the auto snapshot (regional or multi-regional).

      * `guest_flush`: Indication to perform a 'guest aware' snapshot.

      * `chain_name`: Chain name that the snapshot is created in.

  * `group_placement_policy`: A GroupPlacementPolicy specifies resource placement configuration. It specifies the failure bucket separation as well as network locality

    * `style`: Specifies instances to hosts placement relationship
    Possible values:
      * COMPACT
      * FULLY_SPREAD
      * UNSPECIFIED_PLACEMENT_TYPE

    * `locality`: Specifies network locality
    Possible values:
      * BEST_EFFORT
      * STRICT
      * UNSPECIFIED_LOCALITY

    * `vm_count`: Number of VMs in this placement group. Google does not recommend that you use this field unless you use a compact policy and you want your policy to work only if it contains this exact number of VMs.

    * `availability_domain_count`: The number of availability domains to spread instances across. If two instances are in different availability domain, they are not in the same low latency network.

    * `collocation`: Specifies network collocation
    Possible values:
      * CLUSTERED
      * COLLOCATED
      * UNSPECIFIED_COLLOCATION

    * `scope`: Scope specifies the availability domain to which the VMs should be spread.
    Possible values:
      * HOST
      * UNSPECIFIED_SCOPE

    * `tpu_topology`: Specifies the shape of the TPU slice

    * `max_distance`: Specifies the number of max logical switches.

    * `slice_count`: Specifies the number of slices in a multislice workload.

  * `instance_schedule_policy`: An InstanceSchedulePolicy specifies when and how frequent certain operations are performed on the instance.

    * `vm_start_schedule`: Schedule for an instance operation.

      * `schedule`: Specifies the frequency for the operation, using the unix-cron format.

    * `vm_stop_schedule`: Schedule for an instance operation.

      * `schedule`: Specifies the frequency for the operation, using the unix-cron format.

    * `time_zone`: Specifies the time zone to be used in interpreting Schedule.schedule. The value of this field must be a time zone name from the tz database: https://wikipedia.org/wiki/Tz_database.

    * `start_time`: The start time of the schedule. The timestamp is an RFC3339 string.

    * `expiration_time`: The expiration time of the schedule. The timestamp is an RFC3339 string.

  * `status`: [Output Only] The status of resource policy creation.
  Possible values:
    * CREATING
    * DELETING
    * EXPIRED
    * INVALID
    * READY

  * `resource_status`: Contains output only fields. Use this sub-message for all output fields set on ResourcePolicy. The internal structure of this "status" field should mimic the structure of ResourcePolicy proto specification.

    * `instance_schedule_policy`:

      * `next_run_start_time`: [Output Only] The next time the schedule is planned to run. The actual time might be slightly different. The timestamp is an RFC3339 string.

      * `last_run_start_time`: [Output Only] The last time the schedule successfully ran. The timestamp is an RFC3339 string.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
