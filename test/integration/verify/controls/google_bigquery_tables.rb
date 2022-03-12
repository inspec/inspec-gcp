title 'Test GCP google_bigquery_tables resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
bigquery_table = input('bigquery_table', value: {
  "table_id": "inspec_gcp_bigquery_table",
  "description": "A BigQuery table",
  "expiration_time": 1738882264000,
  "time_partitioning_type": "DAY"
}, description: 'BigQuery table definition')
dataset = input('dataset', value: {
  "dataset_id": "inspec_gcp_dataset",
  "friendly_name": "A BigQuery dataset test",
  "description": "Test BigQuery dataset description",
  "location": "EU",
  "default_table_expiration_ms": 3600000,
  "access_writer_role": "WRITER",
  "access_writer_special_group": "projectWriters"
}, description: 'BigQuery dataset definition')

control 'google_bigquery_tables-1.0' do
  impact 1.0
  title 'google_bigquery_tables resource test'

  describe.one do
    google_bigquery_tables(project: gcp_project_id, dataset: dataset['dataset_id']).table_references.each do |table_reference|
      describe google_bigquery_table(project: gcp_project_id, dataset: dataset['dataset_id'], name: table_reference.table_id) do
        its('expiration_time') { should cmp bigquery_table['expiration_time'] }
        its('description') { should eq bigquery_table['description'] }
      end
    end
  end
end
