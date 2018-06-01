title 'Virtual Machines Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_zone = attribute(:gcp_zone, default: '', description: 'The GCP zone being used.')
gcp_ext_vm_data_disk_name = attribute(:gcp_ext_vm_data_disk_name, default: '', description: 'A valid GCP VM name to check for.')

control 'gcp-vms-1.0' do

  impact 1.0
  title 'Ensure VMs have the correct properties in bulk'

  describe google_compute_instances(project: gcp_project_id, zone: gcp_zone) do
    it { should exist }
    its('entries.count') { should be <= 100}
    its('instance_ids.count') { should cmp 9 }
    its('instance_names') { should include gcp_ext_vm_data_disk_name }
  end

end