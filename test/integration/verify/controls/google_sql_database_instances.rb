title 'GCP Cloud SQL Database Instances Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_db_instance_name = attribute(:gcp_db_instance_name, default: '', description: 'The GCP DB instance name.')

control 'gcp-db-instances-1.0' do

  impact 1.0
  title 'Ensure  GCP Cloud SQL Database instances have the correct properties in bulk'

  describe google_sql_database_instances(project: gcp_project_id) do
    its('count') { should be <= 100}
    its('instance_states') { should include 'RUNNABLE' }
    its('instance_names') { should include gcp_db_instance_name }
  end

end