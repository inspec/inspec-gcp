title 'Test GCP google_cloudfunctions_cloud_functions resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_cloud_function_region = input(:gcp_cloud_function_region, value: '', description: 'The Cloud Function region.')
cloudfunction = input('cloudfunction', value: {
  "name": "inspec-gcp-function",
  "description": "A description of the function",
  "available_memory_mb": 128,
  "trigger_http": true,
  "timeout": 60,
  "entry_point": "hello",
  "env_var_value": "val1"
}, description: 'Cloud Function definition')

control 'google_cloudfunctions_cloud_functions-1.0' do
  impact 1.0
  title 'google_cloudfunctions_cloud_functions resource test'

  describe google_cloudfunctions_cloud_functions(project: gcp_project_id, location: gcp_cloud_function_region) do
    its('descriptions') { should include cloudfunction['description'] }
    its('entry_points') { should include cloudfunction['entry_point'] }
  end
end
