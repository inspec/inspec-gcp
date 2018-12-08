# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/logging_v2'

module Inspec::Resources
  class GoogleLoggingProjectSink < GcpResourceBase
    name 'google_logging_project_sink'
    desc 'Verifies settings for a project logging sink'

    example "
      describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: 'sink-name-abcd') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
      @sink = opts[:sink]
      catch_gcp_errors do
        @logging_sink = @gcp.gcp_client(Google::Apis::LoggingV2::LoggingService).get_project_sink("projects/#{opts[:project]}/sinks/#{opts[:sink]}")
        create_resource_methods(@logging_sink)
      end
    end

    def exists?
      !@logging_sink.nil?
    end

    def to_s
      "Logging Project Sink #{@sink}"
    end
  end
end
