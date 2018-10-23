# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleProjectLoggingAuditConfig < GcpResourceBase
    name 'google_project_logging_audit_config'
    desc 'Verifies settings for a GCP project logging audit configuration'

    example "
      describe google_project_logging_audit_config(project: 'chef-inspec-gcp') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
      catch_gcp_errors do
        @audit_logging_configs = @gcp.gcp_project_client.get_project_iam_policy(@project)
        @default_types = []
        @default_exempted_members = {}
        if defined?(@audit_logging_configs.audit_configs) && @audit_logging_configs.audit_configs.class.to_s == 'Array'
          @audit_logging_configs.audit_configs.each do |service_config|
            next if service_config.service != 'allServices'
            service_config.audit_log_configs.each do |config|
              @default_types+=[config.log_type]
              @default_exempted_members[config.log_type]=config.exempted_members if defined?(config.exempted_members) && !config.exempted_members.nil?
            end
          end
        end
      end
    end

    def exists?
      defined?(@audit_logging_configs.audit_configs) && !@audit_logging_configs.audit_configs.nil?
    end

    attr_reader :default_types

    attr_reader :default_exempted_members

    def has_default_exempted_members?
      @default_exempted_members.values.any?
    end

    def to_s
      "Logging Audit Config For #{@project}"
    end
  end
end
