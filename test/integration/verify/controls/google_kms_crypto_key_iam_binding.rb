title 'GCP KMS Crypto Key IAM Binding Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: '', description: 'The GCP region being used.')
gcp_kms_key_ring_policy_name = attribute(:gcp_kms_key_ring_policy_name,default:'',description:'GCP key ring name to test against.')
gcp_kms_crypto_key_name_policy = attribute(:gcp_kms_crypto_key_name_policy, default: '', description: 'The GCP cryto key name.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')
gcp_kms_crypto_key_name_binding = attribute(:gcp_kms_crypto_key_name_binding,default:'',description:'GCP key ring name to test against.')
gcp_kms_key_ring_binding_member_name = attribute(:gcp_kms_key_ring_binding_member_name, default: '', description: 'The GCP cryto key name.')


control 'gcp-crypto-key-iam-binding-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure single KMS Crypto Key IAM Binding has the correct properties'

  describe google_kms_crypto_key_iam_binding(crypto_key_url: "projects/#{gcp_project_id}/locations/#{gcp_location}/keyRings/#{gcp_kms_key_ring_binding_member_name}/cryptoKeys/#{gcp_kms_crypto_key_name_binding}", role: "roles/editor") do
    it { should exist }
    its('members.count') { should eq 1}
  end

  describe google_kms_crypto_key_iam_binding(crypto_key_url: "projects/#{gcp_project_id}/locations/#{gcp_location}/keyRings/#{gcp_kms_key_ring_policy_name}/cryptoKeys/#{gcp_kms_crypto_key_name_policy}", role: "roles/editor") do
    it { should exist }
    its('members.count') { should eq 1}
  end
end