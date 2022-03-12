title 'Test GCP google_sql_user resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project location.')
gcp_db_instance_name = input(:gcp_db_instance_name, value: '', description: 'Database instance name.')
gcp_db_user_name = input(:gcp_db_user_name, value: '', description: 'SQL database user name.')

control 'google_sql_user-1.0' do
  impact 1.0
  title 'google_sql_user resource test'

  describe google_sql_user(project: gcp_project_id, database: gcp_db_instance_name, name: gcp_db_user_name, host: "example.com") do
    it { should exist }
    its('name') { should cmp gcp_db_user_name }
    its('instance') { should cmp gcp_db_instance_name }
  end

  describe google_sql_user(project: gcp_project_id, database: gcp_db_instance_name, name: "nonexistent", host: "example.com") do
    it { should_not exist }
  end
end
