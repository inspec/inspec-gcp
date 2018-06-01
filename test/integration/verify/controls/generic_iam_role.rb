title 'IAM Role Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_project_iam_custom_role_id = attribute(:gcp_project_iam_custom_role_id, default: '', description: 'The GCP IAM custom role identifier.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-generic-iam-role' do
  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure that the IAM role is correctly set up'

  describe google_project_iam_custom_role(project: gcp_project_id, name: gcp_project_iam_custom_role_id ) do
    # stage of a role in the launch lifecycle, should be GA (can be ALPHA, BETA, or GA)
    its('stage') { should eq "GA" }
    its('name') { should match gcp_project_iam_custom_role_id }
    its('included_permissions') { should eq ["iam.roles.list"] }
  end
end