title 'Test GCP Cloud SQL Database users'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_db_instance_name = attribute(:gcp_db_instance_name, default: '', description: 'The GCP DB instance name.')

control 'gcp-db-users-1.0' do

  impact 1.0
  title 'Ensure GCP Cloud SQL Database users have the correct properties.'

  describe google_sql_users(project: gcp_project_id,  database: gcp_db_instance_name) do
    it { should exist }
    its('count') { should be <= 100}
    its('user_instances') { should include gcp_db_instance_name }
  end
end