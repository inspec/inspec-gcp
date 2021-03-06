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

title 'Test GCP google_compute_disks resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_zone = attribute(:gcp_zone, default: 'gcp_zone', description: 'The GCP project zone.')
snapshot = attribute('snapshot', default: {
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
