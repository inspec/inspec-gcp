# frozen_string_literal: false

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
    attr_reader :params

    def initialize(params = {})
      # Call the parent class constructor
      super(params.merge({ use_http_transport: true }))
      @project = params[:project]
      @fetched = @connection.fetch(product_url, resource_base_url, params, 'Post')
      @default_types = []
      @default_exempted_members = {}
      return unless defined?(@fetched['auditConfigs']) && @fetched['auditConfigs'].instance_of?(::Array)
      @audit_logging_configs = GoogleInSpec::Iam::Property::IamPolicyAuditConfigsArray.parse(@fetched['auditConfigs'], to_s)

      @audit_logging_configs.each do |service_config|
        next if service_config.service != 'allServices'
        service_config.audit_log_configs.each do |config|
          @default_types+=[config.log_type]
          @default_exempted_members[config.log_type]=config.exempted_members if defined?(config.exempted_members) && !config.exempted_members.nil?
        end
      end
    end

    def exists?
      defined?(@audit_logging_configs) && !@audit_logging_configs.nil?
    end

    attr_reader :default_types

    attr_reader :default_exempted_members

    def has_default_exempted_members?
      @default_exempted_members.values.any?
    end

    def to_s
      "Logging Audit Config For #{@project}"
    end

    private

    def product_url
      'https://cloudresourcemanager.googleapis.com/v1/'
    end

    def resource_base_url
      'projects/{{project}}:getIamPolicy'
    end
  end
end
