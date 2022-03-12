title 'Test GCP google_compute_node_template resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
node_template = input('node_template', value: {
  "name": "inspec-node-template",
  "label_key": "key",
  "label_value": "value"
}, description: 'Node template description')

control 'google_compute_node_template-1.0' do
  impact 1.0
  title 'google_compute_node_template resource test'

  describe google_compute_node_template(project: gcp_project_id, region: gcp_location, name: node_template['name']) do
    it { should exist }
    its('node_affinity_labels') { should include(node_template['label_key'] => node_template['label_value']) }
  end

  describe google_compute_node_template(project: gcp_project_id, region: gcp_location, name: 'nonexistent') do
    it { should_not exist }
  end
end
