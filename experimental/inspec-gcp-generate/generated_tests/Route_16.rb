title 'Test GCP Route resource.'

control 'Route_16' do
  impact 1.0
  title 'Route resource test'

  describe google_compute_route({:project=>"graphite-test-sam-chef", :name=>"default-route-bce1de178f2ffa27"}) do
    it { should exist }

    its('dest_range') { should cmp "10.0.0.0/16" }
    its('description') { should cmp "Default local route to the subnetwork 10.0.0.0/16." }
    its('name') { should cmp "default-route-bce1de178f2ffa27" }
    its('network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/tf-test-ofw6b2mxe2" }
    its('priority') { should cmp 1000 }
    its('next_hop_network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/tf-test-ofw6b2mxe2" }
  end
end