# frozen_string_literal: false

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
require 'gcp_backend'
require 'google/container/property/nodepool_autoscaling'
require 'google/container/property/nodepool_conditions'
require 'google/container/property/nodepool_config'
require 'google/container/property/nodepool_config_accelerators'
require 'google/container/property/nodepool_config_shielded_instance_config'
require 'google/container/property/nodepool_config_taints'
require 'google/container/property/nodepool_config_workload_meta_config'
require 'google/container/property/nodepool_management'
require 'google/container/property/nodepool_management_upgrade_options'
require 'google/container/property/nodepool_max_pods_constraint'

# A provider to manage Google Kubernetes Engine resources.
class ContainerNodePool < GcpResourceBase
  name 'google_container_node_pool'
  desc 'NodePool'
  supports platform: 'gcp'

  attr_reader :params, :name, :config, :initial_node_count, :status, :status_message, :version, :autoscaling, :management, :max_pods_constraint, :conditions, :pod_ipv4_cidr_size, :cluster, :location

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @config = GoogleInSpec::Container::Property::NodePoolConfig.new(@fetched['config'], to_s)
    @initial_node_count = @fetched['initialNodeCount']
    @status = @fetched['status']
    @status_message = @fetched['statusMessage']
    @version = @fetched['version']
    @autoscaling = GoogleInSpec::Container::Property::NodePoolAutoscaling.new(@fetched['autoscaling'], to_s)
    @management = GoogleInSpec::Container::Property::NodePoolManagement.new(@fetched['management'], to_s)
    @max_pods_constraint = GoogleInSpec::Container::Property::NodePoolMaxPodsConstraint.new(@fetched['maxPodsConstraint'], to_s)
    @conditions = GoogleInSpec::Container::Property::NodePoolConditionsArray.parse(@fetched['conditions'], to_s)
    @pod_ipv4_cidr_size = @fetched['podIpv4CidrSize']
    @cluster = @fetched['cluster']
    @location = @fetched['location']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "NodePool #{@params[:nodepool_name]}"
  end

  private

  def product_url(beta: false)
    if beta
      'https://container.googleapis.com/v1beta1/'
    else
      'https://container.googleapis.com/v1/'
    end
  end

  def resource_base_url
    'projects/{{project}}/locations/{{location}}/clusters/{{cluster_name}}/nodePools/{{nodepool_name}}'
  end
end
