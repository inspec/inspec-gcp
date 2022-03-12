title 'Test GCP google_compute_zone_operation resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
zone_operation = input('zone_operation', value: {
  "name": "operation-1641188179305-5d4a6e66fe2bd-8fd1812d-d97f3b69",
  "zone": "us-central1-a",
  "operation_type": "compute.instanceGroupManagers.insert",
  "status": "DONE",
  "progress": 100
}, description: 'Operation resources contained within the specified zone')

control 'google_compute_zone_operation-1.0' do
  impact 1.0
  title 'google_compute_zone_operation resource test'

  describe google_compute_zone_operation(project: gcp_project_id, zone: zone_operation['zone'], name: zone_operation['name']) do
    it { should exist }
    its('name') { should eq zone_operation['name'] }
    its('status') { should eq zone_operation['status'] }
    its('progress') { should eq zone_operation['progress'] }
  end

  describe google_compute_zone_operation(project: gcp_project_id, zone: zone_operation['zone'], name: 'nonexistent') do
    it { should_not exist }
  end
end
