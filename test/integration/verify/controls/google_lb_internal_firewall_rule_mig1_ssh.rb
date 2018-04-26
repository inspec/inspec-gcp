title 'Firewall Rule Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_lb_mig1_name = attribute(:gcp_lb_mig1_name, default: '', description: 'The GCP pattern first managed instance group firewall name.')

control 'google-lb-internal-firewall-rule-ssh-1.0' do

  impact 1.0
  title 'Ensure that the Firewall Rule has been configured correctly'

  describe google_compute_firewall(project: gcp_project_id, name: "#{gcp_lb_mig1_name}-vm-ssh") do
    # TBD: could look at all rules / rules for e.g. a compute instance / a list of rule names instead of one-by-one
    its('name') { should eq "#{gcp_lb_mig1_name}-vm-ssh" }
    # For the currently in scope rule, SSH should be allowed
    its('allowed_ssh?')  { should be true }
    # For the currently in scope rule, HTTP should not be allowed
    its('allowed_http?')  { should be false }
    # the rule direction - ingress/egress
    its('direction') { should eq "INGRESS" }
    its('kind') { should eq "compute#firewall" }

    # source IP range list for the rule
    its('source_ranges') { should eq ["0.0.0.0/0"] }

    # TBD: left out priority and network for now
  end
end