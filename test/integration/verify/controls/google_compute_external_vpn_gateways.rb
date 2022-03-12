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

title 'Test GCP google_compute_external_vpn_gateways resource.'

gcp_project_id = input(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')

control 'google_compute_external_vpn_gateways-1.0' do
  impact 1.0
  title 'google_compute_external_vpn_gateways resource test'

  describe google_compute_external_vpn_gateways(project: gcp_project_id) do
  it { should exist }
  end
end
