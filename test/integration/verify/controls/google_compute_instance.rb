title 'Test GCP google_compute_instance resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_zone = input(:gcp_zone, value: '', description: 'GCP zone name of the compute disk')
instance = input('instance', value: {
  "name": "inspec-instance",
  "machine_type": "n1-standard-1",
  "tag_1": "foo",
  "tag_2": "bar",
  "metadata_key": "123",
  "metadata_value": "asdf",
  "sa_scope": "https://www.googleapis.com/auth/compute.readonly",
  "startup_script": "echo hi > /test.txt"
}, description: 'Compute instance description')

control 'google_compute_instance-1.0' do
  impact 1.0
  title 'google_compute_instance resource test'

  describe google_compute_instance(project: gcp_project_id, zone: gcp_zone, name: instance['name']) do
    it { should exist }
    its('machine_type') { should match instance['machine_type'] }
    its('tags.items') { should include instance['tag_1'] }
    its('tags.items') { should include instance['tag_2'] }
    its('tag_count') { should cmp 2 }
    its('service_account_scopes') { should include instance['sa_scope'] }
    its('metadata_keys') { should include instance['metadata_key'] }
    its('metadata_values') { should include instance['metadata_value'] }
  end

  describe google_compute_instance(project: gcp_project_id, zone: gcp_zone, name: 'nonexistent') do
    it { should_not exist }
  end
end
