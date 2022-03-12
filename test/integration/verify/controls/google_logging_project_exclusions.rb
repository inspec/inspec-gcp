title 'Test GCP google_logging_project_exclusions resource.'

project_exclusion = input('project_exclusion', value: {
  "name"=>"inspec-project-exclusion",
  "description"=>"My project exclusion description",
  "filter"=>"resource.type = gce_instance AND severity <= DEBUG"
})
gcp_project_id = input(:gcp_project_id, value: '', description: 'The project identifier')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description: 'Flag to enable privileged resources requiring elevated privileges in GCP.')
gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization')

control 'google_logging_project_exclusions-1.0' do
  impact 1.0
  title 'google_logging_project_exclusions resource test'
  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }

  describe google_logging_project_exclusions(project: gcp_project_id) do
    its('names'){ should include project_exclusion['name'] }
  end
end
