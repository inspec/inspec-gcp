# title 'Image Family'
#
# gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
# gcp_project_iam_custom_role_id = attribute(:gcp_project_iam_custom_role_id, default: '', description: 'The GCP IAM custom role identifier.')
#
# control 'gcp-generic-iam-role' do
#
#   impact 1.0
#   title 'Ensure that the IAM role is correctly set up'
#
#   describe gcp_iam_role(project: gcp_project_id, name: gcp_project_iam_custom_role_id ) do
#     # role should be available
#     its('stage') { should eq "GA" }
#     its('name') { should match gcp_project_iam_custom_role_id }
#   end
# end