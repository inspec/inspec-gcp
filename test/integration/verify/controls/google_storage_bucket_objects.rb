title 'Storage Bucket Objects Properties'

gcp_storage_bucket_object = attribute(:gcp_storage_bucket_object, default: '', description: 'The GCP bucket with objects.')
gcp_storage_bucket_object_name = attribute(:gcp_storage_bucket_object_name, default: '', description: 'The GCP bucket object name.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-storage-bucket-objects-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure that the Storage Bucket Objects have the correct properties in bulk'

  describe google_storage_bucket_objects(bucket: gcp_storage_bucket_object) do
    it { should exist }
    its('object_buckets') { should include gcp_storage_bucket_object }
    its('object_names') { should include gcp_storage_bucket_object_name}
  end
end