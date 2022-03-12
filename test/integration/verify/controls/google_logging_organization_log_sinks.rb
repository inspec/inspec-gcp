title 'Test GCP google_logging_organization_log_sinks resource.'

org_sink = input('org_sink', value: {
  "name"=>"inspec-gcp-org-sink",
  "filter"=>"resource.type = gce_instance"
})
gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization that is the parent of this folder')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description: 'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'google_logging_organization_log_sinks-1.0' do
  impact 1.0
  title 'google_logging_organization_log_sinks resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }
  describe google_logging_organization_log_sinks(organization: gcp_organization_id) do
    its('names') { should include org_sink['name'] }
  end
end
