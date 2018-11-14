title 'Instance Group Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_lb_mig1_name = attribute(:gcp_lb_mig1_name, default: '', description: 'The GCP pattern first managed instance group name.')
gcp_lb_zone = attribute(:gcp_lb_zone, default: '', description: 'The GCP pattern zone for the managed instance group (mig1).')

control 'google-lb-internal-instance-group-mig1-1.0' do

  impact 1.0
  title 'Ensure that the Instance Group has been configured correctly'

  describe google_compute_instance_group(project: gcp_project_id, zone: gcp_lb_zone, name: gcp_lb_mig1_name) do
    its('name') { should eq gcp_lb_mig1_name }
    its('kind') { should eq "compute#instanceGroup" }
    # zone should match that of the template
    its('zone') { should match gcp_lb_zone }
    # the GCP template generates two instances within the instance group
    its('size') { should be >= 0 }
    # mig1 has a named port for http (80)
    its('port_name') { should eq "http" }
    its('port_value') { should eq 80 }
  end
end