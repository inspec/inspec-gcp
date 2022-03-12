title 'Test GCP google_dns_managed_zones resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_dns_zone_name = input(:gcp_dns_zone_name, value: '', description: 'The DNS name of the DNS zone.')
dns_managed_zone = input('dns_managed_zone', value: {
  "name"=>"example-zone",
  "description"=>"example description",
  "dnssec_config_state"=>"on"
})

control 'google_dns_managed_zones-1.0' do
  impact 1.0
  title 'google_dns_managed_zones resource test'

  describe google_dns_managed_zones(project: gcp_project_id) do
    it { should exist }
    its('zone_names') { should include dns_managed_zone['name'] }
    its('zone_dns_names') { should include gcp_dns_zone_name }
  end
end
