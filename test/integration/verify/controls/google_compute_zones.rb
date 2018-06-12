title 'Zones Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_zone = attribute(:gcp_zone, default: '', description: 'The GCP zone being used.')
gcp_zone_id = attribute(:gcp_zone_id, default: '', description: 'A sample zone identifier to test for.')

control 'gcp-zones-1.0' do

  impact 1.0
  title 'Ensure zones have the correct properties in bulk'

  describe google_compute_zones(project: gcp_project_id) do
    it { should exist }
    its('count') { should be <= 100} # 46 at the time of writing
    its('zone_names') { should include gcp_zone }
    its('zone_statuses') { should_not include "DOWN" }
    its('zone_ids') { should include gcp_zone_id.to_i }
  end

end