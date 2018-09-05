# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeSubnetworks < GcpResourceBase
    name 'google_compute_subnetworks'
    desc 'Verifies settings for GCP compute subnetworks in bulk'

    example "
      describe google_compute_subnetworks(project: 'chef-inspec-gcp', region: 'europe-west2') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
      @region = opts[:region]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:subnetwork_ids, field: :subnetwork_id)
    filter_table_config.add(:subnetwork_names, field: :subnetwork_name)
    filter_table_config.add(:subnetwork_networks, field: :subnetwork_network)
    filter_table_config.add(:enable_flow_logs, field: :enable_flow_log)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      subnetwork_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @subnetworks = @gcp.gcp_compute_client.list_subnetworks(@project, @region, page_token: next_page)
        end
        return [] if !@subnetworks || !@subnetworks.items
        @subnetworks.items.map do |subnetwork|
          catch_gcp_errors do
            @flow_logs_enabled = !@gcp.gcp_compute_client.list_subnetworks(@project, @region, filter: "enableFlowLogs=true name=\"#{subnetwork.name}\"").items.nil?
          end
          subnetwork_rows+=[{ subnetwork_id: subnetwork.id,
                              subnetwork_name: subnetwork.name,
                              subnetwork_network: subnetwork.network.split('/').last,
                              enable_flow_log: @flow_logs_enabled }]
        end
        next_page = @subnetworks.next_page_token
        break unless next_page
      end
      @table = subnetwork_rows
    end
  end
end
