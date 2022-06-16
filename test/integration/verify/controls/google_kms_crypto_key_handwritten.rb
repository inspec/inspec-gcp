title 'Test single GCP KMS Crypto Key'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_kms_key_ring_policy_name = input(:gcp_kms_key_ring_policy_name,value:'',description:'GCP key ring name to test against.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP region being used.')
gcp_kms_crypto_key_name_policy = input(:gcp_kms_crypto_key_name_policy, value: '', description: 'The GCP cryto key name.')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources,value:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-kms-crypto-key-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure single GCP KMS Crypto Key has the correct properties.'

  describe google_kms_crypto_key(project: gcp_project_id, location: gcp_location, key_ring_name: gcp_kms_key_ring_policy_name, name: gcp_kms_crypto_key_name_policy) do
    it { should exist }
    its('create_time') { should be > Time.now - 365*60*60*24*10 }
    its('crypto_key_name'){ should eq gcp_kms_crypto_key_name_policy }
    its('primary_state') { should eq "ENABLED" }
    its('purpose') { should eq "ENCRYPT_DECRYPT" }
    its('next_rotation_time') { should be > Time.now - 100000 }
  end
end