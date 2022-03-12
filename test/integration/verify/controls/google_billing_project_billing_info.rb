title 'Test GCP google_billing_project_billing_info resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_billing_account = input(:gcp_billing_account, value: '', description: 'The GCP billing account name.')
gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description: 'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'google_billing_project_billing_info-1.0' do
  impact 1.0
  title 'google_billing_project_billing_info resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }
  describe google_billing_project_billing_info(project_id: gcp_project_id) do
    it { should exist }

    its('billing_account_name') { should eq gcp_billing_account }
    its('billing_enabled') { should eq true }
  end
end
