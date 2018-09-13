# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/logging_v2'

module Inspec::Resources
  class GoogleProjectMetrics < GcpResourceBase
    name 'google_project_metrics'
    desc 'Verifies settings for GCP project metrics in bulk'

    example "
      describe google_project_metrics(project: 'chef-inspec-gcp') do
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
    filter_table_config.add(:metric_names, field: :metric_name)
    filter_table_config.add(:metric_types, field: :metric_type)
    filter_table_config.add(:metric_destinations, field: :metric_destination)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      metric_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @metrics = @gcp.gcp_client(Google::Apis::LoggingV2::LoggingService).list_project_metrics("projects/#{@project}", page_token: next_page)
        end
        return [] if !@metrics || !@metrics.metrics
        @metrics.metrics.map do |metric|
          metric_rows+=[{ metric_name: metric.name,
                          metric_filter: metric.filter,
                          metric_type: metric.metric_descriptor.type }]
        end
        next_page = @metrics.next_page_token
        break unless next_page
      end
      @table = metric_rows
    end
  end
end
