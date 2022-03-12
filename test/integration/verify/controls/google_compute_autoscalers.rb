# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_compute_autoscalers resource.'

gcp_project_id = input(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_zone = input(:gcp_zone, default: 'gcp_zone', description: 'The GCP project zone.')
instance_group_manager = input('instance_group_manager', default: {
  "name": "inspec-gcp-igm",
  "base_instance_name": "igm",
  "named_port_name": "port",
  "named_port_port": 80
}, description: 'Instance group manager definition')
autoscaler = input('autoscaler', default: {
  "name": "inspec-gcp-autoscaler",
  "max_replicas": 5,
  "min_replicas": 1,
  "cooldown_period": 60,
  "cpu_utilization_target": 0.5
}, description: 'Autoscaler definition')

control 'google_compute_autoscalers-1.0' do
  impact 1.0
  title 'google_compute_autoscalers resource test'

  autoscalers = google_compute_autoscalers(project: gcp_project_id, zone: gcp_zone)
  describe.one do
    autoscalers.autoscaling_policies.each do |autoscaling_policy|
      describe autoscaling_policy do
          its('max_num_replicas') { should eq autoscaler['max_replicas'] }
          its('min_num_replicas') { should eq autoscaler['min_replicas'] }
          its('cool_down_period_sec') { should eq autoscaler['cooldown_period'] }
          its('cpu_utilization.utilization_target') { should eq autoscaler['cpu_utilization_target'] }
      end
    end
  end
end
