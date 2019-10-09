# frozen_string_literal: true

require 'gcp_backend'
require 'google/apis/logging_v2'

module Inspec::Resources
  class GoogleLoggingProjectExclusion < GcpResourceBase
    name 'google_logging_project_exclusion'
    desc 'Verifies settings for a project logging exclusion'

    example "
      describe google_logging_project_exclusion(project: 'chef-inspec-gcp',  exclusion: 'exclusion-name-abcd') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
      @exclusion = opts[:exclusion]
      catch_gcp_errors do
        @logging_exclusion = @gcp.gcp_client(Google::Apis::LoggingV2::LoggingService).get_project_exclusion("projects/#{opts[:project]}/exclusions/#{opts[:exclusion]}")
        create_resource_methods(@logging_exclusion)
      end
    end

    def exists?
      !@logging_exclusion.nil?
    end

    def to_s
      "Logging Project Exclusion #{@exclusion}"
    end
  end
end
