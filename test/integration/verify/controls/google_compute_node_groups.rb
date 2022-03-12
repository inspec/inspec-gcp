title 'Test GCP google_compute_node_groups resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
node_group = input('node_group', value: {
  "name": "inspec-node-group",
  "description": "A description of the node group",
  "size": 0
}, description: 'Node group description')
gcp_zone = input(:gcp_zone, value: '', description: 'GCP zone name')

control 'google_compute_node_groups-1.0' do
  impact 1.0
  title 'google_compute_node_groups resource test'

  describe google_compute_node_groups(project: gcp_project_id, zone: gcp_zone) do
    it { should exist }
    its('descriptions') { should include node_group['description'] }
    its('sizes') { should include node_group['size'] }
    its('names') { should include node_group['name'] }
  end
end
