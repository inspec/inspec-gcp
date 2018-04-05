require 'json'
require 'yaml'
require 'passgen'

module GCPInspecConfig

  # Note: env vars take precedence - below keys in uppercase

  @@config = {
      :gcp_project_name => "SPaterson Project",
      :gcp_project_id => "spaterson-project",
      :gcp_project_number => "1041358276233",
      # Determine the storage account name and the admin password
      :gcp_storage_account_name => (0...15).map { (65 + rand(26)).chr }.join.downcase,
      :gcp_admin_password => Passgen::generate(length: 12, uppercase: true, lowercase: true, symbols: true, digits: true),
      :gcp_location => "europe-west2",
      :gcp_zone => "europe-west2-a",
      :gcp_int_vm_name => "gcp-inspec-int-ubuntu-vm",
      :gcp_int_vm_size => "f1-micro",
      :gcp_int_vm_image => "ubuntu-os-cloud/ubuntu-1604-lts",
      :gcp_ext_vm_name => "gcp-inspec-ext-ubuntu-vm",
      :gcp_ext_vm_size => "f1-micro",
      :gcp_ext_vm_image => "ubuntu-os-cloud/ubuntu-1604-lts",
      :gcp_ext_compute_address_name => "gcp-inspec-generic-ext-compute-address",
      :gcp_windows_int_vm_image => "windows-cloud/windows-server-2016-dc-core-v20180313",
      :gcp_windows_int_vm_name => "gcp-inspec-int-windows-vm",
      :gcp_windows_int_vm_size => "f1-micro",
      :gcp_storage_bucket_name => "gcp-inspec-storage-bucket"
  }

  def self.config
    @@config
  end

  def self.update_from_environment
    @@config.each { |k,v| @@config[k] = ENV[k.to_s.upcase] || v }
  end

  def self.store_json(file_name="gcp-inspec.tfvars")
    update_from_environment
    File.open(File.join(File.dirname(__FILE__),'..','build',file_name),"w") do |f|
      f.write(@@config.to_json)
    end
  end

  def self.store_yaml(file_name="gcp-inspec-attributes.yaml")
    update_from_environment
    File.open(File.join(File.dirname(__FILE__),'..','build',file_name),"w") do |f|
      f.write(@@config.to_yaml)
    end
  end

end