title 'Test single GCP project logging exclusion'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_logging_project_exclusion_name = attribute(:gcp_logging_project_exclusion_name, default: '', description: 'The GCP project logging exclusion name.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-project-logging-exclusion-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure single GCP project logging exclusion has the correct properties.'

  describe google_logging_project_exclusion(project: gcp_project_id, exclusion: gcp_logging_project_exclusion_name) do
    it { should exist }
    its('name') { should eq gcp_logging_project_exclusion_name }
    its('filter') { should eq 'resource.type = gce_instance AND severity <= DEBUG' }
    its('description') { should eq 'Exclude GCE instance debug logs' }
  end
end