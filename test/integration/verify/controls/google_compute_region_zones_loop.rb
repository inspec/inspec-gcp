title 'Loop over all zones in a GCP region'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_region = attribute(:gcp_location, default: '', description: 'The GCP region being used.')

control 'gcp-region-zones-loop-1.0' do

  impact 1.0
  title 'Ensure all zones in a region are available using google_compute_zone for detail.'

  google_compute_region(project: gcp_project_id,  name: gcp_region).zone_names.each do |zone_name|
    describe google_compute_zone(project: gcp_project_id, name: zone_name) do
      it { should be_up }
    end
  end
end