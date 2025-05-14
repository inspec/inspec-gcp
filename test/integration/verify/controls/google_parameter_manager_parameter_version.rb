title 'Test GCP google_parameter_manager_parameter_version resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_parameter_id = input(:gcp_parameter_id, value: 'gcp_parameter_id', description: 'The GCP parameter identifier.')
gcp_parameter_version_id = input(:gcp_parameter_version_id, value: 'gcp_parameter_version_id', description: 'The GCP parameter version identifier.')
region = input(:region, value: 'gcp_region', description: 'The GCP project region.')

project_parameter = input('project_parameter', value: {
  "name": "projects/#{gcp_project_id}/locations/global/parameters/#{gcp_parameter_id}/versions/#{gcp_parameter_version_id}",
  "regional_name": "projects/#{gcp_project_id}/locations/#{region}/parameters/#{gcp_parameter_id}/versions/#{gcp_parameter_version_id}"
}, description: 'project_parameter description')

control 'google_parameter_manager_parameter_version-1.0' do
  impact 1.0
  title 'google_parameter_manager_parameter_version resource test'

  describe google_parameter_manager_parameter_version(name: project_parameter['name']) do
  	it { should exist }
  end

  describe google_parameter_manager_parameter_version(name: "does_not_exit") do
  	it { should_not exist }
  end

  describe google_parameter_manager_parameter_version(name: project_parameter['regional_name'], region: region) do
  	it { should exist }
  end

  describe google_parameter_manager_parameter_version(name: "does_not_exit", region: region) do
  	it { should_not exist }
  end

  describe google_parameter_manager_parameter_version(name: project_parameter['name'], render_secret: true) do
  	it { should exist }
  end

  describe google_parameter_manager_parameter_version(name: "does_not_exit", render_secret: true) do
  	it { should_not exist }
  end

  describe google_parameter_manager_parameter_version(name: project_parameter['regional_name'], region: region, render_secret: true) do
  	it { should exist }
  end

  describe google_parameter_manager_parameter_version(name: "does_not_exit", region: region, render_secret: true) do
  	it { should_not exist }
  end
end
