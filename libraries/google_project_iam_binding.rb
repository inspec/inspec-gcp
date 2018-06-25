# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleProjectIAMBinding < GcpResourceBase
    name 'google_project_iam_binding'
    desc 'Verifies settings for a single project IAM binding'

    example "
      describe google_project_iam_binding(project: 'chef-inspec-gcp',  role: 'roles/compute.admin') do
        it { should exist }
        its('members') {should include 'user:someuser@domain.com' }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      @project = opts[:project]
      @role = opts[:role]
      @iam_binding_exists = false
      @members_list=[]
      catch_gcp_errors do
        # note this is the same call as for the plural iam_bindings resource because there isn't an easy way to pull out a singular binding
        @iam_bindings = @gcp.gcp_project_client.get_project_iam_policy(@project)
        raise Inspec::Exceptions::ResourceFailed, "google_project_iam_binding is missing expected IAM policy 'bindings' property" if !@iam_bindings || !@iam_bindings.bindings
        @iam_bindings.bindings.each do |binding|
          next if binding.role != @role
          @iam_binding_exists=true
          @members_list=binding.members
        end
      end
    end

    # return the list of users corresponding to the role
    def members
      @members_list
    end

    def exists?
      @iam_binding_exists
    end

    def to_s
      "Project IAM Binding #{@display_name}"
    end
  end
end
