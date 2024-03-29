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

title 'Test GCP google_apigee_organization_envgroup_attachments resource.'

organization_envgroup_attachment = input('organization_envgroup_attachment', value: {
  "name": "6741d6ad-1307-4f03-b02a-9fb4562c0ff3",
  "parent": "organizations/ppradhan/envgroups/test-env-group",
  "created_at": "1698227493793",
  "environment": "test-env",
  "environment_group_id": "test-env-group"
}, description: 'organization_envgroup_attachment description')

control 'google_apigee_organization_envgroup_attachments-1.0' do
  impact 1.0
  title 'google_apigee_organization_envgroup_attachments resource test'

  describe google_apigee_organization_envgroup_attachments(parent: organization_envgroup_attachment['parent']) do
    it { should exist }
  end

  describe google_apigee_organization_envgroup_attachments(parent: organization_envgroup_attachment['parent']).where(name: organization_envgroup_attachment['name']) do
    it { should exist }
    its("environment_group_ids") { should include organization_envgroup_attachment['environment_group_id'] }
    its("environments") { should include organization_envgroup_attachment['environment'] }
  end
end
