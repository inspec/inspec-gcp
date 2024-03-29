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

title 'Test GCP google_compute_target_instances resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
ti_zone = input(:ti_zone, value: 'asia-east1-a', description: 'target_instance zone.')

control 'google_compute_target_instances-1.0' do
  impact 1.0
  title 'google_compute_target_instances resource test'
  describe google_compute_target_instances(project: gcp_project_id, zone: ti_zone) do
    it { should exist }
  end
end
