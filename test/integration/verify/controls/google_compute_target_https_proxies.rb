title 'Test GCP google_compute_target_https_proxies resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
https_proxy = input('https_proxy', value: {
  "name": "inspec-gcp-https-proxy",
  "description": "A HTTPS target proxy"
}, description: 'Compute HTTPS proxy definition')

control 'google_compute_target_https_proxies-1.0' do
  impact 1.0
  title 'google_compute_target_https_proxies resource test'

  describe google_compute_target_https_proxies(project: gcp_project_id) do
    its('names') { should include https_proxy['name'] }
    its('descriptions') { should include https_proxy['description'] }
  end
end
