title 'Test single GCP storage bucket IAM binding'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_storage_bucket_binding = attribute(:gcp_storage_bucket_binding, default: '', description: 'The GCP bucket with IAM binding.')
gcp_storage_bucket_member = attribute(:gcp_storage_bucket_member, default: '', description: 'The GCP bucket with IAM member.')
gcp_storage_bucket_policy = attribute(:gcp_storage_bucket_policy, default: '', description: 'The GCP bucket with IAM policy.')
gcp_service_account_display_name = attribute(:gcp_service_account_display_name, default:'', description: 'Service account display name.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-storage-bucket-iam-binding-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure storage bucket IAM binding has the correct properties.'

  describe google_storage_bucket_iam_binding(bucket: gcp_storage_bucket_binding, role: 'roles/storage.objectViewer') do
    it { should exist }
    its ('members.count'){ should eq 1 } # i.e. our service account
    # below is brittle, could extract service account email from tf in the future...
    its('members') {should include "serviceAccount:#{gcp_service_account_display_name}@#{gcp_project_id}.iam.gserviceaccount.com" }
  end

  describe google_storage_bucket_iam_binding(bucket: gcp_storage_bucket_member, role: 'roles/storage.objectViewer') do
    it { should exist }
    its ('members.count'){ should eq 1 } # i.e. our service account
    # below is brittle, could extract service account email from tf in the future...
    its('members') {should include "serviceAccount:#{gcp_service_account_display_name}@#{gcp_project_id}.iam.gserviceaccount.com" }
  end

  describe google_storage_bucket_iam_binding(bucket: gcp_storage_bucket_policy, role: 'roles/storage.admin') do
    it { should exist }
    its ('members.count'){ should eq 1 } # i.e. our service account
    # below is brittle, could extract service account email from tf in the future...
    its('members') {should include "serviceAccount:#{gcp_service_account_display_name}@#{gcp_project_id}.iam.gserviceaccount.com" }
  end
end