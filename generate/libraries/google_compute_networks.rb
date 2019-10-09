# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeNetworks < GcpResourceBase
    name 'google_compute_networks'
    desc 'Verifies settings for GCP compute networks in bulk'

    example "
      describe google_compute_networks(project: 'chef-inspec-gcp') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:network_ids, field: :network_id)
    filter_table_config.add(:network_names, field: :network_name)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      network_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @networks = @gcp.gcp_compute_client.list_networks(@project, page_token: next_page)
        end
        return [] if !@networks || !@networks.items
        @networks.items.map do |network|
          network_rows+=[{ network_id: network.id,
                           network_name: network.name }]
        end
        next_page = @networks.next_page_token
        break unless next_page
      end
      @table = network_rows
    end
  end
end
