title 'Firewall Rule Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_lb_mig1_name = attribute(:gcp_lb_mig1_name, default: '', description: 'The GCP pattern first managed instance group firewall name.')

control 'google-lb-internal-firewall-rule-ip-ranges-1.0' do

  impact 1.0
  title 'Ensure that the Firewall Rule has been configured correctly with extra focus on expected IP ranges'

  describe google_compute_firewall(project: gcp_project_id, name: "#{gcp_lb_mig1_name}-vm-hc") do
    its('name') { should eq "#{gcp_lb_mig1_name}-vm-hc" }
    # For the currently in scope rule, SSH should not be allowed
    its('allowed_ssh?')  { should be false }
    # For the currently in scope rule, HTTP should be allowed
    its('allowed_http?')  { should be true }

    # equivalently to the above helpers
    it { should_not allow_port_protocol("22", "tcp") }
    it { should allow_port_protocol("80", "tcp") }

    # the rule direction - ingress/egress
    its('direction') { should eq "INGRESS" }

    # source IP range list for the rule e.g. these are hard-coded in the underlying terraform template
    # source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]

    # using the expected property directly
    its('source_ranges') { should_not eq ["0.0.0.0/0"] }

    # using the IP range helpers
    #
    # ensure rule is not exposed to the world
    it { should_not allow_ip_ranges ["0.0.0.0/0"] }
    # test for single known range being present
    it { should allow_ip_ranges ["130.211.0.0/22"] }
    # test for two known ranges being present
    it { should allow_ip_ranges ["130.211.0.0/22","35.191.0.0/16"] }
    # stricter, enforce only those ip ranges are present
    it { should allow_ip_ranges_only ["130.211.0.0/22","35.191.0.0/16"] }
    # ensure partial match fails
    it { should_not allow_ip_ranges_only ["130.211.0.0/22"] }
  end
end