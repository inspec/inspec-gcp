title 'Test GCP Organizations'

gcp_organization_id = attribute(:gcp_organization_id, default: '', description: 'The GCP organization identifier.')
gcp_organization_display_name = attribute(:gcp_organization_display_name, default: '', description: 'The GCP organization display name.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-organizations-loop-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1  && gcp_organization_id != ''}
  impact 1.0
  title 'Ensure organizations have the correct properties in bulk.'

  describe google_organizations do
    it { should exist }
    its('names'){ should include "organizations/#{gcp_organization_id}" }
    its('display_names'){ should include gcp_organization_display_name }
    its('lifecycle_state'){ should include 'ACTIVE' }
  end
end