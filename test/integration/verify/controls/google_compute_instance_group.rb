title 'Test GCP google_compute_instance_group resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_zone = input(:gcp_zone, value: '', description: 'GCP zone name')
instance_group = input('instance_group', value: {
  "name": "inspec-instance-group",
  "description": "My instance group for testing",
  "named_port_name": "https",
  "named_port_port": 8080
}, description: 'Instance group')

control 'google_compute_instance_group-1.0' do
  impact 1.0
  title 'google_compute_instance_group resource test'

  describe google_compute_instance_group(project: gcp_project_id, zone: gcp_zone, name: instance_group['name']) do
    it { should exist }
    its('description') { should cmp instance_group['description'] }
    its('named_ports.count') { should cmp 1 }
    its('named_ports.first.name') { should cmp instance_group['named_port_name'] }
    its('named_ports.first.port') { should cmp instance_group['named_port_port'] }
  end

  describe google_compute_instance_group(project: gcp_project_id, zone: gcp_zone, name: 'nonexistent') do
    it { should_not exist }
  end
end
