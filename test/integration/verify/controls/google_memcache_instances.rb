title 'Test GCP google_memcache_instances resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
memcache_instance = input('memcache_instance', value: {
  "name": "mem-instance"
}, description: 'Memcache settings')

control 'google_memcache_instances-1.0' do
  impact 1.0
  title 'google_memcache_instances resource test'

  describe google_memcache_instances(project: gcp_project_id, region: gcp_location) do
  	its('count') { should be >= 1 }
    its('node_counts') { should include 1 }
  end
end
