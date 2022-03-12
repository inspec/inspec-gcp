title 'Test GCP google_storage_bucket resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'GCP location')

control 'google_storage_bucket-1.0' do
  impact 1.0
  title 'google_storage_bucket resource test'

  describe google_storage_bucket(name: "inspec-gcp-static-#{gcp_project_id}") do
    it { should exist }
    its('location') { should cmp gcp_location.upcase }

    its('storage_class') { should eq "STANDARD" }
    its('labels') { should include("key" => "value") }
    its('retention_policy.retention_period') { should cmp 1000 }
  end

  describe google_storage_bucket(name: "nonexistent") do
    it { should_not exist }
  end
end
