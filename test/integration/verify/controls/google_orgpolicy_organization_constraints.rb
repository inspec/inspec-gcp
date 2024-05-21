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

title 'Test GCP google_orgpolicy_organization_constraints resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  organization_constraint = input('organization_constraint', value: {
  "parent": "organizations/827482578277",
  "name": "organizations/827482578277/constraints/ainotebooks.restrictVpcNetworks",
  "displayName": "Restrict VPC networks on new Vertex AI Workbench instances",
  "description": "This list constraint defines the VPC networks a user can select when creating new Vertex AI Workbench instances where this constraint is enforced. By default, a Vertex AI Workbench instance can be created with any VPC networks. The allowed or denied list of networks must be identified in the form: under:organizations/ORGANIZATION_ID, under:folders/FOLDER_ID, under:projects/PROJECT_ID, or projects/PROJECT_ID/global/networks/NETWORK_NAME.",
  "constraintDefault": "ALLOW",
}, description: 'organization_constraint description')
control 'google_orgpolicy_organization_constraints-1.0' do
  impact 1.0
  title 'google_orgpolicy_organization_constraints resource test'

    describe google_orgpolicy_organization_constraints(parent: organization_constraint['parent']) do
      it { should exist }
      its('names') { should include organization_constraint['name']}
      its('display_names') { should include organization_constraint['displayName']}
      its('descriptions') { should include organization_constraint['description']}
      its('constraint_defaults') { should include organization_constraint['constraintDefault']}
      its('list_constraints') { should include organization_constraint['listConstraint']}
    end
end