title 'Storage Bucket Properties'

gcp_project_number = attribute(:gcp_project_number, default: '', description: 'The GCP project number.')
gcp_location = attribute(:gcp_location, default: '', description: 'The GCP region being used.')
gcp_storage_bucket_name = attribute(:gcp_storage_bucket_name, default:'', description: 'The Storage Bucket name.')

control 'gcp-storage-bucket-1.0' do

  impact 1.0
  title 'Ensure that the Storage Bucket has been created correctly'

  describe google_storage_bucket(name: gcp_storage_bucket_name) do
    it { should exist }
    its('name') { should eq gcp_storage_bucket_name }
    its('id') { should eq gcp_storage_bucket_name }
    its('location') { should eq gcp_location.upcase }
    its('kind') { should eq "storage#bucket" }
    its('project_number') {should eq gcp_project_number.to_i }
    its('storage_class') { should eq 'STANDARD' }
  end
end