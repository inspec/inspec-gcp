title 'IAM Service Account Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_service_account_display_name = attribute(:gcp_service_account_display_name, default: '', description: 'The GCP IAM Service Account display name.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'google-service-account-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure that the Service Account is correctly set up'

  describe google_service_account(name: "projects/#{gcp_project_id}/serviceAccounts/#{gcp_service_account_display_name}@#{gcp_project_id}.iam.gserviceaccount.com") do
    its('display_name') { should match gcp_service_account_display_name } # by design in this case
    its('project_id') { should eq gcp_project_id }
  end
end