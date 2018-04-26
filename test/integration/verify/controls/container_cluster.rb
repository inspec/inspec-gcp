title 'GKE Container Cluster Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_kube_cluster_name = attribute(:gcp_kube_cluster_name, default: '', description: 'The GKE cluster name.')
gcp_kube_cluster_zone = attribute(:gcp_kube_cluster_zone, default: '', description: 'The GKE cluster zone.')
gcp_kube_cluster_master_user = attribute(:gcp_kube_cluster_master_user, default: '', description: 'The GKE cluster master user.')
gcp_kube_cluster_master_pass = attribute(:gcp_kube_cluster_master_pass, default: '', description: 'The GKE cluster master password.')
gcp_kube_cluster_zone_extra1 = attribute(:gcp_kube_cluster_zone_extra1, default: '', description: 'The GKE cluster secondary zone.')
gcp_kube_cluster_zone_extra2 = attribute(:gcp_kube_cluster_zone_extra2, default: '', description: 'The GKE cluster tertiary zone.')


control 'gcp-gke-container-cluster-1.0' do

  impact 1.0
  title 'Ensure GKE Container Cluster was built correctly'

  describe google_container_cluster(project: gcp_project_id, zone: gcp_kube_cluster_zone, name: gcp_kube_cluster_name) do
    it { should exist }
    its('name') { should eq gcp_kube_cluster_name }
    its('zone') { should match gcp_kube_cluster_zone }

    # the cluster should not be tainted
    its('tainted?') { should be false }

    # the cluster should not be untrusted
    its('untrusted?') { should be false }

    # the cluster should be in running state
    its('status') { should eq 'RUNNING' }

    # locations should match those requested
    its('locations.sort'){should cmp [ gcp_kube_cluster_zone, gcp_kube_cluster_zone_extra1, gcp_kube_cluster_zone_extra2 ].sort}

    # importantly for the cluster, check the kube master user/password
    its('master_auth.username'){ should eq gcp_kube_cluster_master_user}
    its('master_auth.password'){ should eq gcp_kube_cluster_master_pass}

    # no special network settings currently applied
    its('network'){should eq "default"}
    its('subnetwork'){should eq "default"}

    # check node configuration settings
    its('node_config.disk_size_gb'){should eq 100}
    its('node_config.image_type'){should eq "COS"}
    its('node_config.machine_type'){should eq "n1-standard-1"}

    # check ipv4 cidr size
    its('node_ipv4_cidr_size'){should eq 24}

    # check there is one node pool in the cluster
    its('node_pools.count'){should eq 1}

  end
end
