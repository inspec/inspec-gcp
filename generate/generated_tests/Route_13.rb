title 'Test GCP Route resource.'

control 'Route_13' do
  impact 1.0
  title 'Route resource test'

  describe google_compute_route({:project=>"graphite-test-sam-chef", :name=>"default-route-96d72e8c69a0db16"}) do
    it { should exist }

    its('dest_range') { should cmp "10.140.0.0/20" }
    its('description') { should cmp "Default local route to the subnetwork 10.140.0.0/20." }
    its('name') { should cmp "default-route-96d72e8c69a0db16" }
    its('network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/default" }
    its('priority') { should cmp 1000 }
    its('next_hop_network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/default" }
  end
end