title 'Google compute instance groups properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_lb_zone = attribute(:gcp_lb_zone, default: '', description: 'The GCP pattern zone for the managed instance group (mig1).')
gcp_lb_mig1_name = attribute(:gcp_lb_mig1_name, default: '', description: 'The GCP pattern first managed instance group name.')

control 'gcp-compute-instance-groups-1.0' do

  impact 1.0
  title 'Ensure compute instance groups have the correct properties in bulk'

  describe google_compute_instance_groups(project: gcp_project_id, zone: gcp_lb_zone) do
    it { should exist }
    its('count') { should be <= 100}
    its('instance_group_names') { should include gcp_lb_mig1_name }
  end
end