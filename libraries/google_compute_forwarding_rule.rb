# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeForwardingRule < GcpResourceBase
    name 'google_compute_forwarding_rule'
    desc 'Verifies settings for a compute forwarding_rule'

    example "
      describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding-rule') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @forwarding_rule = @gcp.gcp_compute_client.get_forwarding_rule(opts[:project], opts[:region], opts[:name])
        create_resource_methods(@forwarding_rule)
      end
    end

    def creation_timestamp_date
      return false if !defined?(creation_timestamp) || creation_timestamp.nil?
      Time.parse(creation_timestamp.to_s)
    end

    def exists?
      !@forwarding_rule.nil?
    end

    def to_s
      "ForwardingRule #{@display_name}"
    end
  end
end
