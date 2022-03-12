title 'Test GCP google_compute_interconnect_location resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
interconnect_location = input('interconnect_location', value: {
  "name": "akl-zone1-1353",
  "facility_provider_facility_id": "Auckland - Albany",
  "facility_provider": "Vocus"
}, description: 'Retrieves the list of interconnect locations available to the specified project.')

control 'google_compute_interconnect_location-1.0' do
  impact 1.0
  title 'google_compute_interconnect_location resource test'

  describe google_compute_interconnect_location(project: gcp_project_id, name: interconnect_location['name']) do
    it { should exist }
    its('facility_provider_facility_id') { should eq interconnect_location['facility_provider_facility_id'] }
    its('facility_provider') { should eq interconnect_location['facility_provider'] }
  end

  describe google_compute_interconnect_location(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
