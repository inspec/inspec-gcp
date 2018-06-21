# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeInstanceGroups < GcpResourceBase
    name 'google_compute_instance_groups'
    desc 'Verifies settings for GCP compute instance_groups in bulk'

    example "
      describe google_compute_instance_groups(project: 'chef-inspec-gcp', zone: 'europe-west2-a') do
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
      @zone = opts[:zone]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:instance_group_ids, field: :instance_group_id)
    filter_table_config.add(:instance_group_names, field: :instance_group_name)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      instance_group_rows = []
      catch_gcp_errors do
        @instance_groups = @gcp.gcp_compute_client.list_instance_groups(@project, @zone)
      end
      return [] if !@instance_groups || !@instance_groups.items
      @instance_groups.items.map do |instance_group|
        instance_group_rows+=[{ instance_group_id: instance_group.id,
                                instance_group_name: instance_group.name }]
      end
      @table = instance_group_rows
    end
  end
end
