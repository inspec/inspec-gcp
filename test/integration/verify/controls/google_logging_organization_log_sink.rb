title 'Test GCP google_logging_organization_log_sink resource.'

org_sink = input('org_sink', value: {
  "name"=>"inspec-gcp-org-sink",
  "filter"=>"resource.type = gce_instance"
})
gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization that is the parent of this folder')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description: 'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'google_logging_organization_log_sink-1.0' do
  impact 1.0
  title 'google_logging_organization_log_sink resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }
  describe google_logging_organization_log_sink(organization: gcp_organization_id, name: org_sink['name']) do
    it { should exist }
    its('filter') { should cmp org_sink['filter'] }
  end

  describe google_logging_organization_log_sink(organization: gcp_organization_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
