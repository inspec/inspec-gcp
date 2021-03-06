# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_logging_project_exclusion resource.'

project_exclusion = attribute('project_exclusion', default: {"name"=>"inspec-project-exclusion", "description"=>"My project exclusion description", "filter"=>"resource.type = gce_instance AND severity <= DEBUG"})
gcp_project_id = attribute(:gcp_project_id, default: gcp_project_id, description: 'The project identifier')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources, default:0, description:'Flag to enable privileged resources requiring elevated privileges in GCP.')
gcp_organization_id = attribute(:gcp_organization_id, default: gcp_organization_id, description: 'The identifier of the organization')
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
