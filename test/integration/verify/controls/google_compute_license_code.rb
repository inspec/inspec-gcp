title 'Test GCP google_compute_license_code resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
license_code = input('license_code', value: {
  "name": "akl-zone1-1353"
}, description: 'License codes are mirrored across all projects that have permissions to read the License Code.')

control 'google_compute_license_code-1.0' do
  impact 1.0
  title 'google_compute_license_code resource test'

  describe google_compute_license_code(project: gcp_project_id, name: license_code['name']) do
    it { should exist }
  end

  describe google_compute_license_code(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
