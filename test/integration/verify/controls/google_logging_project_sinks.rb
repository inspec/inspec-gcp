title 'Test GCP project logging sinks'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_logging_project_sink_name = attribute(:gcp_logging_project_sink_name, default: '', description: 'The GCP project logging sink name.')
gcp_logging_bucket_name = attribute(:gcp_logging_bucket_name, default: '', description: 'The GCP project logging bucket name.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-project-logging-sinks-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure GCP project logging sinks have the correct properties in bulk.'

  describe google_logging_project_sinks(project: gcp_project_id) do
    it { should exist }
    its('sink_names') { should include gcp_logging_project_sink_name }
    its('sink_destinations') { should include "storage.googleapis.com/#{gcp_logging_bucket_name}" }
  end
end