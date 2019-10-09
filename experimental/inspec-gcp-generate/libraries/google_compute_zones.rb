# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeZones < GcpResourceBase
    name 'google_compute_zones'
    desc 'Verifies settings for GCP compute zones in bulk'

    example "
      describe google_compute_zones(project: 'chef-inspec-gcp') do
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
    filter_table_config.add(:zone_ids, field: :zone_id)
    filter_table_config.add(:zone_names, field: :zone_name)
    filter_table_config.add(:zone_statuses, field: :zone_status)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      zone_rows = []
      catch_gcp_errors do
        @zones = @gcp.gcp_compute_client.list_zones(@project)
      end
      return [] if !@zones || !@zones.items
      @zones.items.map do |zone|
        zone_rows+=[{ zone_id: zone.id,
                          zone_name: zone.name,
                          zone_status: zone.status }]
      end
      @table = zone_rows
    end
  end
end
