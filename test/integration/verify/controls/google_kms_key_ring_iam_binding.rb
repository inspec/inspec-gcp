title 'Test single GCP KMS Key Ring IAM Binding'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_kms_key_ring_policy_name = attribute(:gcp_kms_key_ring_policy_name,default:'',description:'GCP key ring name to test against.')
gcp_kms_key_ring_binding_member_name = attribute(:gcp_kms_key_ring_binding_member_name,default:'',description:'GCP key ring name to test against.')
gcp_location = attribute(:gcp_location, default: '', description: 'The GCP region being used.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-kms-key-ring-iam-binding-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure single GCP GCP KMS Key Ring IAM bindings have the correct properties.  Examples below include attaching an IAM policy, binding and member to a key ring.'

  describe google_kms_key_ring_iam_binding(key_ring_url: "projects/#{gcp_project_id}/locations/#{gcp_location}/keyRings/#{gcp_kms_key_ring_policy_name}", role: "roles/editor") do
    it { should exist }
    its ('members.count'){ should eq 1 }
  end

  describe google_kms_key_ring_iam_binding(key_ring_url: "projects/#{gcp_project_id}/locations/#{gcp_location}/keyRings/#{gcp_kms_key_ring_binding_member_name}", role: "roles/editor") do
    it { should exist }
    its ('members.count'){ should eq 1 }
  end

  describe google_kms_key_ring_iam_binding(key_ring_url: "projects/#{gcp_project_id}/locations/#{gcp_location}/keyRings/#{gcp_kms_key_ring_binding_member_name}", role: "roles/owner") do
    it { should exist }
    its ('members.count'){ should eq 1 }
  end
end