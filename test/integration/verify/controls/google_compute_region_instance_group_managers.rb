title 'Google compute region instance group managers properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')

control 'gcp-compute-region-instance-group-managers-1.0' do

  impact 1.0
  title 'Ensure compute regional instance group managers have the correct properties in bulk'

  google_compute_region_instance_group_managers(project: gcp_project_id, region: 'europe-west2').instance_group_manager_names.each do |instance_group_manager_name|
    describe google_compute_region_instance_group_manager(project: gcp_project_id, region: 'europe-west2', name: instance_group_manager_name) do 
      it { should exist }
      its('name') { should cmp /rigm/ }
      its('instance_template') { should cmp /itpl/ }
      its('target_size') { should eq 0 }
    end
  end

end
