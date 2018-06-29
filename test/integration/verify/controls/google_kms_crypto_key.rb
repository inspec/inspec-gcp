title 'Test single GCP KMS Crypto Key'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_kms_key_ring_policy_name = attribute(:gcp_kms_key_ring_policy_name,default:'',description:'GCP key ring name to test against.')
gcp_location = attribute(:gcp_location, default: '', description: 'The GCP region being used.')
gcp_kms_crypto_key_name_policy = attribute(:gcp_kms_crypto_key_name_policy, default: '', description: 'The GCP cryto key name.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-kms-crypto-key-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure single GCP KMS Crypto Key has the correct properties.'

  describe google_kms_crypto_key(project: gcp_project_id, location: gcp_location, key_ring_name: gcp_kms_key_ring_policy_name, name: gcp_kms_crypto_key_name_policy) do
    it { should exist }
    its('create_time_date') { should be > Time.now - 365*60*60*24*10 }
    its('crypto_key_name'){ should eq gcp_kms_crypto_key_name_policy }
    its('primary_state') { should eq "ENABLED" }
    its('purpose') { should eq "ENCRYPT_DECRYPT" }
    its('next_rotation_time_date') { should be > Time.now - 100000 }
    its('create_time_date') { should be > Time.now - 365*60*60*24*10 }
  end
end