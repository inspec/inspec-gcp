title 'Test GCP google_compute_instances resource.'

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

control 'google_compute_instances-1.0' do
  impact 1.0
  title 'google_compute_instances resource test'

  describe google_compute_instances(project: gcp_project_id, zone: gcp_zone) do
    its('instance_names') { should include instance['name'] }
  end
end
