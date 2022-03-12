title 'Test GCP google_container_node_pools resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_kube_cluster_zone = input(:gcp_kube_cluster_zone, value: '', description: 'The zone that the kube cluster resides in.')
gcp_kube_cluster_name = input(:gcp_kube_cluster_name, value: '', description: 'The parent container clusters name.')
regional_node_pool = input('regional_node_pool', value: {
  "name": "inspec-gcp-regional-node-pool",
  "cluster_name": "inspec-gcp-regional-node-pool-cluster",
  "node_count": 1,
  "initial_node_count": 1
}, description: 'Regional Node Pool definition')

control 'google_container_node_pools-1.0' do
  impact 1.0
  title 'google_container_node_pools resource test'

  describe google_container_node_pools(project: gcp_project_id, location: gcp_kube_cluster_zone, cluster_name: gcp_kube_cluster_name) do
    its('initial_node_counts') { should include regional_node_pool['initial_node_count']}
  end
end
