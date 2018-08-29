title 'Regions Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_region = attribute(:gcp_location, default: '', description: 'The GCP region being used.')
gcp_region_id = attribute(:gcp_region_id, default: '', description: 'A sample region identifier to test for.')

control 'gcp-regions-1.0' do

  impact 1.0
  title 'Ensure regions have the correct properties in bulk'

  describe google_compute_regions(project: gcp_project_id) do
    it { should exist }
    its('count') { should be <= 100} # 17 at the time of writing
    its('region_names') { should include gcp_region }
    its('region_statuses') { should_not include "DOWN" }
    its('region_ids') { should include gcp_region_id.to_i }
  end

end