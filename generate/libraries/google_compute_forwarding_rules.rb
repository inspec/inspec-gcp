# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeForwardingRules < GcpResourceBase
    name 'google_compute_forwarding_rules'
    desc 'Verifies settings for GCP compute forwarding_rules in bulk'

    example "
      describe google_compute_forwarding_rules(project: 'chef-inspec-gcp', region: 'europe-west1') do
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      @project = opts[:project]
      @region = opts[:region]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:forwarding_rule_ids, field: :forwarding_rule_id)
    filter_table_config.add(:forwarding_rule_names, field: :forwarding_rule_name)
    filter_table_config.add(:forwarding_rule_networks, field: :forwarding_rule_network)
    filter_table_config.add(:forwarding_rule_load_balancing_schemes, field: :forwarding_rule_load_balancing_scheme)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      forwarding_rule_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @forwarding_rules = @gcp.gcp_compute_client.list_forwarding_rules(@project, @region, page_token: next_page)
        end
        return [] if !@forwarding_rules || !@forwarding_rules.items
        @forwarding_rules.items.map do |forwarding_rule|
          forwarding_rule_network = forwarding_rule.network.split('/').last if !forwarding_rule.network.nil?
          forwarding_rule_rows+=[{ forwarding_rule_id: forwarding_rule.id,
                        forwarding_rule_name: forwarding_rule.name,
                        forwarding_rule_network: forwarding_rule_network,
                        forwarding_rule_load_balancing_scheme: forwarding_rule.load_balancing_scheme }]
        end
        next_page = @forwarding_rules.next_page_token
        break unless next_page
      end
      @table = forwarding_rule_rows
    end
  end
end
