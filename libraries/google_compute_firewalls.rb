# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeFirewalls < GcpResourceBase
    name 'google_compute_firewalls'
    desc 'Verifies settings for GCP compute firewalls in bulk'

    example "
      describe google_compute_firewalls(project: 'chef-inspec-gcp') do
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      @project = opts[:project]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:firewall_ids, field: :firewall_id)
    filter_table_config.add(:firewall_names, field: :firewall_name)
    filter_table_config.add(:firewall_directions, field: :firewall_direction)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      firewall_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @firewalls = @gcp.gcp_compute_client.list_firewalls(@project, page_token: next_page)
        end
        return [] if !@firewalls || !@firewalls.items
        @firewalls.items.map do |firewall|
          firewall_rows+=[{ firewall_id: firewall.id,
                        firewall_name: firewall.name,
                        firewall_direction: firewall.direction }]
        end
        next_page = @firewalls.next_page_token
        break unless next_page
      end
      @table = firewall_rows
    end
  end
end
