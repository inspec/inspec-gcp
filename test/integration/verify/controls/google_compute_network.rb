title 'Test single GCP compute network'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_network_name = attribute(:gcp_network_name, default: '', description: 'The GCP network name.')
gcp_subnetwork_name = attribute(:gcp_subnetwork_name, default: '', description: 'The GCP subnetwork name.')

control 'gcp-compute-network-1.0' do

  impact 1.0
  title 'Ensure GCP compute network has the correct properties.'

  describe google_compute_network(project: gcp_project_id, name: gcp_network_name) do
    it { should exist }
    # the below id example is valid but not tested each time by default
    #its('id') { should eq 5815877451834825315 }
    its('name') { should eq gcp_network_name }
    its ('subnetworks.count') { should eq 1 }
    its ('subnetworks.first') { should match gcp_subnetwork_name }
    its ('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
    its ('routing_config.routing_mode') { should eq "REGIONAL" }
    its ('auto_create_subnetworks'){ should be false }
  end
end