title 'Test GCP google_compute_global_addresses resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
global_address = input('global_address', value: {
  "name": "inspec-gcp-global-address",
  "ip_version": "IPV6"
}, description: 'Compute Global Address definition')

control 'google_compute_global_addresses-1.0' do
  impact 1.0
  title 'google_compute_global_addresses resource test'

  describe google_compute_global_addresses(project: gcp_project_id, name: global_address['name']) do
    its('count') { should be >= 1 }
    its('names') { should include global_address['name'] }
    its('ip_versions') { should include global_address['ip_version'] }
  end
end
