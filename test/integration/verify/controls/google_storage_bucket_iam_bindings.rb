title 'GCP Storage Bucket IAM Bindings Properties'

gcp_storage_bucket_binding = attribute(:gcp_storage_bucket_binding, default: '', description: 'The GCP bucket with IAM binding.')
gcp_storage_bucket_member = attribute(:gcp_storage_bucket_member, default: '', description: 'The GCP bucket with IAM member.')
gcp_storage_bucket_policy = attribute(:gcp_storage_bucket_policy, default: '', description: 'The GCP bucket with IAM policy.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-storage-bucket-iam-bindings-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure project IAM bindings have the correct properties in bulk'

  describe google_storage_bucket_iam_bindings(bucket: gcp_storage_bucket_binding) do
    it { should exist }
    its('count') { should be <= 100}
    its('iam_binding_roles') { should include "roles/storage.objectViewer"  }
  end

  describe google_storage_bucket_iam_bindings(bucket: gcp_storage_bucket_member) do
    it { should exist }
    its('iam_binding_roles') { should include "roles/storage.objectViewer" }
  end

  describe google_storage_bucket_iam_bindings(bucket: gcp_storage_bucket_policy) do
    it { should exist }
    its('iam_binding_roles') { should include "roles/storage.admin" }
  end
end