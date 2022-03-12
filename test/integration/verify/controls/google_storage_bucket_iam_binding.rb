title 'Test single GCP storage bucket IAM binding'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_storage_bucket_binding = input(:gcp_storage_bucket_binding, value: '', description: 'The GCP bucket with IAM binding.')
gcp_storage_bucket_member = input(:gcp_storage_bucket_member, value: '', description: 'The GCP bucket with IAM member.')
gcp_storage_bucket_policy = input(:gcp_storage_bucket_policy, value: '', description: 'The GCP bucket with IAM policy.')
gcp_service_account_display_name = input(:gcp_service_account_display_name, value:'', description: 'Service account display name.')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

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