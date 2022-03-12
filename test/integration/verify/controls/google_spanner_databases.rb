title 'Test GCP google_spanner_databases resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
spannerdatabase = input('spannerdatabase', value: {
  "name": "spdatabase",
  "instance": "spinstance",
  "ddl": "CREATE TABLE test (test STRING(MAX),) PRIMARY KEY (test)"
}, description: 'Cloud Spanner definition') 

control 'google_spanner_databases-1.0' do
  impact 1.0
  title 'google_spanner_databases resource test'

  describe.one do
  	google_spanner_databases(project: gcp_project_id, instance: spannerdatabase['instance']).names.each do |name|
  	  describe name do
  	  	it { should match spannerdatabase['name'] }
      end
    end
  end
end
