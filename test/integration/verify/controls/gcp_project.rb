title 'Project Properties'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_project_name = input(:gcp_project_name, value: '', description: 'The GCP project name.')
gcp_project_number = input(:gcp_project_number, value: '', description: 'The GCP project number.')

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
