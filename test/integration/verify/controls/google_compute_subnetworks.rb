title 'Subnetworks Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_network_name = attribute(:gcp_network_name, default: '', description: 'The GCP network name.')
gcp_region = attribute(:gcp_location, default: '', description: 'The GCP region being used.')
gcp_subnetwork_name = attribute(:gcp_subnetwork_name, default: '', description: 'The GCP subnetwork name.')

control 'gcp-subnetworks-1.0' do

  impact 1.0
  title 'Ensure subnetworks have the correct properties in bulk'

  describe google_compute_subnetworks(project: gcp_project_id, region: gcp_region) do
    it { should exist }
    its('count') { should be <= 100}
    its('subnetwork_names') { should include gcp_subnetwork_name }
    its('subnetwork_networks') { should include gcp_network_name }
  end

end