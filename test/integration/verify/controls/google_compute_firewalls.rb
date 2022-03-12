title 'Test GCP google_compute_firewalls resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
firewall = input('firewall', value: {
  "name": "inspec-gcp-firewall",
  "source_tag": "some-tag"
}, description: 'Firewall rule definition')

control 'google_compute_firewalls-1.0' do
  impact 1.0
  title 'google_compute_firewalls resource test'

  describe google_compute_firewalls(project: gcp_project_id) do
    its('count') { should be >= 1 }
    its('firewall_names') { should include firewall['name'] }
    its('firewall_directions') { should include 'INGRESS' }
  end
end
