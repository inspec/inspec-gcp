title 'Retrieve  all GCP Container Clusters for a project and zone'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_kube_cluster_name = input(:gcp_kube_cluster_name, value: '', description: 'The GKE cluster name.')
gcp_kube_cluster_zone = input(:gcp_kube_cluster_zone, value: '', description: 'The GKE cluster zone.')

control 'gcp-container-clusters-1.0' do

  impact 1.0
  title 'Ensure container clusters have the correct properties in bulk.'

  describe google_container_clusters(project: gcp_project_id, location: gcp_kube_cluster_zone) do
    it { should exist }
    its('count') { should be <= 10}
    its('cluster_names') { should include gcp_kube_cluster_name }
    its('cluster_statuses') { should include "RUNNING" }
  end
end