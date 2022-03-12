title 'Test GCP google_compute_zone resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')

control 'google_compute_zone-1.0' do
  impact 1.0
  title 'google_compute_zone resource test'

  describe google_compute_zone(project: gcp_project_id, name: "us-central1-a") do
    it { should exist }
    it { should be_up }
  end
end
