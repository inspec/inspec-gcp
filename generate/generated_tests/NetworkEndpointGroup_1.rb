title 'Test GCP NetworkEndpointGroup resource.'

control 'NetworkEndpointGroup_1' do
  impact 1.0
  title 'NetworkEndpointGroup resource test'

  describe google_compute_network_endpoint_group({:project=>"graphite-test-sam-chef", :zone=>"us-central1-a", :name=>"tf-test-ofw6b2mxe2"}) do
    it { should exist }

    its('id') { should cmp "2120241162279342589" }
    its('name') { should cmp "tf-test-ofw6b2mxe2" }
    its('network_endpoint_type') { should cmp "GCE_VM_IP_PORT" }
    its('size') { should cmp 0 }
    its('network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/tf-test-ofw6b2mxe2" }
    its('subnetwork') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/regions/us-central1/subnetworks/tf-test-ofw6b2mxe2" }
    its('default_port') { should cmp 90 }
    its('zone') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/zones/us-central1-a" }
  end
end