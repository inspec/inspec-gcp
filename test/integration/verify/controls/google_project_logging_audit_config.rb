title 'Test GCP project logging audit configuration'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')

control 'gcp-project-audit-logging-config-1.0' do

  impact 1.0
  title 'Ensure GCP project logging audit configuration has the correct properties.'

  describe google_project_logging_audit_config(project: gcp_project_id) do
    its('default_types') { should_not match /notthere/ }
    its('default_exempted_members') { should_not match /notthere/ }
  end
end