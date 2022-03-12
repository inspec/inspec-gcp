title 'Test GCP google_compute_external_vpn_gateways resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')

control 'google_compute_external_vpn_gateways-1.0' do
  impact 1.0
  title 'google_compute_external_vpn_gateways resource test'

  describe google_compute_external_vpn_gateways(project: gcp_project_id) do
  it { should exist }
  end
end
