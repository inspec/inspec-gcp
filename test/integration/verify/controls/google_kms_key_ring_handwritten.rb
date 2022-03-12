title 'Test single GCP KMS Key Ring'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP region being used.')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description:' Flag to enable privileged resources requiring elevated privileges in GCP.')
gcp_kms_key_ring_policy_name = input(:gcp_kms_key_ring_policy_name, value: '', description: 'GCP key ring name to test against.')

control 'gcp-key-ring-1.0' do
  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure single KMS Key Ring has the correct properties.'

  describe google_kms_key_ring(project: gcp_project_id, location: gcp_location, name: gcp_kms_key_ring_policy_name) do
    it { should exist }
    its('create_time') { should be > Time.now - 365*60*60*24*10 }
    its('key_ring_name'){ should eq gcp_kms_key_ring_policy_name }
  end
end