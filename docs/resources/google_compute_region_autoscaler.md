+++
title = "google_compute_region_autoscaler resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_compute_region_autoscaler"
identifier = "inspec/resources/gcp/google_compute_region_autoscaler Resource"
parent = "inspec/resources/gcp"
+++

Use the `google_compute_region_autoscaler` InSpec audit resource to to test a Google Cloud RegionAutoscaler resource.

## Examples

```ruby
describe google_compute_region_autoscaler(name: 'value_name', project: 'chef-gcp-inspec', region: 'value_region') do
	it { should exist }
	its('kind') { should cmp 'value_kind' }
	its('id') { should cmp 'value_id' }
	its('creation_timestamp') { should cmp 'value_creationtimestamp' }
	its('name') { should cmp 'value_name' }
	its('description') { should cmp 'value_description' }
	its('target') { should cmp 'value_target' }
	its('zone') { should cmp 'value_zone' }
	its('region') { should cmp 'value_region' }
	its('self_link') { should cmp 'value_selflink' }
	its('self_link_with_id') { should cmp 'value_selflinkwithid' }
	its('status') { should cmp 'value_status' }

end

describe google_compute_region_autoscaler(name: 'value_name', project: 'chef-gcp-inspec', region: ' value_region') do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_region_autoscaler` resource:


  * `kind`: [Output Only] Type of the resource. Always compute#autoscaler for autoscalers.

  * `id`: [Output Only] The unique identifier for the resource. This identifier is defined by the server.

  * `creation_timestamp`: [Output Only] Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `target`: URL of the managed instance group that this autoscaler will scale. This field is required when creating an autoscaler.

  * `autoscaling_policy`: Cloud Autoscaler policy.

    * `min_num_replicas`: The minimum number of replicas that the autoscaler can scale in to. This cannot be less than 0. If not provided, autoscaler chooses a default value depending on maximum number of instances allowed.

    * `max_num_replicas`: The maximum number of instances that the autoscaler can scale out to. This is required when creating or updating an autoscaler. The maximum number of replicas must not be lower than minimal number of replicas.

    * `scale_down_control`: Configuration that allows for slower scale in so that even if Autoscaler recommends an abrupt scale in of a MIG, it will be throttled as specified by the parameters below.

      * `max_scaled_down_replicas`: Encapsulates numeric value that can be either absolute or relative.

        * `fixed`: Specifies a fixed number of VM instances. This must be a positive integer.

        * `percent`: Specifies a percentage of instances between 0 to 100%, inclusive. For example, specify 80 for 80%.

        * `calculated`: [Output Only] Absolute value of VM instances calculated based on the specific mode. - If the value is fixed, then the calculated value is equal to the fixed value. - If the value is a percent, then the calculated value is percent/100 * targetSize. For example, the calculated value of a 80% of a managed instance group with 150 instances would be (80/100 * 150) = 120 VM instances. If there is a remainder, the number is rounded.

      * `time_window_sec`: How far back autoscaling looks when computing recommendations to include directives regarding slower scale in, as described above.

    * `scale_in_control`: Configuration that allows for slower scale in so that even if Autoscaler recommends an abrupt scale in of a MIG, it will be throttled as specified by the parameters below.

      * `max_scaled_in_replicas`: Encapsulates numeric value that can be either absolute or relative.

        * `fixed`: Specifies a fixed number of VM instances. This must be a positive integer.

        * `percent`: Specifies a percentage of instances between 0 to 100%, inclusive. For example, specify 80 for 80%.

        * `calculated`: [Output Only] Absolute value of VM instances calculated based on the specific mode. - If the value is fixed, then the calculated value is equal to the fixed value. - If the value is a percent, then the calculated value is percent/100 * targetSize. For example, the calculated value of a 80% of a managed instance group with 150 instances would be (80/100 * 150) = 120 VM instances. If there is a remainder, the number is rounded.

      * `time_window_sec`: How far back autoscaling looks when computing recommendations to include directives regarding slower scale in, as described above.

    * `cool_down_period_sec`: The number of seconds that your application takes to initialize on a VM instance. This is referred to as the [initialization period](/compute/docs/autoscaler#cool_down_period). Specifying an accurate initialization period improves autoscaler decisions. For example, when scaling out, the autoscaler ignores data from VMs that are still initializing because those VMs might not yet represent normal usage of your application. The default initialization period is 60 seconds. Initialization periods might vary because of numerous factors. We recommend that you test how long your application takes to initialize. To do this, create a VM and time your application's startup process.

    * `cpu_utilization`: CPU utilization policy.

      * `utilization_target`: The target CPU utilization that the autoscaler maintains. Must be a float value in the range (0, 1]. If not specified, the default is 0.6. If the CPU level is below the target utilization, the autoscaler scales in the number of instances until it reaches the minimum number of instances you specified or until the average CPU of your instances reaches the target utilization. If the average CPU is above the target utilization, the autoscaler scales out until it reaches the maximum number of instances you specified or until the average utilization reaches the target utilization.

      * `predictive_method`: Indicates whether predictive autoscaling based on CPU metric is enabled. Valid values are: * NONE (default). No predictive method is used. The autoscaler scales the group to meet current demand based on real-time metrics. * OPTIMIZE_AVAILABILITY. Predictive autoscaling improves availability by monitoring daily and weekly load patterns and scaling out ahead of anticipated demand.
      Possible values:
        * NONE
        * OPTIMIZE_AVAILABILITY
        * PREDICTIVE_METHOD_UNSPECIFIED
        * STANDARD

    * `custom_metric_utilizations`: Configuration parameters of autoscaling based on a custom metric.

      * `metric`: The identifier (type) of the Stackdriver Monitoring metric. The metric cannot have negative values. The metric must have a value type of INT64 or DOUBLE.

      * `filter`: A filter string, compatible with a Stackdriver Monitoring filter string for TimeSeries.list API call. This filter is used to select a specific TimeSeries for the purpose of autoscaling and to determine whether the metric is exporting per-instance or per-group data. For the filter to be valid for autoscaling purposes, the following rules apply: - You can only use the AND operator for joining selectors. - You can only use direct equality comparison operator (=) without any functions for each selector. - You can specify the metric in both the filter string and in the metric field. However, if specified in both places, the metric must be identical. - The monitored resource type determines what kind of values are expected for the metric. If it is a gce_instance, the autoscaler expects the metric to include a separate TimeSeries for each instance in a group. In such a case, you cannot filter on resource labels. If the resource type is any other value, the autoscaler expects this metric to contain values that apply to the entire autoscaled instance group and resource label filtering can be performed to point autoscaler at the correct TimeSeries to scale upon. This is called a *per-group metric* for the purpose of autoscaling. If not specified, the type defaults to gce_instance. Try to provide a filter that is selective enough to pick just one TimeSeries for the autoscaled group or for each of the instances (if you are using gce_instance resource type). If multiple TimeSeries are returned upon the query execution, the autoscaler will sum their respective values to obtain its scaling value.

      * `utilization_target`: The target value of the metric that autoscaler maintains. This must be a positive value. A utilization metric scales number of virtual machines handling requests to increase or decrease proportionally to the metric. For example, a good metric to use as a utilization_target is https://www.googleapis.com/compute/v1/instance/network/received_bytes_count. The autoscaler works to keep this value constant for each of the instances.

      * `single_instance_assignment`: If scaling is based on a per-group metric value that represents the total amount of work to be done or resource usage, set this value to an amount assigned for a single instance of the scaled group. Autoscaler keeps the number of instances proportional to the value of this metric. The metric itself does not change value due to group resizing. A good metric to use with the target is for example pubsub.googleapis.com/subscription/num_undelivered_messages or a custom metric exporting the total number of requests coming to your instances. A bad example would be a metric exporting an average or median latency, since this value can't include a chunk assignable to a single instance, it could be better used with utilization_target instead.

      * `utilization_target_type`: Defines how target utilization value is expressed for a Stackdriver Monitoring metric. Either GAUGE, DELTA_PER_SECOND, or DELTA_PER_MINUTE.
      Possible values:
        * DELTA_PER_MINUTE
        * DELTA_PER_SECOND
        * GAUGE

    * `load_balancing_utilization`: Configuration parameters of autoscaling based on load balancing.

      * `utilization_target`: Fraction of backend capacity utilization (set in HTTP(S) load balancing configuration) that the autoscaler maintains. Must be a positive float value. If not defined, the default is 0.8.

    * `mode`: Defines the operating mode for this policy. The following modes are available: - OFF: Disables the autoscaler but maintains its configuration. - ONLY_SCALE_OUT: Restricts the autoscaler to add VM instances only. - ON: Enables all autoscaler activities according to its policy. For more information, see "Turning off or restricting an autoscaler"
    Possible values:
      * OFF
      * ON
      * ONLY_SCALE_OUT
      * ONLY_UP

    * `scaling_schedules`: Scaling schedules defined for an autoscaler. Multiple schedules can be set on an autoscaler, and they can overlap. During overlapping periods the greatest min_required_replicas of all scaling schedules is applied. Up to 128 scaling schedules are allowed.

      * `additional_properties`: Scaling based on user-defined schedule. The message describes a single scaling schedule. A scaling schedule changes the minimum number of VM instances an autoscaler can recommend, which can trigger scaling out.

  * `zone`: [Output Only] URL of the zone where the instance group resides (for autoscalers living in zonal scope).

  * `region`: [Output Only] URL of the region where the instance group resides (for autoscalers living in regional scope).

  * `self_link`: [Output Only] Server-defined URL for the resource.

  * `self_link_with_id`: [Output Only] Server-defined URL for this resource with the resource id.

  * `status`: [Output Only] The status of the autoscaler configuration. Current set of possible values: - PENDING: Autoscaler backend hasn't read new/updated configuration. - DELETING: Configuration is being deleted. - ACTIVE: Configuration is acknowledged to be effective. Some warnings might be present in the statusDetails field. - ERROR: Configuration has errors. Actionable for users. Details are present in the statusDetails field. New values might be added in the future.
  Possible values:
    * ACTIVE
    * DELETING
    * ERROR
    * PENDING

  * `status_details`: [Output Only] Human-readable details about the current state of the autoscaler. Read the documentation for Commonly returned status messages for examples of status messages you might encounter.

    * `message`: The status message.

    * `type`: The type of error, warning, or notice returned. Current set of possible values: - ALL_INSTANCES_UNHEALTHY (WARNING): All instances in the instance group are unhealthy (not in RUNNING state). - BACKEND_SERVICE_DOES_NOT_EXIST (ERROR): There is no backend service attached to the instance group. - CAPPED_AT_MAX_NUM_REPLICAS (WARNING): Autoscaler recommends a size greater than maxNumReplicas. - CUSTOM_METRIC_DATA_POINTS_TOO_SPARSE (WARNING): The custom metric samples are not exported often enough to be a credible base for autoscaling. - CUSTOM_METRIC_INVALID (ERROR): The custom metric that was specified does not exist or does not have the necessary labels. - MIN_EQUALS_MAX (WARNING): The minNumReplicas is equal to maxNumReplicas. This means the autoscaler cannot add or remove instances from the instance group. - MISSING_CUSTOM_METRIC_DATA_POINTS (WARNING): The autoscaler did not receive any data from the custom metric configured for autoscaling. - MISSING_LOAD_BALANCING_DATA_POINTS (WARNING): The autoscaler is configured to scale based on a load balancing signal but the instance group has not received any requests from the load balancer. - MODE_OFF (WARNING): Autoscaling is turned off. The number of instances in the group won't change automatically. The autoscaling configuration is preserved. - MODE_ONLY_UP (WARNING): Autoscaling is in the "Autoscale only out" mode. The autoscaler can add instances but not remove any. - MORE_THAN_ONE_BACKEND_SERVICE (ERROR): The instance group cannot be autoscaled because it has more than one backend service attached to it. - NOT_ENOUGH_QUOTA_AVAILABLE (ERROR): There is insufficient quota for the necessary resources, such as CPU or number of instances. - REGION_RESOURCE_STOCKOUT (ERROR): Shown only for regional autoscalers: there is a resource stockout in the chosen region. - SCALING_TARGET_DOES_NOT_EXIST (ERROR): The target to be scaled does not exist. - UNSUPPORTED_MAX_RATE_LOAD_BALANCING_CONFIGURATION (ERROR): Autoscaling does not work with an HTTP/S load balancer that has been configured for maxRate. - ZONE_RESOURCE_STOCKOUT (ERROR): For zonal autoscalers: there is a resource stockout in the chosen zone. For regional autoscalers: in at least one of the zones you're using there is a resource stockout. New values might be added in the future. Some of the values might not be available in all API versions.
    Possible values:
      * ALL_INSTANCES_UNHEALTHY
      * BACKEND_SERVICE_DOES_NOT_EXIST
      * CAPPED_AT_MAX_NUM_REPLICAS
      * CUSTOM_METRIC_DATA_POINTS_TOO_SPARSE
      * CUSTOM_METRIC_INVALID
      * MIN_EQUALS_MAX
      * MISSING_CUSTOM_METRIC_DATA_POINTS
      * MISSING_LOAD_BALANCING_DATA_POINTS
      * MODE_OFF
      * MODE_ONLY_SCALE_OUT
      * MODE_ONLY_UP
      * MORE_THAN_ONE_BACKEND_SERVICE
      * NOT_ENOUGH_QUOTA_AVAILABLE
      * REGION_RESOURCE_STOCKOUT
      * SCALING_TARGET_DOES_NOT_EXIST
      * SCHEDULED_INSTANCES_GREATER_THAN_AUTOSCALER_MAX
      * SCHEDULED_INSTANCES_LESS_THAN_AUTOSCALER_MIN
      * UNKNOWN
      * UNSUPPORTED_MAX_RATE_LOAD_BALANCING_CONFIGURATION
      * ZONE_RESOURCE_STOCKOUT

  * `recommended_size`: [Output Only] Target recommended MIG size (number of instances) computed by autoscaler. Autoscaler calculates the recommended MIG size even when the autoscaling policy mode is different from ON. This field is empty when autoscaler is not connected to an existing managed instance group or autoscaler did not generate its prediction.

  * `scaling_schedule_status`: [Output Only] Status information of existing scaling schedules.

    * `additional_properties`:


## GCP permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
