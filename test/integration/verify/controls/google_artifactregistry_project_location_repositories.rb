# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    Type: MMv1     ***
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

title 'Test GCP google_artifactregistry_project_location_repositories resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: 'gcp_location', description: 'The GCP project identifier.')

project_location_repository = input('project_location_repository', value: {
  "name": "projects/#{gcp_project_id}/locations/#{gcp_location}/repositories/test-repository-1",
  "parent": "projects/#{gcp_project_id}/locations/#{gcp_location}"
}, description: 'project_location_repository description')
control 'google_artifactregistry_project_location_repositories-1.0' do
  impact 1.0
  title 'google_artifactregistry_project_location_repositories resource test'

  describe google_artifactregistry_project_location_repositories(parent: project_location_repository['parent']) do
    it { should exist }
  end
end