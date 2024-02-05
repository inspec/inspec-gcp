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

title 'Test GCP google_compute_licenses resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  license = input('license', value: {
  "license": "value_license",
  "project": "value_project",
  "kind": "value_kind",
  "name": "value_name",
  "id": "value_id",
  "license_code": "value_licensecode",
  "creation_timestamp": "value_creationtimestamp",
  "description": "value_description",
  "self_link": "value_selflink"
}, description: 'license description')
control 'google_compute_licenses-1.0' do
  impact 1.0
  title 'google_compute_licenses resource test'

      describe google_compute_v1_licenses(project: gcp_project_id) do
      it { should exist }
    end
end
