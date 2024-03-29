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

title 'Test GCP google_appengine_standard_app_version resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: 'gcp_location', description: 'The GCP project location.')
standardappversion = input('standardappversion', value: {
  "version_id": "v2",
  "service": "default",
  "runtime": "nodejs10",
  "entrypoint": "node ./app.js",
  "port": "8080"
}, description: 'Cloud App Engine definition')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value:0, description:'Flag to enable privileged resources requiring elevated privileges in GCP.')
gcp_organization_id = input(:gcp_organization_id, value: gcp_organization_id, description: 'The identifier of the organization')
control 'google_appengine_standard_app_version-1.0' do
  impact 1.0
  title 'google_appengine_standard_app_version resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }

  describe google_appengine_standard_app_version(project: gcp_project_id, location: gcp_location, version_id: standardappversion['version_id'], service: standardappversion['service']) do
    it { should exist }
    its('version_id') { should eq standardappversion['version_id'] }
    its('runtime') { should eq standardappversion['runtime'] }
  end
end
