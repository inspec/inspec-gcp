title 'Test single GCP project logging sink'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_logging_project_sink_name = attribute(:gcp_logging_project_sink_name, default: '', description: 'The GCP project logging sink name.')
gcp_logging_bucket_name = attribute(:gcp_logging_bucket_name, default: '', description: 'The GCP project logging bucket name.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-project-logging-sink-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure single GCP project logging sink has the correct properties.'

  describe google_logging_project_sink(project: gcp_project_id, sink: gcp_logging_project_sink_name) do
    it { should exist }
    its('name') { should eq gcp_logging_project_sink_name }
    its('filter') { should match "resource.type = gce_instance AND resource.labels.instance_id = \"" }
    its('output_version_format') { should eq "V2" }
    its('destination') { should eq "storage.googleapis.com/#{gcp_logging_bucket_name}" }
    its('writer_identity') { should match "serviceAccount:" }
  end
end