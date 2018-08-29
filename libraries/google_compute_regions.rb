# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeRegions < GcpResourceBase
    name 'google_compute_regions'
    desc 'Verifies settings for GCP compute regions in bulk'

    example "
      describe google_compute_regions(project: 'chef-inspec-gcp') do
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
    filter_table_config.add(:region_ids, field: :region_id)
    filter_table_config.add(:region_names, field: :region_name)
    filter_table_config.add(:region_statuses, field: :region_status)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      region_rows = []
      catch_gcp_errors do
        # could paginate here but there are currently 17 regions and the limit on the below call is 500
        @regions = @gcp.gcp_compute_client.list_regions(@project)
      end
      return [] if !@regions || !@regions.items
      @regions.items.map do |region|
        region_rows+=[{ region_id: region.id,
                          region_name: region.name,
                          region_status: region.status }]
      end
      @table = region_rows
    end
  end
end
