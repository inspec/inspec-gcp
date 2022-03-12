title 'Test GCP google_compute_region_instance_group_managers resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
rigm = input('rigm', value: {
  "name": "inspec-rigm",
  "base_instance_name": "rigm1",
  "target_size": 1,
  "named_port_name": "https",
  "named_port_port": 8888,
  "healing_delay": 300
}, description: 'Compute region instance group manager description')

control 'google_compute_region_instance_group_managers-1.0' do
  impact 1.0
  title 'google_compute_region_instance_group_managers resource test'

  describe google_compute_region_instance_group_managers(project: gcp_project_id, region: gcp_location) do
  	its('instance_group_manager_names') { should include rigm['name'] }
    its('base_instance_names') { should include rigm['base_instance_name'] }
  end
end
