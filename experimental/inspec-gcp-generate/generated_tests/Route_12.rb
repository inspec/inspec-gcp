title 'Test GCP Route resource.'

control 'Route_12' do
  impact 1.0
  title 'Route resource test'

  describe google_compute_route({:project=>"graphite-test-sam-chef", :name=>"default-route-93695ffcb69ccd47"}) do
    it { should exist }

    its('dest_range') { should cmp "0.0.0.0/0" }
    its('description') { should cmp "Default route to the Internet." }
    its('name') { should cmp "default-route-93695ffcb69ccd47" }
    its('network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/tf-test-4pk1r2j41i" }
    its('priority') { should cmp 1000 }
    its('next_hop_gateway') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/gateways/default-internet-gateway" }
  end
end