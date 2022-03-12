title 'Test GCP google_compute_global_operation resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
global_operation = input('global_operation', value: {
  "name": "operation-1635274037755-5cf45e8217d56-c081cd9a-c3ea7346",
  "operationType": "compute.externalVpnGateways.delete"
}, description: 'Global operation rule definition')

control 'google_compute_global_operation-1.0' do
  impact 1.0
  title 'google_compute_global_operation resource test'

  describe google_compute_global_operation(project: gcp_project_id, name: global_operation['name']) do
    it { should exist }
    its('operation_type') { should include global_operation['operationType'] }
  end
end
