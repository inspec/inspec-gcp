title 'Test GCP google_container_server_config resource.'

# gcp_kube_cluster_name = input(:gcp_kube_cluster_name, value: '', description: 'The parent container clusters name.')
gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_kube_cluster_zone = input(:gcp_kube_cluster_zone, value: '', description: 'The zone that the kube cluster resides in.')
container_engine_versions = input('container_engine_versions', value: {
  "valid_master_version": "1.21.5-gke.1802",
  "valid_node_version": "1.21.5-gke.1802"
}, description: 'Google Kubernetes Engine versions in a zone or region for a given project.')

control 'google_container_server_config-1.0' do
  impact 1.0
  title 'google_container_server_config resource test'

  describe google_container_server_config(project: gcp_project_id, location: gcp_kube_cluster_zone) do
    its('valid_master_versions') { should include container_engine_versions['valid_master_version']}
    its('valid_node_versions') { should include container_engine_versions['valid_node_version']}
  end
end
