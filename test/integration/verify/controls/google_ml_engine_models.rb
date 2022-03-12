title 'Test GCP google_ml_engine_models resource.'

# gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
ml_model = input('ml_model', value: {
  "name": "ml_model",
  "region": "us-central1",
  "description": "My awesome ML model",
  "online_prediction_logging": true,
  "online_prediction_console_logging": true
}, description: 'Machine learning model definition')

control 'google_ml_engine_models-1.0' do
  impact 1.0
  title 'google_ml_engine_models resource test'

  describe google_ml_engine_models(project: gcp_project_id) do
    its('descriptions') { should include ml_model['description'] }
    its('online_prediction_loggings') { should include ml_model['online_prediction_logging'] }
    its('online_prediction_console_loggings') { should include ml_model['online_prediction_console_logging'] }
  end
end
