title 'Test GCP google_project_service resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
service = input('service', value: {
  "name": "maps-android-backend.googleapis.com"
}, description: 'Service description')

control 'google_project_service-1.0' do
  impact 1.0
  title 'google_project_service resource test'

  describe google_project_service(project: gcp_project_id, name: service['name']) do
    it { should exist }
    its('state') { should cmp "ENABLED" }
  end
end
