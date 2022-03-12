title 'Test GCP google_runtime_config_variables resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
runtimeconfig_config = input('runtimeconfig_config', value: {
  "name"=>"inspec-gcp-runtime-config",
  "description"=>"My runtime configurations"}
)
runtimeconfig_variable = input('runtimeconfig_variable', value: {
  "name"=>"prod-variables/hostname",
  "text"=>"example.com"}
)

control 'google_runtime_config_variables-1.0' do
  impact 1.0
  title 'google_runtime_config_variables resource test'

  describe google_runtime_config_variables(project: gcp_project_id, config: runtimeconfig_config['name']) do
    its('texts') { should include runtimeconfig_variable['text'] }
  end
end
