title 'Project Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_project_name = attribute(:gcp_project_name, default: '', description: 'The GCP project name.')
gcp_project_number = attribute(:gcp_project_number, default: '', description: 'The GCP project number.')

control 'gcp-project' do

  impact 1.0
  title 'Ensure that the project was created and has the correct settings'

  describe google_project(project: gcp_project_id) do
    it { should exist }
    its('name') { should eq gcp_project_name }
    its('project_number') { should eq gcp_project_number.to_i }
    its('lifecycle_state') { should eq "ACTIVE" }
  end

  describe google_project(project: gcp_project_number.to_i) do
    it { should exist }
    its('name') { should eq gcp_project_name }
    its('project_number') { should eq gcp_project_number.to_i }
    its('lifecycle_state') { should eq "ACTIVE" }
  end
end
