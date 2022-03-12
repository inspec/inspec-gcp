title 'Test GCP google_access_context_manager_service_perimeter resource.'

gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization that is the parent of the perimeter')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description: 'Flag to enable privileged resources requiring elevated privileges in GCP.')
service_perimeter = input('service_perimeter', value: {
  "name": "restrict_all",
  "title": "restrict_all",
  "restricted_service": "storage.googleapis.com",
  "policy_title": "policytitle"
}, description: 'Service perimeter definition')

control 'google_access_context_manager_service_perimeter-1.0' do
  impact 1.0
  title 'google_access_context_manager_service_perimeter resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }

  describe.one do
    google_access_context_manager_access_policies(org_id: gcp_organization_id).names.each do |policy_name|
      describe google_access_context_manager_service_perimeter(policy_name: policy_name, name: service_perimeter['name']) do
        it { should exist }
        its('title') { should cmp service_perimeter['title'] }
        its('status.restricted_services') { should include service_perimeter['restricted_service'] }
      end
    end
  end
end
