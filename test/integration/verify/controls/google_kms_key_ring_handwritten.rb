title 'Test single GCP KMS Key Ring'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: '', description: 'The GCP region being used.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')
gcp_kms_key_ring_policy_name = attribute(:gcp_kms_key_ring_policy_name,default:'',description:'GCP key ring name to test against.')

control 'gcp-key-ring-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure single KMS Key Ring has the correct properties.'

  describe google_kms_key_ring(project: gcp_project_id, location: gcp_location, name: gcp_kms_key_ring_policy_name) do
    it { should exist }
    its('create_time_date') { should be > Time.now - 365*60*60*24*10 }
    its('key_ring_name'){ should eq gcp_kms_key_ring_policy_name }
  end
end