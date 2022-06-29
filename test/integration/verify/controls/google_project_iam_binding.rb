title 'Test single GCP project IAM Binding'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-project-iam-binding-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure single GCP project IAM binding has the correct properties.'

  describe google_project_iam_binding(project: gcp_project_id, role: "roles/compute.admin") do
    it { should exist }
    its ('members.count'){ should be >= 1 }
  end
end