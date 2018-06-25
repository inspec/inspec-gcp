title 'Test single GCP Zone'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_zone = attribute(:gcp_zone, default: '', description: 'The GCP zone being used.')

control 'gcp-single-zone-1.0' do

  impact 1.0
  title 'Ensure single zone has the correct properties.'

  describe google_compute_zone(project: gcp_project_id, name: gcp_zone) do
    it { should exist }
    it { should be_up }
  end
end