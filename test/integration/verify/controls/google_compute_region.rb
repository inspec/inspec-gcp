title 'Test GCP google_compute_region resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')

control 'google_compute_region-1.0' do
  impact 1.0
  title 'google_compute_region resource test'

  describe google_compute_region(project: gcp_project_id, name: gcp_location) do
    it { should exist }
    it { should be_up }
    its('zone_names') { should include "#{gcp_location}-a" }
  end

  describe google_compute_region(project: gcp_project_id, name: 'notthere') do
    it { should_not exist }
  end
end
