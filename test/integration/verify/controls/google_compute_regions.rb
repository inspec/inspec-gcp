title 'Test GCP google_compute_regions resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
control 'google_compute_regions-1.0' do
  impact 1.0
  title 'google_compute_regions resource test'

  describe google_compute_regions(project: gcp_project_id) do
    its('count') { should be >= 1 }
    its('region_names') { should include "#{gcp_location}" }
    its('region_statuses') { should_not include "DOWN" }
    its('region_ids') { should include "1290" }
  end
end
