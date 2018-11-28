# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeRegionInstanceGroupManagers < GcpResourceBase
    name 'google_compute_region_instance_group_managers'
    desc 'Verifies settings for GCP compute region_instance_group_managers in bulk'

    example "
      describe google_compute_region_instance_group_managers(project: 'chef-inspec-gcp', region: 'europe-west2') do
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @project = opts[:project]
      @region = opts[:region]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:instance_group_manager_ids, field: :instance_group_manager_id)
    filter_table_config.add(:instance_group_manager_names, field: :instance_group_manager_name)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      instance_group_manager_rows = []
      catch_gcp_errors do
        @instance_group_managers = @gcp.gcp_compute_client.list_region_instance_group_managers(@project, @region)
      end
      return [] if !@instance_group_managers || !@instance_group_managers.items
      @instance_group_managers.items.map do |instance_group|
        instance_group_manager_rows+=[{ instance_group_manager_id: instance_group.id,
                                instance_group_manager_name: instance_group.name }]
      end
      @table = instance_group_manager_rows
    end
  end
end
