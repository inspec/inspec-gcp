title 'Test GCP google_compute_target_pool resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
gcp_ext_vm_name = input(:gcp_ext_vm_name, value: '', description: 'The name of a VM instance.')
target_pool = input('target_pool', value: {
  "name": "inspec-gcp-target-pool",
  "session_affinity": "CLIENT_IP"
}, description: 'Target pool definition')
gcp_zone = input(:gcp_zone, value: '', description: 'The GCP zone.')

control 'google_compute_target_pool-1.0' do
  impact 1.0
  title 'google_compute_target_pool resource test'

  describe google_compute_target_pool(project: gcp_project_id, region: gcp_location, name: target_pool['name']) do
    it { should exist }
    its('session_affinity') { should eq target_pool['session_affinity'] }
    it { should has_target_instance(gcp_ext_vm_name, gcp_zone) }
  end

  describe google_compute_target_pool(project: gcp_project_id, region: gcp_location, name: 'nonexistent') do
    it { should_not exist }
  end
end
