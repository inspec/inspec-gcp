# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_compute_backend_services resource.'

gcp_project_id = input(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
backend_service = input('backend_service', default: {
  "name": "inspec-gcp-backend-service",
  "description": "A description",
  "port_name": "http",
  "protocol": "HTTP",
  "timeout_sec": 10,
  "enable_cdn": true
}, description: 'Backend service definition')

control 'google_compute_backend_services-1.0' do
  impact 1.0
  title 'google_compute_backend_services resource test'

  describe google_compute_backend_services(project: gcp_project_id) do
    its('count') { should be >= 1 }
    its('names') { should include backend_service['name'] }
    its('port_names') { should include backend_service['port_name'] }
    its('protocols') { should include backend_service['protocol'] }
    its('timeout_secs') { should include backend_service['timeout_sec'] }
  end
end
