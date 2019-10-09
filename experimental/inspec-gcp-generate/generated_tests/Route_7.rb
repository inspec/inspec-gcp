title 'Test GCP Route resource.'

control 'Route_7' do
  impact 1.0
  title 'Route resource test'

  describe google_compute_route({:project=>"graphite-test-sam-chef", :name=>"default-route-5bd8c895e6078efe"}) do
    it { should exist }

    its('dest_range') { should cmp "10.158.0.0/20" }
    its('description') { should cmp "Default local route to the subnetwork 10.158.0.0/20." }
    its('name') { should cmp "default-route-5bd8c895e6078efe" }
    its('network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/default" }
    its('priority') { should cmp 1000 }
    its('next_hop_network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/default" }
  end
end