# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/container_v1beta1'

module Inspec::Resources
  class GoogleContainerCluster < GcpResourceBase
    name 'google_container_cluster'
    desc 'Verifies settings for a google container cluster'

    example "
      describe google_container_cluster(project: 'chef-inspec-gcp', zone: 'europe-west2-a', name: 'cluster-name') do
        it { should exist }
        its('name') { should eq 'inspec-test' }
        its('status') { should eq 'in_use' }
        ...
      end
    "
    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @cluster = @gcp.gcp_client(Google::Apis::ContainerV1beta1::ContainerService).get_zone_cluster(opts[:project], opts[:zone], opts[:name])
        create_resource_methods(@cluster)
      end
    end

    def has_logging_enabled?
      return false if !defined?(@cluster.logging_service)
      return false if @cluster.logging_service.nil?
      return true if @cluster.logging_service == 'logging.googleapis.com'
      false
    end

    def has_monitoring_enabled?
      return false if !defined?(@cluster.monitoring_service)
      return false if @cluster.monitoring_service.nil?
      return true if @cluster.monitoring_service == 'monitoring.googleapis.com'
      false
    end

    def has_legacy_abac_disabled?
      return nil if !defined?(@cluster.legacy_abac)
      return true if @cluster.legacy_abac.to_h.empty?
      false
    end

    def has_master_authorized_networks_enabled?
      return false if !defined?(@cluster.master_authorized_networks_config)
      return false if @cluster.master_authorized_networks_config.to_h.empty?
      return true if  @cluster.master_authorized_networks_config.to_h=={ 'enabled': true }
      false
    end

    def has_resource_labels?
      return false if !defined?(@cluster.resource_labels)
      return false if @cluster.resource_labels.to_h.empty?
      true
    end

    def has_kubernetes_dashboard_disabled?
      return false if !defined?(@cluster.addons_config.kubernetes_dashboard)
      return false if @cluster.addons_config.kubernetes_dashboard.to_h.empty?
      return true if  @cluster.addons_config.kubernetes_dashboard.to_h=={ 'disabled': true }
      false
    end

    def has_basic_authorization?
      return false if @cluster.master_auth.username.nil? and @cluster.master_auth.password.nil?
      true
    end

    def has_network_policy_enabled?
      return false if !defined?(@cluster.network_policy.enabled)
      return true if  @cluster.network_policy.enabled==true
      false
    end

    def has_master_auth_client_key?
      return false if !defined?(@cluster.master_auth.client_key)
      return false if @cluster.master_auth.client_key.nil?
      return false if @cluster.master_auth.client_key==''
      true
    end

    def has_ip_alias_enabled?
      return false if !defined?(@cluster.ip_allocation_policy.use_ip_aliases)
      return true if @cluster.ip_allocation_policy.use_ip_aliases==true
      false
    end

    def has_pod_security_policy_config?
      return false if !defined?(@cluster.pod_security_policy_config.enabled)
      return true if @cluster.pod_security_policy_config.enabled==true
      false
    end

    def private_cluster?
      return false if !defined?(@cluster.private_cluster)
      return true if @cluster.private_cluster==true
      false
    end

    def exists?
      !@cluster.nil?
    end

    def to_s
      "Cluster #{@display_name}"
    end
  end
end
