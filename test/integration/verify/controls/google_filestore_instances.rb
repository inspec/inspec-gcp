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

title 'Test GCP google_filestore_instances resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
filestore_instance = input('filestore_instance', value: {"name"=>"inspecgcp", "zone"=>"us-central1-b", "tier"=>"PREMIUM", "fileshare_capacity_gb"=>2660, "fileshare_name"=>"inspecgcp", "network_name"=>"default", "network_mode"=>"MODE_IPV4"})
control 'google_filestore_instances-1.0' do
  impact 1.0
  title 'google_filestore_instances resource test'

  describe google_filestore_instances(project: gcp_project_id, zone: filestore_instance['zone']) do
    its('tiers') { should include filestore_instance['tier'] }
  end
end
