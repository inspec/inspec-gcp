title 'Test single GCP KMS Key Ring IAM Binding'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_kms_key_ring_policy_name = input(:gcp_kms_key_ring_policy_name, value: '', description: 'GCP key ring name to test against.')
gcp_kms_key_ring_binding_member_name = input(:gcp_kms_key_ring_binding_member_name, value: '', description: 'GCP key ring name to test against.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP region being used.')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description: 'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-kms-key-ring-iam-binding-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure single GCP GCP KMS Key Ring IAM bindings have the correct properties.  Examples below include attaching an IAM policy, binding and member to a key ring.'

  describe google_kms_key_ring_iam_binding(project: gcp_project_id, location: gcp_location, key_ring_name: gcp_kms_key_ring_policy_name, role: "roles/editor") do
    it { should exist }
    its ('members.count'){ should eq 1 }
  end

  describe google_kms_key_ring_iam_binding(project: gcp_project_id, location: gcp_location, key_ring_name: gcp_kms_key_ring_binding_member_name, role: "roles/editor") do
    it { should exist }
    its ('members.count'){ should eq 1 }
  end

  describe google_kms_key_ring_iam_binding(project: gcp_project_id, location: gcp_location, key_ring_name: gcp_kms_key_ring_binding_member_name, role: "roles/owner") do
    it { should exist }
    its ('members.count'){ should eq 1 }
  end
end