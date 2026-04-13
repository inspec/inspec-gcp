title 'Test GCP google_parameter_manager_parameter_versions resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_parameter_id = input(:gcp_parameter_id, value: 'gcp_parameter_id', description: 'The GCP parameter identifier.')
region = input(:region, value: 'gcp_region', description: 'The GCP project region.')

project_parameter = input('project_parameter', value: {
  "parent": "projects/#{gcp_project_id}/locations/global/parameters/#{gcp_parameter_id}",
  "regional_parent": "projects/#{gcp_project_id}/locations/#{region}/parameters/#{gcp_parameter_id}"
}, description: 'project_parameter description')

control 'google_parameter_manager_parameter_versions-1.0' do
  impact 1.0
  title 'google_parameter_manager_parameter_versions resource test'

    describe google_parameter_manager_parameter_versions(parent: project_parameter['parent']) do
      it { should exist }
    end

    describe google_parameter_manager_parameter_versions(parent: project_parameter['regional_parent'], region: region) do
      it { should exist }
    end
end
