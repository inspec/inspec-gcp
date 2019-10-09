# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeNetwork < GcpResourceBase
    name 'google_compute_network'
    desc 'Verifies settings for a compute network'

    example "
      describe google_compute_network(project: 'chef-inspec-gcp',  name: 'gcp-inspec-network') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @network = @gcp.gcp_compute_client.get_network(opts[:project], opts[:name])
        create_resource_methods(@network)
      end
    end

    def exists?
      !@network.nil?
    end

    def legacy?
      return false if @network.auto_create_subnetworks
      return false if !defined?(@network.gateway_i_pv4)
      return false if !defined?(@network.i_pv4_range)
      return false if @network.i_pv4_range.nil?
      return false if @network.gateway_i_pv4.nil?
      true
    end

    def creation_timestamp_date
      return false if !defined?(creation_timestamp) || creation_timestamp.nil?
      Time.parse(creation_timestamp.to_s)
    end

    def to_s
      "Network #{@display_name}"
    end
  end
end
