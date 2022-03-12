title 'Test GCP google_sql_database_instances resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project location.')
gcp_db_instance_name = input(:gcp_db_instance_name, value: '', description: 'Database instance name.')

control 'google_sql_database_instances-1.0' do
  impact 1.0
  title 'google_sql_database_instances resource test'
  
  describe google_sql_database_instances(project: gcp_project_id) do
    its('instance_states') { should include 'RUNNABLE' }
    its('instance_names') { should include gcp_db_instance_name }
  end
end
