title 'Test GCP google_logging_project_sink resource.'

project_sink = input('project_sink', value: {
  "name"=>"inspec-gcp-org-sink",
  "filter"=>"resource.type = gce_instance AND severity = DEBUG"})
gcp_project_id = input(:gcp_project_id, value: '', description: 'The project id.')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description:'Flag to enable privileged resources requiring elevated privileges in GCP.')
gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization')

control 'google_logging_project_sink-1.0' do
  impact 1.0
  title 'google_logging_project_sink resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }
  describe google_logging_project_sink(project: gcp_project_id, name: project_sink['name']) do
    it { should exist }
    its('filter') { should cmp project_sink['filter'] }
  end

  describe google_logging_project_sink(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
