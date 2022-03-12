title 'Test GCP google_compute_image resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
compute_image = input('compute_image', value: {
  "name": "inspec-image",
  "source": "https://storage.googleapis.com/bosh-gce-raw-stemcells/bosh-stemcell-97.98-google-kvm-ubuntu-xenial-go_agent-raw-1557960142.tar.gz"
}, description: 'Compute image description')

control 'google_compute_image-1.0' do
  impact 1.0
  title 'google_compute_image resource test'

  describe google_compute_image(project: gcp_project_id, name: compute_image['name']) do
    it { should exist }
    its('disk_size_gb') { should cmp 3 }
  end

  describe google_compute_image(project: gcp_project_id, name: 'notfound') do
    it { should_not exist }
  end
end
