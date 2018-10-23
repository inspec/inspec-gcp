# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeProjectInfo < GcpResourceBase
    name 'google_compute_project_info'
    desc 'Verifies settings for GCP Compute Project Info'

    example "
      describe google_compute_project_info(project: 'chef-inspec-gcp') do
        it { should exist }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:project]
      catch_gcp_errors do
        @project_info = @gcp.gcp_compute_client.get_project(opts[:project])
        create_resource_methods(@project_info)
      end
    end

    def has_enabled_oslogin?
      return false if !defined?(@project_info.common_instance_metadata.items) || @project_info.common_instance_metadata.items.nil?
      @project_info.common_instance_metadata.items.each do |element|
        return true if element.key=='enable-oslogin' and element.value.casecmp('true').zero?
      end
      false
    end

    def creation_timestamp_date
      return false if !defined?(creation_timestamp) || creation_timestamp.nil?
      Time.parse(creation_timestamp.to_s)
    end

    def exists?
      !@project_info.nil?
    end

    def to_s
      "Compute Project Info #{@display_name}"
    end
  end
end
