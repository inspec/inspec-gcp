title 'Test GCP google_project_alert_policies resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
alert_policy = input('alert_policy', value: {
  "display_name": "Display",
  "combiner": "OR",
  "condition_display_name": "condition",
  "condition_filter": "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\"",
  "condition_duration": "60s",
  "condition_comparison": "COMPARISON_GT"
}, description: 'Alert Policy description')

control 'google_project_alert_policies-1.0' do
  impact 1.0
  title 'google_project_alert_policies resource test'

  describe google_project_alert_policies(project: gcp_project_id) do
    it { should exist }
    its('policy_display_names') { should include alert_policy['display_name']}
    its('combiners') { should include alert_policy['combiner']}
  end
end
