---
title: About the google_vertex_ai_model_deployment_monitoring_jobs resource
platform: gcp
---

## Syntax
A `google_vertex_ai_model_deployment_monitoring_jobs` is used to test a Google ModelDeploymentMonitoringJob resource

## Examples
```
    describe google_vertex_ai_model_deployment_monitoring_jobs(parent: "projects/#{gcp_project_id}/locations/#{model_deployment_monitoring_job['region']}", region: ' value_region') do
    it { should exist }
  end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_model_deployment_monitoring_jobs` resource:

See [google_vertex_ai_model_deployment_monitoring_job.md](google_vertex_ai_model_deployment_monitoring_job.md) for more detailed information
  * `model_deployment_monitoring_objective_configs`: an array of `google_vertex_ai_model_deployment_monitoring_job` model_deployment_monitoring_objective_configs
  * `labels`: an array of `google_vertex_ai_model_deployment_monitoring_job` labels
  * `states`: an array of `google_vertex_ai_model_deployment_monitoring_job` state
  * `analysis_instance_schema_uris`: an array of `google_vertex_ai_model_deployment_monitoring_job` analysis_instance_schema_uri
  * `enable_monitoring_pipeline_logs`: an array of `google_vertex_ai_model_deployment_monitoring_job` enable_monitoring_pipeline_logs
  * `endpoints`: an array of `google_vertex_ai_model_deployment_monitoring_job` endpoint
  * `logging_sampling_strategies`: an array of `google_vertex_ai_model_deployment_monitoring_job` logging_sampling_strategy
  * `bigquery_tables`: an array of `google_vertex_ai_model_deployment_monitoring_job` bigquery_tables
  * `display_names`: an array of `google_vertex_ai_model_deployment_monitoring_job` display_name
  * `schedule_states`: an array of `google_vertex_ai_model_deployment_monitoring_job` schedule_state
  * `errors`: an array of `google_vertex_ai_model_deployment_monitoring_job` error
  * `model_monitoring_alert_configs`: an array of `google_vertex_ai_model_deployment_monitoring_job` model_monitoring_alert_config
  * `latest_monitoring_pipeline_metadata`: an array of `google_vertex_ai_model_deployment_monitoring_job` latest_monitoring_pipeline_metadata
  * `sample_predict_instances`: an array of `google_vertex_ai_model_deployment_monitoring_job` sample_predict_instance
  * `predict_instance_schema_uris`: an array of `google_vertex_ai_model_deployment_monitoring_job` predict_instance_schema_uri
  * `next_schedule_times`: an array of `google_vertex_ai_model_deployment_monitoring_job` next_schedule_time
  * `create_times`: an array of `google_vertex_ai_model_deployment_monitoring_job` create_time
  * `log_ttls`: an array of `google_vertex_ai_model_deployment_monitoring_job` log_ttl
  * `stats_anomalies_base_directories`: an array of `google_vertex_ai_model_deployment_monitoring_job` stats_anomalies_base_directory
  * `update_times`: an array of `google_vertex_ai_model_deployment_monitoring_job` update_time
  * `model_deployment_monitoring_schedule_configs`: an array of `google_vertex_ai_model_deployment_monitoring_job` model_deployment_monitoring_schedule_config
  * `encryption_specs`: an array of `google_vertex_ai_model_deployment_monitoring_job` encryption_spec
  * `names`: an array of `google_vertex_ai_model_deployment_monitoring_job` name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
