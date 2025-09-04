+++
title = "google_vertex_ai_model_deployment_monitoring_job resource"
platform = "gcp"
draft = false
gh_repo = "inspec-gcp"

[menu.inspec]
title = "google_vertex_ai_model_deployment_monitoring_job"
identifier = "inspec/resources/gcp/google_vertex_ai_model_deployment_monitoring_job Resource"
parent = "inspec/resources/gcp"
+++

## Syntax
A `google_vertex_ai_model_deployment_monitoring_job` is used to test a Google ModelDeploymentMonitoringJob resource

## Examples
```
describe google_vertex_ai_model_deployment_monitoring_job(name: "projects/#{gcp_project_id}/locations/#{model_deployment_monitoring_job['region']}/modelDeploymentMonitoringJobs/#{model_deployment_monitoring_job['name']}", region: ' value_region') do
	it { should exist }
	its('state') { should cmp 'value_state' }
	its('analysis_instance_schema_uri') { should cmp 'value_analysisinstanceschemauri' }
	its('endpoint') { should cmp 'value_endpoint' }
	its('display_name') { should cmp 'value_displayname' }
	its('schedule_state') { should cmp 'value_schedulestate' }
	its('predict_instance_schema_uri') { should cmp 'value_predictinstanceschemauri' }
	its('next_schedule_time') { should cmp 'value_nextscheduletime' }
	its('create_time') { should cmp 'value_createtime' }
	its('log_ttl') { should cmp 'value_logttl' }
	its('update_time') { should cmp 'value_updatetime' }
	its('name') { should cmp 'value_name' }

end

describe google_vertex_ai_model_deployment_monitoring_job(name: "does_not_exit", region: ' value_region') do
	it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_vertex_ai_model_deployment_monitoring_job` resource:


  * `model_deployment_monitoring_objective_configs`: Required. The config for monitoring objectives. This is a per DeployedModel config. Each DeployedModel needs to be configured separately.

    * `objective_config`: The objective configuration for model monitoring, including the information needed to detect anomalies for one particular model.

      * `explanation_config`: The config for integrating with Vertex Explainable AI. Only applicable if the Model has explanation_spec populated.

        * `explanation_baseline`: Output from BatchPredictionJob for Model Monitoring baseline dataset, which can be used to generate baseline attribution scores.

          * `prediction_format`: The storage format of the predictions generated BatchPrediction job.
          Possible values:
            * PREDICTION_FORMAT_UNSPECIFIED
            * JSONL
            * BIGQUERY

          * `gcs`: The Google Cloud Storage location where the output is to be written to.

            * `output_uri_prefix`: Required. Google Cloud Storage URI to output directory. If the uri doesn't end with '/', a '/' will be automatically appended. The directory is created if it doesn't exist.

          * `bigquery`: The BigQuery location for the output content.

            * `output_uri`: Required. BigQuery URI to a project or table, up to 2000 characters long. When only the project is specified, the Dataset and Table is created. When the full table reference is specified, the Dataset must exist and table must not exist. Accepted forms: * BigQuery path. For example: `bq://projectId` or `bq://projectId.bqDatasetId` or `bq://projectId.bqDatasetId.bqTableId`.

        * `enable_feature_attributes`: If want to analyze the Vertex Explainable AI feature attribute scores or not. If set to true, Vertex AI will log the feature attributions from explain response and do the skew/drift detection for them.

      * `training_dataset`: Training Dataset information.

        * `logging_sampling_strategy`: Sampling Strategy for logging, can be for both training and prediction dataset.

          * `random_sample_config`: Requests are randomly selected.

            * `sample_rate`: Sample rate (0, 1]

        * `dataset`: The resource name of the Dataset used to train this Model.

        * `gcs_source`: The Google Cloud Storage location for the input content.

          * `uris`: Required. Google Cloud Storage URI(-s) to the input file(s). May contain wildcards. For more information on wildcards, see https://cloud.google.com/storage/docs/gsutil/addlhelp/WildcardNames.

        * `target_field`: The target field name the model is to predict. This field will be excluded when doing Predict and (or) Explain for the training data.

        * `bigquery_source`: The BigQuery location for the input content.

          * `input_uri`: Required. BigQuery URI to a table, up to 2000 characters long. Accepted forms: * BigQuery path. For example: `bq://projectId.bqDatasetId.bqTableId`.

        * `data_format`: Data format of the dataset, only applicable if the input is from Google Cloud Storage. The possible formats are: "tf-record" The source file is a TFRecord file. "csv" The source file is a CSV file. "jsonl" The source file is a JSONL file.

      * `training_prediction_skew_detection_config`: The config for Training & Prediction data skew detection. It specifies the training dataset sources and the skew detection parameters.

        * `skew_thresholds`: Key is the feature name and value is the threshold. If a feature needs to be monitored for skew, a value threshold must be configured for that feature. The threshold here is against feature distribution distance between the training and prediction feature.

          * `additional_properties`: The config for feature monitoring threshold.

        * `default_skew_threshold`: The config for feature monitoring threshold.

          * `value`: Specify a threshold value that can trigger the alert. If this threshold config is for feature distribution distance: 1. For categorical feature, the distribution distance is calculated by L-inifinity norm. 2. For numerical feature, the distribution distance is calculated by Jensen–Shannon divergence. Each feature must have a non-zero threshold if they need to be monitored. Otherwise no alert will be triggered for that feature.

        * `attribution_score_skew_thresholds`: Key is the feature name and value is the threshold. The threshold here is against attribution score distance between the training and prediction feature.

          * `additional_properties`: The config for feature monitoring threshold.

      * `prediction_drift_detection_config`: The config for Prediction data drift detection.

        * `attribution_score_drift_thresholds`: Key is the feature name and value is the threshold. The threshold here is against attribution score distance between different time windows.

          * `additional_properties`: The config for feature monitoring threshold.

        * `drift_thresholds`: Key is the feature name and value is the threshold. If a feature needs to be monitored for drift, a value threshold must be configured for that feature. The threshold here is against feature distribution distance between different time windws.

          * `additional_properties`: The config for feature monitoring threshold.

        * `default_drift_threshold`: The config for feature monitoring threshold.

          * `value`: Specify a threshold value that can trigger the alert. If this threshold config is for feature distribution distance: 1. For categorical feature, the distribution distance is calculated by L-inifinity norm. 2. For numerical feature, the distribution distance is calculated by Jensen–Shannon divergence. Each feature must have a non-zero threshold if they need to be monitored. Otherwise no alert will be triggered for that feature.

    * `deployed_model_id`: The DeployedModel ID of the objective config.

  * `labels`: The labels with user-defined metadata to organize your ModelDeploymentMonitoringJob. Label keys and values can be no longer than 64 characters (Unicode codepoints), can only contain lowercase letters, numeric characters, underscores and dashes. International characters are allowed. See https://goo.gl/xmQnxf for more information and examples of labels.

    * `additional_properties`: 

  * `state`: Output only. The detailed state of the monitoring job. When the job is still creating, the state will be 'PENDING'. Once the job is successfully created, the state will be 'RUNNING'. Pause the job, the state will be 'PAUSED'. Resume the job, the state will return to 'RUNNING'.
  Possible values:
    * JOB_STATE_UNSPECIFIED
    * JOB_STATE_QUEUED
    * JOB_STATE_PENDING
    * JOB_STATE_RUNNING
    * JOB_STATE_SUCCEEDED
    * JOB_STATE_FAILED
    * JOB_STATE_CANCELLING
    * JOB_STATE_CANCELLED
    * JOB_STATE_PAUSED
    * JOB_STATE_EXPIRED
    * JOB_STATE_UPDATING
    * JOB_STATE_PARTIALLY_SUCCEEDED

  * `analysis_instance_schema_uri`: YAML schema file uri describing the format of a single instance that you want Tensorflow Data Validation (TFDV) to analyze. If this field is empty, all the feature data types are inferred from predict_instance_schema_uri, meaning that TFDV will use the data in the exact format(data type) as prediction request/response. If there are any data type differences between predict instance and TFDV instance, this field can be used to override the schema. For models trained with Vertex AI, this field must be set as all the fields in predict instance formatted as string.

  * `enable_monitoring_pipeline_logs`: If true, the scheduled monitoring pipeline logs are sent to Google Cloud Logging, including pipeline status and anomalies detected. Please note the logs incur cost, which are subject to [Cloud Logging pricing](https://cloud.google.com/logging#pricing).

  * `endpoint`: Required. Endpoint resource name. Format: `projects/{project}/locations/{location}/endpoints/{endpoint}`

  * `logging_sampling_strategy`: Sampling Strategy for logging, can be for both training and prediction dataset.

    * `random_sample_config`: Requests are randomly selected.

      * `sample_rate`: Sample rate (0, 1]

  * `bigquery_tables`: Output only. The created bigquery tables for the job under customer project. Customer could do their own query & analysis. There could be 4 log tables in maximum: 1. Training data logging predict request/response 2. Serving data logging predict request/response

    * `log_source`: The source of log.
    Possible values:
      * LOG_SOURCE_UNSPECIFIED
      * TRAINING
      * SERVING

    * `bigquery_table_path`: The created BigQuery table to store logs. Customer could do their own query & analysis. Format: `bq://.model_deployment_monitoring_._`

    * `log_type`: The type of log.
    Possible values:
      * LOG_TYPE_UNSPECIFIED
      * PREDICT
      * EXPLAIN

  * `display_name`: Required. The user-defined name of the ModelDeploymentMonitoringJob. The name can be up to 128 characters long and can consist of any UTF-8 characters. Display name of a ModelDeploymentMonitoringJob.

  * `schedule_state`: Output only. Schedule state when the monitoring job is in Running state.
  Possible values:
    * MONITORING_SCHEDULE_STATE_UNSPECIFIED
    * PENDING
    * OFFLINE
    * RUNNING

  * `error`: The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).

    * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use.

    * `code`: The status code, which should be an enum value of google.rpc.Code.

    * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

  * `model_monitoring_alert_config`: 

    * `email_alert_config`: The config for email alert.

      * `user_emails`: The email addresses to send the alert.

    * `enable_logging`: Dump the anomalies to Cloud Logging. The anomalies will be put to json payload encoded from proto google.cloud.aiplatform.logging.ModelMonitoringAnomaliesLogEntry. This can be further sinked to Pub/Sub or any other services supported by Cloud Logging.

  * `latest_monitoring_pipeline_metadata`: All metadata of most recent monitoring pipelines.

    * `status`: The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).

      * `details`: A list of messages that carry the error details. There is a common set of message types for APIs to use.

      * `code`: The status code, which should be an enum value of google.rpc.Code.

      * `message`: A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.

    * `run_time`: The time that most recent monitoring pipelines that is related to this run.

  * `sample_predict_instance`: Sample Predict instance, same format as PredictRequest.instances, this can be set as a replacement of ModelDeploymentMonitoringJob.predict_instance_schema_uri. If not set, we will generate predict schema from collected predict requests.

  * `predict_instance_schema_uri`: YAML schema file uri describing the format of a single instance, which are given to format this Endpoint's prediction (and explanation). If not set, we will generate predict schema from collected predict requests.

  * `next_schedule_time`: Output only. Timestamp when this monitoring pipeline will be scheduled to run for the next round.

  * `create_time`: Output only. Timestamp when this ModelDeploymentMonitoringJob was created.

  * `log_ttl`: The TTL of BigQuery tables in user projects which stores logs. A day is the basic unit of the TTL and we take the ceil of TTL/86400(a day). e.g. { second: 3600} indicates ttl = 1 day.

  * `stats_anomalies_base_directory`: The Google Cloud Storage location where the output is to be written to.

    * `output_uri_prefix`: Required. Google Cloud Storage URI to output directory. If the uri doesn't end with '/', a '/' will be automatically appended. The directory is created if it doesn't exist.

  * `update_time`: Output only. Timestamp when this ModelDeploymentMonitoringJob was updated most recently.

  * `model_deployment_monitoring_schedule_config`: The config for scheduling monitoring job.

    * `monitor_window`: The time window of the prediction data being included in each prediction dataset. This window specifies how long the data should be collected from historical model results for each run. If not set, ModelDeploymentMonitoringScheduleConfig.monitor_interval will be used. e.g. If currently the cutoff time is 2022-01-08 14:30:00 and the monitor_window is set to be 3600, then data from 2022-01-08 13:30:00 to 2022-01-08 14:30:00 will be retrieved and aggregated to calculate the monitoring statistics.

    * `monitor_interval`: Required. The model monitoring job scheduling interval. It will be rounded up to next full hour. This defines how often the monitoring jobs are triggered.

  * `encryption_spec`: Represents a customer-managed encryption key spec that can be applied to a top-level resource.

    * `kms_key_name`: Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. The key needs to be in the same region as where the compute resource is created.

  * `name`: Output only. Resource name of a ModelDeploymentMonitoringJob.


## GCP Permissions
