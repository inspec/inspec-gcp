title 'Firewalls Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_enable_gcloud_calls = attribute(:gcp_enable_gcloud_calls,default:0,description:'Flag to enable the use of gcloud command line to pull in live data to test against.')

control 'gcp-firewalls-1.0' do

  only_if { gcp_enable_gcloud_calls.to_i == 1 }
  impact 1.0
  title 'Ensure firewalls have the correct properties in bulk'

  describe google_compute_firewalls(project: gcp_project_id) do
    it { should exist }
    its('count') { should be <= 100}
    # assume this is a development setup for a moment
    its('firewall_names') { should include "default-allow-ssh" }
    its('firewall_names') { should include "default-allow-rdp" }
    its('firewall_names') { should include "default-allow-internal" }
    its('firewall_names') { should include "default-allow-icmp" }
    # Only make the call if the configuration flag is specified and the test will run
    gcp_firewall_id = `gcloud compute firewall-rules list --filter="name=default-allow-ssh" --format=json | grep id | grep -o '[0-9]\\+'`.chomp.to_i
    its('firewall_ids') { should include gcp_firewall_id }
  end

end