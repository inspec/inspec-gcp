title 'Loop over all GCP Regions'

  gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')

  control 'gcp-regions-loop-1.0' do

    impact 1.0
    title 'Ensure regions have the correct properties in bulk using google_compute_region for detail.'

    google_compute_regions(project: gcp_project_id).region_names.each do |region_name|
      describe google_compute_region(project: gcp_project_id, name: region_name) do
        it { should be_up }
      end
    end
  end