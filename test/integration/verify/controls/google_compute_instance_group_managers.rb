title 'Test GCP google_compute_instance_group_managers resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_zone = input(:gcp_zone, value: '', description: 'The GCP project zone.')
instance_group_manager = input('instance_group_manager', value: {
  "name": "inspec-gcp-igm",
  "base_instance_name": "igm",
  "named_port_name": "port",
  "named_port_port": 80
}, description: 'Instance group manager definition')

control 'google_compute_instance_group_managers-1.0' do
  impact 1.0
  title 'google_compute_instance_group_managers resource test'

  describe google_compute_instance_group_managers(project: gcp_project_id, zone: gcp_zone) do
    its('base_instance_names') { should include instance_group_manager['base_instance_name'] }
  end
end
