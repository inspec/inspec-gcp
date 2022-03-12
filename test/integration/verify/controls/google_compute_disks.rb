title 'Test GCP google_compute_disks resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_zone = input(:gcp_zone, value: '', description: 'The GCP project zone.')
snapshot = input('snapshot', value: {
  "name": "inspec-gcp-disk-snapshot",
  "disk_name": "inspec-snapshot-disk",
  "disk_type": "pd-standard",
  "disk_image": "debian-cloud/debian-10-buster-v20191014"
}, description: 'Disk snapshot description')
gcp_compute_disk_name = snapshot["disk_name"]
gcp_compute_disk_image = snapshot["disk_image"]
gcp_compute_disk_type = snapshot["disk_type"]

control 'google_compute_disks-1.0' do
  impact 1.0
  title 'google_compute_disks resource test'

  most_recent_image = google_compute_image(project: gcp_compute_disk_image.split('/').first, name: gcp_compute_disk_image.split('/').last)
  describe google_compute_disks(project: gcp_project_id, zone: gcp_zone) do
    it { should exist }
    its('names') { should include snapshot['disk_name'] }
    its('source_images') { should include most_recent_image.self_link }
  end
end
