# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleProjectIamCustomRole < GcpResourceBase
    name 'google_project_iam_custom_role'
    desc 'Verifies settings for a project IAM role'

    example "
      describe google_project_iam_custom_role(project: 'chef-inspec-gcp', name: 'admin12345') do
        it { should exist }
        its('stage') { should eq 'GA' }
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      catch_gcp_errors do
        @iam_role = @gcp.gcp_iam_client.get_role("projects/#{opts[:project]}/roles/#{opts[:name]}")
        create_resource_methods(@iam_role)
      end
    end

    def exists?
      !@iam_role.nil?
    end

    def to_s
      "Project IAM Custom Role #{@display_name}"
    end
  end
end
