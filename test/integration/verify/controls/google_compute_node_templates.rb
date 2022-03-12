title 'Test GCP google_compute_node_templates resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
node_template = input('node_template', value: {
  "name": "inspec-node-template",
  "label_key": "key",
  "label_value": "value"
}, description: 'Node template description')

control 'google_compute_node_templates-1.0' do
  impact 1.0
  title 'google_compute_node_templates resource test'

  describe google_compute_node_templates(project: gcp_project_id, region: gcp_location) do
    its('names') { should include node_template['name'] }
  end
end
