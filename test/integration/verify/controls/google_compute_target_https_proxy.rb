title 'Test GCP google_compute_target_https_proxy resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
https_proxy = input('https_proxy', value: {
  "name": "inspec-gcp-https-proxy",
  "description": "A HTTPS target proxy"
}, description: 'Compute HTTPS proxy definition')

control 'google_compute_target_https_proxy-1.0' do
  impact 1.0
  title 'google_compute_target_https_proxy resource test'

  describe google_compute_target_https_proxy(project: gcp_project_id, name: https_proxy['name']) do
    it { should exist }
    its('url_map') { should match /\/inspec-gcp-url-map$/ }
    its('description') { should eq https_proxy['description'] }
  end

  describe google_compute_target_https_proxy(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
