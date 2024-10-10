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

title 'Test GCP google_compute_region_notification_endpoints resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  region_notification_endpoint = input('region_notification_endpoint', value: {
  "project": "value_project",
  "public_advertised_prefix": "value_publicadvertisedprefix",
  "kind": "value_kind",
  "id": "value_id",
  "creation_timestamp": "value_creationtimestamp",
  "name": "value_name",
  "description": "value_description",
  "self_link": "value_selflink",
  "region": "value_region"
}, description: 'region_notification_endpoint description')
control 'google_compute_region_notification_endpoints-1.0' do
  impact 1.0
  title 'google_compute_region_notification_endpoints resource test'

      describe google_compute_region_notification_endpoints(project: gcp_project_id, region: region_notification_endpoint['region']) do
      it { should exist }
    end
end