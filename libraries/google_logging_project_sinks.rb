# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleLoggingProjectSinks < GcpResourceBase
    name 'google_logging_project_sinks'
    desc 'Verifies settings for GCP project logging sinks in bulk'

    example "
      describe google_logging_project_sinks(project: 'chef-inspec-gcp') do
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
    filter_table_config.add(:sink_names, field: :sink_name)
    filter_table_config.add(:sink_destinations, field: :sink_destination)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      sink_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @sinks = @gcp.gcp_client(Google::Apis::LoggingV2::LoggingService).list_project_sinks("projects/#{@project}", page_token: next_page)
        end
        return [] if !@sinks || !@sinks.sinks
        @sinks.sinks.map do |sink|
          logging_sink = @gcp.gcp_client(Google::Apis::LoggingV2::LoggingService).get_project_sink("projects/#{@project}/sinks/#{sink.name}")
          sink_rows+=[{ sink_name: sink.name,
                        sink_destination: sink.destination,
                        sink_filter: logging_sink.filter }]
        end
        next_page = @sinks.next_page_token
        break unless next_page
      end
      @table = sink_rows
    end
  end
end
