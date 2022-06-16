title 'Retrieve  all GCP Container Cluster Node Pools for a project, cluster and zone'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_kube_cluster_name = input(:gcp_kube_cluster_name, value: '', description: 'The GKE cluster name.')
gcp_kube_cluster_zone = input(:gcp_kube_cluster_zone, value: '', description: 'The GKE cluster zone.')
gcp_kube_nodepool_name = input(:gcp_kube_nodepool_name, value:'', description: 'The GKE cluster node pool name.')

control 'gcp-container-cluster-node-pools-1.0' do

  impact 1.0
  title 'Ensure container cluster node pools have the correct properties in bulk.'

  describe google_container_node_pools(project: gcp_project_id, location: gcp_kube_cluster_zone, cluster_name: gcp_kube_cluster_name) do
    it { should exist }
    its('count') { should be <= 10}
    its('node_pool_names') { should include gcp_kube_nodepool_name }
    its('node_pool_statuses') { should include "RUNNING" }
  end
end