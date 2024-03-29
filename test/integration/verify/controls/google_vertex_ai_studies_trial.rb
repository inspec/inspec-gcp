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

title 'Test GCP google_vertex_ai_studies_trial resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  studies_trial = input('studies_trial', value: {
    "name": "1",
    "region": "us-central1",
    "parent": "projects/165434197229/locations/us-central1/studies/2975668570413/trials/",
    "study": "890385007008",
    "start_time": "value_starttime",
    "end_time": "value_endtime",
    "infeasible_reason": "value_infeasiblereason",
    "client_id": "value_clientid",
    "custom_job": "value_customjob",
    "state": "value_state",
    "id": "1"
}, description: 'studies_trial description')
control 'google_vertex_ai_studies_trial-1.0' do
  impact 1.0
  title 'google_vertex_ai_studies_trial resource test'

  describe google_vertex_ai_studies_trial(name: "projects/#{gcp_project_id}/locations/#{studies_trial['region']}/studies/#{studies_trial['study']}/trials/#{studies_trial['name']}", region: studies_trial['region']) do
  	it { should exist }
  	its('start_time') { should cmp studies_trial['start_time'] }
  	its('end_time') { should cmp studies_trial['end_time'] }
  	its('name') { should cmp studies_trial['name'] }
  	its('infeasible_reason') { should cmp studies_trial['infeasible_reason'] }
  	its('client_id') { should cmp studies_trial['client_id'] }
  	its('custom_job') { should cmp studies_trial['custom_job'] }
  	its('state') { should cmp studies_trial['state'] }
  	its('id') { should cmp studies_trial['id'] }

  end

  describe google_vertex_ai_studies_trial(name: "does_not_exit", region: studies_trial['region']) do
  	it { should_not exist }
  end
end
