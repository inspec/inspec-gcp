title 'Test GCP google_container_cluster resource.'

# gcp_kube_cluster_size = input(:gcp_kube_cluster_size, value: '', description: 'GCP container cluster size')
gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_kube_cluster_name = input(:gcp_kube_cluster_name, value: '', description: 'GCP container cluster name')
gcp_kube_cluster_zone = input(:gcp_kube_cluster_zone, value: '', description: 'GCP container cluster zone')
gcp_kube_cluster_zone_extra1 = input(:gcp_kube_cluster_zone_extra1, value: '', description: 'First extra zone for the cluster')
gcp_kube_cluster_zone_extra2 = input(:gcp_kube_cluster_zone_extra2, value: '', description: 'Second extra zone for the cluster')
gcp_kube_cluster_master_user = input(:gcp_kube_cluster_master_user, value: '', description: 'GCP container cluster admin username')

control 'google_container_cluster-1.0' do
  impact 1.0
  title 'google_container_cluster resource test'

  describe google_container_cluster(project: gcp_project_id, location: gcp_kube_cluster_zone, name: gcp_kube_cluster_name) do
    it { should exist }
    its('locations.sort'){ should cmp [ gcp_kube_cluster_zone, gcp_kube_cluster_zone_extra1, gcp_kube_cluster_zone_extra2 ].sort }
    its('master_auth.username') { should eq gcp_kube_cluster_master_user }
  end

  describe google_container_cluster(project: gcp_project_id, location: gcp_kube_cluster_zone, name: 'nonexistent') do
    it { should_not exist }
  end

  describe google_container_cluster(project: gcp_project_id, location: gcp_kube_cluster_zone, name: gcp_kube_cluster_name, beta: true) do
    it { should exist }
    its('release_channel.channel') { should cmp "RAPID" }
  end
end
