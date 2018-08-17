title 'Test single GCP storage bucket ACL'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_storage_bucket_acl = attribute(:gcp_storage_bucket_acl, default: '', description: 'The GCP bucket with ACL set.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-storage-bucket-acl-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure storage bucket ACL has the correct properties.'

  describe google_storage_bucket_acl(bucket: gcp_storage_bucket_acl, entity: "user-object-viewer@#{gcp_project_id}.iam.gserviceaccount.com") do
    it { should exist }
    its('email') { should include "object-viewer@#{gcp_project_id}.iam.gserviceaccount.com" }
    its('role') { should eq "OWNER" }
    its('bucket') { should eq gcp_storage_bucket_acl }
  end

end