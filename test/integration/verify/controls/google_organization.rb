title 'Test GCP google_organization resource.'

gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization that is the parent of this folder')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'google_organization-1.0' do
  impact 1.0
  title 'google_organization resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }

  describe google_organization(name: "organizations/#{gcp_organization_id}") do
    its('name') { should eq "organizations/#{gcp_organization_id}" }
    its('lifecycle_state') { should cmp 'ACTIVE' }
  end
end
