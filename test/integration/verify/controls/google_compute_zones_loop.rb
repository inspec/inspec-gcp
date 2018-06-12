title 'Loop over all GCP Zones'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')

control 'gcp-zones-loop-1.0' do

  impact 1.0
  title 'Ensure zones have the correct properties in bulk using google_compute_zone for detail.'

  google_compute_zones(project: gcp_project_id).zone_names.each do |zone_name|
    describe google_compute_zone(project: gcp_project_id, name: zone_name) do
      it { should exist }
      its('kind') { should eq "compute#zone" }
      its('status') { should eq 'UP' }
      # or equivalently
      it { should be_up }
    end
  end
end