title 'Test GCP google_cloudfunctions_cloud_function resource.'

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

control 'google_cloudfunctions_cloud_function-1.0' do
  impact 1.0
  title 'google_cloudfunctions_cloud_function resource test'

  describe google_cloudfunctions_cloud_function(project: gcp_project_id, location: gcp_cloud_function_region, name: cloudfunction['name']) do
    it { should exist }
    its('description') { should eq cloudfunction['description'] }
    its('available_memory_mb') { should eq cloudfunction['available_memory_mb'] }
    its('https_trigger.url') { should match /\/inspec-gcp-function$/ }
    its('entry_point') { should eq cloudfunction['entry_point'] }
    its('environment_variables') { should include('MY_ENV_VAR' => cloudfunction['env_var_value']) }
  end

  describe google_cloudfunctions_cloud_function(project: gcp_project_id, location: gcp_cloud_function_region, name: 'nonexistent') do
    it { should_not exist }
  end
end
