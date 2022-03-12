title 'Test GCP google_container_clusters resource.'

# gcp_kube_cluster_size = input(:gcp_kube_cluster_size, value: '', description: 'GCP container cluster size')
# gcp_kube_cluster_zone_extra1 = input(:gcp_kube_cluster_zone_extra1, value: '', description: 'First extra zone for the cluster')
# gcp_kube_cluster_zone_extra2 = input(:gcp_kube_cluster_zone_extra2, value: '', description: 'Second extra zone for the cluster')
# gcp_kube_cluster_master_user = input(:gcp_kube_cluster_master_user, value: '', description: 'GCP container cluster admin username')gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_kube_cluster_name = input(:gcp_kube_cluster_name, value: '', description: 'GCP container cluster name')
gcp_kube_cluster_zone = input(:gcp_kube_cluster_zone, value: '', description: 'GCP container cluster zone')

control 'google_container_clusters-1.0' do
  impact 1.0
  title 'google_container_clusters resource test'

  describe google_container_clusters(project: gcp_project_id, location: gcp_kube_cluster_zone) do
    its('cluster_names') { should include gcp_kube_cluster_name }
  end
end
