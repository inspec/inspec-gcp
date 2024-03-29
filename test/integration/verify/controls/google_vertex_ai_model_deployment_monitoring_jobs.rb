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

title 'Test GCP google_vertex_ai_model_deployment_monitoring_jobs resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  model_deployment_monitoring_job = input('model_deployment_monitoring_job', value: {
  "name": "4965515800912855040",
  "region": "us-central1",
  "parent": "projects/165434197229/locations/us-central1/modelDeploymentMonitoringJobs/",
  "state": "value_state",
  "analysis_instance_schema_uri": "value_analysisinstanceschemauri",
  "endpoint": "projects/165434197229/locations/us-central1/endpoints/5787303642054787072",
  "display_name": "churn",
  "schedule_state": "value_schedulestate",
  "predict_instance_schema_uri": "value_predictinstanceschemauri",
  "next_schedule_time": "value_nextscheduletime",
  "create_time": "value_createtime",
  "log_ttl": "value_logttl",
  "update_time": "value_updatetime"
}, description: 'model_deployment_monitoring_job description')
control 'google_vertex_ai_model_deployment_monitoring_jobs-1.0' do
  impact 1.0
  title 'google_vertex_ai_model_deployment_monitoring_jobs resource test'

      describe google_vertex_ai_model_deployment_monitoring_jobs(parent: "projects/#{gcp_project_id}/locations/#{model_deployment_monitoring_job['region']}", region: model_deployment_monitoring_job['region']) do
      it { should exist }
    end
end
