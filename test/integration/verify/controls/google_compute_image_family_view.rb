title 'Test GCP google_compute_image_family_view resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
image_family_views = input('image_family_views', value: {
  "zone": "us-central1-c",
  "name": "image-1",
  "source_type": "RAW",
  "status": "READY",
  "archive_size_bytes": 539099200,
  "disk_size_gb": 3,
  "family": "test"
}, description: 'Returns the latest image that is part of an image family, is not deprecated and is rolled out in the specified zone.')

control 'google_compute_image_family_view-1.0' do
  impact 1.0
  title 'google_compute_image_family_view resource test'

  describe google_compute_image_family_view(project: gcp_project_id, zone: image_family_views['zone'], name: image_family_views['family']) do
    it { should exist }
    its('image.name') { should eq image_family_views['name'] }
    its('image.source_type') { should eq image_family_views['source_type'] }
    its('image.family') { should eq image_family_views['family'] }
  end
end
