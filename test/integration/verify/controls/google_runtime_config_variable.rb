title 'Test GCP google_runtime_config_variable resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
runtimeconfig_config = input('runtimeconfig_config', value: {
  "name"=>"inspec-gcp-runtime-config",
  "description"=>"My runtime configurations"}
)
runtimeconfig_variable = input('runtimeconfig_variable', value: {
  "name"=>"prod-variables/hostname",
  "text"=>"example.com"}
)

control 'google_runtime_config_variable-1.0' do
  impact 1.0
  title 'google_runtime_config_variable resource test'

  describe google_runtime_config_variable(project: gcp_project_id, config: runtimeconfig_config['name'], name: runtimeconfig_variable['name']) do
    it { should exist }
    its('text') { should cmp runtimeconfig_variable['text'] }
  end

  describe google_runtime_config_variable(project: gcp_project_id, config: runtimeconfig_config['name'], name: 'nonexistent') do
    it { should_not exist }
  end
end
