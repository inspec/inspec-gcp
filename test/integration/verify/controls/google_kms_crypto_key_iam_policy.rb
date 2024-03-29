title 'GCP KMS Crypto Key IAM Bindings Properties'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP region being used.')
gcp_kms_key_ring_binding_member_name = input(:gcp_kms_key_ring_binding_member_name,value:'',description:'GCP key ring name to test against.')
gcp_kms_crypto_key_name_binding = input(:gcp_kms_crypto_key_name_binding,value:'',description:'Key in key ring to test.')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources,value:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-kms-crypto-key-iam-bindings-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure GCP KMS Crypto Key IAM Bindings have the correct properties in bulk'

  describe google_kms_crypto_key_iam_policy(project: gcp_project_id, location: gcp_location, key_ring_name: gcp_kms_key_ring_binding_member_name, crypto_key_name: gcp_kms_crypto_key_name_binding) do
    it { should exist }
    its('count') { should be <= 100}
    its('iam_binding_roles') { should include "roles/editor" }
  end
end