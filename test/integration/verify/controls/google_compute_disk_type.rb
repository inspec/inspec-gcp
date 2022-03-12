title 'Test GCP google_compute_disk_type resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
# disk_type = input('disk_type', default: null, description: 'The accelerator type')

control 'google_compute_disk_type-1.0' do
  impact 1.0
  title 'google_compute_disk_type resource test'

  describe google_compute_disk_type(project: gcp_project_id, zone: 'us-east1-b', name: accelerator_type['name']) do
    it { should exist }
  end
end
