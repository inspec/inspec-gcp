title 'Storage Bucket Object Properties'

gcp_storage_bucket_object = attribute(:gcp_storage_bucket_object, default: '', description: 'The GCP bucket with objects.')
gcp_storage_bucket_object_name = attribute(:gcp_storage_bucket_object_name, default: '', description: 'The GCP bucket object name.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-storage-bucket-object-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure that the Storage Bucket Object has been created correctly'

  describe google_storage_bucket_object(bucket: gcp_storage_bucket_object, object: gcp_storage_bucket_object_name) do
    it { should exist }
    its('name') { should eq gcp_storage_bucket_object_name }
    its('size') { should be > 0 }
    its('content_type') { should eq "text/plain; charset=utf-8" }
    its('time_created_date') { should be > Time.now - 365*60*60*24*10 }
    its('updated_date') { should be > Time.now - 365*60*60*24*10 }
  end
end