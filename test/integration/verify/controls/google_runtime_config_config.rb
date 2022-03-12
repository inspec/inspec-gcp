title 'Test GCP google_runtime_config_config resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
runtimeconfig_config = input('runtimeconfig_config', value: {
  "name"=>"inspec-gcp-runtime-config",
  "description"=>"My runtime configurations"}
)

control 'google_runtime_config_config-1.0' do
  impact 1.0
  title 'google_runtime_config_config resource test'

  describe google_runtime_config_config(project: gcp_project_id, name: runtimeconfig_config['name']) do
    it { should exist }
    its('description') { should cmp runtimeconfig_config['description'] }
  end

  describe google_runtime_config_config(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
