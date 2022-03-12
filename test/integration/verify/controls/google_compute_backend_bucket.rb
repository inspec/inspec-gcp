title 'Test GCP google_compute_backend_bucket resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_storage_bucket_name = input(:gcp_storage_bucket_name, value: '', description: 'The GCS bucket name to use for the backend bucket.')
backend_bucket = input('backend_bucket', value: {
  "name": "inspec-gcp-backend-bucket",
  "description": "Backend bucket example",
  "enable_cdn": true
}, description: 'Backend bucket definition')

control 'google_compute_backend_bucket-1.0' do
  impact 1.0
  title 'google_compute_backend_bucket resource test'

  describe google_compute_backend_bucket(project: gcp_project_id, name: backend_bucket['name']) do
    it { should exist }
    its('description') { should eq backend_bucket['description'] }
    its('enable_cdn') { should be backend_bucket['enable_cdn'] }
  end

  describe google_compute_backend_bucket(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
