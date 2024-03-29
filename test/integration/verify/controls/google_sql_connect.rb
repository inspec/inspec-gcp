# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    Type: MMv1     ***
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

title 'Test GCP google_sql_connect resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
sql_connect = attribute('sql_connect', default: {
  "region": "us-central1",
  "database_version": "POSTGRES_13",
  "backend_type": "SECOND_GEN",
  "cert_serial_number": 0,
  "common_name": "C=US,O=Google\\, Inc,CN=Google Cloud SQL Server CA,dnQualifier=68c79386-b63e-4998-8254-ba59729cdf78",
  "instance": "test-pg"
}, description: 'Sql connect settings about a Cloud SQL instance')

control 'google_sql_connect-1.0' do
  impact 1.0
  title 'google_sql_connect resource test'


  describe google_sql_connect(project: gcp_project_id, instance: sql_connect['instance'], name: 'test') do
    it { should exist }
    its('region') { should include sql_connect['region'] }
    its('database_version') { should include sql_connect['database_version'] }
    its('backend_type') { should include sql_connect['backend_type'] }
  end
end
