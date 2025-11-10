title 'Test GCP google_parameter_manager_parameters resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
region = input(:region, value: 'gcp_region', description: 'The GCP project region.')

project_parameter = input('project_parameter', value: {
  "parent": "projects/#{gcp_project_id}/locations/global",
  "regional_parent": "projects/#{gcp_project_id}/locations/#{region}"
}, description: 'project_parameter description')

control 'google_parameter_manager_parameters-1.0' do
  impact 1.0
  title 'google_parameter_manager_parameters resource test'

    describe google_parameter_manager_parameters(parent: project_parameter['parent']) do
      it { should exist }
    end

    describe google_parameter_manager_parameters(parent: project_parameter['regional_parent'], region: region) do
      it { should exist }
    end
end
