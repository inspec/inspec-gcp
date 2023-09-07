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

title 'Test GCP google_compute_region_security_policy resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  region_security_policy = input('region_security_policy', value: {
  "securitypolicy": "value_securitypolicy"
}, description: 'region_security_policy description')
control 'google_compute_region_security_policy-1.0' do
  impact 1.0
  title 'google_compute_region_security_policy resource test'

        describe google_compute_region_security_policy(project: gcp_project_id, region: region_security_policy['region'], securityPolicy: region_security_policy['securityPolicy']) do
       it { should exist }
     end
end
