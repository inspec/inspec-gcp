# Configuration helper for GCP & Inspec
# - Terraform expects a JSON variable file
# - Inspec expects a YAML attribute file
# This allows to store all transient parameters in one place.
# If any of the @config keys are exported as environment variables in uppercase, these take precedence.
require 'json'
require 'yaml'
require 'erb'

module GCPInspecConfig

  # helper method for adding random strings
  def self.add_random_string(length = 25)
    "#{(0...length).map { (65 + rand(26)).chr }.join.downcase}"
  end

  # Config for terraform / inspec in the below hash
  @config = {
      # Generic GCP resource parameters
      :gcp_project_name => "SPaterson Project",
      :gcp_project_id => "spaterson-project",
      :gcp_project_number => "1041358276233",
      # Determine the storage account name and the admin password
      :gcp_location => "europe-west2",
      :gcp_zone => "europe-west2-a",
      :gcp_zone_id => "2290",
      :gcp_region_id => "1290",
      # Cloud functions are only available in certain regions
      :gcp_cloud_function_region => "us-central1",
      :gcp_int_vm_name => "gcp-inspec-int-linux-vm",
      :gcp_int_vm_size => "f1-micro",
      :gcp_int_vm_image => "ubuntu-os-cloud/ubuntu-1604-lts",
      :gcp_ext_vm_name => "gcp-inspec-ext-linux-vm",
      :gcp_ext_vm_size => "f1-micro",
      :gcp_ext_vm_image => "ubuntu-os-cloud/ubuntu-1604-lts",
      :gcp_ext_compute_address_name => "gcp-inspec-generic-ext-compute-address",
      :gcp_windows_int_vm_image => "windows-cloud/windows-server-2016-dc-core-v20180313",
      :gcp_windows_int_vm_name => "gcp-inspec-int-windows-vm",
      # Recommended to upgrade to a minimum of g1-small
      :gcp_windows_int_vm_size => "g1-small",
      :gcp_service_account_display_name => "gcp-inspec-service-account",
      # We need to randomize the name of this role to avoid e.g.
      #    Error 400: You can't create a role with role_id (gcp_inspec_project_custom_role_id) where there is an existing role with that role_id in a deleted state.
      :gcp_project_iam_custom_role_id => "gcp_inspec_custom_role_id_#{add_random_string}",
      :gcp_compute_disk_name => "gcp-inspec-compute-disk-name",
      :gcp_compute_disk_type => "pd-standard",
      :gcp_compute_disk_image => "ubuntu-os-cloud/ubuntu-1604-lts",
      :gcp_ext_vm_data_disk_address_name => "gcp-inspec-generic-ext-compute-data-disk-address",
      :gcp_ext_vm_data_disk_name => "gcp-inspec-generic-ext-linux-vm-data-disk",
      :gcp_ext_vm_data_disk_size => "f1-micro",
      :gcp_ext_vm_data_disk_image => "ubuntu-os-cloud/ubuntu-1604-lts",
      :gcp_storage_bucket_name => "gcp-inspec-storage-bucket-#{add_random_string}",
      :gcp_storage_bucket_acl => "gcp-inspec-storage-bucket-acl-#{add_random_string}",
      :gcp_storage_bucket_binding => "gcp-inspec-storage-bucket-iam-binding-#{add_random_string}",
      :gcp_storage_bucket_member => "gcp-inspec-storage-bucket-iam-member-#{add_random_string}",
      :gcp_storage_bucket_policy => "gcp-inspec-storage-bucket-iam-policy-#{add_random_string}",
      :gcp_storage_bucket_object => "gcp-inspec-storage-bucket-object-#{add_random_string}",
      :gcp_storage_bucket_object_name => "bucket-object-#{add_random_string}",
      # Google Load Balanced App example parameters
      :gcp_lb_network => "default",
      :gcp_lb_region => "europe-west2",
      :gcp_lb_zone => "europe-west2-a",
      :gcp_lb_zone_mig2 => "europe-west2-b",
      :gcp_lb_zone_mig3 => "europe-west2-c",
      :gcp_lb_fr_name => "gcp-inspec-app-lb-fr-mig1",
      :gcp_lb_ilb_name => "gcp-inspec-app-lb-internal",
      :gcp_lb_mig1_name => "gcp-inspec-app-mig1",
      :gcp_lb_mig2_name => "gcp-inspec-app-mig2",
      :gcp_lb_mig3_name => "gcp-inspec-app-mig3",
      # GKE example parameters
      :gcp_kube_cluster_name => "gcp-inspec-kube-cluster",
      :gcp_kube_cluster_zone => "europe-west2-a",
      :gcp_kube_cluster_size => 1,
      :gcp_kube_cluster_zone_extra1 => "europe-west2-b",
      :gcp_kube_cluster_zone_extra2 => "europe-west2-c",
      :gcp_kube_cluster_master_user => "gcp-inspec-kube-admin",
      :gcp_kube_cluster_master_pass => (("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a + %w{! @ # $ % & / ( ) + ? *}).sample(20).join,
      :gcp_kube_nodepool_name => "default-pool",
      :gcp_inspec_user_email => "user:chef@example.com",
      :gcp_kms_key_ring_policy_name => "gcp-inspec-kms-key-ring-#{add_random_string}",
      :gcp_kms_key_ring_binding_member_name => "gcp-inspec-kms-key-ring-#{add_random_string}",
      :gcp_kms_crypto_key_name_policy => "gcp-inspec-kms-crypto-key-policy-#{add_random_string}",
      :gcp_kms_crypto_key_name_binding => "gcp-inspec-kms-crypto-key-binding-#{add_random_string}",
      :gcp_logging_vm_name => "gcp-inspec-logging-vm",
      :gcp_logging_bucket_name => "gcp-inspec-logging-#{add_random_string}",
      :gcp_logging_project_sink_name => "gcp-inspec-logging-project-#{add_random_string}",
      :gcp_logging_project_exclusion_name => "gcp-inspec-project-exclusion-#{add_random_string}",
      :gcp_network_name => "gcp-inspec-network",
      :gcp_subnetwork_name => "gcp-inspec-subnetwork",
      :gcp_vpn_gateway_name => "gcp-inspec-gateway",
      :gcp_vpn_tunnel_name => "gcp-inspec-tunnel",
      :gcp_fr_esp_name => "gcp-inspec-fr-esp",
      :gcp_fr_udp_name => "gcp-inspec-fr-udp",
      :gcp_address_name => "gcp-inspec-address",
      :gcp_vpn_address_name => "gcp-inspec-vpn-address",
      :gcp_db_instance_name => "gcp-inspec-db-#{add_random_string}",
      :gcp_db_name => "inspecgcp",
      :gcp_db_type => "MYSQL_5_7",
      :gcp_db_size => "db-f1-micro",
      :gcp_db_user_name => "inspecgcpuser",
      :gcp_db_user_password => (("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a + %w{! @ # $ % & / ( ) + ? *}).sample(20).join,
      # Some resources require elevated privileges to create and therefore test against.  The below flag is used to control
      # both the terraform resource creation and the inspec test execution for those resources.  Default behaviour is for this to
      # be disabled meaning a user needs no special GCP privileges to run the integration test pack.
      #
      # Note, would prefer to use boolean true or false here but will revisit for a future version of tf, see here for more detail: https://www.terraform.io/docs/configuration/variables.html
      :gcp_enable_privileged_resources => 0,
      # Some controls make use of the gcloud command and grep to discover live data to then test against.
      # Only test execution is affected by this flag, resource creation via terraform is unaffected.
      # Default behaviour is for this to be disabled, enable by changing the below flag.
      :gcp_enable_gcloud_calls => 0
  }

  def self.config
    @config
  end

  # This method ensures any environment variables take precedence.
  def self.update_from_environment
    @config.each { |k, v| @config[k] = ENV[k.to_s.upcase] || v }
  end

  def self.load_mm_vars
    loaded = YAML.load_file(File.join(File.dirname(__FILE__), 'mm-attributes.yml'))
    @config = loaded.merge(@config)
  end

  # Create JSON for terraform
  def self.store_json(file_name = "gcp-inspec.tfvars")
    load_mm_vars
    update_from_environment
    File.open(File.join(File.dirname(__FILE__), '..', 'build', file_name), "w") do |f|
      f.write(@config.to_json)
    end
  end

  # Create YAML for inspec
  def self.store_yaml(file_name = "gcp-inspec-attributes.yaml")
    load_mm_vars
    update_from_environment
    File.open(File.join(File.dirname(__FILE__), '..', 'build', file_name), "w") do |f|
      f.write(@config.to_yaml)
    end
  end

end
