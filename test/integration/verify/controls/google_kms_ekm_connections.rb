# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    Type: MMv1     ***
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

title 'Test GCP google_kms_ekm_connections resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: 'gcp_location', description: 'GCP location')
gcp_kms_connection_name = input(:gcp_kms_connection_name, value: 'gcp_kms_connection_name', description: 'GCP location')
control 'google_kms_ekm_connections-1.0' do
  impact 1.0
  title 'google_kms_ekm_connections resource test'

  describe google_kms_ekm_connections(project: gcp_project_id, location: gcp_location) do
    it { should exist }
  end
end