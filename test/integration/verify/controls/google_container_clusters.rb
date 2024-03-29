# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_container_clusters resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_kube_cluster_name = input(:gcp_kube_cluster_name, value: 'gcp_kube_cluster_name', description: 'GCP container cluster name')
gcp_kube_cluster_zone = input(:gcp_kube_cluster_zone, value: 'gcp_kube_cluster_zone', description: 'GCP container cluster zone')
gcp_kube_cluster_size = input(:gcp_kube_cluster_size, value: 'gcp_kube_cluster_size', description: 'GCP container cluster size')
gcp_kube_cluster_zone_extra1 = input(:gcp_kube_cluster_zone_extra1, value: 'gcp_kube_cluster_zone_extra1', description: 'First extra zone for the cluster')
gcp_kube_cluster_zone_extra2 = input(:gcp_kube_cluster_zone_extra2, value: 'gcp_kube_cluster_zone_extra2', description: 'Second extra zone for the cluster')
gcp_kube_cluster_master_user = input(:gcp_kube_cluster_master_user, value: 'gcp_kube_cluster_master_user', description: 'GCP container cluster admin username')
control 'google_container_clusters-1.0' do
  impact 1.0
  title 'google_container_clusters resource test'

  describe google_container_clusters(project: gcp_project_id, location: gcp_kube_cluster_zone) do
    its('cluster_names') { should include gcp_kube_cluster_name }
  end
end
