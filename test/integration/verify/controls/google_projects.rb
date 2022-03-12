title 'Test GCP google_projects resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')

control 'google_projects-1.0' do
  impact 1.0
  title 'google_projects resource test'

  describe google_projects() do
    its('count') { should be >= 1 }
    its('project_ids') { should include gcp_project_id }
    its('lifecycle_states') { should include 'ACTIVE' }
  end
end
