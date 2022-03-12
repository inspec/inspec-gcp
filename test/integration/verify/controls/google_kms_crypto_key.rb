title 'Test GCP google_kms_crypto_key resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'GCP location')
gcp_kms_key_ring_policy_name = input(:gcp_kms_key_ring_policy_name, value: '', description: 'Key ring name')
gcp_kms_crypto_key_name_policy = input(:gcp_kms_crypto_key_name_policy, value: '', description: 'Key name')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: '', description: 'If we are running tests with escalated permissions(required for this test)')
gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization')

control 'google_kms_crypto_key-1.0' do
  impact 1.0
  title 'google_kms_crypto_key resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }
  describe google_kms_crypto_key(project: gcp_project_id, location: gcp_location, key_ring_name: gcp_kms_key_ring_policy_name, name: gcp_kms_crypto_key_name_policy) do
    it { should exist }
    its('crypto_key_name') { should cmp gcp_kms_crypto_key_name_policy }
    its('primary_state') { should eq "ENABLED" }
    its('purpose') { should eq "ENCRYPT_DECRYPT" }
    its('next_rotation_time') { should be > Time.now - 100000 }
    its('create_time') { should be > Time.now - 365*60*60*24*10 }
  end

  describe google_kms_crypto_key(project: gcp_project_id, location: gcp_location, key_ring_name: gcp_kms_key_ring_policy_name, name: "nonexistent") do
    it { should_not exist }
  end
end
