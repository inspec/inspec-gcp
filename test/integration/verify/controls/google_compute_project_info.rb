title 'Test GCP google_compute_project_info resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')

control 'google_compute_project_info-1.0' do
  impact 1.0
  title 'google_compute_project_info resource test'

  describe google_compute_project_info(project: gcp_project_id) do
  	it { should exist }
  	its('default_service_account') { should match "developer.gserviceaccount.com" }
  end
end
