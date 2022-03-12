title 'Test GCP google_logging_project_exclusion resource.'

project_exclusion = input('project_exclusion', value: {
  "name"=>"inspec-project-exclusion",
  "description"=>"My project exclusion description",
  "filter"=>"resource.type = gce_instance AND severity <= DEBUG"
})
gcp_project_id = input(:gcp_project_id, value: '', description: 'The project identifier')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description: 'Flag to enable privileged resources requiring elevated privileges in GCP.')
gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization')

control 'google_logging_project_exclusion-1.0' do
  impact 1.0
  title 'google_logging_project_exclusion resource test'
  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }

  describe google_logging_project_exclusion(project: gcp_project_id, name: project_exclusion['name']) do
  	it { should exist }
    its('description'){ should cmp project_exclusion['description'] }
    its('filter'){ should cmp project_exclusion['filter'] }
  end

  describe google_logging_project_exclusion(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
