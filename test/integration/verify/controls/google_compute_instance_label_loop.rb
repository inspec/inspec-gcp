title 'Loop over all GCP Zones to find all Compute Instances with a particular Label'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')

control 'gcp-zones-compute-label-loop-1.0' do

  impact 1.0
  title 'Ensure labels for compute instances across all zones have or do not have a particular label.'

  google_compute_zones(project: gcp_project_id).zone_names.each do |zone_name|
    google_compute_instances(project: gcp_project_id, zone: zone_name).instance_names.each do |instance_name|
      describe google_compute_instance(project: gcp_project_id, zone: zone_name, name: instance_name) do
        its('labels_keys') { should_not include 'operations_override_do_not_kill' }
      end
    end
  end
end