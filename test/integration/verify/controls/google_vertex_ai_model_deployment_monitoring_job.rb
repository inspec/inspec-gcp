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

title 'Test GCP google_vertex_ai_model_deployment_monitoring_job resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  model_deployment_monitoring_job = input('model_deployment_monitoring_job', value: {
  "name": "value_name",
  "region": "value_region",
  "parent": "value_parent",
  "state": "value_state",
  "analysis_instance_schema_uri": "value_analysisinstanceschemauri",
  "endpoint": "value_endpoint",
  "display_name": "value_displayname",
  "schedule_state": "value_schedulestate",
  "predict_instance_schema_uri": "value_predictinstanceschemauri",
  "next_schedule_time": "value_nextscheduletime",
  "create_time": "value_createtime",
  "log_ttl": "value_logttl",
  "update_time": "value_updatetime"
}, description: 'model_deployment_monitoring_job description')
control 'google_vertex_ai_model_deployment_monitoring_job-1.0' do
  impact 1.0
  title 'google_vertex_ai_model_deployment_monitoring_job resource test'

  describe google_vertex_ai_model_deployment_monitoring_job(name: "projects/#{gcp_project_id}/locations/#{model_deployment_monitoring_job['region']}/modelDeploymentMonitoringJobs/#{model_deployment_monitoring_job['name']}", region: model_deployment_monitoring_job['region']) do
  	it { should exist }
  	its('state') { should cmp model_deployment_monitoring_job['state'] }
  	its('analysis_instance_schema_uri') { should cmp model_deployment_monitoring_job['analysis_instance_schema_uri'] }
  	its('endpoint') { should cmp model_deployment_monitoring_job['endpoint'] }
  	its('display_name') { should cmp model_deployment_monitoring_job['display_name'] }
  	its('schedule_state') { should cmp model_deployment_monitoring_job['schedule_state'] }
  	its('predict_instance_schema_uri') { should cmp model_deployment_monitoring_job['predict_instance_schema_uri'] }
  	its('next_schedule_time') { should cmp model_deployment_monitoring_job['next_schedule_time'] }
  	its('create_time') { should cmp model_deployment_monitoring_job['create_time'] }
  	its('log_ttl') { should cmp model_deployment_monitoring_job['log_ttl'] }
  	its('update_time') { should cmp model_deployment_monitoring_job['update_time'] }
  	its('name') { should cmp model_deployment_monitoring_job['name'] }

  end

  describe google_vertex_ai_model_deployment_monitoring_job(name: "does_not_exit", region: model_deployment_monitoring_job['region']) do
  	it { should_not exist }
  end
end
