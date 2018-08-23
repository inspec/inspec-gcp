title 'Test single GCP compute subnetwork'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_region = attribute(:gcp_location, default: '', description: 'The GCP region being used.')
gcp_network_name = attribute(:gcp_network_name, default: '', description: 'The GCP network name.')
gcp_subnetwork_name = attribute(:gcp_subnetwork_name, default: '', description: 'The GCP subnetwork name.')

control 'gcp-compute-subnetwork-1.0' do

  impact 1.0
  title 'Ensure GCP compute subnetwork has the correct properties.'

  describe google_compute_subnetwork(project: gcp_project_id, region: gcp_region, name: gcp_subnetwork_name) do
    it { should exist }
    # leaving the below two lines as examples of valid tests
    #its('id') { should eq 3916412205080353392 }
    #its('gateway_address') { should eq "10.2.0.1" }
    its('name') { should eq gcp_subnetwork_name }
    its('region') { should match gcp_region }
    its('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
    its('ip_cidr_range') { should eq "10.2.0.0/29" }
    its('network') { should match gcp_network_name }
    its('private_ip_google_access') { should be false }
  end
end