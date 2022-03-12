title 'Test GCP google_compute_zones resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')

control 'google_compute_zones-1.0' do
  impact 1.0
  title 'google_compute_zones resource test'

  google_compute_zones(project: gcp_project_id).zone_names.each do |zone_name|
    describe google_compute_zone(project: gcp_project_id, name: zone_name) do
      it { should exist }
      it { should be_up }
    end
  end
end
