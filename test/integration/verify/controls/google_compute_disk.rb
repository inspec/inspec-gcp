title 'Test GCP google_compute_disk resource.'

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

control 'google_compute_disk-1.0' do
  impact 1.0
  title 'google_compute_disk resource test'

  most_recent_image = google_compute_image(project: gcp_compute_disk_image.split('/').first, name: gcp_compute_disk_image.split('/').last)

  describe google_compute_disk(project: gcp_project_id, name: gcp_compute_disk_name, zone: gcp_zone) do
    it { should exist }
    # Test that the image is the most recent image for the family
    its('source_image') { should match most_recent_image.self_link }
    its('type') { should match gcp_compute_disk_type }
  end

  describe.one do
    google_compute_disk(project: gcp_project_id, name: gcp_compute_disk_name, zone: gcp_zone).labels.each_pair do |key, value|
      describe key do
        it { should cmp "environment" }
      end
    end
  end

  describe google_compute_disk(project: gcp_project_id, name: 'nonexistent', zone: gcp_zone) do
    it { should_not exist }
  end
end
