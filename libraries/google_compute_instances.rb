# frozen_string_literal: true

require 'gcp_backend'

module Inspec::Resources
  class GoogleComputeInstances < GcpResourceBase
    name 'google_compute_instances'
    desc 'Verifies settings for GCP compute instances in bulk'

    example "
      describe google_compute_instances(project: 'chef-inspec-gcp',  zone: 'europe-west2-a') do
        it { should exist }
        ...
      end
    "

    def initialize(opts = {})
      # Call the parent class constructor
      super(opts)
      @display_name = opts[:name]
      @zone = opts[:zone]
      @project = opts[:project]
    end

    # FilterTable setup
    filter_table_config = FilterTable.create
    filter_table_config.add(:instance_ids, field: :instance_id)
    filter_table_config.add(:instance_names, field: :instance_name)
    filter_table_config.connect(self, :fetch_data)

    def fetch_data
      instance_rows = []
      next_page = nil
      loop do
        catch_gcp_errors do
          @instances = @gcp.gcp_compute_client.list_instances(@project, @zone, page_token: next_page)
        end
        return [] if !@instances || !@instances.items
        @instances.items.map do |instance|
          instance_rows+=[{ instance_id: instance.id,
                          instance_name: instance.name }]
        end
        next_page = @instances.next_page_token
        break unless next_page
      end
      @table = instance_rows
    end
  end
end
