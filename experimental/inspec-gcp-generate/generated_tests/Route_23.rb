title 'Test GCP Route resource.'

control 'Route_23' do
  impact 1.0
  title 'Route resource test'

  describe google_compute_route({:project=>"graphite-test-sam-chef", :name=>"default-route-f1c4a683d7e290e9"}) do
    it { should exist }

    its('dest_range') { should cmp "10.0.0.0/16" }
    its('description') { should cmp "Default local route to the subnetwork 10.0.0.0/16." }
    its('name') { should cmp "default-route-f1c4a683d7e290e9" }
    its('network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/tf-test-4pk1r2j41i" }
    its('priority') { should cmp 1000 }
    its('next_hop_network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/tf-test-4pk1r2j41i" }
  end
end