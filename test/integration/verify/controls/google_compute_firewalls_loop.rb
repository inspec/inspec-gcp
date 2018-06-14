title 'Loop over all GCP Firewalls'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')

control 'gcp-firewalls-loop-1.0' do

  impact 1.0
  title 'Ensure firewalls have the correct properties in bulk using google_compute_firewall for detail.'

  google_compute_firewalls(project: gcp_project_id).firewall_names.each do |firewall_name|
    describe google_compute_firewall(project: gcp_project_id, name: firewall_name) do
      it { should exist }
      its('kind') { should eq "compute#firewall" }
      its('direction') { should be_in ["INGRESS","EGRESS"] }
    end
  end
end