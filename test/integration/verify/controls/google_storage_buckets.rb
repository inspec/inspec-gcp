title 'Loop over all GCP Storage Buckets for a project'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_project_number = attribute(:gcp_project_number, default: '', description: 'The GCP project number.')
gcp_storage_bucket_name = attribute(:gcp_storage_bucket_name, default:'', description: 'The Storage Bucket name.')
gcp_location = attribute(:gcp_location, default: '', description: 'The GCP region being used.')

control 'gcp-storage-buckets-1.0' do

  impact 1.0
  title 'Ensure storage buckets have the correct properties in bulk.'

  describe google_storage_buckets(project: gcp_project_id) do
    it { should exist }
    its('count') { should be <= 100}
    its('bucket_names') { should include gcp_storage_bucket_name }
    its('bucket_ids') { should include gcp_storage_bucket_name }
    its('bucket_locations') { should include gcp_location.upcase }
    its('bucket_project_numbers') {should include gcp_project_number.to_i }
  end
end