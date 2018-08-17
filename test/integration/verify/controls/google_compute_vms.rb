title 'Virtual Machines Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_zone = attribute(:gcp_zone, default: '', description: 'The GCP zone being used.')
gcp_ext_vm_data_disk_name = attribute(:gcp_ext_vm_data_disk_name, default: '', description: 'A valid GCP VM name to check for.')
gcp_enable_gcloud_calls = attribute(:gcp_enable_gcloud_calls,default:0,description:'Flag to enable the use of gcloud command line to pull in live data to test against.')

control 'gcp-vms-1.0' do

  only_if { gcp_enable_gcloud_calls.to_i == 1 }
  impact 1.0
  title 'Ensure VMs have the correct properties in bulk'

  describe google_compute_instances(project: gcp_project_id, zone: gcp_zone) do
    it { should exist }
    its('count') { should be <= 100}
    its('instance_ids.count') { should be > 0 }
    its('instance_names') { should include gcp_ext_vm_data_disk_name }
    # Only make the call if the configuration flag is specified and the test will run
    gcp_instance_id = `gcloud compute instances list --filter="name=gcp-inspec-ext-linux-vm" --format=json | grep id | grep -o '[0-9]\\+'`.chomp.to_i
    its('instance_ids') { should include gcp_instance_id }
  end

end