title 'Test GCP google_compute_target_http_proxy resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
http_proxy = input('http_proxy', value: {
  "name": "inspec-gcp-http-proxy",
  "description": "A HTTP proxy"
}, description: 'Compute HTTP proxy definition')

control 'google_compute_target_http_proxy-1.0' do
  impact 1.0
  title 'google_compute_target_http_proxy resource test'

  describe google_compute_target_http_proxy(project: gcp_project_id, name: http_proxy['name']) do
    it { should exist }
    its('description') { should eq http_proxy['description'] }
    its('url_map') { should  match /\/inspec-gcp-url-map$/ }
  end

  describe google_compute_target_http_proxy(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
