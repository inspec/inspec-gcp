title 'Test GCP google_compute_regional_disk resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_region = input(:gcp_location, value: '', description: 'The GCP project region.')
gcp_compute_disk_name = input(:gcp_compute_disk_name, value: '', description: 'GCP Compute disk name.')
gcp_compute_disk_type = input(:gcp_compute_disk_type, value: '', description: 'GCP Compute disk type.')

control 'google_compute_regional_disk-1.0' do
  impact 1.0
  title 'google_compute_regional_disk resource test'

  describe google_compute_regional_disk(project: gcp_project_id, name: "#{gcp_compute_disk_name}-regional", region: gcp_region) do
    it { should exist }
    its('type') { should match gcp_compute_disk_type }
  end

  describe google_compute_regional_disk(project: gcp_project_id, name: 'nonexistent', region: gcp_region) do
    it { should_not exist }
  end
end
