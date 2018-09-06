title 'Test single GCP Cloud SQL Database instance'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_db_instance_name = attribute(:gcp_db_instance_name, default: '', description: 'The GCP DB instance name.')

control 'gcp-db-instance-1.0' do

  impact 1.0
  title 'Ensure GCP Cloud SQL Database instance has the correct properties.'

  describe google_sql_database_instance(project: gcp_project_id,  database: gcp_db_instance_name) do
    it { should exist }
    its('state') { should eq 'RUNNABLE' }
    its('backend_type') { should eq 'SECOND_GEN' }
    its('database_version') { should eq 'MYSQL_5_7' }
  end
end