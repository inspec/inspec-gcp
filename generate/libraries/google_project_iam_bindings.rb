# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleProjectIAMBindings < GcpResourceBase
    name 'google_project_iam_bindings'
    desc 'Verifies settings for GCP project iam_bindings in bulk'

    example "
      describe google_project_iam_bindings(project: 'chef-inspec-gcp') do
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:iam_binding_roles, field: :iam_binding_role)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      iam_binding_rows = []
      catch_gcp_errors do
        @iam_bindings = @gcp.gcp_project_client.get_project_iam_policy(@project)
      end
      return [] if !@iam_bindings || !@iam_bindings.bindings
      @iam_bindings.bindings.map do |iam_binding|
        iam_binding_rows+=[{ iam_binding_role: iam_binding.role }]
      end
      @table = iam_binding_rows
    end
  end
end
