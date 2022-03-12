title 'Test GCP google_sourcerepo_repository resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
repository = input('repository', value: {
  "name": "inspec-gcp-repository"
}, description: 'Source Repository definition')

control 'google_sourcerepo_repository-1.0' do
  impact 1.0
  title 'google_sourcerepo_repository resource test'

  describe google_sourcerepo_repository(project: gcp_project_id, name: repository['name']) do
    it { should exist }
  end

  describe google_sourcerepo_repository(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
