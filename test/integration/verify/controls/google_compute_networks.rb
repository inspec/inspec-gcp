title 'Networks Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_network_name = attribute(:gcp_network_name, default: '', description: 'The GCP network name.')

control 'gcp-networks-1.0' do

  impact 1.0
  title 'Ensure networks have the correct properties in bulk'

  describe google_compute_networks(project: gcp_project_id) do
    it { should exist }
    its('count') { should be <= 100}
    its('network_names') { should include gcp_network_name }
  end

end