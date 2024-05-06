title 'Test GCP google_compute_target_ssl_proxy resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

target_ssl_proxy = input('target_ssl_proxy', value: {
  "project": "ppradhan",
  "kind": "compute#targetSslProxy",
  "creation_timestamp": "value_creationtimestamp",
  "name": "test-proxy",
  "self_link": "https://www.googleapis.com/compute/v1/projects/ppradhan/global/targetSslProxies/test-proxy",
  "service": "https://www.googleapis.com/compute/v1/projects/ppradhan/global/backendServices/backend-service",
  "proxy_header": "NONE",
}, description: 'target_ssl_proxy description')

control 'google_compute_target_ssl_proxy-1.0' do
  impact 1.0
  title 'google_compute_target_ssl_proxy resource test'

  describe google_compute_target_ssl_proxy(project: gcp_project_id, name: target_ssl_proxy['name']) do
  	it { should exist }
  	its('kind') { should cmp target_ssl_proxy['kind'] }
  	its('name') { should cmp target_ssl_proxy['name'] }
  	its('self_link') { should cmp target_ssl_proxy['self_link'] }
  	its('service') { should cmp target_ssl_proxy['service'] }
  	its('proxy_header') { should cmp target_ssl_proxy['proxy_header'] }
  end

  describe google_compute_target_ssl_proxy(project: gcp_project_id, name: "donotexist") do
  	it { should_not exist }
  end
end
