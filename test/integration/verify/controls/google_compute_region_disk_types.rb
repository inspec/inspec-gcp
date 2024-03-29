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

title 'Test GCP google_compute_region_disk_types resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  region_disk_type = input('region_disk_type', value: {
  "project": "ppradhan",
  "region": "us-central1",
  "kind": "compute#diskType",
  "id": "value_id",
  "creation_timestamp": "value_creationtimestamp",
  "name": "pd-balanced",
  "description": "Balanced Persistent Disk",
  "valid_disk_size": "100",
  "zone": "value_zone",
  "self_link": "value_selflink",
  "default_disk_size_gb": "value_defaultdisksizegb"
}, description: 'region_disk_type description')
control 'google_compute_region_disk_types-1.0' do
  impact 1.0
  title 'google_compute_region_disk_types resource test'

    describe google_compute_region_disk_types(project: gcp_project_id, region: region_disk_type['region']) do
      it { should exist }
    end
end
