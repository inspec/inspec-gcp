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

title 'Test GCP google_vertex_ai_custom_jobs resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  custom_job = input('custom_job', value: {
  "name": "value_name",
  "job_id": "job_id",
  "region": "value_region",
  "parent": "value_parent"
}, description: 'custom_job description')
control 'google_vertex_ai_custom_jobs-1.0' do
  impact 1.0
  title 'google_vertex_ai_custom_jobs resource test'

  describe google_vertex_ai_custom_jobs(name: "projects/#{gcp_project_id}/locations/#{custom_job['region']}", region: custom_job['region']) do
      it { should exist }
      its ('display_names') { should include custom_job['name']}
  end
end