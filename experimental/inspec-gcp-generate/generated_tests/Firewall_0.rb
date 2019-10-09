title 'Test GCP Firewall resource.'

control 'Firewall_0' do
  impact 1.0
  title 'Firewall resource test'

  describe google_compute_firewall({:project=>"graphite-test-sam-chef", :name=>"default-allow-icmp"}) do
    it { should exist }

    its('allowed') { should include '{"IPProtocol":"icmp"}' }
    its('creation_timestamp.to_s') { should cmp '2019-09-19 14:40:14 -0700' }
    its('description') { should cmp "" }
    its('direction') { should cmp "INGRESS" }
    its('disabled') { should cmp false }
    its('id') { should cmp "881751432245431121" }
    its('name') { should cmp "default-allow-icmp" }
    its('network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/default" }
    its('priority') { should cmp 65534 }
    its('source_ranges') { should include "0.0.0.0/0" }
  end
end