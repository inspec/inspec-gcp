title 'Test GCP google_sql_databases resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_db_instance_name = input(:gcp_db_instance_name, value: '', description: 'Database instance name.')
gcp_db_name = input(:gcp_db_name, value: '', description: 'Database instance name.')

control 'google_sql_databases-1.0' do
  impact 1.0
  title 'google_sql_databases resource test'

  describe google_sql_databases(project: gcp_project_id, instance: gcp_db_instance_name) do
    it { should exist }
    its('names') { should include gcp_db_name }
    its('instances') { should include gcp_db_instance_name }
  end
end
