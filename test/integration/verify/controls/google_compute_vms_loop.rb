title 'Loop over all GCP Virtual Machines'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_zone = input(:gcp_zone, value: '', description: 'The GCP zone being used.')

control 'gcp-vms-loop-1.0' do
  impact 1.0
  title 'Ensure VMs have the correct properties in bulk using google_compute_instance for detail.'

  google_compute_instances(project: gcp_project_id, zone: gcp_zone).instance_names.each do |instance_name|
    describe google_compute_instance(project: gcp_project_id, zone: gcp_zone, name: instance_name) do
      it { should exist }
      its('zone') { should match gcp_zone }
      its('status') { should be_in ['RUNNING', 'PROVISIONING', 'STAGING', 'STOPPING', 'TERMINATED'] }
    end
  end
end