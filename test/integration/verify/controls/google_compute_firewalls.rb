title 'Firewalls Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')

control 'gcp-firewalls-1.0' do

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
  end

end