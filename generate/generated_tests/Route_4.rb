title 'Test GCP Route resource.'

control 'Route_4' do
  impact 1.0
  title 'Route resource test'

  describe google_compute_route({:project=>"graphite-test-sam-chef", :name=>"default-route-3ee4a7d82db64824"}) do
    it { should exist }

    its('dest_range') { should cmp "0.0.0.0/0" }
    its('description') { should cmp "Default route to the Internet." }
    its('name') { should cmp "default-route-3ee4a7d82db64824" }
    its('network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/default" }
    its('priority') { should cmp 1000 }
    its('next_hop_gateway') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/gateways/default-internet-gateway" }
  end
end