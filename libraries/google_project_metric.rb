# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/logging_v2'

module Inspec::Resources
  class GoogleProjectMetric < GcpResourceBase
    name 'google_project_metric'
    desc 'Verifies settings for a project metric'

    example "
      describe google_project_metric(project: 'chef-inspec-gcp',  metric: 'metric_name') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:metric]
      catch_gcp_errors do
        @metric = @gcp.gcp_client(Google::Apis::LoggingV2::LoggingService).get_project_metric("projects/#{opts[:project]}/metrics/#{opts[:metric]}")
        create_resource_methods(@metric)
      end
    end

    def exists?
      !@metric.nil?
    end

    def to_s
      "Project Metric #{@display_name}"
    end
  end
end
