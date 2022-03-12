title 'Test GCP google_compute_global_operations resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
global_operation = input('global_operation', value: {
  "name": "operation-1634799391539-5ced765030229-be5d5765-6623920f",
  "operationType": "compute.externalVpnGateways.delete"
}, description: 'Global operation rule definition')

control 'google_compute_global_operations-1.0' do
  impact 1.0
  title 'google_compute_global_operations resource test'
  describe google_compute_global_operations(project: gcp_project_id) do
    it { should exist }
    its('operation_types') { should include global_operation[:operationType] }
  end
end
