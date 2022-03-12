title 'Test GCP google_compute_addresses resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
address = input('address', value: {
  "name": "inspec-gcp-global-address",
  "address_type": "INTERNAL",
  "address": "10.2.0.3"
}, description: 'Address definition')

control 'google_compute_addresses-1.0' do
  impact 1.0
  title 'google_compute_addresses resource test'

  describe google_compute_addresses(project: gcp_project_id, location: gcp_location) do
    its('addresses') { should include address['address'] }
    its('names') { should include address['name'] }
  end
end
