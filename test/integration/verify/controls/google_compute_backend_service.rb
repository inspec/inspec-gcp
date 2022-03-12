title 'Test GCP google_compute_backend_service resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
backend_service = input('backend_service', value: {
  "name": "inspec-gcp-backend-service",
  "description": "A description",
  "port_name": "http",
  "protocol": "HTTP",
  "timeout_sec": 10,
  "enable_cdn": true
}, description: 'Backend service definition')

control 'google_compute_backend_service-1.0' do
  impact 1.0
  title 'google_compute_backend_service resource test'

  describe google_compute_backend_service(project: gcp_project_id, name: backend_service['name']) do
    it { should exist }
    its('description') { should eq backend_service['description'] }
    its('port_name') { should eq backend_service['port_name'] }
    its('protocol') { should eq backend_service['protocol'] }
    its('timeout_sec') { should eq backend_service['timeout_sec'] }
    its('enable_cdn') { should eq backend_service['enable_cdn'] }
  end

  describe google_compute_backend_service(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
