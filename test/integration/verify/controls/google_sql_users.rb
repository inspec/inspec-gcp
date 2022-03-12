title 'Test GCP google_sql_users resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project location.')
gcp_db_instance_name = input(:gcp_db_instance_name, value: '', description: 'Database instance name.')
gcp_db_user_name = input(:gcp_db_user_name, value: '', description: 'SQL database user name.')

control 'google_sql_users-1.0' do
  impact 1.0
  title 'google_sql_users resource test'


  describe google_sql_users(project: gcp_project_id, database: gcp_db_instance_name) do
    its('user_names') { should include gcp_db_user_name }
  end
end
