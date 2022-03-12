title 'Test GCP google_project_services resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
service = input('service', value: {
  "name": "maps-android-backend.googleapis.com"
}, description: 'Service description')

control 'google_project_services-1.0' do
  impact 1.0
  title 'google_project_services resource test'

  describe.one do
    google_project_services(project: gcp_project_id).names.each do |name|
      describe name do
        it { should match service['name'] }
      end
    end
  end
end
