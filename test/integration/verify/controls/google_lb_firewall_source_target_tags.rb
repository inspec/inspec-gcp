title 'Firewall Rule Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_lb_ilb_name = attribute(:gcp_lb_ilb_name, default: '', description: 'The GCP pattern ilb group firewall name.')

control 'google-lb-internal-firewall-rule-target-tags-1.0' do

  impact 1.0
  title 'Ensure that the Firewall Rule has been configured correctly and has expected source and target tags'

  describe google_compute_firewall(project: gcp_project_id, name: "#{gcp_lb_ilb_name}-ilb-fw") do
    its('name') { should eq "#{gcp_lb_ilb_name}-ilb-fw" }
    # For the currently in scope rule, SSH should not be allowed
    its('allowed_ssh?')  { should be false }
    # For the currently in scope rule, HTTP should not be allowed
    its('allowed_http?')  { should be true }

    # equivalently to the above helpers
    it { should_not allow_port_protocol("22", "tcp") }
    it { should allow_port_protocol("80", "tcp") }

    # the rule direction - ingress/egress
    its('direction') { should eq "INGRESS" }

    # now let's specifically concentrate on source and target tags for this rule
    # here we know the following should be true:
    #     source tags => ["allow-gcp-inspec-app-mig1"]
    #     target tags => ["allow-gcp-inspec-app-mig2", "allow-gcp-inspec-app-mig3"]
    # allow single tag - other tags present
    it { should allow_target_tags ["allow-gcp-inspec-app-mig2"] }
    # allow only specified tagss
    it { should allow_target_tags_only ["allow-gcp-inspec-app-mig2","allow-gcp-inspec-app-mig3"] }
    # should not allow non-existing tag
    it { should_not allow_target_tags ["not-present"] }
    # similarly for source tags
    it { should_not allow_source_tags ["not-present"] }
    # allow specified tag - could be others present
    it { should allow_source_tags ["allow-gcp-inspec-app-mig1"] }
    # allow only specified tag
    it { should allow_source_tags_only ["allow-gcp-inspec-app-mig1"] }
    # not allow a non-existing tag
    it { should_not allow_source_tags_only ["allow-gcp-inspec-app-mig1","not_existing"] }
  end
end