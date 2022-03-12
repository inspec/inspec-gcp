title 'Test GCP google_compute_node_group resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
node_group = input('node_group', value: {
  "name": "inspec-node-group",
  "description": "A description of the node group",
  "size": 0
}, description: 'Node group description')
gcp_zone = input(:gcp_zone, value: '', description: 'GCP zone name')

control 'google_compute_node_group-1.0' do
  impact 1.0
  title 'google_compute_node_group resource test'


  describe google_compute_node_group(project: gcp_project_id, zone: gcp_zone, name: node_group['name']) do
    it { should exist }
    its('description') { should cmp node_group['description'] }
    its('size') { should cmp node_group['size'] }
  end

  describe google_compute_node_group(project: gcp_project_id, zone: gcp_zone, name: 'nonexistent') do
    it { should_not exist }
  end
end
