title 'Test GCP google_sourcerepo_repositories resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
repository = input('repository', value: {
  "name": "inspec-gcp-repository"
}, description: 'Source Repository definition')

control 'google_sourcerepo_repositories-1.0' do
  impact 1.0
  title 'google_sourcerepo_repositories resource test'

  repo_name = repository['name']
  describe.one do
    google_sourcerepo_repositories(project: gcp_project_id).names.each do |name|
      describe name do
        it { should match /\/repos\/#{repo_name}$/ }
      end
    end
  end
end
