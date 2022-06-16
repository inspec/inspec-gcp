title 'GCP KMS Crypto Key IAM Binding Properties'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP region being used.')
gcp_kms_key_ring_policy_name = input(:gcp_kms_key_ring_policy_name,value:'',description:'GCP key ring name to test against.')
gcp_kms_crypto_key_name_policy = input(:gcp_kms_crypto_key_name_policy, value: '', description: 'The GCP cryto key name.')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources,value:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')
gcp_kms_crypto_key_name_binding = input(:gcp_kms_crypto_key_name_binding,value:'',description:'GCP key ring name to test against.')
gcp_kms_key_ring_binding_member_name = input(:gcp_kms_key_ring_binding_member_name, value: '', description: 'The GCP cryto key name.')


control 'gcp-crypto-key-iam-binding-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure single KMS Crypto Key IAM Binding has the correct properties'

  describe google_kms_crypto_key_iam_binding(project: gcp_project_id, location: gcp_location, key_ring_name: gcp_kms_key_ring_binding_member_name, crypto_key_name: gcp_kms_crypto_key_name_binding, role: "roles/editor") do
    it { should exist }
    its('members.count') { should eq 1}
  end

  describe google_kms_crypto_key_iam_binding(project: gcp_project_id, location: gcp_location, key_ring_name: gcp_kms_key_ring_policy_name, crypto_key_name: gcp_kms_crypto_key_name_policy, role: "roles/editor") do
    it { should exist }
    its('members.count') { should eq 1}
  end
end