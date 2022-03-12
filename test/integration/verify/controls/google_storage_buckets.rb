title 'Test GCP google_storage_buckets resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
# gcp_location = input(:gcp_location, value: '', description: 'GCP location')

control 'google_storage_buckets-1.0' do
  impact 1.0
  title 'google_storage_buckets resource test'

  describe google_storage_buckets(project: gcp_project_id) do
    its('bucket_names') { should include "inspec-gcp-static-#{gcp_project_id}" }
  end
end
