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

title 'Test GCP google_vertex_ai_batch_prediction_job resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  batch_prediction_job = input('batch_prediction_job', value: {
  "name": "5035574482811486208",
  "region": "us-central1",
  "parent": "value_parent",
  "create_time": "2023-09-15T11:46:26.533131Z",
  "model_version_id": "1",
  "end_time": "2023-09-15T11:59:58.296734Z",
  "start_time": "2023-09-15T11:48:37.092389Z",
  "update_time": "value_updatetime",
  "state": "JOB_STATE_SUCCEEDED",
  "model": "projects/165431197229/locations/us-central1/models/3496242467164913664",
  "display_name": "testpreded",
  "service_account": "value_serviceaccount"
}, description: 'batch_prediction_job description')
control 'google_vertex_ai_batch_prediction_job-1.0' do
  impact 1.0
  title 'google_vertex_ai_batch_prediction_job resource test'

  describe google_vertex_ai_batch_prediction_job(name: "projects/#{gcp_project_id}/locations/#{batch_prediction_job['region']}/batchPredictionJobs/#{batch_prediction_job['name']}", region: batch_prediction_job['region']) do
  	it { should exist }
  	its('create_time') { should cmp batch_prediction_job['create_time'] }
  	its('model_version_id') { should cmp batch_prediction_job['model_version_id'] }
  	its('end_time') { should cmp batch_prediction_job['end_time'] }
  	its('start_time') { should cmp batch_prediction_job['start_time'] }
  	its('state') { should cmp batch_prediction_job['state'] }
  	its('model') { should cmp batch_prediction_job['model'] }
  	its('display_name') { should cmp batch_prediction_job['display_name'] }
  end

  describe google_vertex_ai_batch_prediction_job(name: "does_not_exit", region: batch_prediction_job['region']) do
  	it { should_not exist }
  end
end
