title 'Google compute instance groups properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_lb_zone = attribute(:gcp_lb_zone, default: '', description: 'The GCP pattern zone for the managed instance group (mig1).')

control 'gcp-compute-instance-groups-loop-1.0' do

  impact 1.0
  title 'Ensure compute instance groups have the correct properties by looping in detail and filtering'

  google_compute_instance_groups(project: gcp_project_id, zone: gcp_lb_zone).where(instance_group_name: /^gcp-inspec/).instance_group_names.each do |instance_group_name|
    describe google_compute_instance_group(project: gcp_project_id, zone: 'europe-west2-a', name: instance_group_name) do
      it { should exist }
      its('size') { should be >= 0 }
    end
  end
end

