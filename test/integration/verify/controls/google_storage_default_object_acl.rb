title 'Test single GCP storage default object ACL'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_storage_object_default_acl = attribute(:gcp_storage_bucket_name, default: '', description: 'The GCP bucket with default ACL set.')
gcp_service_account_display_name = attribute(:gcp_service_account_display_name, default:'', description: 'Service account display name.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-storage-default-object-acl-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure storage default object ACL has the correct properties.'

  describe google_storage_default_object_acl(bucket: gcp_storage_object_default_acl, entity: "user-#{gcp_service_account_display_name}@#{gcp_project_id}.iam.gserviceaccount.com") do
    it { should exist }
    its('email') { should include "#{gcp_service_account_display_name}@#{gcp_project_id}.iam.gserviceaccount.com" }
    its('role') { should eq "OWNER" }
  end

end