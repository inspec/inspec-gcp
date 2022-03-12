title 'Test GCP google_compute_instance_group_manager resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_zone = input(:gcp_zone, value: '', description: 'The GCP project zone.')
instance_group_manager = input('instance_group_manager', value: {
  "name": "inspec-gcp-igm",
  "base_instance_name": "igm",
  "named_port_name": "port",
  "named_port_port": 80
}, description: 'Instance group manager definition')

control 'google_compute_instance_group_manager-1.0' do
  impact 1.0
  title 'google_compute_instance_group_manager resource test'

  describe google_compute_instance_group_manager(project: gcp_project_id, zone: gcp_zone, name: instance_group_manager['name']) do
    it { should exist }
    its('base_instance_name') { should eq instance_group_manager['base_instance_name'] }
    its('named_ports.count') { should cmp 1 }
    its('named_ports.first.name') { should eq instance_group_manager['named_port_name'] }
    its('named_ports.first.port') { should eq instance_group_manager['named_port_port'] }
  end

  describe google_compute_instance_group_manager(project: gcp_project_id, zone: gcp_zone, name: 'nonexistent') do
    it { should_not exist }
  end
end
