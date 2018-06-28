title 'GCP KMS Key Ring IAM Binding Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: '', description: 'The GCP region being used.')
gcp_kms_key_ring_binding_member_name = attribute(:gcp_kms_key_ring_binding_member_name,default:'',description:'GCP key ring name to test against.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-kms-key-ring-iam-bindings-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure GCP KMS Key Ring IAM bindings have the correct properties in bulk'

  describe google_kms_key_ring_iam_bindings(key_ring_url: "projects/#{gcp_project_id}/locations/#{gcp_location}/keyRings/#{gcp_kms_key_ring_binding_member_name}") do
    it { should exist }
    its('count') { should be <= 100}
    its('iam_binding_roles') { should include "roles/owner" }
    its('iam_binding_roles') { should include "roles/editor" }
  end
end