title 'GCP KMS Key Rings Properties'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP region being used.')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description: 'Flag to enable privileged resources requiring elevated privileges in GCP.')
gcp_kms_key_ring_policy_name = input(:gcp_kms_key_ring_policy_name, value:'', description: 'GCP key ring name to test against.')
gcp_kms_key_ring_binding_member_name = input(:gcp_kms_key_ring_binding_member_name, value:'', description: 'GCP key ring name to test against.')

control 'gcp-key-rings-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure KMS key rings have the correct properties in bulk'

  describe google_kms_key_rings(project: gcp_project_id, location: gcp_location) do
    it { should exist }
    its ('key_ring_names') { should include gcp_kms_key_ring_policy_name }
    its ('key_ring_names') { should include gcp_kms_key_ring_binding_member_name }
  end

end