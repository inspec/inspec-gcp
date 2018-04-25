# Configuration helper for GCP & Inspec
# - Terraform expects a JSON variable file
# - Inspec expects a YAML attribute file
# This allows to store all transient parameters in one place.
# If any of the @config keys are exported as environment variables in uppercase, these take precedence.
require 'json'
require 'yaml'
require 'passgen'

module GCPInspecConfig

  # Config for terraform / inspec in the below hash
  @config = {
      # Generic GCP resrource parameters
      :gcp_project_name => "SPaterson Project",
      :gcp_project_id => "spaterson-project",
      :gcp_project_number => "1041358276233",
      # Determine the storage account name and the admin password
      # BELOW TO BE REMOVED
#      :gcp_storage_account_name => (0...15).map { (65 + rand(26)).chr }.join.downcase,
#      :gcp_admin_password => Passgen::generate(length: 12, uppercase: true, lowercase: true, symbols: true, digits: true),
      :gcp_location => "europe-west2",
      :gcp_zone => "europe-west2-a",
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
      :gcp_project_iam_custom_role_id => "gcp_inspec_custom_role_id_#{(0...15).map { (65 + rand(26)).chr }.join.downcase}",
      :gcp_compute_disk_name => "gcp-inspec-compute-disk-name",
      :gcp_compute_disk_type => "pd-standard",
      :gcp_compute_disk_image => "ubuntu-os-cloud/ubuntu-1604-lts",
      :gcp_ext_vm_data_disk_address_name => "gcp-inspec-generic-ext-compute-data-disk-address",
      :gcp_ext_vm_data_disk_name => "gcp-inspec-generic-ext-linux-vm-data-disk",
      :gcp_ext_vm_data_disk_size => "f1-micro",
      :gcp_ext_vm_data_disk_image => "ubuntu-os-cloud/ubuntu-1604-lts",
      :gcp_storage_bucket_name => "gcp-inspec-storage-bucket",
      # Google Load Balanced App example parameters
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
      :gcp_kube_cluster_zone_extra1 => "europe-west2-b",
      :gcp_kube_cluster_zone_extra2 => "europe-west2-c",
      :gcp_kube_cluster_master_user => "gcp-inspec-kube-admin",
      :gcp_kube_cluster_master_pass => Passgen::generate(length: 20, uppercase: true, lowercase: true, symbols: true, digits: true),
      :gcp_kube_nodepool_name => "default-pool"
  }

  def self.config
    @config
  end

  # This method ensures any environment variables take precedence.
  def self.update_from_environment
    @config.each { |k,v| @config[k] = ENV[k.to_s.upcase] || v }
  end

  # Create JSON for terraform
  def self.store_json(file_name="gcp-inspec.tfvars")
    update_from_environment
    File.open(File.join(File.dirname(__FILE__),'..','build',file_name),"w") do |f|
      f.write(@config.to_json)
    end
  end

  # Create YAML for inspec
  def self.store_yaml(file_name="gcp-inspec-attributes.yaml")
    update_from_environment
    File.open(File.join(File.dirname(__FILE__),'..','build',file_name),"w") do |f|
      f.write(@config.to_yaml)
    end
  end

end