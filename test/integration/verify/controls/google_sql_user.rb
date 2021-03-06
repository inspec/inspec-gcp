# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_sql_user resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: 'gcp_location', description: 'The GCP project location.')
gcp_db_instance_name = attribute(:gcp_db_instance_name, default: 'gcp_db_instance_name', description: 'Database instance name.')
gcp_db_user_name = attribute(:gcp_db_user_name, default: 'gcp_db_user_name', description: 'SQL database user name.')
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
