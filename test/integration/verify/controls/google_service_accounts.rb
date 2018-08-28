title 'Service Accounts Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_service_account_display_name = attribute(:gcp_service_account_display_name, default: '', description: 'The GCP IAM Service Account display name.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-service-accounts-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure service accounts have the correct properties in bulk'

  describe google_service_accounts(project: gcp_project_id) do
    it { should exist }
    its('count') { should be <= 1000}
    its('service_account_display_names') { should include gcp_service_account_display_name }
  end
end
