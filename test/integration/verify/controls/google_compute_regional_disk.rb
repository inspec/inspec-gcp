title 'Test GCP google_compute_regional_disk resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_region = attribute(:gcp_location, default: 'gcp_location', description: 'The GCP project region.')
gcp_compute_disk_name = attribute(:gcp_compute_disk_name, default: 'gcp_compute_disk_name', description: 'GCP Compute disk name.')
gcp_compute_disk_type = attribute(:gcp_compute_disk_type, default: 'gcp_compute_disk_type', description: 'GCP Compute disk type.')
control 'google_compute_regional_disk-1.0' do
  impact 1.0
  title 'google_compute_regional_disk resource test'

  describe google_compute_regional_disk(project: gcp_project_id, name: gcp_compute_disk_name, region: gcp_region) do
    it { should exist }
    its('type') { should match gcp_compute_disk_type }
  end

  describe.one do
    google_compute_regional_disk(project: gcp_project_id, name: gcp_compute_disk_name, region: gcp_region).labels.each_pair do |key, value|
      describe key do
        it { should cmp "environment" }
      end
    end
  end

  describe google_compute_regional_disk(project: gcp_project_id, name: 'nonexistent', region: gcp_region) do
    it { should_not exist }
  end
end
