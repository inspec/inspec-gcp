title 'Test GCP google_compute_snapshot resource.'

# gcp_zone = input(:gcp_zone, value: '', description: 'GCP zone name of the compute disk')
gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
snapshot = input('snapshot', value: {
  "name": "inspec-gcp-disk-snapshot",
  "disk_name": "inspec-snapshot-disk",
  "disk_type": "pd-standard",
  "disk_image": "debian-cloud/debian-10-buster-v20191014"
}, description: 'Compute disk snapshot description')

control 'google_compute_snapshot-1.0' do
  impact 1.0
  title 'google_compute_snapshot resource test'

  describe google_compute_snapshot(project: gcp_project_id, name: snapshot['name']) do
    it { should exist }
    its('source_disk') { should match snapshot['disk_name'] }
  end

  describe google_compute_snapshot(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
