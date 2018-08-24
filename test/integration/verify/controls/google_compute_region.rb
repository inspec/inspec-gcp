title 'Test single GCP Region'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_region = attribute(:gcp_location, default: '', description: 'The GCP region being used.')

control 'gcp-single-region-1.0' do

  impact 1.0
  title 'Ensure single region has the correct properties.'

  describe google_compute_region(project: gcp_project_id, name: gcp_region) do
    it { should exist }
    it { should be_up }
    its('zone_names') { should include "#{gcp_region}-a" }
  end
end