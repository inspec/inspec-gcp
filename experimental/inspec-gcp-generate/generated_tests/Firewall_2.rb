title 'Test GCP Firewall resource.'

control 'Firewall_2' do
  impact 1.0
  title 'Firewall resource test'

  describe google_compute_firewall({:project=>"graphite-test-sam-chef", :name=>"default-allow-ssh"}) do
    it { should exist }

    its('allowed') { should include '{"IPProtocol":"tcp","ports":["22"]}' }
    its('creation_timestamp.to_s') { should cmp '2019-09-19 14:42:37 -0700' }
    its('description') { should cmp "" }
    its('direction') { should cmp "INGRESS" }
    its('disabled') { should cmp false }
    its('id') { should cmp "3549923861144160418" }
    its('name') { should cmp "default-allow-ssh" }
    its('network') { should cmp "https://www.googleapis.com/compute/v1/projects/graphite-test-sam-chef/global/networks/default" }
    its('priority') { should cmp 65534 }
    its('source_ranges') { should include "0.0.0.0/0" }
  end
end