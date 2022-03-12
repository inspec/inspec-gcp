title 'Test GCP google_sql_database_instance resource.'

# gcp_location = input(:gcp_location, value: '', description: 'The GCP project location.')
gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_db_instance_name = input(:gcp_db_instance_name, value: '', description: 'Database instance name.')

control 'google_sql_database_instance-1.0' do
  impact 1.0
  title 'google_sql_database_instance resource test'


  describe google_sql_database_instance(project: gcp_project_id, database: gcp_db_instance_name) do
    it { should exist }
    its('state') { should eq 'RUNNABLE' }
    its('backend_type') { should eq 'SECOND_GEN' }
    its('database_version') { should eq 'MYSQL_5_7' }
  end
end
