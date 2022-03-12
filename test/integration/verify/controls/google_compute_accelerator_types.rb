title 'Test GCP google_compute_accelerator_types resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
# accelerator_type = input('accelerator_type', value: null, description: 'The accelerator type')

control 'google_compute_accelerator_types-1.0' do
  impact 1.0
  title 'google_compute_accelerator_types resource test'

  describe google_compute_accelerator_types(project: gcp_project_id, zone: 'us-east1-b') do
  it { should exist }
  it { should be_up }
  end
end
