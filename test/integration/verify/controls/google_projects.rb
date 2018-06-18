title 'Loop over all GCP Projects'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_project_name = attribute(:gcp_project_name, default: '', description: 'The GCP project name.')
gcp_project_number = attribute(:gcp_project_number, default: '', description: 'The GCP project number.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources,default:0,description:'Flag to enable privileged resources requiring elevated privileges in GCP.')

control 'gcp-projects-loop-1.0' do

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  impact 1.0
  title 'Ensure projects have the correct properties in bulk.'

  describe google_projects do
    it { should exist }
    its('project_names'){ should include gcp_project_name }
    its('project_ids'){ should include gcp_project_id }
    its('project_numbers'){ should include gcp_project_number.to_i }
  end
end