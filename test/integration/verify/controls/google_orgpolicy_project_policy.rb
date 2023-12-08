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

title 'Test GCP google_orgpolicy_project_policy resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  project_policy = input('project_policy', value: {
  "name": "value_name",
  "parent": "value_parent"
}, description: 'project_policy description')
control 'google_orgpolicy_project_policy-1.0' do
  impact 1.0
  title 'google_orgpolicy_project_policy resource test'

  describe google_orgpolicy_project_policy(name: project_policy['name']) do
  	it { should exist }

  end

  describe google_orgpolicy_project_policy(name: "does_not_exit") do
  	it { should_not exist }
  end
end