title 'Test GCP google_compute_target_pools resource.'

# gcp_ext_vm_name = input(:gcp_ext_vm_name, value: '', description: 'The name of a VM instance.')
# gcp_zone = input(:gcp_zone, value: '', description: 'The GCP zone.')
gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
target_pool = input('target_pool', value: {
  "name": "inspec-gcp-target-pool",
  "session_affinity": "CLIENT_IP"
}, description: 'Target pool definition')

control 'google_compute_target_pools-1.0' do
  impact 1.0
  title 'google_compute_target_pools resource test'

  describe google_compute_target_pools(project: gcp_project_id, region: gcp_location) do
    its('names') { should include target_pool['name'] }
    its('session_affinities') { should include target_pool['session_affinity'] }
  end
end
