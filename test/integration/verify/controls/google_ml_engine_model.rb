title 'Test GCP google_ml_engine_model resource.'

# gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
ml_model = input('ml_model', value: {
  "name": "ml_model",
  "region": "us-central1",
  "description": "My awesome ML model",
  "online_prediction_logging": true,
  "online_prediction_console_logging": true
}, description: 'Machine learning model definition')

control 'google_ml_engine_model-1.0' do
  impact 1.0
  title 'google_ml_engine_model resource test'

  describe google_ml_engine_model(project: gcp_project_id, name: ml_model['name']) do
    it { should exist }
    its('description') { should cmp ml_model['description'] }
    its('regions') { should include ml_model['region'] }
    its('online_prediction_logging') { should cmp ml_model['online_prediction_logging'] }
    its('online_prediction_console_logging') { should cmp ml_model['online_prediction_console_logging'] }
  end

  describe google_ml_engine_model(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
