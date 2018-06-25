title 'GCP Project IAM Bindings Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-project-iam-bindings-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure project IAM bindings have the correct properties in bulk'

  describe google_project_iam_bindings(project: gcp_project_id) do
    it { should exist }
    its('count') { should be <= 100}
    its('iam_binding_roles') { should include "roles/owner" }
  end

end