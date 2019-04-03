title 'GKE Container Node Pool Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_kube_cluster_name = attribute(:gcp_kube_cluster_name, default: '', description: 'The GKE cluster name.')
gcp_kube_cluster_zone = attribute(:gcp_kube_cluster_zone, default: '', description: 'The GKE cluster zone.')
gcp_kube_cluster_size = attribute(:gcp_kube_cluster_size, default: '', description: 'The GKE cluster initial size.')
gcp_kube_nodepool_name = attribute(:gcp_kube_nodepool_name, default:'', description: 'The GKE cluster node pool name.')

control 'gcp-gke-container-node-pool-1.0' do

  impact 1.0
  title 'Ensure GKE Container Node Pool was built correctly'

  describe google_container_node_pool(project: gcp_project_id, zone: gcp_kube_cluster_zone, cluster_name: gcp_kube_cluster_name, nodepool_name: gcp_kube_nodepool_name) do
    it { should exist }
    its('name') { should eq gcp_kube_nodepool_name }

    # the cluster should not be tainted
    its('tainted?') { should be false }

    # the cluster should not be untrusted
    its('untrusted?') { should be false }

    # the cluster should be in running state
    its('status') { should eq 'RUNNING' }

    # check node pool configuration settings
    its('config.disk_size_gb'){should eq 100}
    its('config.image_type'){should eq "COS"}
    its('config.machine_type'){should eq "n1-standard-1"}

    # default initial node count should be set via the configuration file
    its('initial_node_count'){should eq gcp_kube_cluster_size}
  end
end
