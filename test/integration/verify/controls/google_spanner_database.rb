title 'Test GCP google_spanner_database resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
spannerdatabase = input('spannerdatabase', value: {
  "name": "spdatabase",
  "instance": "spinstance",
  "ddl": "CREATE TABLE test (test STRING(MAX),) PRIMARY KEY (test)"
}, description: 'Cloud Spanner definition') 

control 'google_spanner_database-1.0' do
  impact 1.0
  title 'google_spanner_database resource test'

  describe google_spanner_database(project: gcp_project_id, instance: spannerdatabase['instance'], name: spannerdatabase['name']) do
    it { should exist }
    its('name') { should match spannerdatabase['name'] }
  end
end
