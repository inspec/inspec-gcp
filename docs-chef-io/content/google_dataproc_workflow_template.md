+++
title = "google_dataproc_workflow_template resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.gcp]
title = "google_dataproc_workflow_template"
identifier = "inspec/resources/gcp/google_dataproc_workflow_template resource"
parent = "inspec/resources/gcp"
+++

Use the `google_dataproc_workflow_template` InSpec audit resource to to test a Google Cloud WorkflowTemplate resource.

## Examples

```ruby
describe google_dataproc_workflow_template(name: 'value_name') do
	it { should exist }
	its('id') { should cmp 'value_id' }
	its('name') { should cmp 'value_name' }
	its('create_time') { should cmp 'value_createtime' }
	its('update_time') { should cmp 'value_updatetime' }
	its('dag_timeout') { should cmp 'value_dagtimeout' }

end

describe google_dataproc_workflow_template(name: "does_not_exit") do
	it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_dataproc_workflow_template` resource:


  * `id`:

  * `name`: Output only. The resource name of the workflow template, as described in https://cloud.google.com/apis/design/resource_names. For projects.regions.workflowTemplates, the resource name of the template has the following format: projects/{project_id}/regions/{region}/workflowTemplates/{template_id} For projects.locations.workflowTemplates, the resource name of the template has the following format: projects/{project_id}/locations/{location}/workflowTemplates/{template_id}

  * `version`: Optional. Used to perform a consistent read-modify-write.This field should be left blank for a CreateWorkflowTemplate request. It is required for an UpdateWorkflowTemplate request, and must match the current server version. A typical update template flow would fetch the current template with a GetWorkflowTemplate request, which will return the current template with the version field filled in with the current server version. The user updates other fields in the template, then returns it as part of the UpdateWorkflowTemplate request.

  * `create_time`: Output only. The time template was created.

  * `update_time`: Output only. The time template was last updated.

  * `labels`: Optional. The labels to associate with this template. These labels will be propagated to all jobs and clusters created by the workflow instance.Label keys must contain 1 to 63 characters, and must conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.txt).Label values may be empty, but, if present, must contain 1 to 63 characters, and must conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.txt).No more than 32 labels can be associated with a template.

    * `additional_properties`:

  * `placement`: Specifies workflow execution target.Either managed_cluster or cluster_selector is required.

    * `managed_cluster`: Cluster that is managed by the workflow.

      * `cluster_name`: Required. The cluster name prefix. A unique cluster name will be formed by appending a random suffix.The name must contain only lower-case letters (a-z), numbers (0-9), and hyphens (-). Must begin with a letter. Cannot begin or end with hyphen. Must consist of between 2 and 35 characters.

      * `config`: The cluster config.

        * `config_bucket`: Optional. A Cloud Storage bucket used to stage job dependencies, config files, and job driver console output. If you do not specify a staging bucket, Cloud Dataproc will determine a Cloud Storage location (US, ASIA, or EU) for your cluster's staging bucket according to the Compute Engine zone where your cluster is deployed, and then create and manage this project-level, per-location bucket (see Dataproc staging and temp buckets (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/staging-bucket)). This field requires a Cloud Storage bucket name, not a gs://... URI to a Cloud Storage bucket.

        * `temp_bucket`: Optional. A Cloud Storage bucket used to store ephemeral cluster and jobs data, such as Spark and MapReduce history files. If you do not specify a temp bucket, Dataproc will determine a Cloud Storage location (US, ASIA, or EU) for your cluster's temp bucket according to the Compute Engine zone where your cluster is deployed, and then create and manage this project-level, per-location bucket. The default bucket has a TTL of 90 days, but you can use any TTL (or none) if you specify a bucket (see Dataproc staging and temp buckets (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/staging-bucket)). This field requires a Cloud Storage bucket name, not a gs://... URI to a Cloud Storage bucket.

        * `gce_cluster_config`: Common config settings for resources of Compute Engine cluster instances, applicable to all instances in the cluster.

          * `zone_uri`: Optional. The Compute Engine zone where the Dataproc cluster will be located. If omitted, the service will pick a zone in the cluster's Compute Engine region. On a get request, zone will always be present.A full URL, partial URI, or short name are valid. Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/zones/[zone] projects/[project_id]/zones/[zone] [zone]

          * `network_uri`: Optional. The Compute Engine network to be used for machine communications. Cannot be specified with subnetwork_uri. If neither network_uri nor subnetwork_uri is specified, the "default" network of the project is used, if it exists. Cannot be a "Custom Subnet Network" (see Using Subnetworks (https://cloud.google.com/compute/docs/subnetworks) for more information).A full URL, partial URI, or short name are valid. Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/global/networks/default projects/[project_id]/global/networks/default default

          * `subnetwork_uri`: Optional. The Compute Engine subnetwork to be used for machine communications. Cannot be specified with network_uri.A full URL, partial URI, or short name are valid. Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/regions/[region]/subnetworks/sub0 projects/[project_id]/regions/[region]/subnetworks/sub0 sub0

          * `internal_ip_only`: Optional. This setting applies to subnetwork-enabled networks. It is set to true by default in clusters created with image versions 2.2.x.When set to true: All cluster VMs have internal IP addresses. Google Private Access (https://cloud.google.com/vpc/docs/private-google-access) must be enabled to access Dataproc and other Google Cloud APIs. Off-cluster dependencies must be configured to be accessible without external IP addresses.When set to false: Cluster VMs are not restricted to internal IP addresses. Ephemeral external IP addresses are assigned to each cluster VM.

          * `private_ipv6_google_access`: Optional. The type of IPv6 access for a cluster.
          Possible values:
            * PRIVATE_IPV6_GOOGLE_ACCESS_UNSPECIFIED
            * INHERIT_FROM_SUBNETWORK
            * OUTBOUND
            * BIDIRECTIONAL

          * `service_account`: Optional. The Dataproc service account (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/service-accounts#service_accounts_in_dataproc) (also see VM Data Plane identity (https://cloud.google.com/dataproc/docs/concepts/iam/dataproc-principals#vm_service_account_data_plane_identity)) used by Dataproc cluster VM instances to access Google Cloud Platform services.If not specified, the Compute Engine default service account (https://cloud.google.com/compute/docs/access/service-accounts#default_service_account) is used.

          * `service_account_scopes`: Optional. The URIs of service account scopes to be included in Compute Engine instances. The following base set of scopes is always included: https://www.googleapis.com/auth/cloud.useraccounts.readonly https://www.googleapis.com/auth/devstorage.read_write https://www.googleapis.com/auth/logging.writeIf no scopes are specified, the following defaults are also provided: https://www.googleapis.com/auth/bigquery https://www.googleapis.com/auth/bigtable.admin.table https://www.googleapis.com/auth/bigtable.data https://www.googleapis.com/auth/devstorage.full_control

          * `tags`: The Compute Engine tags to add to all instances (see Tagging instances (https://cloud.google.com/compute/docs/label-or-tag-resources#tags)).

          * `metadata`: Optional. The Compute Engine metadata entries to add to all instances (see Project and instance metadata (https://cloud.google.com/compute/docs/storing-retrieving-metadata#project_and_instance_metadata)).

            * `additional_properties`:

          * `reservation_affinity`: Reservation Affinity for consuming Zonal reservation.

            * `consume_reservation_type`: Optional. Type of reservation to consume
            Possible values:
              * TYPE_UNSPECIFIED
              * NO_RESERVATION
              * ANY_RESERVATION
              * SPECIFIC_RESERVATION

            * `key`: Optional. Corresponds to the label key of reservation resource.

            * `values`: Optional. Corresponds to the label values of reservation resource.

          * `node_group_affinity`: Node Group Affinity for clusters using sole-tenant node groups. The Dataproc NodeGroupAffinity resource is not related to the Dataproc NodeGroup resource.

            * `node_group_uri`: Required. The URI of a sole-tenant node group resource (https://cloud.google.com/compute/docs/reference/rest/v1/nodeGroups) that the cluster will be created on.A full URL, partial URI, or node group name are valid. Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/zones/[zone]/nodeGroups/node-group-1 projects/[project_id]/zones/[zone]/nodeGroups/node-group-1 node-group-1

          * `shielded_instance_config`: Shielded Instance Config for clusters using Compute Engine Shielded VMs (https://cloud.google.com/security/shielded-cloud/shielded-vm).

            * `enable_secure_boot`: Optional. Defines whether instances have Secure Boot enabled.

            * `enable_vtpm`: Optional. Defines whether instances have the vTPM enabled.

            * `enable_integrity_monitoring`: Optional. Defines whether instances have integrity monitoring enabled.

          * `confidential_instance_config`: Confidential Instance Config for clusters using Confidential VMs (https://cloud.google.com/compute/confidential-vm/docs)

            * `enable_confidential_compute`: Optional. Defines whether the instance should have confidential compute enabled.

        * `master_config`: The config settings for Compute Engine resources in an instance group, such as a master or worker group.

          * `num_instances`: Optional. The number of VM instances in the instance group. For HA cluster master_config groups, must be set to 3. For standard cluster master_config groups, must be set to 1.

          * `instance_names`: Output only. The list of instance names. Dataproc derives the names from cluster_name, num_instances, and the instance group.

          * `instance_references`: Output only. List of references to Compute Engine instances.

            * `instance_name`: The user-friendly name of the Compute Engine instance.

            * `instance_id`: The unique identifier of the Compute Engine instance.

            * `public_key`: The public RSA key used for sharing data with this instance.

            * `public_ecies_key`: The public ECIES key used for sharing data with this instance.

          * `image_uri`: Optional. The Compute Engine image resource used for cluster instances.The URI can represent an image or image family.Image examples: https://www.googleapis.com/compute/v1/projects/[project_id]/global/images/[image-id] projects/[project_id]/global/images/[image-id] image-idImage family examples. Dataproc will use the most recent image from the family: https://www.googleapis.com/compute/v1/projects/[project_id]/global/images/family/[custom-image-family-name] projects/[project_id]/global/images/family/[custom-image-family-name]If the URI is unspecified, it will be inferred from SoftwareConfig.image_version or the system default.

          * `machine_type_uri`: Optional. The Compute Engine machine type used for cluster instances.A full URL, partial URI, or short name are valid. Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/zones/[zone]/machineTypes/n1-standard-2 projects/[project_id]/zones/[zone]/machineTypes/n1-standard-2 n1-standard-2Auto Zone Exception: If you are using the Dataproc Auto Zone Placement (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/auto-zone#using_auto_zone_placement) feature, you must use the short name of the machine type resource, for example, n1-standard-2.

          * `disk_config`: Specifies the config of disk options for a group of VM instances.

            * `boot_disk_type`: Optional. Type of the boot disk (default is "pd-standard"). Valid values: "pd-balanced" (Persistent Disk Balanced Solid State Drive), "pd-ssd" (Persistent Disk Solid State Drive), or "pd-standard" (Persistent Disk Hard Disk Drive). See Disk types (https://cloud.google.com/compute/docs/disks#disk-types).

            * `boot_disk_size_gb`: Optional. Size in GB of the boot disk (default is 500GB).

            * `num_local_ssds`: Optional. Number of attached SSDs, from 0 to 8 (default is 0). If SSDs are not attached, the boot disk is used to store runtime logs and HDFS (https://hadoop.apache.org/docs/r1.2.1/hdfs_user_guide.html) data. If one or more SSDs are attached, this runtime bulk data is spread across them, and the boot disk contains only basic config and installed binaries.Note: Local SSD options may vary by machine type and number of vCPUs selected.

            * `local_ssd_interface`: Optional. Interface type of local SSDs (default is "scsi"). Valid values: "scsi" (Small Computer System Interface), "nvme" (Non-Volatile Memory Express). See local SSD performance (https://cloud.google.com/compute/docs/disks/local-ssd#performance).

          * `is_preemptible`: Output only. Specifies that this instance group contains preemptible instances.

          * `preemptibility`: Optional. Specifies the preemptibility of the instance group.The default value for master and worker groups is NON_PREEMPTIBLE. This default cannot be changed.The default value for secondary instances is PREEMPTIBLE.
          Possible values:
            * PREEMPTIBILITY_UNSPECIFIED
            * NON_PREEMPTIBLE
            * PREEMPTIBLE
            * SPOT

          * `managed_group_config`: Specifies the resources used to actively manage an instance group.

            * `instance_template_name`: Output only. The name of the Instance Template used for the Managed Instance Group.

            * `instance_group_manager_name`: Output only. The name of the Instance Group Manager for this group.

            * `instance_group_manager_uri`: Output only. The partial URI to the instance group manager for this group. E.g. projects/my-project/regions/us-central1/instanceGroupManagers/my-igm.

          * `accelerators`: Optional. The Compute Engine accelerator configuration for these instances.

            * `accelerator_type_uri`: Full URL, partial URI, or short name of the accelerator type resource to expose to this instance. See Compute Engine AcceleratorTypes (https://cloud.google.com/compute/docs/reference/v1/acceleratorTypes).Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/zones/[zone]/acceleratorTypes/nvidia-tesla-t4 projects/[project_id]/zones/[zone]/acceleratorTypes/nvidia-tesla-t4 nvidia-tesla-t4Auto Zone Exception: If you are using the Dataproc Auto Zone Placement (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/auto-zone#using_auto_zone_placement) feature, you must use the short name of the accelerator type resource, for example, nvidia-tesla-t4.

            * `accelerator_count`: The number of the accelerator cards of this type exposed to this instance.

          * `min_cpu_platform`: Optional. Specifies the minimum cpu platform for the Instance Group. See Dataproc -> Minimum CPU Platform (https://cloud.google.com/dataproc/docs/concepts/compute/dataproc-min-cpu).

          * `min_num_instances`: Optional. The minimum number of primary worker instances to create. If min_num_instances is set, cluster creation will succeed if the number of primary workers created is at least equal to the min_num_instances number.Example: Cluster creation request with num_instances = 5 and min_num_instances = 3: If 4 VMs are created and 1 instance fails, the failed VM is deleted. The cluster is resized to 4 instances and placed in a RUNNING state. If 2 instances are created and 3 instances fail, the cluster in placed in an ERROR state. The failed VMs are not deleted.

          * `instance_flexibility_policy`: Instance flexibility Policy allowing a mixture of VM shapes and provisioning models.

            * `instance_selection_list`: Optional. List of instance selection options that the group will use when creating new VMs.

              * `machine_types`: Optional. Full machine-type names, e.g. "n1-standard-16".

              * `rank`: Optional. Preference of this instance selection. Lower number means higher preference. Dataproc will first try to create a VM based on the machine-type with priority rank and fallback to next rank based on availability. Machine types and instance selections with the same priority have the same preference.

            * `instance_selection_results`: Output only. A list of instance selection results in the group.

              * `machine_type`: Output only. Full machine-type names, e.g. "n1-standard-16".

              * `vm_count`: Output only. Number of VM provisioned with the machine_type.

          * `startup_config`: Configuration to handle the startup of instances during cluster create and update process.

            * `required_registration_fraction`: Optional. The config setting to enable cluster creation/ updation to be successful only after required_registration_fraction of instances are up and running. This configuration is applicable to only secondary workers for now. The cluster will fail if required_registration_fraction of instances are not available. This will include instance creation, agent registration, and service registration (if enabled).

        * `worker_config`: The config settings for Compute Engine resources in an instance group, such as a master or worker group.

          * `num_instances`: Optional. The number of VM instances in the instance group. For HA cluster master_config groups, must be set to 3. For standard cluster master_config groups, must be set to 1.

          * `instance_names`: Output only. The list of instance names. Dataproc derives the names from cluster_name, num_instances, and the instance group.

          * `instance_references`: Output only. List of references to Compute Engine instances.

            * `instance_name`: The user-friendly name of the Compute Engine instance.

            * `instance_id`: The unique identifier of the Compute Engine instance.

            * `public_key`: The public RSA key used for sharing data with this instance.

            * `public_ecies_key`: The public ECIES key used for sharing data with this instance.

          * `image_uri`: Optional. The Compute Engine image resource used for cluster instances.The URI can represent an image or image family.Image examples: https://www.googleapis.com/compute/v1/projects/[project_id]/global/images/[image-id] projects/[project_id]/global/images/[image-id] image-idImage family examples. Dataproc will use the most recent image from the family: https://www.googleapis.com/compute/v1/projects/[project_id]/global/images/family/[custom-image-family-name] projects/[project_id]/global/images/family/[custom-image-family-name]If the URI is unspecified, it will be inferred from SoftwareConfig.image_version or the system default.

          * `machine_type_uri`: Optional. The Compute Engine machine type used for cluster instances.A full URL, partial URI, or short name are valid. Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/zones/[zone]/machineTypes/n1-standard-2 projects/[project_id]/zones/[zone]/machineTypes/n1-standard-2 n1-standard-2Auto Zone Exception: If you are using the Dataproc Auto Zone Placement (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/auto-zone#using_auto_zone_placement) feature, you must use the short name of the machine type resource, for example, n1-standard-2.

          * `disk_config`: Specifies the config of disk options for a group of VM instances.

            * `boot_disk_type`: Optional. Type of the boot disk (default is "pd-standard"). Valid values: "pd-balanced" (Persistent Disk Balanced Solid State Drive), "pd-ssd" (Persistent Disk Solid State Drive), or "pd-standard" (Persistent Disk Hard Disk Drive). See Disk types (https://cloud.google.com/compute/docs/disks#disk-types).

            * `boot_disk_size_gb`: Optional. Size in GB of the boot disk (default is 500GB).

            * `num_local_ssds`: Optional. Number of attached SSDs, from 0 to 8 (default is 0). If SSDs are not attached, the boot disk is used to store runtime logs and HDFS (https://hadoop.apache.org/docs/r1.2.1/hdfs_user_guide.html) data. If one or more SSDs are attached, this runtime bulk data is spread across them, and the boot disk contains only basic config and installed binaries.Note: Local SSD options may vary by machine type and number of vCPUs selected.

            * `local_ssd_interface`: Optional. Interface type of local SSDs (default is "scsi"). Valid values: "scsi" (Small Computer System Interface), "nvme" (Non-Volatile Memory Express). See local SSD performance (https://cloud.google.com/compute/docs/disks/local-ssd#performance).

          * `is_preemptible`: Output only. Specifies that this instance group contains preemptible instances.

          * `preemptibility`: Optional. Specifies the preemptibility of the instance group.The default value for master and worker groups is NON_PREEMPTIBLE. This default cannot be changed.The default value for secondary instances is PREEMPTIBLE.
          Possible values:
            * PREEMPTIBILITY_UNSPECIFIED
            * NON_PREEMPTIBLE
            * PREEMPTIBLE
            * SPOT

          * `managed_group_config`: Specifies the resources used to actively manage an instance group.

            * `instance_template_name`: Output only. The name of the Instance Template used for the Managed Instance Group.

            * `instance_group_manager_name`: Output only. The name of the Instance Group Manager for this group.

            * `instance_group_manager_uri`: Output only. The partial URI to the instance group manager for this group. E.g. projects/my-project/regions/us-central1/instanceGroupManagers/my-igm.

          * `accelerators`: Optional. The Compute Engine accelerator configuration for these instances.

            * `accelerator_type_uri`: Full URL, partial URI, or short name of the accelerator type resource to expose to this instance. See Compute Engine AcceleratorTypes (https://cloud.google.com/compute/docs/reference/v1/acceleratorTypes).Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/zones/[zone]/acceleratorTypes/nvidia-tesla-t4 projects/[project_id]/zones/[zone]/acceleratorTypes/nvidia-tesla-t4 nvidia-tesla-t4Auto Zone Exception: If you are using the Dataproc Auto Zone Placement (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/auto-zone#using_auto_zone_placement) feature, you must use the short name of the accelerator type resource, for example, nvidia-tesla-t4.

            * `accelerator_count`: The number of the accelerator cards of this type exposed to this instance.

          * `min_cpu_platform`: Optional. Specifies the minimum cpu platform for the Instance Group. See Dataproc -> Minimum CPU Platform (https://cloud.google.com/dataproc/docs/concepts/compute/dataproc-min-cpu).

          * `min_num_instances`: Optional. The minimum number of primary worker instances to create. If min_num_instances is set, cluster creation will succeed if the number of primary workers created is at least equal to the min_num_instances number.Example: Cluster creation request with num_instances = 5 and min_num_instances = 3: If 4 VMs are created and 1 instance fails, the failed VM is deleted. The cluster is resized to 4 instances and placed in a RUNNING state. If 2 instances are created and 3 instances fail, the cluster in placed in an ERROR state. The failed VMs are not deleted.

          * `instance_flexibility_policy`: Instance flexibility Policy allowing a mixture of VM shapes and provisioning models.

            * `instance_selection_list`: Optional. List of instance selection options that the group will use when creating new VMs.

              * `machine_types`: Optional. Full machine-type names, e.g. "n1-standard-16".

              * `rank`: Optional. Preference of this instance selection. Lower number means higher preference. Dataproc will first try to create a VM based on the machine-type with priority rank and fallback to next rank based on availability. Machine types and instance selections with the same priority have the same preference.

            * `instance_selection_results`: Output only. A list of instance selection results in the group.

              * `machine_type`: Output only. Full machine-type names, e.g. "n1-standard-16".

              * `vm_count`: Output only. Number of VM provisioned with the machine_type.

          * `startup_config`: Configuration to handle the startup of instances during cluster create and update process.

            * `required_registration_fraction`: Optional. The config setting to enable cluster creation/ updation to be successful only after required_registration_fraction of instances are up and running. This configuration is applicable to only secondary workers for now. The cluster will fail if required_registration_fraction of instances are not available. This will include instance creation, agent registration, and service registration (if enabled).

        * `secondary_worker_config`: The config settings for Compute Engine resources in an instance group, such as a master or worker group.

          * `num_instances`: Optional. The number of VM instances in the instance group. For HA cluster master_config groups, must be set to 3. For standard cluster master_config groups, must be set to 1.

          * `instance_names`: Output only. The list of instance names. Dataproc derives the names from cluster_name, num_instances, and the instance group.

          * `instance_references`: Output only. List of references to Compute Engine instances.

            * `instance_name`: The user-friendly name of the Compute Engine instance.

            * `instance_id`: The unique identifier of the Compute Engine instance.

            * `public_key`: The public RSA key used for sharing data with this instance.

            * `public_ecies_key`: The public ECIES key used for sharing data with this instance.

          * `image_uri`: Optional. The Compute Engine image resource used for cluster instances.The URI can represent an image or image family.Image examples: https://www.googleapis.com/compute/v1/projects/[project_id]/global/images/[image-id] projects/[project_id]/global/images/[image-id] image-idImage family examples. Dataproc will use the most recent image from the family: https://www.googleapis.com/compute/v1/projects/[project_id]/global/images/family/[custom-image-family-name] projects/[project_id]/global/images/family/[custom-image-family-name]If the URI is unspecified, it will be inferred from SoftwareConfig.image_version or the system default.

          * `machine_type_uri`: Optional. The Compute Engine machine type used for cluster instances.A full URL, partial URI, or short name are valid. Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/zones/[zone]/machineTypes/n1-standard-2 projects/[project_id]/zones/[zone]/machineTypes/n1-standard-2 n1-standard-2Auto Zone Exception: If you are using the Dataproc Auto Zone Placement (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/auto-zone#using_auto_zone_placement) feature, you must use the short name of the machine type resource, for example, n1-standard-2.

          * `disk_config`: Specifies the config of disk options for a group of VM instances.

            * `boot_disk_type`: Optional. Type of the boot disk (default is "pd-standard"). Valid values: "pd-balanced" (Persistent Disk Balanced Solid State Drive), "pd-ssd" (Persistent Disk Solid State Drive), or "pd-standard" (Persistent Disk Hard Disk Drive). See Disk types (https://cloud.google.com/compute/docs/disks#disk-types).

            * `boot_disk_size_gb`: Optional. Size in GB of the boot disk (default is 500GB).

            * `num_local_ssds`: Optional. Number of attached SSDs, from 0 to 8 (default is 0). If SSDs are not attached, the boot disk is used to store runtime logs and HDFS (https://hadoop.apache.org/docs/r1.2.1/hdfs_user_guide.html) data. If one or more SSDs are attached, this runtime bulk data is spread across them, and the boot disk contains only basic config and installed binaries.Note: Local SSD options may vary by machine type and number of vCPUs selected.

            * `local_ssd_interface`: Optional. Interface type of local SSDs (default is "scsi"). Valid values: "scsi" (Small Computer System Interface), "nvme" (Non-Volatile Memory Express). See local SSD performance (https://cloud.google.com/compute/docs/disks/local-ssd#performance).

          * `is_preemptible`: Output only. Specifies that this instance group contains preemptible instances.

          * `preemptibility`: Optional. Specifies the preemptibility of the instance group.The default value for master and worker groups is NON_PREEMPTIBLE. This default cannot be changed.The default value for secondary instances is PREEMPTIBLE.
          Possible values:
            * PREEMPTIBILITY_UNSPECIFIED
            * NON_PREEMPTIBLE
            * PREEMPTIBLE
            * SPOT

          * `managed_group_config`: Specifies the resources used to actively manage an instance group.

            * `instance_template_name`: Output only. The name of the Instance Template used for the Managed Instance Group.

            * `instance_group_manager_name`: Output only. The name of the Instance Group Manager for this group.

            * `instance_group_manager_uri`: Output only. The partial URI to the instance group manager for this group. E.g. projects/my-project/regions/us-central1/instanceGroupManagers/my-igm.

          * `accelerators`: Optional. The Compute Engine accelerator configuration for these instances.

            * `accelerator_type_uri`: Full URL, partial URI, or short name of the accelerator type resource to expose to this instance. See Compute Engine AcceleratorTypes (https://cloud.google.com/compute/docs/reference/v1/acceleratorTypes).Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/zones/[zone]/acceleratorTypes/nvidia-tesla-t4 projects/[project_id]/zones/[zone]/acceleratorTypes/nvidia-tesla-t4 nvidia-tesla-t4Auto Zone Exception: If you are using the Dataproc Auto Zone Placement (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/auto-zone#using_auto_zone_placement) feature, you must use the short name of the accelerator type resource, for example, nvidia-tesla-t4.

            * `accelerator_count`: The number of the accelerator cards of this type exposed to this instance.

          * `min_cpu_platform`: Optional. Specifies the minimum cpu platform for the Instance Group. See Dataproc -> Minimum CPU Platform (https://cloud.google.com/dataproc/docs/concepts/compute/dataproc-min-cpu).

          * `min_num_instances`: Optional. The minimum number of primary worker instances to create. If min_num_instances is set, cluster creation will succeed if the number of primary workers created is at least equal to the min_num_instances number.Example: Cluster creation request with num_instances = 5 and min_num_instances = 3: If 4 VMs are created and 1 instance fails, the failed VM is deleted. The cluster is resized to 4 instances and placed in a RUNNING state. If 2 instances are created and 3 instances fail, the cluster in placed in an ERROR state. The failed VMs are not deleted.

          * `instance_flexibility_policy`: Instance flexibility Policy allowing a mixture of VM shapes and provisioning models.

            * `instance_selection_list`: Optional. List of instance selection options that the group will use when creating new VMs.

              * `machine_types`: Optional. Full machine-type names, e.g. "n1-standard-16".

              * `rank`: Optional. Preference of this instance selection. Lower number means higher preference. Dataproc will first try to create a VM based on the machine-type with priority rank and fallback to next rank based on availability. Machine types and instance selections with the same priority have the same preference.

            * `instance_selection_results`: Output only. A list of instance selection results in the group.

              * `machine_type`: Output only. Full machine-type names, e.g. "n1-standard-16".

              * `vm_count`: Output only. Number of VM provisioned with the machine_type.

          * `startup_config`: Configuration to handle the startup of instances during cluster create and update process.

            * `required_registration_fraction`: Optional. The config setting to enable cluster creation/ updation to be successful only after required_registration_fraction of instances are up and running. This configuration is applicable to only secondary workers for now. The cluster will fail if required_registration_fraction of instances are not available. This will include instance creation, agent registration, and service registration (if enabled).

        * `software_config`: Specifies the selection and config of software inside the cluster.

          * `image_version`: Optional. The version of software inside the cluster. It must be one of the supported Dataproc Versions (https://cloud.google.com/dataproc/docs/concepts/versioning/dataproc-versions#supported_dataproc_versions), such as "1.2" (including a subminor version, such as "1.2.29"), or the "preview" version (https://cloud.google.com/dataproc/docs/concepts/versioning/dataproc-versions#other_versions). If unspecified, it defaults to the latest Debian version.

          * `properties`: Optional. The properties to set on daemon config files.Property keys are specified in prefix:property format, for example core:hadoop.tmp.dir. The following are supported prefixes and their mappings: capacity-scheduler: capacity-scheduler.xml core: core-site.xml distcp: distcp-default.xml hdfs: hdfs-site.xml hive: hive-site.xml mapred: mapred-site.xml pig: pig.properties spark: spark-defaults.conf yarn: yarn-site.xmlFor more information, see Cluster properties (https://cloud.google.com/dataproc/docs/concepts/cluster-properties).

            * `additional_properties`:

          * `optional_components`: Optional. The set of components to activate on the cluster.

        * `initialization_actions`: Optional. Commands to execute on each node after config is completed. By default, executables are run on master and all worker nodes. You can test a node's role metadata to run an executable on a master or worker node, as shown below using curl (you can also use wget): ROLE=$(curl -H Metadata-Flavor:Google http://metadata/computeMetadata/v1/instance/attributes/dataproc-role) if [[ "${ROLE}" == 'Master' ]]; then ... master specific actions ... else ... worker specific actions ... fi

          * `executable_file`: Required. Cloud Storage URI of executable file.

          * `execution_timeout`: Optional. Amount of time executable has to complete. Default is 10 minutes (see JSON representation of Duration (https://developers.google.com/protocol-buffers/docs/proto3#json)).Cluster creation fails with an explanatory error message (the name of the executable that caused the error and the exceeded timeout period) if the executable is not completed at end of the timeout period.

        * `encryption_config`: Encryption settings for the cluster.

          * `gce_pd_kms_key_name`: Optional. The Cloud KMS key resource name to use for persistent disk encryption for all instances in the cluster. See Use CMEK with cluster data (https://cloud.google.com//dataproc/docs/concepts/configuring-clusters/customer-managed-encryption#use_cmek_with_cluster_data) for more information.

          * `kms_key`: Optional. The Cloud KMS key resource name to use for cluster persistent disk and job argument encryption. See Use CMEK with cluster data (https://cloud.google.com//dataproc/docs/concepts/configuring-clusters/customer-managed-encryption#use_cmek_with_cluster_data) for more information.When this key resource name is provided, the following job arguments of the following job types submitted to the cluster are encrypted using CMEK: FlinkJob args (https://cloud.google.com/dataproc/docs/reference/rest/v1/FlinkJob) HadoopJob args (https://cloud.google.com/dataproc/docs/reference/rest/v1/HadoopJob) SparkJob args (https://cloud.google.com/dataproc/docs/reference/rest/v1/SparkJob) SparkRJob args (https://cloud.google.com/dataproc/docs/reference/rest/v1/SparkRJob) PySparkJob args (https://cloud.google.com/dataproc/docs/reference/rest/v1/PySparkJob) SparkSqlJob (https://cloud.google.com/dataproc/docs/reference/rest/v1/SparkSqlJob) scriptVariables and queryList.queries HiveJob (https://cloud.google.com/dataproc/docs/reference/rest/v1/HiveJob) scriptVariables and queryList.queries PigJob (https://cloud.google.com/dataproc/docs/reference/rest/v1/PigJob) scriptVariables and queryList.queries PrestoJob (https://cloud.google.com/dataproc/docs/reference/rest/v1/PrestoJob) scriptVariables and queryList.queries

        * `autoscaling_config`: Autoscaling Policy config associated with the cluster.

          * `policy_uri`: Optional. The autoscaling policy used by the cluster.Only resource names including projectid and location (region) are valid. Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/locations/[dataproc_region]/autoscalingPolicies/[policy_id] projects/[project_id]/locations/[dataproc_region]/autoscalingPolicies/[policy_id]Note that the policy must be in the same project and Dataproc region.

        * `security_config`: Security related configuration, including encryption, Kerberos, etc.

          * `kerberos_config`: Specifies Kerberos related configuration.

            * `enable_kerberos`: Optional. Flag to indicate whether to Kerberize the cluster (default: false). Set this field to true to enable Kerberos on a cluster.

            * `root_principal_password_uri`: Optional. The Cloud Storage URI of a KMS encrypted file containing the root principal password.

            * `kms_key_uri`: Optional. The URI of the KMS key used to encrypt sensitive files.

            * `keystore_uri`: Optional. The Cloud Storage URI of the keystore file used for SSL encryption. If not provided, Dataproc will provide a self-signed certificate.

            * `truststore_uri`: Optional. The Cloud Storage URI of the truststore file used for SSL encryption. If not provided, Dataproc will provide a self-signed certificate.

            * `keystore_password_uri`: Optional. The Cloud Storage URI of a KMS encrypted file containing the password to the user provided keystore. For the self-signed certificate, this password is generated by Dataproc.

            * `key_password_uri`: Optional. The Cloud Storage URI of a KMS encrypted file containing the password to the user provided key. For the self-signed certificate, this password is generated by Dataproc.

            * `truststore_password_uri`: Optional. The Cloud Storage URI of a KMS encrypted file containing the password to the user provided truststore. For the self-signed certificate, this password is generated by Dataproc.

            * `cross_realm_trust_realm`: Optional. The remote realm the Dataproc on-cluster KDC will trust, should the user enable cross realm trust.

            * `cross_realm_trust_kdc`: Optional. The KDC (IP or hostname) for the remote trusted realm in a cross realm trust relationship.

            * `cross_realm_trust_admin_server`: Optional. The admin server (IP or hostname) for the remote trusted realm in a cross realm trust relationship.

            * `cross_realm_trust_shared_password_uri`: Optional. The Cloud Storage URI of a KMS encrypted file containing the shared password between the on-cluster Kerberos realm and the remote trusted realm, in a cross realm trust relationship.

            * `kdc_db_key_uri`: Optional. The Cloud Storage URI of a KMS encrypted file containing the master key of the KDC database.

            * `tgt_lifetime_hours`: Optional. The lifetime of the ticket granting ticket, in hours. If not specified, or user specifies 0, then default value 10 will be used.

            * `realm`: Optional. The name of the on-cluster Kerberos realm. If not specified, the uppercased domain of hostnames will be the realm.

          * `identity_config`: Identity related configuration, including service account based secure multi-tenancy user mappings.

            * `user_service_account_mapping`: Required. Map of user to service account.

              * `additional_properties`:

        * `lifecycle_config`: Specifies the cluster auto-delete schedule configuration.

          * `idle_delete_ttl`: Optional. The duration to keep the cluster alive while idling (when no jobs are running). Passing this threshold will cause the cluster to be deleted. Minimum value is 5 minutes; maximum value is 14 days (see JSON representation of Duration (https://developers.google.com/protocol-buffers/docs/proto3#json)).

          * `auto_delete_time`: Optional. The time when cluster will be auto-deleted (see JSON representation of Timestamp (https://developers.google.com/protocol-buffers/docs/proto3#json)).

          * `auto_delete_ttl`: Optional. The lifetime duration of cluster. The cluster will be auto-deleted at the end of this period. Minimum value is 10 minutes; maximum value is 14 days (see JSON representation of Duration (https://developers.google.com/protocol-buffers/docs/proto3#json)).

          * `idle_start_time`: Output only. The time when cluster became idle (most recent job finished) and became eligible for deletion due to idleness (see JSON representation of Timestamp (https://developers.google.com/protocol-buffers/docs/proto3#json)).

        * `endpoint_config`: Endpoint config for this cluster

          * `http_ports`: Output only. The map of port descriptions to URLs. Will only be populated if enable_http_port_access is true.

            * `additional_properties`:

          * `enable_http_port_access`: Optional. If true, enable http access to specific ports on the cluster from external sources. Defaults to false.

        * `metastore_config`: Specifies a Metastore configuration.

          * `dataproc_metastore_service`: Required. Resource name of an existing Dataproc Metastore service.Example: projects/[project_id]/locations/[dataproc_region]/services/[service-name]

        * `gke_cluster_config`: The cluster's GKE config.

          * `namespaced_gke_deployment_target`: Deprecated. Used only for the deprecated beta. A full, namespace-isolated deployment target for an existing GKE cluster.

            * `target_gke_cluster`: Optional. The target GKE cluster to deploy to. Format: 'projects/{project}/locations/{location}/clusters/{cluster_id}'

            * `cluster_namespace`: Optional. A namespace within the GKE cluster to deploy into.

          * `gke_cluster_target`: Optional. A target GKE cluster to deploy to. It must be in the same project and region as the Dataproc cluster (the GKE cluster can be zonal or regional). Format: 'projects/{project}/locations/{location}/clusters/{cluster_id}'

          * `node_pool_target`: Optional. GKE node pools where workloads will be scheduled. At least one node pool must be assigned the DEFAULT GkeNodePoolTarget.Role. If a GkeNodePoolTarget is not specified, Dataproc constructs a DEFAULT GkeNodePoolTarget. Each role can be given to only one GkeNodePoolTarget. All node pools must have the same location settings.

            * `node_pool`: Required. The target GKE node pool. Format: 'projects/{project}/locations/{location}/clusters/{cluster}/nodePools/{node_pool}'

            * `roles`: Required. The roles associated with the GKE node pool.

            * `node_pool_config`: The configuration of a GKE node pool used by a Dataproc-on-GKE cluster (https://cloud.google.com/dataproc/docs/concepts/jobs/dataproc-gke#create-a-dataproc-on-gke-cluster).

              * `config`: Parameters that describe cluster nodes.

                * `machine_type`: Optional. The name of a Compute Engine machine type (https://cloud.google.com/compute/docs/machine-types).

                * `local_ssd_count`: Optional. The number of local SSD disks to attach to the node, which is limited by the maximum number of disks allowable per zone (see Adding Local SSDs (https://cloud.google.com/compute/docs/disks/local-ssd)).

                * `preemptible`: Optional. Whether the nodes are created as legacy preemptible VM instances (https://cloud.google.com/compute/docs/instances/preemptible). Also see Spot VMs, preemptible VM instances without a maximum lifetime. Legacy and Spot preemptible nodes cannot be used in a node pool with the CONTROLLER role or in the DEFAULT node pool if the CONTROLLER role is not assigned (the DEFAULT node pool will assume the CONTROLLER role).

                * `accelerators`: Optional. A list of hardware accelerators (https://cloud.google.com/compute/docs/gpus) to attach to each node.

                  * `accelerator_count`: The number of accelerator cards exposed to an instance.

                  * `accelerator_type`: The accelerator type resource namename (see GPUs on Compute Engine).

                  * `gpu_partition_size`: Size of partitions to create on the GPU. Valid values are described in the NVIDIA mig user guide (https://docs.nvidia.com/datacenter/tesla/mig-user-guide/#partitioning).

                * `min_cpu_platform`: Optional. Minimum CPU platform (https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform) to be used by this instance. The instance may be scheduled on the specified or a newer CPU platform. Specify the friendly names of CPU platforms, such as "Intel Haswell"` or Intel Sandy Bridge".

                * `boot_disk_kms_key`: Optional. The Customer Managed Encryption Key (CMEK) (https://cloud.google.com/kubernetes-engine/docs/how-to/using-cmek) used to encrypt the boot disk attached to each node in the node pool. Specify the key using the following format: projects/{project}/locations/{location}/keyRings/{key_ring}/cryptoKeys/{crypto_key}

                * `spot`: Optional. Whether the nodes are created as Spot VM instances (https://cloud.google.com/compute/docs/instances/spot). Spot VMs are the latest update to legacy preemptible VMs. Spot VMs do not have a maximum lifetime. Legacy and Spot preemptible nodes cannot be used in a node pool with the CONTROLLER role or in the DEFAULT node pool if the CONTROLLER role is not assigned (the DEFAULT node pool will assume the CONTROLLER role).

              * `locations`: Optional. The list of Compute Engine zones (https://cloud.google.com/compute/docs/zones#available) where node pool nodes associated with a Dataproc on GKE virtual cluster will be located.Note: All node pools associated with a virtual cluster must be located in the same region as the virtual cluster, and they must be located in the same zone within that region.If a location is not specified during node pool creation, Dataproc on GKE will choose the zone.

              * `autoscaling`: GkeNodePoolAutoscaling contains information the cluster autoscaler needs to adjust the size of the node pool to the current cluster usage.

                * `min_node_count`: The minimum number of nodes in the node pool. Must be >= 0 and <= max_node_count.

                * `max_node_count`: The maximum number of nodes in the node pool. Must be >= min_node_count, and must be > 0. Note: Quota must be sufficient to scale up the cluster.

        * `dataproc_metric_config`: Dataproc metric config.

          * `metrics`: Required. Metrics sources to enable.

            * `metric_source`: Required. A standard set of metrics is collected unless metricOverrides are specified for the metric source (see Custom metrics (https://cloud.google.com/dataproc/docs/guides/dataproc-metrics#custom_metrics) for more information).
            Possible values:
              * METRIC_SOURCE_UNSPECIFIED
              * MONITORING_AGENT_DEFAULTS
              * HDFS
              * SPARK
              * YARN
              * SPARK_HISTORY_SERVER
              * HIVESERVER2
              * HIVEMETASTORE
              * FLINK

            * `metric_overrides`: Optional. Specify one or more Custom metrics (https://cloud.google.com/dataproc/docs/guides/dataproc-metrics#custom_metrics) to collect for the metric course (for the SPARK metric source (any Spark metric (https://spark.apache.org/docs/latest/monitoring.html#metrics) can be specified).Provide metrics in the following format: METRIC_SOURCE: INSTANCE:GROUP:METRIC Use camelcase as appropriate.Examples: yarn:ResourceManager:QueueMetrics:AppsCompleted spark:driver:DAGScheduler:job.allJobs sparkHistoryServer:JVM:Memory:NonHeapMemoryUsage.committed hiveserver2:JVM:Memory:NonHeapMemoryUsage.used Notes: Only the specified overridden metrics are collected for the metric source. For example, if one or more spark:executive metrics are listed as metric overrides, other SPARK metrics are not collected. The collection of the metrics for other enabled custom metric sources is unaffected. For example, if both SPARK andd YARN metric sources are enabled, and overrides are provided for Spark metrics only, all YARN metrics are collected.

        * `auxiliary_node_groups`: Optional. The node group settings.

          * `node_group`: Dataproc Node Group. The Dataproc NodeGroup resource is not related to the Dataproc NodeGroupAffinity resource.

            * `name`: The Node group resource name (https://aip.dev/122).

            * `roles`: Required. Node group roles.

            * `node_group_config`: The config settings for Compute Engine resources in an instance group, such as a master or worker group.

              * `num_instances`: Optional. The number of VM instances in the instance group. For HA cluster master_config groups, must be set to 3. For standard cluster master_config groups, must be set to 1.

              * `instance_names`: Output only. The list of instance names. Dataproc derives the names from cluster_name, num_instances, and the instance group.

              * `instance_references`: Output only. List of references to Compute Engine instances.

                * `instance_name`: The user-friendly name of the Compute Engine instance.

                * `instance_id`: The unique identifier of the Compute Engine instance.

                * `public_key`: The public RSA key used for sharing data with this instance.

                * `public_ecies_key`: The public ECIES key used for sharing data with this instance.

              * `image_uri`: Optional. The Compute Engine image resource used for cluster instances.The URI can represent an image or image family.Image examples: https://www.googleapis.com/compute/v1/projects/[project_id]/global/images/[image-id] projects/[project_id]/global/images/[image-id] image-idImage family examples. Dataproc will use the most recent image from the family: https://www.googleapis.com/compute/v1/projects/[project_id]/global/images/family/[custom-image-family-name] projects/[project_id]/global/images/family/[custom-image-family-name]If the URI is unspecified, it will be inferred from SoftwareConfig.image_version or the system default.

              * `machine_type_uri`: Optional. The Compute Engine machine type used for cluster instances.A full URL, partial URI, or short name are valid. Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/zones/[zone]/machineTypes/n1-standard-2 projects/[project_id]/zones/[zone]/machineTypes/n1-standard-2 n1-standard-2Auto Zone Exception: If you are using the Dataproc Auto Zone Placement (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/auto-zone#using_auto_zone_placement) feature, you must use the short name of the machine type resource, for example, n1-standard-2.

              * `disk_config`: Specifies the config of disk options for a group of VM instances.

                * `boot_disk_type`: Optional. Type of the boot disk (default is "pd-standard"). Valid values: "pd-balanced" (Persistent Disk Balanced Solid State Drive), "pd-ssd" (Persistent Disk Solid State Drive), or "pd-standard" (Persistent Disk Hard Disk Drive). See Disk types (https://cloud.google.com/compute/docs/disks#disk-types).

                * `boot_disk_size_gb`: Optional. Size in GB of the boot disk (default is 500GB).

                * `num_local_ssds`: Optional. Number of attached SSDs, from 0 to 8 (default is 0). If SSDs are not attached, the boot disk is used to store runtime logs and HDFS (https://hadoop.apache.org/docs/r1.2.1/hdfs_user_guide.html) data. If one or more SSDs are attached, this runtime bulk data is spread across them, and the boot disk contains only basic config and installed binaries.Note: Local SSD options may vary by machine type and number of vCPUs selected.

                * `local_ssd_interface`: Optional. Interface type of local SSDs (default is "scsi"). Valid values: "scsi" (Small Computer System Interface), "nvme" (Non-Volatile Memory Express). See local SSD performance (https://cloud.google.com/compute/docs/disks/local-ssd#performance).

              * `is_preemptible`: Output only. Specifies that this instance group contains preemptible instances.

              * `preemptibility`: Optional. Specifies the preemptibility of the instance group.The default value for master and worker groups is NON_PREEMPTIBLE. This default cannot be changed.The default value for secondary instances is PREEMPTIBLE.
              Possible values:
                * PREEMPTIBILITY_UNSPECIFIED
                * NON_PREEMPTIBLE
                * PREEMPTIBLE
                * SPOT

              * `managed_group_config`: Specifies the resources used to actively manage an instance group.

                * `instance_template_name`: Output only. The name of the Instance Template used for the Managed Instance Group.

                * `instance_group_manager_name`: Output only. The name of the Instance Group Manager for this group.

                * `instance_group_manager_uri`: Output only. The partial URI to the instance group manager for this group. E.g. projects/my-project/regions/us-central1/instanceGroupManagers/my-igm.

              * `accelerators`: Optional. The Compute Engine accelerator configuration for these instances.

                * `accelerator_type_uri`: Full URL, partial URI, or short name of the accelerator type resource to expose to this instance. See Compute Engine AcceleratorTypes (https://cloud.google.com/compute/docs/reference/v1/acceleratorTypes).Examples: https://www.googleapis.com/compute/v1/projects/[project_id]/zones/[zone]/acceleratorTypes/nvidia-tesla-t4 projects/[project_id]/zones/[zone]/acceleratorTypes/nvidia-tesla-t4 nvidia-tesla-t4Auto Zone Exception: If you are using the Dataproc Auto Zone Placement (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/auto-zone#using_auto_zone_placement) feature, you must use the short name of the accelerator type resource, for example, nvidia-tesla-t4.

                * `accelerator_count`: The number of the accelerator cards of this type exposed to this instance.

              * `min_cpu_platform`: Optional. Specifies the minimum cpu platform for the Instance Group. See Dataproc -> Minimum CPU Platform (https://cloud.google.com/dataproc/docs/concepts/compute/dataproc-min-cpu).

              * `min_num_instances`: Optional. The minimum number of primary worker instances to create. If min_num_instances is set, cluster creation will succeed if the number of primary workers created is at least equal to the min_num_instances number.Example: Cluster creation request with num_instances = 5 and min_num_instances = 3: If 4 VMs are created and 1 instance fails, the failed VM is deleted. The cluster is resized to 4 instances and placed in a RUNNING state. If 2 instances are created and 3 instances fail, the cluster in placed in an ERROR state. The failed VMs are not deleted.

              * `instance_flexibility_policy`: Instance flexibility Policy allowing a mixture of VM shapes and provisioning models.

                * `instance_selection_list`: Optional. List of instance selection options that the group will use when creating new VMs.

                  * `machine_types`: Optional. Full machine-type names, e.g. "n1-standard-16".

                  * `rank`: Optional. Preference of this instance selection. Lower number means higher preference. Dataproc will first try to create a VM based on the machine-type with priority rank and fallback to next rank based on availability. Machine types and instance selections with the same priority have the same preference.

                * `instance_selection_results`: Output only. A list of instance selection results in the group.

                  * `machine_type`: Output only. Full machine-type names, e.g. "n1-standard-16".

                  * `vm_count`: Output only. Number of VM provisioned with the machine_type.

              * `startup_config`: Configuration to handle the startup of instances during cluster create and update process.

                * `required_registration_fraction`: Optional. The config setting to enable cluster creation/ updation to be successful only after required_registration_fraction of instances are up and running. This configuration is applicable to only secondary workers for now. The cluster will fail if required_registration_fraction of instances are not available. This will include instance creation, agent registration, and service registration (if enabled).

            * `labels`: Optional. Node group labels. Label keys must consist of from 1 to 63 characters and conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.txt). Label values can be empty. If specified, they must consist of from 1 to 63 characters and conform to RFC 1035 (https://www.ietf.org/rfc/rfc1035.txt). The node group must have no more than 32 labelsn.

              * `additional_properties`:

          * `node_group_id`: Optional. A node group ID. Generated if not specified.The ID must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), and hyphens (-). Cannot begin or end with underscore or hyphen. Must consist of from 3 to 33 characters.

      * `labels`: Optional. The labels to associate with this cluster.Label keys must be between 1 and 63 characters long, and must conform to the following PCRE regular expression: \p{Ll}\p{Lo}{0,62}Label values must be between 1 and 63 characters long, and must conform to the following PCRE regular expression: \p{Ll}\p{Lo}\p{N}_-{0,63}No more than 32 labels can be associated with a given cluster.

        * `additional_properties`:

    * `cluster_selector`: A selector that chooses target cluster for jobs based on metadata.

      * `zone`: Optional. The zone where workflow process executes. This parameter does not affect the selection of the cluster.If unspecified, the zone of the first cluster matching the selector is used.

      * `cluster_labels`: Required. The cluster labels. Cluster must have all labels to match.

        * `additional_properties`:

  * `jobs`: Required. The Directed Acyclic Graph of Jobs to submit.

    * `step_id`: Required. The step id. The id must be unique among all jobs within the template.The step id is used as prefix for job id, as job goog-dataproc-workflow-step-id label, and in prerequisiteStepIds field from other steps.The id must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), and hyphens (-). Cannot begin or end with underscore or hyphen. Must consist of between 3 and 50 characters.

    * `hadoop_job`: A Dataproc job for running Apache Hadoop MapReduce (https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html) jobs on Apache Hadoop YARN (https://hadoop.apache.org/docs/r2.7.1/hadoop-yarn/hadoop-yarn-site/YARN.html).

      * `main_jar_file_uri`: The HCFS URI of the jar file containing the main class. Examples: 'gs://foo-bucket/analytics-binaries/extract-useful-metrics-mr.jar' 'hdfs:/tmp/test-samples/custom-wordcount.jar' 'file:///home/usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar'

      * `main_class`: The name of the driver's main class. The jar file containing the class must be in the default CLASSPATH or specified in jar_file_uris.

      * `args`: Optional. The arguments to pass to the driver. Do not include arguments, such as -libjars or -Dfoo=bar, that can be set as job properties, since a collision might occur that causes an incorrect job submission.

      * `jar_file_uris`: Optional. Jar file URIs to add to the CLASSPATHs of the Hadoop driver and tasks.

      * `file_uris`: Optional. HCFS (Hadoop Compatible Filesystem) URIs of files to be copied to the working directory of Hadoop drivers and distributed tasks. Useful for naively parallel tasks.

      * `archive_uris`: Optional. HCFS URIs of archives to be extracted in the working directory of Hadoop drivers and tasks. Supported file types: .jar, .tar, .tar.gz, .tgz, or .zip.

      * `properties`: Optional. A mapping of property names to values, used to configure Hadoop. Properties that conflict with values set by the Dataproc API might be overwritten. Can include properties set in /etc/hadoop/conf/*-site and classes in user code.

        * `additional_properties`:

      * `logging_config`: The runtime logging config of the job.

        * `driver_log_levels`: The per-package log levels for the driver. This can include "root" package name to configure rootLogger. Examples: - 'com.google = FATAL' - 'root = INFO' - 'org.apache = DEBUG'

          * `additional_properties`:

    * `spark_job`: A Dataproc job for running Apache Spark (https://spark.apache.org/) applications on YARN.

      * `main_jar_file_uri`: The HCFS URI of the jar file that contains the main class.

      * `main_class`: The name of the driver's main class. The jar file that contains the class must be in the default CLASSPATH or specified in SparkJob.jar_file_uris.

      * `args`: Optional. The arguments to pass to the driver. Do not include arguments, such as --conf, that can be set as job properties, since a collision may occur that causes an incorrect job submission.

      * `jar_file_uris`: Optional. HCFS URIs of jar files to add to the CLASSPATHs of the Spark driver and tasks.

      * `file_uris`: Optional. HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks.

      * `archive_uris`: Optional. HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip.

      * `properties`: Optional. A mapping of property names to values, used to configure Spark. Properties that conflict with values set by the Dataproc API might be overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf and classes in user code.

        * `additional_properties`:

      * `logging_config`: The runtime logging config of the job.

        * `driver_log_levels`: The per-package log levels for the driver. This can include "root" package name to configure rootLogger. Examples: - 'com.google = FATAL' - 'root = INFO' - 'org.apache = DEBUG'

          * `additional_properties`:

    * `pyspark_job`: A Dataproc job for running Apache PySpark (https://spark.apache.org/docs/0.9.0/python-programming-guide.html) applications on YARN.

      * `main_python_file_uri`: Required. The HCFS URI of the main Python file to use as the driver. Must be a .py file.

      * `args`: Optional. The arguments to pass to the driver. Do not include arguments, such as --conf, that can be set as job properties, since a collision may occur that causes an incorrect job submission.

      * `python_file_uris`: Optional. HCFS file URIs of Python files to pass to the PySpark framework. Supported file types: .py, .egg, and .zip.

      * `jar_file_uris`: Optional. HCFS URIs of jar files to add to the CLASSPATHs of the Python driver and tasks.

      * `file_uris`: Optional. HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks.

      * `archive_uris`: Optional. HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip.

      * `properties`: Optional. A mapping of property names to values, used to configure PySpark. Properties that conflict with values set by the Dataproc API might be overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf and classes in user code.

        * `additional_properties`:

      * `logging_config`: The runtime logging config of the job.

        * `driver_log_levels`: The per-package log levels for the driver. This can include "root" package name to configure rootLogger. Examples: - 'com.google = FATAL' - 'root = INFO' - 'org.apache = DEBUG'

          * `additional_properties`:

    * `hive_job`: A Dataproc job for running Apache Hive (https://hive.apache.org/) queries on YARN.

      * `query_file_uri`: The HCFS URI of the script that contains Hive queries.

      * `query_list`: A list of queries to run on a cluster.

        * `queries`: Required. The queries to execute. You do not need to end a query expression with a semicolon. Multiple queries can be specified in one string by separating each with a semicolon. Here is an example of a Dataproc API snippet that uses a QueryList to specify a HiveJob: "hiveJob": { "queryList": { "queries": [ "query1", "query2", "query3;query4", ] } }

      * `continue_on_failure`: Optional. Whether to continue executing queries if a query fails. The default value is false. Setting to true can be useful when executing independent parallel queries.

      * `script_variables`: Optional. Mapping of query variable names to values (equivalent to the Hive command: SET name="value";).

        * `additional_properties`:

      * `properties`: Optional. A mapping of property names and values, used to configure Hive. Properties that conflict with values set by the Dataproc API might be overwritten. Can include properties set in /etc/hadoop/conf/*-site.xml, /etc/hive/conf/hive-site.xml, and classes in user code.

        * `additional_properties`:

      * `jar_file_uris`: Optional. HCFS URIs of jar files to add to the CLASSPATH of the Hive server and Hadoop MapReduce (MR) tasks. Can contain Hive SerDes and UDFs.

    * `pig_job`: A Dataproc job for running Apache Pig (https://pig.apache.org/) queries on YARN.

      * `query_file_uri`: The HCFS URI of the script that contains the Pig queries.

      * `query_list`: A list of queries to run on a cluster.

        * `queries`: Required. The queries to execute. You do not need to end a query expression with a semicolon. Multiple queries can be specified in one string by separating each with a semicolon. Here is an example of a Dataproc API snippet that uses a QueryList to specify a HiveJob: "hiveJob": { "queryList": { "queries": [ "query1", "query2", "query3;query4", ] } }

      * `continue_on_failure`: Optional. Whether to continue executing queries if a query fails. The default value is false. Setting to true can be useful when executing independent parallel queries.

      * `script_variables`: Optional. Mapping of query variable names to values (equivalent to the Pig command: name=[value]).

        * `additional_properties`:

      * `properties`: Optional. A mapping of property names to values, used to configure Pig. Properties that conflict with values set by the Dataproc API might be overwritten. Can include properties set in /etc/hadoop/conf/*-site.xml, /etc/pig/conf/pig.properties, and classes in user code.

        * `additional_properties`:

      * `jar_file_uris`: Optional. HCFS URIs of jar files to add to the CLASSPATH of the Pig Client and Hadoop MapReduce (MR) tasks. Can contain Pig UDFs.

      * `logging_config`: The runtime logging config of the job.

        * `driver_log_levels`: The per-package log levels for the driver. This can include "root" package name to configure rootLogger. Examples: - 'com.google = FATAL' - 'root = INFO' - 'org.apache = DEBUG'

          * `additional_properties`:

    * `spark_r_job`: A Dataproc job for running Apache SparkR (https://spark.apache.org/docs/latest/sparkr.html) applications on YARN.

      * `main_r_file_uri`: Required. The HCFS URI of the main R file to use as the driver. Must be a .R file.

      * `args`: Optional. The arguments to pass to the driver. Do not include arguments, such as --conf, that can be set as job properties, since a collision may occur that causes an incorrect job submission.

      * `file_uris`: Optional. HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks.

      * `archive_uris`: Optional. HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip.

      * `properties`: Optional. A mapping of property names to values, used to configure SparkR. Properties that conflict with values set by the Dataproc API might be overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf and classes in user code.

        * `additional_properties`:

      * `logging_config`: The runtime logging config of the job.

        * `driver_log_levels`: The per-package log levels for the driver. This can include "root" package name to configure rootLogger. Examples: - 'com.google = FATAL' - 'root = INFO' - 'org.apache = DEBUG'

          * `additional_properties`:

    * `spark_sql_job`: A Dataproc job for running Apache Spark SQL (https://spark.apache.org/sql/) queries.

      * `query_file_uri`: The HCFS URI of the script that contains SQL queries.

      * `query_list`: A list of queries to run on a cluster.

        * `queries`: Required. The queries to execute. You do not need to end a query expression with a semicolon. Multiple queries can be specified in one string by separating each with a semicolon. Here is an example of a Dataproc API snippet that uses a QueryList to specify a HiveJob: "hiveJob": { "queryList": { "queries": [ "query1", "query2", "query3;query4", ] } }

      * `script_variables`: Optional. Mapping of query variable names to values (equivalent to the Spark SQL command: SET name="value";).

        * `additional_properties`:

      * `properties`: Optional. A mapping of property names to values, used to configure Spark SQL's SparkConf. Properties that conflict with values set by the Dataproc API might be overwritten.

        * `additional_properties`:

      * `jar_file_uris`: Optional. HCFS URIs of jar files to be added to the Spark CLASSPATH.

      * `logging_config`: The runtime logging config of the job.

        * `driver_log_levels`: The per-package log levels for the driver. This can include "root" package name to configure rootLogger. Examples: - 'com.google = FATAL' - 'root = INFO' - 'org.apache = DEBUG'

          * `additional_properties`:

    * `presto_job`: A Dataproc job for running Presto (https://prestosql.io/) queries. IMPORTANT: The Dataproc Presto Optional Component (https://cloud.google.com/dataproc/docs/concepts/components/presto) must be enabled when the cluster is created to submit a Presto job to the cluster.

      * `query_file_uri`: The HCFS URI of the script that contains SQL queries.

      * `query_list`: A list of queries to run on a cluster.

        * `queries`: Required. The queries to execute. You do not need to end a query expression with a semicolon. Multiple queries can be specified in one string by separating each with a semicolon. Here is an example of a Dataproc API snippet that uses a QueryList to specify a HiveJob: "hiveJob": { "queryList": { "queries": [ "query1", "query2", "query3;query4", ] } }

      * `continue_on_failure`: Optional. Whether to continue executing queries if a query fails. The default value is false. Setting to true can be useful when executing independent parallel queries.

      * `output_format`: Optional. The format in which query output will be displayed. See the Presto documentation for supported output formats

      * `client_tags`: Optional. Presto client tags to attach to this query

      * `properties`: Optional. A mapping of property names to values. Used to set Presto session properties (https://prestodb.io/docs/current/sql/set-session.html) Equivalent to using the --session flag in the Presto CLI

        * `additional_properties`:

      * `logging_config`: The runtime logging config of the job.

        * `driver_log_levels`: The per-package log levels for the driver. This can include "root" package name to configure rootLogger. Examples: - 'com.google = FATAL' - 'root = INFO' - 'org.apache = DEBUG'

          * `additional_properties`:

    * `trino_job`: A Dataproc job for running Trino (https://trino.io/) queries. IMPORTANT: The Dataproc Trino Optional Component (https://cloud.google.com/dataproc/docs/concepts/components/trino) must be enabled when the cluster is created to submit a Trino job to the cluster.

      * `query_file_uri`: The HCFS URI of the script that contains SQL queries.

      * `query_list`: A list of queries to run on a cluster.

        * `queries`: Required. The queries to execute. You do not need to end a query expression with a semicolon. Multiple queries can be specified in one string by separating each with a semicolon. Here is an example of a Dataproc API snippet that uses a QueryList to specify a HiveJob: "hiveJob": { "queryList": { "queries": [ "query1", "query2", "query3;query4", ] } }

      * `continue_on_failure`: Optional. Whether to continue executing queries if a query fails. The default value is false. Setting to true can be useful when executing independent parallel queries.

      * `output_format`: Optional. The format in which query output will be displayed. See the Trino documentation for supported output formats

      * `client_tags`: Optional. Trino client tags to attach to this query

      * `properties`: Optional. A mapping of property names to values. Used to set Trino session properties (https://trino.io/docs/current/sql/set-session.html) Equivalent to using the --session flag in the Trino CLI

        * `additional_properties`:

      * `logging_config`: The runtime logging config of the job.

        * `driver_log_levels`: The per-package log levels for the driver. This can include "root" package name to configure rootLogger. Examples: - 'com.google = FATAL' - 'root = INFO' - 'org.apache = DEBUG'

          * `additional_properties`:

    * `flink_job`: A Dataproc job for running Apache Flink applications on YARN.

      * `main_jar_file_uri`: The HCFS URI of the jar file that contains the main class.

      * `main_class`: The name of the driver's main class. The jar file that contains the class must be in the default CLASSPATH or specified in jarFileUris.

      * `args`: Optional. The arguments to pass to the driver. Do not include arguments, such as --conf, that can be set as job properties, since a collision might occur that causes an incorrect job submission.

      * `jar_file_uris`: Optional. HCFS URIs of jar files to add to the CLASSPATHs of the Flink driver and tasks.

      * `savepoint_uri`: Optional. HCFS URI of the savepoint, which contains the last saved progress for starting the current job.

      * `properties`: Optional. A mapping of property names to values, used to configure Flink. Properties that conflict with values set by the Dataproc API might beoverwritten. Can include properties set in/etc/flink/conf/flink-defaults.conf and classes in user code.

        * `additional_properties`:

      * `logging_config`: The runtime logging config of the job.

        * `driver_log_levels`: The per-package log levels for the driver. This can include "root" package name to configure rootLogger. Examples: - 'com.google = FATAL' - 'root = INFO' - 'org.apache = DEBUG'

          * `additional_properties`:

    * `labels`: Optional. The labels to associate with this job.Label keys must be between 1 and 63 characters long, and must conform to the following regular expression: \p{Ll}\p{Lo}{0,62}Label values must be between 1 and 63 characters long, and must conform to the following regular expression: \p{Ll}\p{Lo}\p{N}_-{0,63}No more than 32 labels can be associated with a given job.

      * `additional_properties`:

    * `scheduling`: Job scheduling options.

      * `max_failures_per_hour`: Optional. Maximum number of times per hour a driver can be restarted as a result of driver exiting with non-zero code before job is reported failed.A job might be reported as thrashing if the driver exits with a non-zero code four times within a 10-minute window.Maximum value is 10.Note: This restartable job option is not supported in Dataproc workflow templates (https://cloud.google.com/dataproc/docs/concepts/workflows/using-workflows#adding_jobs_to_a_template).

      * `max_failures_total`: Optional. Maximum total number of times a driver can be restarted as a result of the driver exiting with a non-zero code. After the maximum number is reached, the job will be reported as failed.Maximum value is 240.Note: Currently, this restartable job option is not supported in Dataproc workflow templates (https://cloud.google.com/dataproc/docs/concepts/workflows/using-workflows#adding_jobs_to_a_template).

    * `prerequisite_step_ids`: Optional. The optional list of prerequisite job step_ids. If not specified, the job will start at the beginning of workflow.

  * `parameters`: Optional. Template parameters whose values are substituted into the template. Values for parameters must be provided when the template is instantiated.

    * `name`: Required. Parameter name. The parameter name is used as the key, and paired with the parameter value, which are passed to the template when the template is instantiated. The name must contain only capital letters (A-Z), numbers (0-9), and underscores (_), and must not start with a number. The maximum length is 40 characters.

    * `fields`: Required. Paths to all fields that the parameter replaces. A field is allowed to appear in at most one parameter's list of field paths.A field path is similar in syntax to a google.protobuf.FieldMask. For example, a field path that references the zone field of a workflow template's cluster selector would be specified as placement.clusterSelector.zone.Also, field paths can reference fields using the following syntax: Values in maps can be referenced by key: labels'key' placement.clusterSelector.clusterLabels'key' placement.managedCluster.labels'key' placement.clusterSelector.clusterLabels'key' jobs'step-id'.labels'key' Jobs in the jobs list can be referenced by step-id: jobs'step-id'.hadoopJob.mainJarFileUri jobs'step-id'.hiveJob.queryFileUri jobs'step-id'.pySparkJob.mainPythonFileUri jobs'step-id'.hadoopJob.jarFileUris0 jobs'step-id'.hadoopJob.archiveUris0 jobs'step-id'.hadoopJob.fileUris0 jobs'step-id'.pySparkJob.pythonFileUris0 Items in repeated fields can be referenced by a zero-based index: jobs'step-id'.sparkJob.args0 Other examples: jobs'step-id'.hadoopJob.properties'key' jobs'step-id'.hadoopJob.args0 jobs'step-id'.hiveJob.scriptVariables'key' jobs'step-id'.hadoopJob.mainJarFileUri placement.clusterSelector.zoneIt may not be possible to parameterize maps and repeated fields in their entirety since only individual map values and individual items in repeated fields can be referenced. For example, the following field paths are invalid: placement.clusterSelector.clusterLabels jobs'step-id'.sparkJob.args

    * `description`: Optional. Brief description of the parameter. Must not exceed 1024 characters.

    * `validation`: Configuration for parameter validation.

      * `regex`: Validation based on regular expressions.

        * `regexes`: Required. RE2 regular expressions used to validate the parameter's value. The value must match the regex in its entirety (substring matches are not sufficient).

      * `values`: Validation based on a list of allowed values.

        * `values`: Required. List of allowed values for the parameter.

  * `dag_timeout`: Optional. Timeout duration for the DAG of jobs, expressed in seconds (see JSON representation of duration (https://developers.google.com/protocol-buffers/docs/proto3#json)). The timeout duration must be from 10 minutes ("600s") to 24 hours ("86400s"). The timer begins when the first job is submitted. If the workflow is running at the end of the timeout period, any remaining jobs are cancelled, the workflow is ended, and if the workflow was running on a managed cluster, the cluster is deleted.

  * `encryption_config`: Encryption settings for encrypting workflow template job arguments.

    * `kms_key`: Optional. The Cloud KMS key name to use for encrypting workflow template job arguments.When this this key is provided, the following workflow template job arguments (https://cloud.google.com/dataproc/docs/concepts/workflows/use-workflows#adding_jobs_to_a_template), if present, are CMEK encrypted (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/customer-managed-encryption#use_cmek_with_workflow_template_data): FlinkJob args (https://cloud.google.com/dataproc/docs/reference/rest/v1/FlinkJob) HadoopJob args (https://cloud.google.com/dataproc/docs/reference/rest/v1/HadoopJob) SparkJob args (https://cloud.google.com/dataproc/docs/reference/rest/v1/SparkJob) SparkRJob args (https://cloud.google.com/dataproc/docs/reference/rest/v1/SparkRJob) PySparkJob args (https://cloud.google.com/dataproc/docs/reference/rest/v1/PySparkJob) SparkSqlJob (https://cloud.google.com/dataproc/docs/reference/rest/v1/SparkSqlJob) scriptVariables and queryList.queries HiveJob (https://cloud.google.com/dataproc/docs/reference/rest/v1/HiveJob) scriptVariables and queryList.queries PigJob (https://cloud.google.com/dataproc/docs/reference/rest/v1/PigJob) scriptVariables and queryList.queries PrestoJob (https://cloud.google.com/dataproc/docs/reference/rest/v1/PrestoJob) scriptVariables and queryList.queries


## GCP permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
