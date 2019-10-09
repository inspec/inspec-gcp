title 'Test GCP Firewall resource.'

control 'Firewall_1' do
  impact 1.0
  title 'Firewall resource test'

  describe google_compute_firewall({:project=>"graphite-test-sam-chef", :name=>"default-allow-internal"}) do
    it { should exist }

    its('allowed') { should include '{"IPProtocol":"tcp","ports":["0-65535"]}' }
    its('allowed') { should include '{"IPProtocol":"udp","ports":["0-65535"]}' }
    its('allowed') { should include '{"IPProtocol":"icmp"}' }
    its('creation_timestamp.to_s') { should cmp '2019-09-19 14:41:25 -0700' }
    its('description') { should cmp "" }
    its('direction') { should cmp "INGRESS" }
    its('disabled') { should cmp false }
    its('id') { should cmp "6382995580778334442" }
    its('name') { should cmp "default-allow-internal" }
    its('network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/default" }
    its('priority') { should cmp 65534 }
    its('source_ranges') { should include "10.128.0.0/9" }
  end
end