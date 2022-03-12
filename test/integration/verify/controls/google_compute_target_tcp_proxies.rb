title 'Test GCP google_compute_target_tcp_proxies resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
target_tcp_proxy = input('target_tcp_proxy', value: {
  "name": "inspec-gcp-target-tcp-proxy",
  "proxy_header": "NONE",
  "tcp_backend_service_name": "gcp-inspec-tcp-backend-service"
}, description: 'Compute TCP proxy definition')

control 'google_compute_target_tcp_proxies-1.0' do
  impact 1.0
  title 'google_compute_target_tcp_proxies resource test'

  describe google_compute_target_tcp_proxies(project: gcp_project_id) do
    its('names') { should include target_tcp_proxy['name'] }
    its('proxy_headers') { should include target_tcp_proxy['proxy_header'] }
  end
end
