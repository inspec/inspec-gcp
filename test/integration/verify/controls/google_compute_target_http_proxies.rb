title 'Test GCP google_compute_target_http_proxies resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
http_proxy = input('http_proxy', value: {
  "name": "inspec-gcp-http-proxy",
  "description": "A HTTP proxy"
}, description: 'Compute HTTP proxy definition')
control 'google_compute_target_http_proxies-1.0' do
  impact 1.0
  title 'google_compute_target_http_proxies resource test'

  describe google_compute_target_http_proxies(project: gcp_project_id) do
    its('names') { should include http_proxy['name'] }
    its('descriptions') { should include http_proxy['description'] }
  end
end
